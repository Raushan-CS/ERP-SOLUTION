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

public partial class Maker_edit_invoice : System.Web.UI.Page
{
    Connection cn = new Connection();
    BL bl = new BL();
    Message ms = new Message();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["tishcon"].ConnectionString);
    int i = 0;
    DataTable tmpdt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            if (Session["Maker"] != null)
            {
                HiddenField2.Value = Session["Maker"].ToString();
                string invoice = Request.QueryString["InvoiceNo"].ToString();
                //  gdview(id);
                Program(invoice);
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





    void Program(string invoiceNo)
    {
        DataTable dt = new DataTable();
        dt = BL.dtt("Select tb1.from_date, tb1.to_date, tb1.tax, tb1.others, tb1.bill_desc as BillDesc, tb2.desc_head as SubDesc, tb1.invoice_no as invoice_No, tb1.grand_tot as total, tb1.others, tb1.tax, tb1.billing_name, tb1.total_amt, tb1.entry_date, tb1.project_name, tb1.designation, tb1.project_order  from  tbl_bill tb1 left join tbl_bill_details tb2 on tb1.invoice_no = tb2.invoice_no   where tb1.invoice_no = '" + invoiceNo + "'");
        if (dt.Rows.Count > 0)
        {
            txtInvoiceNo.Text = dt.Rows[0]["invoice_no"].ToString();
            txtFunderName.Text = dt.Rows[0]["billing_name"].ToString();
            txtProjectName.Text = dt.Rows[0]["project_name"].ToString();
            txtBillDescription.Text = dt.Rows[0]["BillDesc"].ToString();
            txtDesignation.Text = dt.Rows[0]["designation"].ToString();
            txtProjectOrdDetails.Text = dt.Rows[0]["project_order"].ToString();
            txtFromDate.Text = (Convert.ToDateTime(dt.Rows[0]["from_date"])).ToString("yyyy-MM-dd");
            txtToDate.Text = (Convert.ToDateTime(dt.Rows[0]["to_date"])).ToString("yyyy-MM-dd");
            totalamount.Text = dt.Rows[0]["total"].ToString();
            //paidamount.Text = dt.Rows[0]["paidAmount"].ToString();
            //balancedue.Text = dt.Rows[0]["dueAmount"].ToString();
            txtTax.Text = dt.Rows[0]["tax"].ToString();
            txtOthers.Text = dt.Rows[0]["others"].ToString();
            txtTotal.Text = dt.Rows[0]["total_amt"].ToString();
        }

        DataTable dttemp = new DataTable();
        dttemp = BL.dtt("SELECT * FROM tbl_bill_details WHERE invoice_no='" + txtInvoiceNo.Text + "'");

        if (dttemp.Rows.Count > 0)
        {
            GridView2.DataSource = dttemp;
            GridView2.DataBind();
            GridView2.Columns[1].Visible = false;
        }
        else
        {
            GridView2.DataSource = dttemp;
            GridView2.DataBind();
        }

        populateHeads(txtProjectName.Text);
    }


    void gd1view()
    {
        DataTable dtt = new DataTable();
        dtt = BL.dtt("SELECT * FROM tbl_bill_details WHERE invoice_no='" + txtInvoiceNo.Text + "'");

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

    protected void btnAddHeading_Click(object sender, EventArgs e)
    {
        
            try
            {
                ms.billonlyDescp_entry_inedit(txtInvoiceNo.Text.Trim(), txtSubDesc.Text.Trim(), DateTime.Today, HiddenField2.Value);

            }
            catch (Exception ex)
            {
               
            }
        
        gd1view();
    }


    protected void btnAddSubDesc_Click(object sender, EventArgs e)
    {
        
            try
            {
                ms.billDesp_entry_inedit(txtInvoiceNo.Text.Trim(), txtSubDescription.Text.Trim(), txtUnit.Text.Trim(), txtQty.Text.Trim(), txtUnitPrice.Text.Trim(), Convert.ToDouble(txtAmount.Text.Trim()), DateTime.Today, HiddenField2.Value);
            }
            catch (Exception ex)
            {
                
            }
        
        gd1view();
    }


   

    //******************************************************** Calculating Total Amount on basis og Quantity and UnitPrice entered******************************************************** 
    protected void txtUnitPrice_TextChanged(object sender, EventArgs e)
    {

        long unit = Convert.ToInt64(txtQty.Text.ToString());
        long Qty = Convert.ToInt64(txtUnitPrice.Text.ToString()); 
        long Amount = unit * Qty;
        txtAmount.Text = Amount.ToString();
       
    }
    protected void txtQty_TextChanged(object sender, EventArgs e)
    {
        if (txtUnitPrice.Text != "")
        {
            long unit = Convert.ToInt64(txtQty.Text.ToString());
            long Qty = Convert.ToInt64(txtUnitPrice.Text.ToString()); ;
            long Amount = unit * Qty;
            txtAmount.Text = Amount.ToString();

           
        }
        //else
        //{
        //    lblMsg2.InnerText = "Please enter UnitPrice!";
        //}

    }








    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        double total = 0;
        int length = GridView2.Rows.Count;
        string s = "";
        int j = 0;
        foreach (GridViewRow row in GridView2.Rows)
        {
            var numberLabel = row.FindControl("lblAmt") as Label;
            double number;
            if (numberLabel != null)
            {
                if (double.TryParse(numberLabel.Text, out number))
                {
                    total += number;
                    txtTotal.Text = total.ToString();
                    double Tax = Convert.ToDouble(txtTax.Text.ToString());
                    double Others = Convert.ToDouble(txtOthers.Text.ToString());
                    totalamount.Text = (total + Tax + Others).ToString();
                    //********MixUp***********************
                   // balancedue.Text = (Convert.ToDouble(totalamount.Text.ToString()) - Convert.ToDouble(paidamount.Text.ToString())).ToString();
                }
            }
        }

        if (total > 0)
        {
            btnsave.Visible = true;
        }
        else
        {

        }

    }

    //================================================================Method to calculate Grandtotal and dues if Tax amount changed =================================================================================

    protected void txtTax_TextChanged(object sender, EventArgs e)
    {
        double Tax = Convert.ToDouble(txtTax.Text);
         double Othrs = Convert.ToDouble(txtOthers.Text);
         double Grandtot = Convert.ToDouble(totalamount.Text);
         double subtot = Convert.ToDouble(txtTotal.Text);
         //********MixUp***********************
        // double dues = Convert.ToDouble(balancedue.Text);
        

         double prevTax = Grandtot - (subtot + Othrs);
        double Taxdiff;
        if (prevTax > Tax)
        {
            Taxdiff = prevTax - Tax;
            Grandtot -= Taxdiff;
            //********MixUp***********************
           // dues -= Taxdiff;
        }
        else
        {
            Taxdiff = Tax - prevTax;
            Grandtot += Taxdiff;
            //********MixUp***********************
           // dues += Taxdiff;
        }
        
        totalamount.Text = Grandtot.ToString();
        //********MixUp***********************
       // balancedue.Text = dues.ToString();
    }

    //================================================================Method to calculate Grandtotal and dues if Others amount changed =================================================================================

    protected void txtOthers_TextChanged(object sender, EventArgs e)
    {

        double Tax = Convert.ToDouble(txtTax.Text);
        double Othrs = Convert.ToDouble(txtOthers.Text);
        double Grandtot = Convert.ToDouble(totalamount.Text);
        double subtot = Convert.ToDouble(txtTotal.Text);

        //********MixUp***********************
        //double dues = Convert.ToDouble(balancedue.Text);
       


        double prevOthrs = Grandtot - (subtot + Tax);
        double Othsdiff;
        if (prevOthrs > Othrs)
        {
            Othsdiff = prevOthrs - Othrs;
            Grandtot -= Othsdiff;
            //********MixUp***********************
            //dues -= Othsdiff;
        }
        else
        {
            Othsdiff = Othrs - prevOthrs;
            Grandtot += Othsdiff;
            //********MixUp***********************
            //dues += Othsdiff;
        }
        
        totalamount.Text = Grandtot.ToString();
        //********MixUp***********************
       // balancedue.Text = dues.ToString();
    }

    //================================================================Method to insert Book details in database =================================================================================

    protected void btnsave_Click(object sender, EventArgs e)
    {


        try
        {
            ms.update_bill(txtInvoiceNo.Text.Trim(),txtDesignation.Text.Trim(), txtProjectOrdDetails.Text.Trim(), txtBillDescription.Text.Trim(), Convert.ToDateTime(txtFromDate.Text.ToString()), Convert.ToDateTime(txtToDate.Text.ToString()), Convert.ToDouble(txtTotal.Text.Trim()), Convert.ToDouble(txtTax.Text.Trim()), Convert.ToDouble(txtOthers.Text.Trim()), Convert.ToDouble(totalamount.Text.Trim()));
             //clear();

            //********MixUp***********************
            ms.update_paymentHistory(txtInvoiceNo.Text.Trim(), txtProjectName.Text, Convert.ToDecimal(totalamount.Text.Trim()));

            ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Invoice details Updated!!'); window.location='edit_invoice.aspx?invoiceNo=" + txtInvoiceNo.Text + "';", true);
        }
        catch (Exception ex)
        { //lblmsg3.InnerText = ex.Message; 
        }
        
    }


    //=================================== Gridview Operations to edit data i gridview which will directly reflect in Database data Start =================================================

    protected void GridView2_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        btnsave.Visible = true;
        GridView2.EditIndex = e.NewEditIndex;
        gd1view();
    }

    protected void GridView2_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        btnsave.Visible = true;
        //Finding the controls from Gridview for the row which is going to update  

        Label ID = GridView2.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
        int s = Convert.ToInt32(ID.Text);

        TextBox Description = GridView2.Rows[e.RowIndex].FindControl("txtDescr") as TextBox;
        TextBox Unit = GridView2.Rows[e.RowIndex].FindControl("txtUnit") as TextBox;
        TextBox Quantity = GridView2.Rows[e.RowIndex].FindControl("txtQty") as TextBox;
        TextBox UnitPrice = GridView2.Rows[e.RowIndex].FindControl("txtUPrice") as TextBox;
        TextBox Amount = GridView2.Rows[e.RowIndex].FindControl("txtAmt") as TextBox;

        ms.update_billDetails(txtInvoiceNo.Text.Trim(), Description.Text.Trim(), Unit.Text.Trim(), Quantity.Text.Trim(), UnitPrice.Text.Trim(), Convert.ToDecimal(Amount.Text.Trim()), s);

       

        //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
        GridView2.EditIndex = -1;
        //Call ShowData method for displaying updated data  
        this.gd1view();
    }


    protected void GridView2_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        btnsave.Visible = true;
        Label ID = GridView2.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
        int s = Convert.ToInt32(ID.Text);

        GridView2.EditIndex = -1;
        this.gd1view();
    }


    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        btnsave.Visible = true;
        Label ID = GridView2.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
        int s = Convert.ToInt32(ID.Text);

        ms.delete_billDetails(s);
        ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Record Deleted');  window.location='#'; ", true);
     

        //Call method for displaying updated data  
        this.gd1view();
    }


    //=================   Method to populate dropdown with project Heads from database for selected Project Name ====================================================

   

    public void populateHeads(string PName)
    {
        DataTable dt = new DataTable();

        dt = BL.dtt("select project_head from tbl_project_head where project_name ='" + PName + "'");
        

        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                txtSubDesc.DataSource = dt;
                txtSubDesc.DataBind();
                txtSubDesc.Items.Insert(0, new ListItem("-Select Project Head -", "0"));
            }
        }

        else
        {
            txtSubDesc.DataTextField = "";
            txtSubDesc.DataSource = "";
        }

    }


   
}