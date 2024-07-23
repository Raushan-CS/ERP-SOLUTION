using System.Data.SqlClient;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Configuration;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Net.Sockets;
using System.Globalization;
using System;

/// <summary>
/// Summary description for Message
/// </summary>
public class Message
{
    SqlConnection con = Connection.connect();
    
	public Message()
	{
	}

    //==================================================================== Admin Login logic=================================================================================

    public DataSet login(string username, string password)
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM login WHERE username=@user_id and password=@password";
        cmd.Parameters.AddWithValue("@user_id", username);
        cmd.Parameters.AddWithValue("@password", password);
        try
        {
            cmd.Connection = con;
            cmd.Connection.Open();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(ds);
            cmd.Connection.Close();
            return ds;
        }
        catch
        {
            return null;
        }
    }

    //==================================================================== User Login logic=================================================================================

    public DataSet maker_checker_login(string username, string password)
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM tbl_maker_checker WHERE username=@user_id and password=@password";
        cmd.Parameters.AddWithValue("@user_id", username);
        cmd.Parameters.AddWithValue("@password", password);
        try
        {
            cmd.Connection = con;
            cmd.Connection.Open();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(ds);
            cmd.Connection.Close();
            return ds;
        }
        catch
        {
            return null;
        }
    }

    
         //====================================================================User Entry by Admin =================================================================================


    public bool user_entry(string Name, string user_name, string password,  DateTime date, string created_by)
    {
        SqlCommand insert = new SqlCommand();
        insert.CommandText = "insert into tbl_user(name,  username, password, entry_date, created_by)";
        insert.CommandText += "Values(@name,@user_name,@password, @entry_date,@created_by)";
        insert.Parameters.AddWithValue("@user_name", user_name);
        insert.Parameters.AddWithValue("@name", Name);
        insert.Parameters.AddWithValue("@password", password);
      
        CultureInfo culture = new CultureInfo("en-IN");
        //string date = DateTime.Now.ToString("dd-MM-yyyy");
        //DateTime dtfromdate = Convert.ToDateTime(date, culture);
 
        insert.Parameters.AddWithValue("@entry_date", date);
        insert.Parameters.AddWithValue("@created_by", created_by);
        //insert.Parameters.AddWithValue("@status", "0");
        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }

    //==================================================================== User Login logic=================================================================================

    public DataSet user_login(string username, string password)
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM tbl_user WHERE username=@user_id and password=@password";
        cmd.Parameters.AddWithValue("@user_id", username);
        cmd.Parameters.AddWithValue("@password", password);
        try
        {
            cmd.Connection = con;
            cmd.Connection.Open();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(ds);
            cmd.Connection.Close();
            return ds;
        }
        catch
        {
            return null;
        }
    }


    //====================================================================Maker/Checker Entry by Admin =================================================================================
 

    public bool create_user(string Name,string Mobile, string user_name, string password,string Address, string UserType, DateTime date, string created_by)
    {
        SqlCommand insert = new SqlCommand();
        insert.CommandText = "insert into tbl_maker_checker(name,mobile,  username, password, address,user_type, entry_date, created_by)";
        insert.CommandText += "Values(@name, @mobile, @user_name,@password,@address, @usertype, @entry_date,@created_by)";
        insert.Parameters.AddWithValue("@user_name", user_name);
        insert.Parameters.AddWithValue("@name", Name);
        insert.Parameters.AddWithValue("@password", password);
        insert.Parameters.AddWithValue("@address", Address);
        insert.Parameters.AddWithValue("@usertype", UserType);
        CultureInfo culture = new CultureInfo("en-IN");
        //string date = DateTime.Now.ToString("dd-MM-yyyy");
        //DateTime dtfromdate = Convert.ToDateTime(date, culture);
        insert.Parameters.AddWithValue("@mobile", Mobile);
        insert.Parameters.AddWithValue("@entry_date", date);
        insert.Parameters.AddWithValue("@created_by", created_by);
        //insert.Parameters.AddWithValue("@status", "0");
        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }


    //====================================================================Funder Registration Entry by Admin =================================================================================


    public bool create_funder(string Name, string Mobile, string EmailId, string FunderType, string Pan, string UID, string Address, DateTime date, string created_by)
    {
        SqlCommand insert = new SqlCommand();
        insert.CommandText = "insert into tbl_funder(funder_name, funder_contact, funder_email, funder_type, pan, uid, address, entry_date, entered_by)";
        insert.CommandText += "Values(@name, @mobile, @email,@fundertype,@pan,@uid, @address, @entry_date,@created_by)";
        insert.Parameters.AddWithValue("@name", Name);
        insert.Parameters.AddWithValue("@mobile", Mobile);
        insert.Parameters.AddWithValue("@email", EmailId);
        insert.Parameters.AddWithValue("@fundertype", FunderType);
        insert.Parameters.AddWithValue("@pan", Pan);
        CultureInfo culture = new CultureInfo("en-IN");
        //string date = DateTime.Now.ToString("dd-MM-yyyy");
        //DateTime dtfromdate = Convert.ToDateTime(date, culture);
        insert.Parameters.AddWithValue("@uid", UID);
        insert.Parameters.AddWithValue("@address", Address);
        insert.Parameters.AddWithValue("@entry_date", date);
        insert.Parameters.AddWithValue("@created_by", created_by);
        //insert.Parameters.AddWithValue("@status", "0");
        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }

     //==================================================================== Create Project with details Admin =================================================================================


    public bool create_project(string Name, string Location, string Type, string Value, string Timeline, DateTime date, string created_by)
    {
        SqlCommand insert = new SqlCommand();
        insert.CommandText = "insert into tbl_project_details(project_name, project_location,  project_type, project_value, project_timeline,  entry_date, entered_by)";
        insert.CommandText += "Values(@name, @location, @type, @value, @timeline,   @entry_date,@created_by)";
        insert.Parameters.AddWithValue("@location", Location);
        insert.Parameters.AddWithValue("@name", Name);
        insert.Parameters.AddWithValue("@type", Type);
        insert.Parameters.AddWithValue("@timeline", Timeline);
        insert.Parameters.AddWithValue("@value", Value);
        CultureInfo culture = new CultureInfo("en-IN");
        //string date = DateTime.Now.ToString("dd-MM-yyyy");
        //DateTime dtfromdate = Convert.ToDateTime(date, culture);
       
        insert.Parameters.AddWithValue("@entry_date", date);
        insert.Parameters.AddWithValue("@created_by", created_by);
        //insert.Parameters.AddWithValue("@status", "0");
        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }

    //==================================================================== Update Project details Admin =================================================================================

    public bool update_project(string PName, string PLocation, string PType, string PValue, string PTimeline, int id)
    {
        SqlCommand cmd = new SqlCommand("Update tbl_project_details set project_name=@Name, project_location=@location, project_type= @type, project_value=@value, project_timeline=@timeline where ID =@id");
        cmd.Parameters.AddWithValue("@value", PValue);

        cmd.Parameters.AddWithValue("@timeline", PTimeline);
        cmd.Parameters.AddWithValue("@Name", PName);
        cmd.Parameters.AddWithValue("@location", PLocation);
        cmd.Parameters.AddWithValue("@type", PType);

        cmd.Parameters.AddWithValue("@id", id);

        cmd.Connection = con;
        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        return true;
    }

     //==================================================================== Create Project Type Admin =================================================================================


    public bool create_project_type(string ProjectType, DateTime date, string created_by)
    {
        SqlCommand insert = new SqlCommand();
        insert.CommandText = "insert into tbl_project_type(project_type, entry_date, created_by)";
        insert.CommandText += "Values(@type, @entry_date,@created_by)";
        insert.Parameters.AddWithValue("@type", ProjectType);
        CultureInfo culture = new CultureInfo("en-IN");
        //string date = DateTime.Now.ToString("dd-MM-yyyy");
        //DateTime dtfromdate = Convert.ToDateTime(date, culture);       
        insert.Parameters.AddWithValue("@entry_date", date);
        insert.Parameters.AddWithValue("@created_by", created_by);
        //insert.Parameters.AddWithValue("@status", "0");
        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }

    //==================================================================== Update Project Type Admin =================================================================================

    public bool update_project_type(string TypeName, int id)
    {
        SqlCommand cmd = new SqlCommand("Update tbl_project_type set project_type=@Type where id =@id");
        cmd.Parameters.AddWithValue("@Type", TypeName);      
        cmd.Parameters.AddWithValue("@id", id);

        cmd.Connection = con;
        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        return true;
    }

 //*==================================================================== Adding Bill data =================================================================================
    public bool add_bill_data(string InvoiceNo, string BillingName, string Designation, string ProjectOrder, string ProjectName, string BillDesc, DateTime From, DateTime To, double Amount, double Tax, double Others, double GTotal, DateTime date, string entered_by)
    {
        SqlCommand insert = new SqlCommand();
        insert.CommandText = "INSERT INTO tbl_bill(invoice_no, billing_name, designation, project_order, project_name,  bill_desc, from_date, to_date, total_amt, tax, others, grand_tot,  entry_date, entered_by)";
        insert.CommandText += "Values(@invoice_no,@billing_name, @designation, @projectOrdrDetails, @project_name, @billDesc,  @fromDate, @toDate, @total, @tax, @others, @grand, @entry_date, @entered_by)";
        insert.Parameters.AddWithValue("@invoice_no", InvoiceNo);
        insert.Parameters.AddWithValue("@billing_name", BillingName);
        insert.Parameters.AddWithValue("@project_name", ProjectName);
        insert.Parameters.AddWithValue("@designation", Designation);
        insert.Parameters.AddWithValue("@projectOrdrDetails", ProjectOrder);
        insert.Parameters.AddWithValue("@billDesc", BillDesc);
        CultureInfo culture = new CultureInfo("en-IN");
        insert.Parameters.AddWithValue("@fromDate", From);
        insert.Parameters.AddWithValue("@toDate", To);

        insert.Parameters.AddWithValue("@total", Amount);
        insert.Parameters.AddWithValue("@tax", Tax);
        insert.Parameters.AddWithValue("@others", Others);
        insert.Parameters.AddWithValue("@grand", GTotal);
        
      
        insert.Parameters.AddWithValue("@entry_date", date);
        insert.Parameters.AddWithValue("@entered_by", entered_by);
        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();

        return true;
    }

     //*==================================================================== Adding Bill Invoice receipt number ==============================================================
    public bool addbillReceipt(string InvoiceNo)
    {
        SqlCommand insert = new SqlCommand();
        insert.CommandText += "insert into tbl_invoiceReceipt(invoice_receipt)";
        insert.CommandText += "values(@recipe_no)";
        insert.Parameters.AddWithValue("@recipe_no", InvoiceNo);

        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }
    


    //*==================================================================== Updating bill for tbl_bill by Maker=================================================================================
    public bool update_bill(string InvoiceNo,string Designation, string ProjectOrder,  string BillDesc, DateTime From, DateTime To, double Amount, double Tax, double Others, double GTotal)
    {
        SqlCommand insert = new SqlCommand();

        insert.CommandText = "update tbl_bill set designation = @Desig, project_order=@pOrderDetails, bill_desc= @Bill_Desc, from_date= @fromDate, to_date = @toDate, total_amt=@total, tax=@tax,  others=@others, grand_tot= @grand  where invoice_no = @invoice_no ";

        insert.Parameters.AddWithValue("@invoice_no", InvoiceNo);
       // insert.Parameters.AddWithValue("@billing_name", BillingName);
        insert.Parameters.AddWithValue("@Desig", Designation);
        insert.Parameters.AddWithValue("@pOrderDetails", ProjectOrder);
        insert.Parameters.AddWithValue("@Bill_Desc", BillDesc);

        CultureInfo culture = new CultureInfo("en-IN");
        insert.Parameters.AddWithValue("@fromDate", From);
        insert.Parameters.AddWithValue("@toDate", To);

        insert.Parameters.AddWithValue("@total", Amount);
        insert.Parameters.AddWithValue("@tax", Tax);
        insert.Parameters.AddWithValue("@others", Others);
        insert.Parameters.AddWithValue("@grand", GTotal);


        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }


        //*==================================================================== Bill  details entry =================================================================================

    public bool bill_descriptions_empty(string InvoiceNo, string Description, DateTime date, string entered_by)
    {
        SqlCommand insert = new SqlCommand();
        insert.CommandText = "insert into tbl_bill_details( invoice_no, desc_head,  entry_date, entered_by)";
        insert.CommandText += "Values(@invoice_no, @desc, @entry_date, @entered_by)";
        insert.Parameters.AddWithValue("@invoice_no", InvoiceNo);
        insert.Parameters.AddWithValue("@desc", Description);
       
        insert.Parameters.AddWithValue("@entry_date", date);
        insert.Parameters.AddWithValue("@entered_by", entered_by);
        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }



    

    //*==================================================================== Bill  details entry =================================================================================

    public bool bill_descriptions(string InvoiceNo, string Description, string Unit, string Quantity, string Price, double Amount, DateTime date, string entered_by)
    {
        SqlCommand insert = new SqlCommand();
        insert.CommandText = "insert into tbl_bill_details( invoice_no, desc_head, unit, quantity, unit_price, amount, entry_date, entered_by)";
        insert.CommandText += "Values(@invoice_no, @desc, @unit, @qty, @price, @amt,  @entry_date, @entered_by)";
        insert.Parameters.AddWithValue("@invoice_no", InvoiceNo);
        insert.Parameters.AddWithValue("@desc", Description);
        
        insert.Parameters.AddWithValue("@unit", Unit);
        insert.Parameters.AddWithValue("@qty", Quantity);
        insert.Parameters.AddWithValue("@price", Price);
        insert.Parameters.AddWithValue("@amt", Amount);
        insert.Parameters.AddWithValue("@entry_date", date);
        insert.Parameters.AddWithValue("@entered_by", entered_by);
        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }

 //==================================================================== Add Comments for disapproval =================================================================================

    public bool add_comment(string Comment, string InvoiceNo)
    {
        SqlCommand insert = new SqlCommand();
        insert.CommandText = "update tbl_bill set comment = @comment where  invoice_no = @invoice_no ";
      
        insert.Parameters.AddWithValue("@comment", Comment);
        insert.Parameters.AddWithValue("@invoice_no", InvoiceNo);
       
        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }


    //==================================================================== Update Table Payment History =================================================================================

    public bool add_payment_history(string Invoice, string ProjectName, string ProjectValue, double Total, double Received, double Dues, DateTime date, string entered_by )
    {
        SqlCommand insert = new SqlCommand();
        insert.CommandText = "insert into tbl_payment_history( invoice_no, project_name, project_value,grand_tot, payment_received, payment_dues, entry_date, entered_by)";
        insert.CommandText += "Values(@invoice_no, @name,@value,@total, @receive, @due,  @entry_date, @entered_by)";
        insert.Parameters.AddWithValue("@invoice_no", Invoice);
        insert.Parameters.AddWithValue("@name", ProjectName);
        insert.Parameters.AddWithValue("@value", ProjectValue);
        insert.Parameters.AddWithValue("@total", Total);
        insert.Parameters.AddWithValue("@receive", Received);
        insert.Parameters.AddWithValue("@due", Dues);
       
        insert.Parameters.AddWithValue("@entry_date", date);
        insert.Parameters.AddWithValue("@entered_by", entered_by);
        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }


    //==================================================================== Bill  details entry during Edit by Maker =================================================================================

    public bool insert_bill_details_heading(string InvoiceNo, string Description, string BillDescription, DateTime date, string entered_by)
    {
        SqlCommand insert = new SqlCommand();
        insert.CommandText = "insert into tbl_bill_details( invoice_no, desc_head, sub_desc , entry_date, entered_by)";
        insert.CommandText += "Values(@invoice_no, @desc,@subDesc,   @entry_date, @entered_by)";
        insert.Parameters.AddWithValue("@invoice_no", InvoiceNo);
        insert.Parameters.AddWithValue("@desc", Description);
        insert.Parameters.AddWithValue("@subDesc", BillDescription);



        insert.Parameters.AddWithValue("@entry_date", date);
        insert.Parameters.AddWithValue("@entered_by", entered_by);
        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }


    //==================================================================== Bill  details entry during Edit by Maker =================================================================================

    public bool insert_bill_details(string InvoiceNo, string Description, string BillDescription, string Unit, string Quantity, string Price, double Amount, DateTime date, string entered_by)
    {
        SqlCommand insert = new SqlCommand();
        insert.CommandText = "insert into tbl_bill_details( invoice_no, desc_head, sub_desc,unit, quantity, unit_price, amount, entry_date, entered_by)";
        insert.CommandText += "Values(@invoice_no, @desc,@subDesc,@unit, @qty, @price, @amt,  @entry_date, @entered_by)";
        insert.Parameters.AddWithValue("@invoice_no", InvoiceNo);
        insert.Parameters.AddWithValue("@desc", Description);
        insert.Parameters.AddWithValue("@subDesc", BillDescription);
        insert.Parameters.AddWithValue("@unit", Unit);
        insert.Parameters.AddWithValue("@qty", Quantity);
        insert.Parameters.AddWithValue("@price", Price);
        insert.Parameters.AddWithValue("@amt", Amount);
        insert.Parameters.AddWithValue("@entry_date", date);
        insert.Parameters.AddWithValue("@entered_by", entered_by);
        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }

    
         //*==================================================================== UPdating bill for tbl_bill by Maker=================================================================================
     public bool update_bill(string InvoiceNo, string BillingName, string BillDesc,  DateTime From, DateTime To, double Amount, double Tax, double Others, double GTotal)
   
    {
        SqlCommand insert = new SqlCommand();

        insert.CommandText = "update tbl_bill set billing_name = @billing_name, bill_desc= @Bill_Desc, from_date= @fromDate, to_date = @toDate, total_amt=@total, tax=@tax,  others=@others, grand_tot= @grand  where invoice_no = @invoice_no ";

        insert.Parameters.AddWithValue("@invoice_no", InvoiceNo);
        insert.Parameters.AddWithValue("@billing_name", BillingName);
        insert.Parameters.AddWithValue("@Bill_Desc", BillDesc); 

        CultureInfo culture = new CultureInfo("en-IN");
        insert.Parameters.AddWithValue("@fromDate", From);
        insert.Parameters.AddWithValue("@toDate", To);

        insert.Parameters.AddWithValue("@total", Amount);
        insert.Parameters.AddWithValue("@tax", Tax);
        insert.Parameters.AddWithValue("@others", Others);
        insert.Parameters.AddWithValue("@grand", GTotal);

      
        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }

     //*==================================================================== Bill  details entry during Edit =================================================================================

    public bool update_billDetails(string InvoiceNo, string Description,  string Unit, string Quantity, string Price, decimal Amount, int ID)
    {
        SqlCommand insert = new SqlCommand();

        insert.CommandText = "update tbl_bill_details set desc_head = @desc,  unit= @unit, quantity = @qty, unit_price=@price, amount=@amt where invoice_no = @invoice_no and id =@id";
        
        insert.Parameters.AddWithValue("@invoice_no", InvoiceNo);
        insert.Parameters.AddWithValue("@desc", Description);
      
        insert.Parameters.AddWithValue("@unit", Unit);
        insert.Parameters.AddWithValue("@qty", Quantity);
        insert.Parameters.AddWithValue("@price", Price);
        insert.Parameters.AddWithValue("@amt", Amount);
        insert.Parameters.AddWithValue("@id", ID);
      
        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }


         //==================================================================== Updating Table Payment History =================================================================================

    public bool update_paymentHistory(string InvoiceNo, string ProjectName, decimal Total)
    {
        SqlCommand insert = new SqlCommand();
        insert.CommandText = "update tbl_payment_history set  grand_tot = @Gtotal where invoice_no = @invoice and project_name = @PName ";

        insert.Parameters.AddWithValue("@invoice", InvoiceNo);
        insert.Parameters.AddWithValue("@Gtotal", Total);
       
        insert.Parameters.AddWithValue("@PName", ProjectName);
        
        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }



    


    //==================================================================== Deleting record from tbl_bill_details =================================================================================

    public bool delete_billDetails(int Id)
    {

        SqlCommand cmd = new SqlCommand("delete from tbl_bill_details where ID = @id");
        cmd.Parameters.AddWithValue("@id", Id);
        cmd.Connection = con;
        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        return true;
    }


    //*==================================================================== Bill  details entry =================================================================================

    public bool billonlyDescp_entry_inedit(string InvoiceNo, string Description,   DateTime date, string entered_by)
    {
        SqlCommand insert = new SqlCommand();
        insert.CommandText = "insert into tbl_bill_details( invoice_no, desc_head,   entry_date, entered_by)";
        insert.CommandText += "Values(@invoice_no, @desc,  @entry_date, @entered_by)";
        insert.Parameters.AddWithValue("@invoice_no", InvoiceNo);
        insert.Parameters.AddWithValue("@desc", Description);
       
        insert.Parameters.AddWithValue("@entry_date", date);
        insert.Parameters.AddWithValue("@entered_by", entered_by);
        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }





    //*==================================================================== Bill  details entry =================================================================================

    public bool billDesp_entry_inedit(string InvoiceNo, string Description,  string Unit, string Quantity, string Price, double Amount, DateTime date, string entered_by)
    {
        SqlCommand insert = new SqlCommand();
        insert.CommandText = "insert into tbl_bill_details( invoice_no, desc_head, unit, quantity, unit_price, amount, entry_date, entered_by)";
        insert.CommandText += "Values(@invoice_no, @desc,@unit, @qty, @price, @amt,  @entry_date, @entered_by)";
        insert.Parameters.AddWithValue("@invoice_no", InvoiceNo);
        insert.Parameters.AddWithValue("@desc", Description);
        
        insert.Parameters.AddWithValue("@unit", Unit);
        insert.Parameters.AddWithValue("@qty", Quantity);
        insert.Parameters.AddWithValue("@price", Price);
        insert.Parameters.AddWithValue("@amt", Amount);
        insert.Parameters.AddWithValue("@entry_date", date);
        insert.Parameters.AddWithValue("@entered_by", entered_by);
        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }

         //*==================================================================== Project Head details entry =================================================================================
    public bool add_head(string ProjectName, string ProjectHead, string HeadAmount, DateTime Date)
    {
        SqlCommand insert = new SqlCommand();
        insert.CommandText = "insert into tbl_project_head( project_name, project_head, head_amt, entry_dt)";
        insert.CommandText += "Values(@projectName, @projectHead,@headAmount,  @entry_date)";
        insert.Parameters.AddWithValue("@projectName", ProjectName);
        insert.Parameters.AddWithValue("@projectHead", ProjectHead);

        insert.Parameters.AddWithValue("@headAmount", HeadAmount);
        insert.Parameters.AddWithValue("@entry_date", Date);
        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }

         //==================================================================== Project Head details updation =================================================================================
    public bool update_HeadDetails( string ProjectHead, string HeadAmount, int id)
    {
        SqlCommand insert = new SqlCommand();
        insert.CommandText = "update tbl_project_head set project_head  = @projectHead, head_amt = @headAmt where id = @Id";

        insert.Parameters.AddWithValue("@projectHead", ProjectHead);
        insert.Parameters.AddWithValue("@headAmt", HeadAmount);

       
        insert.Parameters.AddWithValue("@Id", id);
        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }

         //==================================================================== Deleting record from tbl_project_head =================================================================================

    public bool delete_projHead(int Id)
    {

        SqlCommand cmd = new SqlCommand("delete from tbl_project_head where ID = @id");
        cmd.Parameters.AddWithValue("@id", Id);
        cmd.Connection = con;
        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        return true;
    }


          //*==================================================================== Project Head details entry =================================================================================
    public bool addHeadinedit(string ProjectName, string ProjectHead, string HeadAmount, DateTime Date)
    {
        SqlCommand insert = new SqlCommand();
        insert.CommandText = "insert into tbl_project_head( project_name, project_head, head_amt, entry_dt)";
        insert.CommandText += "Values(@projectName, @projectHead,@headAmount,  @entry_date)";
        insert.Parameters.AddWithValue("@projectName", ProjectName);
        insert.Parameters.AddWithValue("@projectHead", ProjectHead);

        insert.Parameters.AddWithValue("@headAmount", HeadAmount);
        insert.Parameters.AddWithValue("@entry_date", Date);
        insert.Connection = con;
        insert.Connection.Open();
        insert.ExecuteNonQuery();
        insert.Connection.Close();
        return true;
    }

        //================================================================ Update project details =========================================================

    public bool update_projectHead(string PName, string PLocation, string PType, string PValue, string PTimeline, int id)
    {
        SqlCommand cmd = new SqlCommand("Update tbl_project_details set project_name=@Name, project_location=@location, project_type= @type, project_value=@value, project_timeline=@timeline where ID =@id");
        cmd.Parameters.AddWithValue("@value", PValue);

        cmd.Parameters.AddWithValue("@timeline", PTimeline);
        cmd.Parameters.AddWithValue("@Name", PName);
        cmd.Parameters.AddWithValue("@location", PLocation);
        cmd.Parameters.AddWithValue("@type", PType);

        cmd.Parameters.AddWithValue("@id", id);

        cmd.Connection = con;
        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        return true;
    }
 //   *******************************************************************************************************************************************

  
    

}