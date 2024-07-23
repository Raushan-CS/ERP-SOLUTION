using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_payment_info : System.Web.UI.Page
{
    Connection cn = new Connection();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["tishcon"].ConnectionString);
    string invoiceNo;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.ToString().Contains("invoiceNo") )
        {
            if (!IsPostBack)
            {
                if (Session["admin"] != null)
                {
                    hiddenfield1.Value = Session["admin"].ToString();
                invoiceNo = Convert.ToString(Request.QueryString["invoiceNo"]);
                string pname = Convert.ToString(Request.QueryString["ProjectName"]);

                customer(invoiceNo);
                //IronPdf.AspxToPdf.RenderThisPageAsPdf();
                }
                else{
                    Response.Redirect("../index.aspx");
                }
            }
        }
    }


    //================================================= Method for Displaying Payment details ===================================================================

    void customer(string ids)
    {
        try
        {
            using (SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["tishcon"].ConnectionString))
            {
                SqlDataAdapter sde = new SqlDataAdapter("Select tb2.project_value as Value, tb2.project_name as PName, tb1.invoice_no as invoice_No, tb1.grand_tot as total, tb1.others, tb1.tax, tb1.billing_name, tb1.total_amt, tb1.entry_date, tb1.project_name, tb3.payment_dues as dueAmount, tb3.payment_received as paidAmount from  tbl_bill tb1 join tbl_project_details tb2 on tb1.project_name = tb2.project_name left join tbl_payment_history tb3 on tb1.invoice_no = tb3.invoice_no where tb1.invoice_no = '" + invoiceNo + "'", con2);
                DataTable dt = new DataTable();
                sde.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    recipno.Text = dt.Rows[0]["invoice_No"].ToString();
                    //recid.Text = dt.Rows[0][""].ToString();
                    Projectname.Text = dt.Rows[0]["PName"].ToString();
                    TotalAm.Text = dt.Rows[0]["total"].ToString();
                    PaidAm.Text = dt.Rows[0]["paidAmount"].ToString();
                    DueAm.Text = dt.Rows[0]["dueAmount"].ToString();
                    Projectvalue.Text = dt.Rows[0]["Value"].ToString();
                   // UserId.Text = dt.Rows[0]["usersid"].ToString();

                    if (DueAm.Text == "" && PaidAm.Text == "")
                    {
                        string date = DateTime.Now.ToString("yyyy-MM-dd");
                        string time = DateTime.Now.ToString("HH:mm:ss");
                        SqlCommand insert = new SqlCommand();
                        insert.CommandText = "insert into tbl_payment_history (invoice_no, project_name, project_value,   grand_tot,payment_received,payment_dues,entry_date,entry_time,entered_by)";
                        insert.CommandText += "values(@invoice, @PName, @PValue, @total, @receivedAmt,@duesAmt,@entry_dt,@entry_time,@enteredBy)";
                        insert.Parameters.AddWithValue("@invoice", recipno.Text);
                        
                        insert.Parameters.AddWithValue("@total", TotalAm.Text);
                        insert.Parameters.AddWithValue("@receivedAmt", "0");
                        insert.Parameters.AddWithValue("@duesAmt", TotalAm.Text );

                        insert.Parameters.AddWithValue("@entry_dt", date);
                        insert.Parameters.AddWithValue("@entry_time", time);
                        //insert.Parameters.AddWithValue("@recipt_no", (recipno.Text+":"+(Convert.ToInt32(RowsCount.Text)+1).ToString()));

                        insert.Parameters.AddWithValue("@PName", Projectname.Text);
                        insert.Parameters.AddWithValue("@PValue", Projectvalue.Text);
                        insert.Parameters.AddWithValue("@enteredBy", hiddenfield1.Value);
                        insert.Connection = con;
                        insert.Connection.Open();
                        insert.ExecuteNonQuery();
                        insert.Connection.Close();
                    }


                }
            }

            gdview(recipno.Text);
            ProjectHead(Projectname.Text);
        }
        catch (Exception ecx)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "messagebox", "alert('Message:" + ecx.Message + "');", true);
        }
    }

    //================================================= Method for Calculating PaidAmount and Dues amount according to Current Payment ===================================================================

    protected void CurPay_TextChanged(object sender, EventArgs e)
    {
        try
        {
            double dueamt;
            if (DueAm.Text != "")
            {
               dueamt = Convert.ToDouble(DueAm.Text);
            }
            else
            {
                dueamt = Convert.ToDouble(TotalAm.Text);
            }
            double curamt = Convert.ToDouble(CurPay.Text);
           
            double paidamt;
            try
            {
                paidamt = Convert.ToDouble(PaidAm.Text);
            }
            catch (Exception ex)
            {
                paidamt = 0;
                
            }

            if (curamt > dueamt)
            {
                CurPay.Text = "0";
                ClientScript.RegisterStartupScript(this.GetType(), "messagebox", "alert('Please enter amount less than due amount or equal to due amount');", true);
            }
            else
            {
                DueAm.Text = (dueamt - curamt).ToString();
                PaidAm.Text = (paidamt + curamt).ToString();

            }

        }
        catch (Exception ecx)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "messagebox", "alert('Message:" + ecx.Message + "');", true);
        }
    }

    //========================================================== Method for displaying transactiondetails in Gridview===========================================================================================

    void gdview(string ids)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["tishcon"].ConnectionString);
            con.Open();
            SqlDataAdapter sde = new SqlDataAdapter("Select * from transactionHistory where invoice_no='" + ids + "'", con);
            DataSet ds = new DataSet();
            sde.Fill(ds);
            DataTable dt = new DataTable();
            sde.Fill(dt);
            //RowsCount.Text = dt.Rows.Count.ToString();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    CultureInfo culture2 = new CultureInfo("en-US");
                    DateTime tempDate3 = Convert.ToDateTime(dr["entry_date"].ToString().Trim(), culture2);
                    dr["entry_date"] = tempDate3.ToString("dd-MM-yyyy");
                }
                GridView1.DataSource = dt;
                GridView1.DataBind();
                GridView1.Columns[1].Visible = false;    //To hide ID column in Gridview
            }
            else
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }


        }
        catch (Exception ex)
        {
            message.InnerText = ex.Message;
        }
    }

    //========== Method for saving values in transactionHistory and updating values in tbl_payment_history================================================

    protected void Submit_Click(object sender, EventArgs e)
    {
        int j = 1;
        DataTable dtr = new DataTable();
        dtr = BL.dtt("Select * from tbl_Receipt");
        if (dtr.Rows.Count > 0)
        {
            j = dtr.Rows.Count + 1;
        }
        else
        {
            j = dtr.Rows.Count + 1;
        }

        try
        {
            
            //DataTable dtb = new DataTable();
            //dtb = BL.dtt("Select * from transactionHistory where invoice_no = '" + recipno.Text + "' ");
            //if (dtb.Rows.Count > 0)
           // {

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



                DataTable dt = new DataTable();
                string date = DateTime.Now.ToString("yyyy-MM-dd");
                string time = DateTime.Now.ToString("hh:mm:ss");
                SqlCommand insert = new SqlCommand();
                insert.CommandText = "insert into transactionHistory (invoice_no,  project_head, grand_tot,payment_received,payment_dues,cur_pay,entry_date,entry_time,transaction_no,cheque_no,money_receipt_no,entered_by)";
                insert.CommandText += "values(@invoice,@projectHead,@total, @receivedAmt,@duesAmt,@curPay,@entry_dt,@entry_time,@bycas,@cheque,@moneyReceipt,@entered_by)";
                insert.CommandText += "insert into tbl_Receipt(receipt_no)";
                insert.CommandText += "values(@recipe_no)";
                insert.Parameters.AddWithValue("@invoice", recipno.Text);
                insert.Parameters.AddWithValue("@projectHead", ddlProjectHead.SelectedValue);
                //insert.Parameters.AddWithValue("@projectValue", Projectvalue.Text);
                insert.Parameters.AddWithValue("@total", TotalAm.Text);
                insert.Parameters.AddWithValue("@receivedAmt", PaidAm.Text);
                insert.Parameters.AddWithValue("@duesAmt", DueAm.Text);
                insert.Parameters.AddWithValue("@curPay", CurPay.Text);
                insert.Parameters.AddWithValue("@entry_dt", date);
                insert.Parameters.AddWithValue("@entry_time", time);
                //insert.Parameters.AddWithValue("@recipt_no", (recipno.Text+":"+(Convert.ToInt32(RowsCount.Text)+1).ToString()));

                insert.Parameters.AddWithValue("@bycas", TransactionNo.Text);
                insert.Parameters.AddWithValue("@cheque", chequeno.Text);
                insert.Parameters.AddWithValue("@moneyReceipt", rsno);
                insert.Parameters.AddWithValue("@entered_by", hiddenfield1.Value);
                insert.Parameters.AddWithValue("@recipe_no", rsno);


                insert.Connection = con;
                insert.Connection.Open();
                insert.ExecuteNonQuery();
                insert.Connection.Close();






                SqlCommand updates = new SqlCommand();
                updates.CommandText = "update tbl_payment_history set payment_received=@Paid_amt, payment_dues=@Balance_amt where invoice_no=@id";
                updates.Parameters.AddWithValue("@Paid_amt", PaidAm.Text);
                updates.Parameters.AddWithValue("@Balance_amt", DueAm.Text);
                updates.Parameters.AddWithValue("@id", recipno.Text);
                updates.Connection = con;
                updates.Connection.Open();
                updates.ExecuteNonQuery();
                updates.Connection.Close();



                ScriptManager.RegisterStartupScript(this, typeof(string), "MessageBox", "alert('Payment Added Successfully'); window.location='payment_info.aspx?invoiceNo=" + recipno.Text + "';", true);

                clear();
            //}
        }
        catch (Exception ex)
        {
            message.InnerText = ex.Message;
        }
        
        
    }

    public void clear()
{
    CurPay.Text = "0";
    TransactionNo.Text = "";
    chequeno.Text = "";
}

    //========================================================== Method for including Pagination in Gridview ===========================================================================================

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {


        GridView1.PageIndex = e.NewPageIndex;
        this.customer(invoiceNo); 
    
    }


    //========================================================== Method for Searching transactions according to dates entered ===========================================================================================

    protected void Button2_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["tishcon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            CultureInfo culture = new CultureInfo("en-US");
            DateTime tempDate = Convert.ToDateTime(Date1.Text.Trim(), culture);
            DateTime tempDate2 = Convert.ToDateTime(Date2.Text.Trim(), culture);
            SqlDataAdapter sde = new SqlDataAdapter("Select * from transactionHistory where entry_date BETWEEN '" + Date1.Text.Trim() + "' AND '" + Date2.Text.Trim() + "' and invoice_no ='" + recipno.Text + "' order by entry_date desc", con);
            DataTable dt = new DataTable();
            sde.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    CultureInfo culture2 = new CultureInfo("en-US");
                    DateTime tempDate3 = Convert.ToDateTime(dr["entry_date"].ToString().Trim(), culture);
                    dr["entry_date"] = tempDate3.ToString("dd-MM-yyyy");
                }
                GridView1.DataSource = dt;
                GridView1.DataBind();
                GridView1.Columns[1].Visible = false;    //To hide ID column in Gridview
            }
            else
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
        }
    }


    //=================   Method to populate dropdown with project Heads from database for selected invoice ====================================================

    protected void ProjectHead(string Pname)
    {
        DataTable dt = new DataTable();

        dt = BL.dtt("select project_head from tbl_project_head where project_name ='" + Pname + "'");
        populateHeads(dt);
    }

    public void populateHeads(DataTable dt)
    {
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ddlProjectHead.DataSource = dt;
                ddlProjectHead.DataBind();
                ddlProjectHead.Items.Insert(0, new ListItem("-Select Project Head -", "0"));
            }
        }

        else
        {
            ddlProjectHead.DataTextField = "";
            ddlProjectHead.DataSource = "";
        }

    }

   
}