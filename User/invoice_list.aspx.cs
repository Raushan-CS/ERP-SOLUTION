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
using System.Drawing;

public partial class User_invoice_list : System.Web.UI.Page
{
    Connection cn = new Connection();
    SqlConnection con = Connection.connect();
    Message ms = new Message();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["User"] != null)
            {
                HiddenField2.Value = Session["User"].ToString();
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


    //********************************************************************************************** Binding data from database into Gridview *********************************************************************************
  
    void gd2view()
    {
        string constr = ConfigurationManager.ConnectionStrings["tishcon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlDataAdapter sde = new SqlDataAdapter("Select tb2.project_value, tb2.project_name, tb1.invoice_no,tb1.entered_by as EnteredBy, tb1.grand_tot, tb1.others, tb1.tax, tb1.billing_name, tb1.total_amt, tb1.entry_date, tb1.project_name, tb3.payment_dues, tb3.payment_received  from  tbl_bill tb1 join tbl_project_details tb2 on tb1.project_name = tb2.project_name left join tbl_payment_history tb3 on tb1.invoice_no = tb3.invoice_no  ", con);
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

    //********************************************************************************************** Applying paging on Gridview *********************************************************************************
   
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        gd2view();
    }

    //********************************************************************************************** Searching data using invoice_no *********************************************************************************

    protected void txtInvoice_No_TextChanged(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        if (txtInvoice_No.Text.Trim() == "")
        {
            dt = BL.dtt("Select tb2.project_value, tb2.project_name, tb1.invoice_no,tb1.entered_by as EnteredBy, tb1.grand_tot, tb1.others, tb1.tax, tb1.billing_name, tb1.total_amt, tb1.entry_date, tb1.project_name, tb3.payment_dues, tb3.payment_received  from  tbl_bill tb1 join tbl_project_details tb2 on tb1.project_name = tb2.project_name left join tbl_payment_history tb3 on tb1.invoice_no = tb3.invoice_no");
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

            dt = BL.dtt("Select tb2.project_value, tb2.project_name, tb1.invoice_no,tb1.entered_by as EnteredBy, tb1.grand_tot, tb1.others, tb1.tax, tb1.billing_name, tb1.total_amt, tb1.entry_date, tb1.project_name, tb3.payment_dues, tb3.payment_received  from  tbl_bill tb1 join tbl_project_details tb2 on tb1.project_name = tb2.project_name left join tbl_payment_history tb3 on tb1.invoice_no = tb3.invoice_no where tb1.invoice_no ='" + txtInvoice_No.Text.Trim() + "' ");
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

    //********************************************************************************************** Searching data using invoice_no *********************************************************************************

    protected void Button2_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["tishcon"].ConnectionString;
        if (txtInvoice_No.Text.Trim() == "")
        {
            GridView2.AllowPaging = true;
            gd2view();
        }
        else
        {

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlDataAdapter sde = new SqlDataAdapter("Select tb2.project_value, tb2.project_name, tb1.invoice_no,tb1.entered_by as EnteredBy, tb1.grand_tot, tb1.others, tb1.tax, tb1.billing_name, tb1.total_amt, tb1.entry_date, tb1.project_name, tb3.payment_dues, tb3.payment_received  from  tbl_bill tb1 join tbl_project_details tb2 on tb1.project_name = tb2.project_name left join tbl_payment_history tb3 on tb1.invoice_no = tb3.invoice_no where tb1.invoice_no ='" + txtInvoice_No.Text.Trim() + "' ", con);
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
                SqlDataAdapter sde = new SqlDataAdapter("Select tb2.project_value, tb2.project_name, tb1.invoice_no,tb1.entered_by as EnteredBy, tb1.grand_tot, tb1.others, tb1.tax, tb1.billing_name, tb1.total_amt, tb1.entry_date, tb1.project_name, tb3.payment_dues, tb3.payment_received  from  tbl_bill tb1 join tbl_project_details tb2 on tb1.project_name = tb2.project_name left join tbl_payment_history tb3 on tb1.invoice_no = tb3.invoice_no where tb1.entry_date BETWEEN '" + DATE1.Text.Trim() + "' AND '" + DATE2.Text.Trim() + "' order by tb1.entry_date desc", con);
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

    //********************************************************************************************** Searching Project data using ProjectName *********************************************************************************

    protected void btnSearchProject_Click(object sender, EventArgs e)
    {

        try
        {
            if (ddlProjectName.SelectedItem.Text.Trim() == "-Select Project-")
            {
                DataTable dt = new DataTable();
                dt = BL.dtt("Select tb2.project_value, tb2.project_name, tb1.invoice_no,tb1.entered_by as EnteredBy, tb1.grand_tot, tb1.others, tb1.tax, tb1.billing_name, tb1.total_amt, tb1.entry_date, tb1.project_name, tb3.payment_dues, tb3.payment_received  from  tbl_bill tb1 join tbl_project_details tb2 on tb1.project_name = tb2.project_name left join tbl_payment_history tb3 on tb1.invoice_no = tb3.invoice_no  ");
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
                dt = BL.dtt("Select tb2.project_value, tb2.project_name, tb1.invoice_no,tb1.entered_by as EnteredBy, tb1.grand_tot, tb1.others, tb1.tax, tb1.billing_name, tb1.total_amt, tb1.entry_date, tb1.project_name, tb3.payment_dues, tb3.payment_received  from  tbl_bill tb1 join tbl_project_details tb2 on tb1.project_name = tb2.project_name left join tbl_payment_history tb3 on tb1.invoice_no = tb3.invoice_no where tb2.project_name ='" + ddlProjectName.SelectedItem.Text.Trim() + "' ");
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
    //********************************** Calculating Sum of Columns Grand Total, Payment Received and Payment Duies and displaying in Footer ******************************************************************

    double gTotal;
    double TotalReceive;
    double TotalDue;
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (!DBNull.Value.Equals(DataBinder.Eval(e.Row.DataItem, "grand_tot")))
            {
                gTotal += Convert.ToInt64(DataBinder.Eval(e.Row.DataItem, "grand_tot"));
            }
            if (!DBNull.Value.Equals(DataBinder.Eval(e.Row.DataItem, "payment_received")))
            {
                TotalReceive += Convert.ToInt64(DataBinder.Eval(e.Row.DataItem, "payment_received"));
            }
            if (!DBNull.Value.Equals(DataBinder.Eval(e.Row.DataItem, "payment_dues")))
            {
                TotalDue += Convert.ToInt64(DataBinder.Eval(e.Row.DataItem, "payment_dues"));
            }



        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblGtotal = (Label)e.Row.FindControl("lblTotalBillAmount");
            Label lblPayReceive = (Label)e.Row.FindControl("lblTotalPayReceived");
            Label lblPayDue = (Label)e.Row.FindControl("lblTotalDues");
            if (lblGtotal != null)
            {
                lblGtotal.Text = gTotal.ToString();
            }
            if (lblPayReceive != null)
            {
                lblPayReceive.Text = TotalReceive.ToString();
            }
            if (lblPayDue != null)
            {
                lblPayDue.Text = TotalDue.ToString();
            }
            
        }
    }

    //********************************************************************************************** Included to avoid error of from tag during exporting *********************************************************************************

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    }

    //********************************************************************************************** Exporting the Gridview Data to Excel *********************************************************************************

    protected void btnExporttoExcel_Click(object sender, EventArgs e)
    {

        if (GridView2.Rows.Count > 0)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=InvoicesReport.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                GridView gv = GridView2;

                gv.Columns.RemoveAt(11);




                //To Export all pages
                gv.AllowPaging = false;
                this.gd2view();

                gv.AllowPaging = false;

                gv.HeaderRow.BackColor = Color.White;

                foreach (TableCell cell in gv.HeaderRow.Cells)
                {
                    cell.BackColor = gv.HeaderStyle.BackColor;
                }

                foreach (GridViewRow row in gv.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = gv.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = gv.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }
                gv.RenderControl(hw);
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Message", "alert('No Record Found')", true);
        }
        //ExportGridToExcel();
    }
}