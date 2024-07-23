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

public partial class Maker_createInvoice : System.Web.UI.Page
{
    double total;
    double totl = 0.0;
    double tax = 0.0;
    double othrs = 0.0;
    double GrandTotal = 0.0;
    Message ms = new Message();
    Connection cn = new Connection();
    SqlConnection con = Connection.connect();
    //int a = 1;
    //int b = 1;
    //int d = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        //GridView1.DataBind();
        btnsave.Visible = false;
        if (!IsPostBack)
        {
            if (Session["Maker"] != null)
            {
                HiddenField2.Value = Session["Maker"].ToString();

            }

            else
            {
                Response.Redirect("../index.aspx");
            }

            getProjectNames();
            getFunderNames();
            Addtemp();
            setInvoice();
        }

        else
        {
            ddlProjectName.DataSource = "";
        }

    }

    //=================================================================================== generating Invoice Number=========================================================  
    public void setInvoice()
    {
        int j = 1;
        DataTable dtr = new DataTable();
        dtr = BL.dtt("Select * from tbl_invoiceReceipt");
        if (dtr.Rows.Count > 0)
        {
            j = dtr.Rows.Count + 1;
        }
        else
        {
            j = dtr.Rows.Count + 1;
        }

        string rsno = "";
        if ((j / 10) == 0)
        {
            rsno = "000" + j;
        }
        else if ((j / 100) == 0)
        {
            rsno = "00" + j;
        }
        else if ((j / 1000 == 0))
        {
            rsno = "0" + j;
        }
        else
        {
            rsno = "" + j;
        }
        txtInvoiceNo.Text = rsno;
    }



    //====================================================== creating columns for displaying Invoice details in Gridview==========================================================    
    public void Addtemp()
    {
        DataTable dttemp = new DataTable();
        //dttemp.Columns.Add("invoice_no");
        dttemp.Columns.Add("desc_head");
        dttemp.Columns.Add("unit");
        dttemp.Columns.Add("quantity");
        dttemp.Columns.Add("unit_price");
        dttemp.Columns.Add("amount");
        Session["dttemp"] = dttemp;

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

    //============================================================== Method to calculate total amount according to Unit and Quantity===========================================    

    protected void txtUnitPrice_TextChanged(object sender, EventArgs e)
    {
        long unit = Convert.ToInt64(txtQuantity.Text.ToString());
        long Qty = Convert.ToInt64(txtUnitPrice.Text.ToString());;
        long Amount = unit * Qty;
        txtAmount.Text = Amount.ToString();
    }


    //============================================================== Method to add invoice Description heading in temporary gridview================================================    

    protected void btnAddHeading_Click(object sender, EventArgs e)
    {
        btnsave.Visible = true;
        if (Session["dttemp"] != null)
        {
            DataTable dttemp = (DataTable)Session["dttemp"];
            DataRow drtemp = dttemp.NewRow();

            drtemp[0] =  txtDescription.Text.Trim();
           
            dttemp.Rows.Add(drtemp);
            GridView2.DataSource = dttemp;
            GridView2.DataBind();
            Session["dttemp"] = dttemp;
            
        }
    }


    //=================================================================================== Method to add invoice Description details in temporary gridview==========================================================    

    protected void btnAddSubDesc_Click(object sender, EventArgs e)
    {
       
        btnsave.Visible = true;
        if (Session["dttemp"] != null)
        {
            DataTable dttemp = (DataTable)Session["dttemp"];
            DataRow drtemp = dttemp.NewRow();

            drtemp[0] = txtSubDescription.Text.Trim();
            drtemp[1] = txtUnit.Text.ToString();
            drtemp[2] = txtQuantity.Text.ToString();
            drtemp[3] = txtUnitPrice.Text.ToString();
            drtemp[4] = txtAmount.Text.ToString();


            dttemp.Rows.Add(drtemp);
            GridView2.DataSource = dttemp;
            GridView2.DataBind();
            Session["dttemp"] = dttemp;
            
            int z = 0;
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                int x = 0;
                Label lblcost = (Label)GridView2.Rows[i].FindControl("lblAmt");

                if (lblcost.Text.Trim() == "")
                {
                    lblcost.Text = x.ToString();
                }
                z += Convert.ToInt32(lblcost.Text.Trim());
            }
            int costamount = 0;
            costamount = z;
            txtTotal.Text = costamount.ToString();


            
         totl = Convert.ToDouble(txtTotal.Text.ToString());
        
         GrandTotal  += totl ;
         txtGrandTotal.Text = GrandTotal.ToString();
         if (txtTax.Text != "")
         {
             tax = Convert.ToDouble(txtTax.Text.ToString());
             if (tax > 0)
             {
                 GrandTotal += tax;
             }
         }
         if (txtOthers.Text != "")
         {
             othrs = Convert.ToDouble(txtOthers.Text.ToString());
             if (othrs > 0)
             {
                 GrandTotal += othrs;
             }
         }
         txtGrandTotal.Text = GrandTotal.ToString();
         
            
        }
        
    }


    //================================================================Method to insert bill details in database =================================================================================

    protected void btnsave_Click(object sender, EventArgs e)
    {

        string empty = "NULL";
        double emp = 0.0;
        try
        {

            ms.add_bill_data(txtInvoiceNo.Text.Trim(), ddlFunderName.SelectedItem.Text.Trim(), txtDesignation.Text.Trim(), txtprojectOrder.Text.Trim(), ddlProjectName.SelectedItem.Text.Trim(), txtBillDescription.Text.Trim(), Convert.ToDateTime(txtFromDate.Text.ToString()), Convert.ToDateTime(txtToDate.Text.ToString()), Convert.ToDouble(txtTotal.Text.Trim()), Convert.ToDouble(txtTax.Text.Trim()), Convert.ToDouble(txtOthers.Text.Trim()), Convert.ToDouble(txtGrandTotal.Text.Trim()), DateTime.Today, HiddenField2.Value);
            ms.addbillReceipt(txtInvoiceNo.Text.Trim());
            for (int i = 0; i <= GridView2.Rows.Count - 1; i++)
            {

                Label desc = (Label)GridView2.Rows[i].FindControl("lblDescr");
                Label unit = (Label)GridView2.Rows[i].FindControl("lblUnit");
                Label qty = (Label)GridView2.Rows[i].FindControl("lblQty");
                Label price = (Label)GridView2.Rows[i].FindControl("lblUPrice");
                Label amt = (Label)GridView2.Rows[i].FindControl("lblAmt");

                string units = unit.Text;
                if (units == "" )
                {
                    ms.bill_descriptions_empty(txtInvoiceNo.Text.Trim(), desc.Text.Trim() , DateTime.Today, HiddenField2.Value);
                }
                else
                {

                    ms.bill_descriptions(txtInvoiceNo.Text.Trim(), desc.Text.Trim(),  unit.Text.Trim(), qty.Text.Trim(), price.Text.Trim(), Convert.ToDouble(amt.Text.Trim()), DateTime.Today, HiddenField2.Value);
                }
                //total += Convert.ToDouble(amt.Text.ToString());
                //txtTotal.Text = total.ToString();

            }
            ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Invoice details added!!'); window.location='createInvoice.aspx';", true);

          
            //clear();

        }

        catch (Exception ex)
        {
            success.InnerText = ex.Message;
        }
    }


