using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using IronPdf;


public partial class User_user_transaction_receipt : System.Web.UI.Page
{
    Connection cn = new Connection();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["tishcon"].ConnectionString);
    NumberToWords ns = new NumberToWords();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.ToString().Contains("invoiceNo") && Request.QueryString.ToString().Contains("ID"))
        {
            if (!IsPostBack)
            {
                if (Session["User"] != null)
                {
                    string memnos = Convert.ToString(Request.QueryString["invoiceNo"]);
                    int id = Convert.ToInt32(Request.QueryString["ID"].Trim());
                    dataView(memnos, id);
                    //IronPdf.AspxToPdf.RenderThisPageAsPdf();
                }
                else { Response.Redirect("../index.aspx"); }
            }
            
        }
    }

    void dataView(string InvoiceNum, int Id)
    {
        DataTable dt = new DataTable();
        dt = BL.dtt("Select tb1.funder_name, tb1.funder_contact, tb1.funder_email, tb1.pan, tb1.uid, tb1.address, th.id, th.cheque_no, th.cur_pay, th.entry_date as ReceivedDate, th.transaction_no, th.project_head, th.money_receipt_no from tbl_funder tb1 join tbl_bill tb2 on tb1.funder_name = tb2.billing_name join transactionHistory th on tb2.invoice_no = th.invoice_no  where tb2.invoice_no = '" + InvoiceNum + "' and th.id = " + Id + "");
        if (dt.Rows.Count > 0)
        {
            lbl_recipt.Text = dt.Rows[0]["money_receipt_no"].ToString();
            lbl_name.Text = dt.Rows[0]["funder_name"].ToString();
            lbl_date.Text = dt.Rows[0]["ReceivedDate"].ToString();
            lbl_address.Text = dt.Rows[0]["address"].ToString();

            //lbl_recipt.Text = dt.Rows[0]["ReceivedDate"].ToString();

            string number = dt.Rows[0]["cur_pay"].ToString();
            number = ns.ConvertAmount(double.Parse(number));

            contact.InnerText = dt.Rows[0]["funder_contact"].ToString();
            email.InnerText = dt.Rows[0]["funder_email"].ToString();
            pan.InnerText = dt.Rows[0]["pan"].ToString();
            uid.InnerText = dt.Rows[0]["uid"].ToString();

            amount.InnerText = dt.Rows[0]["cur_pay"].ToString();
            amt_words.InnerText = number;
            transaction_no.InnerText = dt.Rows[0]["transaction_no"].ToString();
            majorHead.InnerText = dt.Rows[0]["project_head"].ToString();
            cudt.Text = DateTime.Today.ToString("dd-MM-yyyy");
            pay_mode.InnerText = dt.Rows[0]["cheque_no"].ToString();

            //******************************* Second Section ************************************
            lblReceipt.Text = dt.Rows[0]["money_receipt_no"].ToString();
            lblReceived.Text = dt.Rows[0]["funder_name"].ToString();
            LblReceivedDate.Text = dt.Rows[0]["ReceivedDate"].ToString();
            lblAddress.Text = dt.Rows[0]["address"].ToString();




            contact1.InnerText = dt.Rows[0]["funder_contact"].ToString();
            email1.InnerText = dt.Rows[0]["funder_email"].ToString();
            pan1.InnerText = dt.Rows[0]["pan"].ToString();
            uid1.InnerText = dt.Rows[0]["uid"].ToString();

            amtReceived.InnerText = dt.Rows[0]["cur_pay"].ToString();
            amtReceived_words.InnerText = number;
            //         mode.InnerText = 
            transact.InnerText = dt.Rows[0]["transaction_no"].ToString();
            majrHead.InnerText = dt.Rows[0]["project_head"].ToString();
            current.Text = DateTime.Today.ToString("dd-MM-yyyy");
            mode.InnerText = dt.Rows[0]["cheque_no"].ToString();




        }
    }
}