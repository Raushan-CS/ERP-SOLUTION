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
public partial class Admin_CreateProject : System.Web.UI.Page
{
    Message ms = new Message();
    Connection cn = new Connection();
    SqlConnection con = Connection.connect();
    string projectTypeSelected = string.Empty;
    StringBuilder sb = new StringBuilder();

    protected void Page_Load(object sender, EventArgs e)
    {
        btnsubmit.Visible = false;
        if (!IsPostBack)
        {
            if (Session["admin"] != null)
            {
                HiddenField2.Value = Session["admin"].ToString();
                getProjectType();
                details();
                Addtemp();


            }
            else { Response.Redirect("../index.aspx"); }
        }
        else
        {
            ddlDeptSelector.DataSource = "";
        }
    }

    //=================================================================================  details() method for getting data from database  ==============================================================================================

    public void details()
    {
        DataTable dt = new DataTable();
        dt = BL.dtt("Select * from tbl_project_details");
        if (dt.Rows.Count > 0)
        {
            Gridview1.DataSource = dt;
            Gridview1.DataBind();
        }
    }


   // =================================================================================== Method to fetch and populate Departments in Dropdown==========================================================

    void getProjectType()
    {
        DataTable dt = new DataTable();
        DataTable dtr = new DataTable();

        dt = BL.dtt("select project_type from tbl_project_type");
        Display(dt);
    }

