using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;
using System.Data;
using System.Text;
using System.Drawing;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Net.Mail;
using System.Net.Sockets;
using System.Net;
using System.Globalization;

public partial class Admin_ViewProjectDetails : System.Web.UI.Page
{
    Connection cn = new Connection();
    SqlConnection con = Connection.connect();
    Message ms = new Message();
    string projectName;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Admin"] != null)
            {
                projectName = Convert.ToString(Request.QueryString["projectname"]);

                dataView(projectName);
               
              
            }
            else
            {
                Response.Redirect("../index.aspx");
            }
        }
        else
        {

        }
    }

    //============================================== Populate Gridview ===========================================
    public void gdView()
    {
        

        DataTable dtt = new DataTable();
        dtt = BL.dtt("Select * from tbl_project_head where project_name = '" + txt_projectName.Text + "' ");

        if (dtt.Rows.Count > 0)
        {
            GridView2.DataSource = dtt;
            GridView2.DataBind();
            GridView2.Columns[1].Visible = false;
        }
        else
        {
            GridView2.DataSource = dtt;
            GridView2.DataBind();
        }
    }


    // =================================================================================== Method to fetch and populate Departments in Dropdown==========================================================    
    void getProjectType()
    {
        DataTable dt = new DataTable();


        dt = BL.dtt("select project_type from tbl_project_type");
        Display(dt);
    }

    public void Display(DataTable dt)
    {
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {

                ddlProjectTypeSelector.DataSource = dt;
                ddlProjectTypeSelector.DataBind();
                ddlProjectTypeSelector.Items.Insert(0, new ListItem("-Select Project Type-", "0"));
            }
        }

        else
        {

            ddlProjectTypeSelector.DataTextField = "";
            ddlProjectTypeSelector.DataSource = "";
        }
    }

    // ========================================================== Method to fetch and populate Project details    ======================================   

    void dataView(string Prjno)
    {
        SqlDataAdapter sde = new SqlDataAdapter("select * from  tbl_project_details where project_name = '" + Prjno + "'", con);
        DataTable dt = new DataTable();
        sde.Fill(dt);
        if (dt.Rows.Count > 0)
        {

            hd_value.Value = dt.Rows[0]["id"].ToString();
            txt_projectName.Text = dt.Rows[0]["project_name"].ToString();
            txtlocation.Text = dt.Rows[0]["project_location"].ToString();
            //txtPType.Text = dt.Rows[0]["project_type"].ToString();
            txttimeline.Text = dt.Rows[0]["project_timeline"].ToString();
            txtvalue.Text = dt.Rows[0]["project_value"].ToString();
            getProjectType();
            ddlProjectTypeSelector.SelectedItem.Text = dt.Rows[0]["project_type"].ToString();


        }

        SqlDataAdapter sda = new SqlDataAdapter("Select * from tbl_project_head where project_name = '" + projectName + "' ", con);
        DataTable dtHead = new DataTable();
        sda.Fill(dtHead);

        if (dtHead.Rows.Count > 0)
        {
            GridView2.DataSource = dtHead;
            GridView2.DataBind();
            GridView2.Columns[1].Visible = false;
        }
          else
        {
            GridView2.DataSource = "";
            GridView2.DataBind();
        }
        


    }


    //=================================== Gridview Operations to edit data i gridview which will directly reflect in Database data  =================================================

   

   

    protected void GridView2_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        GridView2.EditIndex = e.NewEditIndex;
        this.gdView();
    }

    protected void GridView2_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
    
        //Finding the controls from Gridview for the row which is going to update  

        Label ID = GridView2.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
        int s = Convert.ToInt32(ID.Text);

        TextBox projectHead = GridView2.Rows[e.RowIndex].FindControl("txtProjectHead") as TextBox;
        TextBox headAmount = GridView2.Rows[e.RowIndex].FindControl("txtHeadAmt") as TextBox;


        ms.update_HeadDetails(projectHead.Text.Trim(), headAmount.Text.Trim(), s);



        //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
        GridView2.EditIndex = -1;
        //Call ShowData method for displaying updated data  
        this.gdView();
    }


    protected void GridView2_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
       
        Label ID = GridView2.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
        int s = Convert.ToInt32(ID.Text);

        GridView2.EditIndex = -1;
        this.gdView();
    }


    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
       
        Label ID = GridView2.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
        int s = Convert.ToInt32(ID.Text);

        ms.delete_projHead(s);
        ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Record Deleted');  window.location='#'; ", true);


        //Call method for displaying updated data  
        this.gdView();
    }

   
  
   
   
   
    //protected void GridView2_RowEditing1(object sender, GridViewEditEventArgs e)
    //{
        
    //}
    //protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    //{
    //    GridView2.EditIndex = -1;
    //    gdView();
    //}
    //protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
    //{
    //    int userid = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value.ToString());
    //    GridViewRow row = (GridViewRow)GridView2.Rows[e.RowIndex];
    //    Label lblID = (Label)row.FindControl("lblID");
    //    //TextBox txtname=(TextBox)gr.cell[].control[];  
    //    TextBox projectHead = (TextBox)row.Cells[2].Controls[0];
    //    TextBox headAmount = (TextBox)row.Cells[3].Controls[0];
       
    //    //TextBox textadd = (TextBox)row.FindControl("txtadd");  
    //    //TextBox textc = (TextBox)row.FindControl("txtc");  
    //    GridView2.EditIndex = -1;
    //    con.Open();
    //    //SqlCommand cmd = new SqlCommand("SELECT * FROM detail", conn);  
    //    SqlCommand cmd = new SqlCommand("update tbl_project_head set project_head='" + projectHead.Text + "',head_Amt='" + headAmount.Text + "' where id='" + userid + "'", con);
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //    gdView();
    //    //GridView1.DataBind();
    //}
    //protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    GridViewRow row = (GridViewRow)GridView2.Rows[e.RowIndex];
    //    Label lbldeleteid = (Label)row.FindControl("lblID");
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand("delete FROM tbl_project_head where id='" + Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //    gdView();
    //}
    //protected void GridView2_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    //{
    //    GridView2.PageIndex = e.NewPageIndex;
    //    gdView();
    //}

    //========================================   Methos to add Project Head to Database table ===============================
    protected void btnAddHead_Click(object sender, EventArgs e)
    {
        try
        {
            ms.addHeadinedit(txt_projectName.Text.Trim(), txtProjectHead.Text.Trim(), txtHeadAmount.Text.Trim(), DateTime.Today);

        }
        catch (Exception ex)
        {

        }

        gdView();
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
         int id = Convert.ToInt32(hd_value.Value.Trim());
         try
        {
            ms.update_projectHead(txt_projectName.Text.Trim(),txtlocation.Text.Trim(), ddlProjectTypeSelector.SelectedItem.Text.Trim(), txtvalue.Text.Trim(), txttimeline.Text.Trim(), id);
           
            ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Project details Updated!!'); window.location='CreateProject.aspx';", true);
        }
        catch (Exception ex)
        { //lblmsg3.InnerText = ex.Message; 
        }
        
    }
    
}