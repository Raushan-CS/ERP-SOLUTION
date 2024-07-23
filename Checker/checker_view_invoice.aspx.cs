using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Text;
//using PdfSharp.Pdf;
//using TheArtOfDev.HtmlRenderer.PdfSharp;
//using PdfSharp;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
//using Syncfusion.HtmlConverter;
//using Syncfusion.Pdf;
//using System.Globalization;
using IronPdf;

//using iTextSharp.text;
//using iTextSharp.text.pdf;
//using iTextSharp.text.html;
//using iTextSharp.text.html.simpleparser;
//using System.Xml;
//using iTextSharp.tool.xml;

//using iTextSharp.text.xml;
//using iTextSharp.text.xml.simpleparser;
//using System.Windows.Forms;

public partial class Checker_checker_view_invoice : System.Web.UI.Page
{
    Connection cn = new Connection();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["tishcon"].ConnectionString);
    NumberToWords ns = new NumberToWords();
    Message ms = new Message();
    string invoice;
     StringBuilder htmlBuilder = new StringBuilder();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.QueryString.ToString().Contains("invoiceNo"))
        {
            invoice = Convert.ToString(Request.QueryString["invoiceNo"]);
            if (!IsPostBack)
            {
                comment.Visible = false;
                Div1.Visible = false;
                string memnos = Convert.ToString(Request.QueryString["invoiceNo"]);

                dataView(memnos);
               
                //IronPdf.AspxToPdf.RenderThisPageAsPdf();
            }
            
        }
    }

    void dataView(string memno)
    {
        string constr = ConfigurationManager.ConnectionStrings["tishcon"].ConnectionString;
        int totalam = 0;
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlDataAdapter sde = new SqlDataAdapter("select bil.invoice_no as inv, bil.billing_name as Billon, bil.designation as desig, bil.project_order as POrderDetails, bil.project_name as PName, bil.from_date as FromDate, bil.to_date as Todate, bd.desc_head, bil.entry_date as entryDt, bil.bill_desc as Descrip, bd.unit, bd.quantity, bd.unit_price, bd.amount from tbl_bill  bil join tbl_bill_details bd on bil.invoice_no = bd.invoice_no where bd.invoice_no = '" + memno + "'", con);
            DataTable dt = new DataTable();
            sde.Fill(dt);
            if (dt.Rows.Count > 0)
            {

                int dat = Convert.ToInt32(DateTime.Now.Month);
                string finYear;
                if (dat >= 1 && dat <= 3)
                {
                    int lastYear = Convert.ToInt32(DateTime.Now.Year);
                    lastYear = lastYear % 100;
                    finYear = (DateTime.Now.Year - 1).ToString() + "-" + lastYear.ToString();
                }
                else
                {
                    int lastYear = Convert.ToInt32(DateTime.Now.Year + 1);
                    lastYear = lastYear % 100;
                    finYear = (DateTime.Now.Year).ToString() + "-" + lastYear.ToString();

                }
                CultureInfo culture = new CultureInfo("en-US");
                NameOfOrganisation.InnerText = dt.Rows[0]["desig"].ToString().Trim();
                NameOfCust.InnerText = dt.Rows[0]["Billon"].ToString().Trim();
                project_name.InnerText = dt.Rows[0]["PName"].ToString().Trim();
                bill_desc.InnerText = dt.Rows[0]["Descrip"].ToString().Trim();
                DateTime fromDate = Convert.ToDateTime(dt.Rows[0]["FromDate"].ToString());
                period_from.InnerText = fromDate.ToString("dd-MM-yyyy");
                DateTime toDate = Convert.ToDateTime(dt.Rows[0]["Todate"].ToString());
                period_to.InnerText = toDate.ToString("dd-MM-yyyy");
                project_ord_details.InnerText = dt.Rows[0]["POrderDetails"].ToString().Trim();
                //      
                recip_no.InnerText = "Invoice No: SOL/ " + dt.Rows[0]["inv"].ToString().Trim() + "/ " + finYear;
                DateTime EntryDate = Convert.ToDateTime(dt.Rows[0]["entryDt"].ToString());
                entry_dat.InnerText = " Invoice Date : " + EntryDate.ToString("dd-MM-yyyy");

                     
            }
            else
            {
                NameOfOrganisation.InnerText = "Record Not Found";
            }
        }
        string constr2 = ConfigurationManager.ConnectionStrings["tishcon"].ConnectionString;
        using (SqlConnection con2 = new SqlConnection(constr2))
        {
            SqlDataAdapter sde = new SqlDataAdapter("select bil.invoice_no, bil.billing_name as Billon, bil.project_name, bil.bill_desc, bil.from_date, bil.to_date, bil.grand_tot as Grand, bil.total_amt as Total, bil.tax as Tax, bil.others as Others, bd.desc_head as Head, bd.unit as Unit, bd.quantity as Qnty, bd.unit_price as Price, bd.amount as Amt from tbl_bill  bil join tbl_bill_details bd on bil.invoice_no = bd.invoice_no where bd.invoice_no = '" + memno + "'", con2);
            DataTable dt = new DataTable();
            sde.Fill(dt);
            StringBuilder sb3 = new StringBuilder();
            if (dt.Rows.Count > 0)
            {
                double totall = Convert.ToDouble(dt.Rows[0]["Total"].ToString().Trim());
                double Gtotall = Convert.ToDouble(dt.Rows[0]["Grand"].ToString().Trim());
                double tax = Convert.ToDouble(dt.Rows[0]["Tax"].ToString().Trim());
                double others = Convert.ToDouble(dt.Rows[0]["Others"].ToString().Trim());
                sb3.Append("<table class='invoice-table'>");
                sb3.Append("<thead>");
                sb3.Append("<tr>");
                sb3.Append("<th>Product,Service Name/Description</th>");
                sb3.Append("<th>Unit</th>");
                sb3.Append("<th>Quantity</th>");
                sb3.Append("<th>Unit Price</th>");
                sb3.Append("<th>Amount</th>");
                sb3.Append("</tr>");
                sb3.Append("</thead>");
                sb3.Append("<tbody>");
                double paidamt;
                int i = 1;
                int j = 1;
                int g = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    sb3.Append("<tr>");
                    if (dr["Unit"].ToString() == "" && dr["Qnty"].ToString() == "" && dr["Price"].ToString() == "")
                    {
                        sb3.Append("<td colspan='5' style='text-align:left;padding-left:5px;'><b><span>" + i + ".</span> " + dr["Head"] + "</b></td>");
                        sb3.Append("</tr>");
                        j = i - g;
                        i++;
                        g++;
                    }
                    else
                    {
                        int k = i - 1;
                        sb3.Append("<td style='padding-left:10px;'> <span>" + k + "." + j + ".</span> " + dr["Head"] + "</td>");
                        sb3.Append("<td>" + dr["Unit"] + "</td>");
                        sb3.Append("<td>" + dr["Qnty"] + "</td>");
                        sb3.Append("<td>" + dr["Price"] + "</td>");
                        sb3.Append("<td style='padding-right:5px;'>" + dr["Amt"] + "</td>");

                        sb3.Append("</tr>");
                        j++;
                        k++;
                    }
                    //sb3.Append("<td>" + dr["Head"] + "</td>");
                   
                }
                string number = Gtotall.ToString().Trim();
                number = ns.ConvertAmount(double.Parse(number));
                double paidamts = (Convert.ToDouble(totalam) / 118) * 100;
                double cgsts = Math.Round(paidamts * 0.09, 2);
                double sgsts = Math.Round(paidamts * 0.09, 2);
                sb3.Append("<tr>");
                sb3.Append("<td colspan='4' style='text-align:right;padding-right:5px;'><b>Total</b></td>");
                sb3.Append("<td class='bold-see' style='padding-right:5px;'>" + totall + "</td>");
                sb3.Append("</tr>");

                sb3.Append("<tr>");
                sb3.Append("<td colspan='4' style='text-align:right;padding-right:5px;'><b>Tax If any</b></td>");
                sb3.Append("<td class='bold-see' style='padding-right:5px;'>" + tax + "</td>");
                sb3.Append("</tr>");

                sb3.Append("<tr>");
                sb3.Append("<td colspan='4' style='text-align:right;padding-right:5px;'><b>Others If any</b></td>");
                sb3.Append("<td class='bold-see' style='padding-right:5px;'>" + others + "</td>");
                sb3.Append("</tr>");

                sb3.Append("<tr>");
                sb3.Append("<td colspan='4' style='text-align:right;padding-right:5px;'><b>Grand Total</b></td>");
                sb3.Append("<td class='bold-see' style='padding-right:5px;'>" + Gtotall + "</td>");
                sb3.Append("</tr>");

                sb3.Append("<tr>");
                sb3.Append("<td colspan='5' style='text-align:center;'><b><span>&#8377;  </span>" + number + "/-</b></td>");
                sb3.Append("</tr>");



                sb3.Append("</tbody>");
                sb3.Append("</table>");
              
                tblprg.InnerHtml = sb3.ToString();
            }
            else
            {
                NameOfOrganisation.InnerText = "Record Not Found";
            }
        }

    }

    protected void ddlInvoiceStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        if (ddlInvoiceStatus.SelectedValue.Trim() == "Approved")
        {
            DataTable dt = new DataTable();
            dt = BL.dtt("Select * from tbl_bill where invoice_no = '" + invoice + "'");
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["status"].ToString() == "Approved")
                {
                    ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Bill Already Approved!!'); window.close(); ", true);
                    ScriptManager.RegisterStartupScript(this, typeof(string), " ", " window.opener.location.reload('view_invoiceList.aspx')", true);
                }
                else
                {

                    BL.ExecuteNonQuery("update tbl_bill set status='Approved', comment='' where invoice_no = '" + invoice + "'");
                    ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Bill Approved'); window.close(); ", true);


                    ScriptManager.RegisterStartupScript(this, typeof(string), " ", " window.opener.location.reload('view_invoiceList.aspx')", true);
                }


            }
        }
        else if (ddlInvoiceStatus.SelectedValue.Trim() == "Disapproved")
        {
            comment.Visible = true;
            Div1.Visible = true;
             DataTable dt = new DataTable();
            dt = BL.dtt("Select * from tbl_bill where invoice_no = '" + invoice + "'");
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["status"].ToString() == "Disapproved")
                {
                    ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Bill Already Disapproved!!'); window.close(); ", true);
                    ScriptManager.RegisterStartupScript(this, typeof(string), " ", " window.opener.location.reload('view_invoiceList.aspx')", true);
                }
                else
                {
                    BL.ExecuteNonQuery("update tbl_bill set status='Disapproved' where invoice_no = '" + invoice + "'");
                }
                

            }
           
        }
    }


    protected void save_comment_Click(object sender, EventArgs e)
    {
        string inv = invoice;
        try
        {
            ms.add_comment(txtComment.Text.Trim(), invoice);
            ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Comment Added');window.close();  ", true);
            ScriptManager.RegisterStartupScript(this, typeof(string), " ", " window.opener.location.reload('view_invoiceList.aspx')", true);
        }
        catch (Exception ex) 
        {
            lblmsg.InnerText = ex.Message;
        }
    }


    protected void Button3_Click(object sender, EventArgs e)
    {


       


        //Response.ContentType = "application/pdf";
        //Response.AddHeader("content-disposition", "attachment;filename=Panel.pdf");
        //Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //StringWriter stringWriter = new StringWriter();
        //HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);
        //download_section.RenderControl(htmlTextWriter);
        //StringReader stringReader = new StringReader(stringWriter.ToString());
        //Document Doc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
        //HTMLWorker htmlparser = new HTMLWorker(Doc);
        ////XMLWorker xmlparser = new XMLWorker(
        //PdfWriter.GetInstance(Doc, Response.OutputStream);
        //Doc.Open();

        //htmlparser.Parse(stringReader);

        //Doc.Close();
        //Response.Write(Doc);
        //Response.End();

        //using (StringWriter sw = new StringWriter())
        //{
        //    using (HtmlTextWriter hw = new HtmlTextWriter(sw))
        //    {
        //        download_section.RenderControl(hw);
        //        StringReader sr = new StringReader(sw.ToString());
        //        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
        //        PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        //        pdfDoc.Open();

        //        XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
        //        pdfDoc.Close();
        //        Response.ContentType = "application/pdf";
        //        Response.AddHeader("content-disposition", "attachment;filename=Panel.pdf");
        //        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //        Response.Write(pdfDoc);
        //        Response.End();

        //    }
        //}
        //DownloadPDF();
       
    }

    
    

   


}