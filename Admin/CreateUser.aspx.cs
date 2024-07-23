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

public partial class Admin_CreateUser : System.Web.UI.Page
{
    Message ms = new Message();
    Connection cn = new Connection();
    SqlConnection con = Connection.connect();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["admin"] != null)
            {
                HiddenField2.Value = Session["admin"].ToString();
                details();
            }
            else { Response.Redirect("../index.aspx"); }
        }
    }

    //=================================================================================  details() method for getting data from database  ==============================================================================================

    public void details()
    {
        DataTable dt = new DataTable();
        dt = BL.dtt("Select * from tbl_maker_checker");
        if (dt.Rows.Count > 0)
        {
            Gridview1.DataSource = dt;
            Gridview1.DataBind();
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
        ddlusertype.SelectedValue = "0";
        txtusername.Text = "";
        txtpassword.Text = "";
    }

    //=================================================================================   method to Save data to the Database  ==============================================================================================


    protected void btnsubmit_Click(object sender, EventArgs e)
    {

        try
        {
            ms.create_user(txt_Name.Text.Trim(), txtmobile.Text.Trim(), txtusername.Text.Trim(), txtpassword.Text.Trim(), txtaddress.Text.Trim(), ddlusertype.SelectedValue.Trim(), DateTime.Today, HiddenField2.Value);
            ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('User Created'); window.location='CreateUser.aspx';", true);
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
            BL.ExecuteNonQuery("Delete from tbl_maker_checker where ID=" + id + "");
            ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Record Deleted'); window.location='CreateUser.aspx';", true);
        }
        if (e.CommandName.Equals("unblock"))
        {
            bool status;
            int id = Convert.ToInt32(e.CommandArgument);
            DataTable dt = new DataTable();
            dt = BL.dtt("Select * from tbl_maker_checker where ID=" + id + "");
            if (dt.Rows.Count > 0)
            {
                status = Convert.ToBoolean(dt.Rows[0]["status"].ToString());
                if (status)
                {
                    BL.ExecuteNonQuery("update tbl_maker_checker set status='0' where ID=" + id + "");
                    ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('User blocked'); window.location='CreateUser.aspx';", true);
                }
                else
                {
                    BL.ExecuteNonQuery("update tbl_maker_checker set status='1' where ID=" + id + "");
                    ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('User Unblocked'); window.location='CreateUser.aspx';", true);
                }
            }
        }
        if (e.CommandName.Equals("edt"))
        {
            int id = Convert.ToInt32(e.CommandArgument);
            hd_value.Value = id.ToString();
            string sql = @"Select * from tbl_maker_checker where ID =" + id + "";
            DataTable dt = new DataTable();
            dt = BL.dtt(sql);
            if (dt.Rows.Count > 0)
            {
                MessagePnl_ModalPopupExtender.Show();
                
                txtName.Text = dt.Rows[0]["name"].ToString();
                txtUsrName.Text = dt.Rows[0]["username"].ToString();
                txtUserPwd.Text = dt.Rows[0]["password"].ToString();
                txtMobileNo.Text = dt.Rows[0]["mobile"].ToString();
                txtAddressLine.Text = dt.Rows[0]["address"].ToString();

                Type.SelectedItem.Text = dt.Rows[0]["user_type"].ToString();
               // Type.SelectedIndex = Type.Items.IndexOf(Type.Items.FindByText(dt.Rows[0]["user_type"].ToString()));

            }
        }
    }

    //=================================================================================  Method to update details from Popup  ==============================================================================================


    protected void btnupdate_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(hd_value.Value.Trim());

        update_user(txtName.Text.Trim(), txtMobileNo.Text.Trim(), txtAddressLine.Text.Trim(), txtUsrName.Text.Trim(), txtUserPwd.Text.Trim(), Type.SelectedValue.Trim(), id);
        ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Record Updated'); window.location='CreateUser.aspx';", true);
    }

    private bool update_user(string Name, string Mobile, string Address, string user_name, string password, string type, int id)
    {
        SqlCommand cmd = new SqlCommand("Update tbl_maker_checker set name=@Name, mobile=@mobile, address= @address, username=@user_name, user_type=@type, password=@password  where ID =@id");
        cmd.Parameters.AddWithValue("@user_name", user_name);
        cmd.Parameters.AddWithValue("@type", type);
        cmd.Parameters.AddWithValue("@password", password);
        cmd.Parameters.AddWithValue("@Name", Name);
        cmd.Parameters.AddWithValue("@mobile", Mobile);
        cmd.Parameters.AddWithValue("@address", Address);

        cmd.Parameters.AddWithValue("@id", id);

        cmd.Connection = con;
        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        return true;
    }
}