    public void Display(DataTable dt)
    {
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ddlDeptSelector.DataSource = dt;
                ddlDeptSelector.DataBind();
                ddlDeptSelector.Items.Insert(0, new ListItem("-Select Project Type-", "0"));


                ddlProjectTypeSelector.DataSource = dt;
                ddlProjectTypeSelector.DataBind();
                ddlProjectTypeSelector.Items.Insert(0, new ListItem("-Select Project Type-", "0"));
            }
        }

        else
        {
            ddlDeptSelector.DataTextField = "";
            ddlDeptSelector.DataSource = "";


            ddlProjectTypeSelector.DataTextField = "";
            ddlProjectTypeSelector.DataSource = "";
        }
    }

    //========================================================== Method for including Pagination in Gridview ===========================================================================================

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Gridview1.PageIndex = e.NewPageIndex;
        this.details();
    }



    

    //=================================================================================   method to clear data from the form  ==============================================================================================

    void clear()
    {
        //txtUserId.Text = "";
        //ddlusertype.SelectedValue = "0";
        //txtusername.Text = "";
        //txtpassword.Text = "";
    }


     


    //=================================================================================   method to Save data to the Database  ==============================================================================================


    protected void btnsubmit_Click(object sender, EventArgs e)
    {

        try
        {
            //************************** Saving Project details in database table tbl_project_details   ***********************************
            ms.create_project(txt_projectName.Text.Trim(), txtlocation.Text.Trim(), ddlDeptSelector.SelectedItem.Text.Trim(), txtvalue.Text.Trim(), txttimeline.Text.Trim(), DateTime.Today, HiddenField2.Value);

            //************************** Saving Project head details in database table tbl_project_head   ***********************************
           
                
                 for (int i = 0; i <= GridView2.Rows.Count - 1; i++)
                 {

                     Label projHead = (Label)GridView2.Rows[i].FindControl("lblProjectHead");
                     Label headAmt = (Label)GridView2.Rows[i].FindControl("lblHeadAmount");
                     ms.add_head(txt_projectName.Text.Trim(), projHead.Text.Trim(), headAmt.Text.Trim(),DateTime.Today);
                 }
               


            ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Project Created'); window.location='CreateProject.aspx';", true);
            clear();
        }
        catch (Exception ex) { success.InnerText = ex.Message; }
    }

    //=================================================================================  Gridview operations  ==============================================================================================


    protected void Gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
        if (e.CommandName.Equals("del"))
        {
            int id = Convert.ToInt32(e.CommandArgument);
            BL.ExecuteNonQuery("Delete from tbl_project_details where ID=" + id + "");
            ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Record Deleted'); window.location='CreateProject.aspx';", true);
        }
        
        if (e.CommandName.Equals("edt"))
        {
            int id = Convert.ToInt32(e.CommandArgument);
            hd_value.Value = id.ToString();
            string sql = @"Select * from tbl_project_details where ID =" + id + "";
            DataTable dt = new DataTable();
            dt = BL.dtt(sql);
            if (dt.Rows.Count > 0)
            {
                MessagePnl_ModalPopupExtender.Show();

                txtPName.Text = dt.Rows[0]["project_name"].ToString();
                txtPLocation.Text = dt.Rows[0]["project_location"].ToString();
                //txtPType.Text = dt.Rows[0]["project_type"].ToString();
                txtPTimeline.Text = dt.Rows[0]["project_timeline"].ToString();
                txtPValue.Text = dt.Rows[0]["project_value"].ToString();

                ddlProjectTypeSelector.SelectedItem.Text = dt.Rows[0]["project_type"].ToString();
                

            }
            //string sqlHead = @"select ph.project_head , ph.head_amt from tbl_project_head ph join tbl_project_details pd on ph.project_name = pd.project_name where pd.id = "+ id +"";
            //DataTable dtHead = new DataTable();
            //dtHead = BL.dtt(sqlHead);
            //int i = 1;
            //sb.Append("<table class='table' style='border:1px solid; ' >");
            //sb.Append("<thead>");
            //sb.Append("<tr>");
            //sb.Append("<th>S.No</th>");
            //sb.Append("<th>Project Head</th>");
            //sb.Append("<th>Head Amount</th>");
            //sb.Append("</tr>");
            //sb.Append("</thead>");
            //sb.Append("<tbody>");

            //foreach (DataRow dr in dtHead.Rows)
            //{
            //    sb.Append("<tr>");
            //    sb.Append("<td><span>" + i + ".</span></td>");
            //    sb.Append("<td>" + dr["project_head"] + "</td>");
            //    sb.Append("<td>" + dr["head_amt"] + "</td>");
            //    sb.Append("</tr>");
            //    i++;
            //}
            //sb.Append("</tbody>");
           
            //PHead.InnerHtml = sb.ToString();
        }
    }



    //=============================================================  Method to update details from Popup  ===========================================================================


    protected void btnupdate_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(hd_value.Value.Trim());

        ms.update_project(txtPName.Text.Trim(), txtPLocation.Text.Trim(), ddlProjectTypeSelector.SelectedItem.Text.Trim(), txtPValue.Text.Trim(), txtPTimeline.Text.Trim(), id);
        ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Record Updated'); window.location='CreateProject.aspx';", true);
    }



    //====================================================== creating columns for displaying Project Heads in Gridview==========================================================    
    public void Addtemp()
    {
        DataTable dttemp = new DataTable();
        //dttemp.Columns.Add("invoice_no");
        dttemp.Columns.Add("project_head");
        dttemp.Columns.Add("head_amt");        
        Session["dttemp"] = dttemp;

    }


    //============================================================== Method to add Project Heads to temporary gridview================================================    

    protected void btnAddHead_Click(object sender, EventArgs e)
    {
        btnsubmit.Visible = true;
        if (Session["dttemp"] != null)
        {
            DataTable dttemp = (DataTable)Session["dttemp"];
            DataRow drtemp = dttemp.NewRow();

            drtemp[0] = txtProjectHead.Text.Trim();
            drtemp[1] = txtHeadAmount.Text.Trim();
            dttemp.Rows.Add(drtemp);
            GridView2.DataSource = dttemp;
            GridView2.DataBind();
            Session["dttemp"] = dttemp;

        }
    }


    //=======================Method to delete project Head from temporary gridview  =================================================================================

    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (Session["dttemp"] != null)
        {
            DataTable dt = (DataTable)Session["dttemp"];
            DataRow drCurrentRow = null;
            int rowIndex = Convert.ToInt32(e.RowIndex);
            if (dt.Rows.Count > 0)
            {
                dt.Rows.Remove(dt.Rows[rowIndex]);
                drCurrentRow = dt.NewRow();
                Session["dttemp"] = dt;
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
        }
    }
}