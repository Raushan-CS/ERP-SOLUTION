using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Globalization;

public partial class Maker_invoiceList : System.Web.UI.Page
{
    Connection cn = new Connection();
    SqlConnection con = Connection.connect();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Session["Maker"] != null)
            {
                HiddenField2.Value = Session["Maker"].ToString();
                gd2view();


            }
            else
            {
                Response.Redirect("../index.aspx");
            }
            getProjectNames();
        }


        
    }



    //=================================================================================== Method to fetch and populate Project Names in Dropdown==========================================================    

    void getProjectNames()
    {
        DataTable dt = new DataTable();
        DataTable dtr = new DataTable();

        dt = BL.dtt("select project_name from tbl_project_details");
        Display(dt);
    }

    public void Display(DataTable dt)
    {
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ddlProjectName.DataSource = dt;
                ddlProjectName.DataBind();
                ddlProjectName.Items.Insert(0, new ListItem("-Select Project-", "0"));
            }
        }

        else
        {
            ddlProjectName.DataTextField = "";
            ddlProjectName.DataSource = "";
        }
    }

     //*************************************************** Method to display invoices list of the particular logged in MAKER****************************************************************
    void gd2view()
    {
        string constr = ConfigurationManager.ConnectionStrings["tishcon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlDataAdapter sde = new SqlDataAdapter("Select * from tbl_bill where entered_by = '"+ HiddenField2.Value+"'  order by id desc", con);
            DataTable dt = new DataTable();
            sde.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
            else
            {
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
        }
    }

    //*************************************************** Method to add paging on Gridview****************************************************************
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        gd2view();
    }

    //*************************************************** Method to add perform Gridview Operations****************************************************************
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName.Equals("Remove"))
        {
            string constr = ConfigurationManager.ConnectionStrings["tishcon"].ConnectionString;
            string memberrecipt = "";
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlDataAdapter sde = new SqlDataAdapter("Select invoice_no from tbl_bill where id=" + id + "", con);
                DataTable dt = new DataTable();
                sde.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    memberrecipt = dt.Rows[0]["invoice_no"].ToString().Trim();
                }
            }
            string del = @"Delete from tbl_bill where id=" + id + ";";
            del += "Delete from tbl_bill_details where invoice_no='" + memberrecipt + "';";
            BL.ExecuteNonQuery(del);
            ScriptManager.RegisterStartupScript(this, typeof(string), "MessageBox", "alert('Successfully Deleted'); window.location='invoiceList.aspx';", true);
            Response.Redirect(Request.RawUrl);
        }
    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int length = GridView2.Rows.Count;
        for (int i = 0; i < length; i++)
        {
            //CultureInfo culture = new CultureInfo("en-US");
            //DateTime tempDate = Convert.ToDateTime(GridView2.Rows[i].Cells[5].Text.ToString().Trim(), culture);
            //GridView2.Rows[i].Cells[5].Text = tempDate.ToString("dd-MM-yyyy");
        }
    }

    //=================================================================================== Method to fetch and populate Data on InvoiceNo Search==========================================================    

    protected void txtInvoice_No_TextChanged(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        if (txtInvoice_No.Text.Trim() == "")
        {
            dt = BL.dtt("Select * from tbl_bill where entered_by = '" + HiddenField2.Value + "' order by id desc");
            if (dt.Rows.Count > 0)
            {
                GridView2.DataSource = dt;
                GridView2.DataBind();
                txtInvoice_No.Text = string.Empty;

            }
            else
            {
                GridView2.DataSource = dt;
                GridView2.DataBind();
                //userMsg.InnerText = "No Entry found !!";


            }
        }
        else
        {

            dt = BL.dtt("Select * from tbl_bill where  entered_by = '" + HiddenField2.Value + "' and invoice_no ='" + txtInvoice_No.Text.Trim() + "' ");
            if (dt.Rows.Count > 0)
            {
                GridView2.DataSource = dt;
                GridView2.DataBind();
                txtInvoice_No.Text = string.Empty;

            }
            else
            {
                GridView2.DataSource = dt;
                GridView2.DataBind();
                //userMsg.InnerText = "No Entry found !!";


            }
        }
    }


    //=================================================================================== Method to fetch and populate Data on Projectname Search==========================================================    

    protected void btnSearchProject_Click(object sender, EventArgs e)
    {

        try
        {
            if (ddlProjectName.SelectedItem.Text.Trim() == "-Select Project-")
            {
                DataTable dt = new DataTable();
                dt = BL.dtt("Select * from tbl_bill where entered_by = '" + HiddenField2.Value + "' order by id desc");
                if (dt.Rows.Count > 0)
                {

                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                }
                else
                {
                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                }

            }
            else
            {
                DataTable dt = new DataTable();
                dt = BL.dtt("Select * from tbl_bill where entered_by = '" + HiddenField2.Value + "' and project_name ='" + ddlProjectName.SelectedItem.Text.Trim() + "' ");
                if (dt.Rows.Count > 0)
                {

                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                }
                else
                {
                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                }
            }




        }
        catch (Exception ex)
        {
        }


    }



    //********************************************************************************************** Searching data using start and end dates *********************************************************************************


    protected void Button3_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["tishcon"].ConnectionString;
        if (DATE1.Text.Trim() == "" || DATE1.Text.Trim() == "")
        {
            GridView2.AllowPaging = true;
            gd2view();
        }
        else
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                CultureInfo culture = new CultureInfo("en-US");
                DateTime tempDate = Convert.ToDateTime(DATE1.Text.Trim(), culture);
                DateTime tempDate2 = Convert.ToDateTime(DATE2.Text.Trim(), culture);
                SqlDataAdapter sde = new SqlDataAdapter("Select * from tbl_bill where  entered_by = '" + HiddenField2.Value + "' and entry_date BETWEEN '" + DATE1.Text.Trim() + "' AND '" + DATE2.Text.Trim() + "' order by id desc", con);
                DataTable dt = new DataTable();
                sde.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                  
                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                    GridView2.AllowPaging = false;
                }
                else
                {
                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                    GridView2.AllowPaging = true;
                }
            }
        }

    }

    
}