//================================================================Method to delete invoice details from temporary gridview bill details in database =================================================================================

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


    //================================================================Method to calculate grandtotal on Other amount addition =================================================================================

    protected void txtOthers_TextChanged(object sender, EventArgs e)
    {
       

         tax = Convert.ToDouble(txtTax.Text.ToString());
         totl = Convert.ToDouble(txtTotal.Text.ToString());
         othrs = Convert.ToDouble(txtOthers.Text.ToString());
         GrandTotal = tax + totl + othrs;
         txtGrandTotal.Text = GrandTotal.ToString();
         btnsave.Visible = true;
    }

    //======================================Method to populate dropdown with Funder Names from database =================================================================================

   
        void getFunderNames()
           {
                DataTable dt = new DataTable();
               

                dt = BL.dtt("select funder_name from tbl_funder");
                display_Funder(dt);
            }
     
           
     public void display_Funder(DataTable dt)
     {
            if (dt.Rows.Count > 0)
             {
                    foreach (DataRow dr in dt.Rows)
                    {
                        ddlFunderName.DataSource = dt;
                        ddlFunderName.DataBind();
                        ddlFunderName.Items.Insert(0, new ListItem("-Select Company/Dept. -", "0"));
                    }
                }

                else
                {
                    ddlFunderName.DataTextField = "";
                    ddlFunderName.DataSource = "";
                }
    
            }


    // protected void ddlFunderName_TextChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        DataTable dtr = new DataTable();
    //        dtr = BL.dtt("select * from tbl_funder where funder_name = '"+ ddlFunderName.SelectedItem.Text.Trim()+"' ");
    //        if (dtr.Rows.Count > 0)
    //        {
    //            txtFunderMobile.Text = dtr.Rows[0]["funder_contact"].ToString();
    //            txtFunderEmail.Text = dtr.Rows[0]["funder_email"].ToString();
    //        }

    //    }
    //    catch (Exception ex)
    //    {
    //    }
    //}


     //=================   Method to populate dropdown with project Heads from database for selected Project Name ====================================================

     protected void ddlProjectName_TextChanged(object sender, EventArgs e)
     {
         DataTable dt = new DataTable();

         dt = BL.dtt("select project_head from tbl_project_head where project_name ='"+ ddlProjectName.SelectedValue +"'");
         populateHeads(dt);
     }

     public void populateHeads(DataTable dt)
     {
         if (dt.Rows.Count > 0)
             {
                    foreach (DataRow dr in dt.Rows)
                    {
                        txtDescription.DataSource = dt;
                        txtDescription.DataBind();
                        txtDescription.Items.Insert(0, new ListItem("-Select Project Head -", "0"));
                    }
                }

                else
                {
                    txtDescription.DataTextField = "";
                    txtDescription.DataSource = "";
                }
    
            }
     
}