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

public partial class Admin_UserEntry : System.Web.UI.Page
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
        dt = BL.dtt("Select * from tbl_user");
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
      
        txtusername.Text = "";
        txtpassword.Text = "";
    }

    //=================================================================================   method to Save data to the Database  ==============================================================================================


    protected void btnsubmit_Click(object sender, EventArgs e)
    {

        try
        {
            ms.user_entry(txt_Name.Text.Trim(), txtusername.Text.Trim(), txtpassword.Text.Trim(), DateTime.Today, HiddenField2.Value);
            ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('User Created'); window.location='UserEntry.aspx';", true);
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
            BL.ExecuteNonQuery("Delete from tbl_user where ID=" + id + "");
            ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Record Deleted'); window.location='UserEntry.aspx';", true);
        }
        if (e.CommandName.Equals("unblock"))
        {
            bool status;
            int id = Convert.ToInt32(e.CommandArgument);
            DataTable dt = new DataTable();
            dt = BL.dtt("Select * from tbl_user where ID=" + id + "");
            if (dt.Rows.Count > 0)
            {
                status = Convert.ToBoolean(dt.Rows[0]["status"].ToString());
                if (status)
                {
                    BL.ExecuteNonQuery("update tbl_user set status='0' where ID=" + id + "");
                    ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('User blocked'); window.location='UserEntry.aspx';", true);
                }
                else
                {
                    BL.ExecuteNonQuery("update tbl_user set status='1' where ID=" + id + "");
                    ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('User Unblocked'); window.location='UserEntry.aspx';", true);
                }
            }
        }
        if (e.CommandName.Equals("edt"))
        {
            int id = Convert.ToInt32(e.CommandArgument);
            hd_value.Value = id.ToString();
            string sql = @"Select * from tbl_user where ID =" + id + "";
            DataTable dt = new DataTable();
            dt = BL.dtt(sql);
            if (dt.Rows.Count > 0)
            {
                MessagePnl_ModalPopupExtender.Show();

                txtName.Text = dt.Rows[0]["name"].ToString();
                txtUsrName.Text = dt.Rows[0]["username"].ToString();
                txtUserPwd.Text = dt.Rows[0]["password"].ToString();
               
            }
        }
    }

    //=================================================================================  Method to update details from Popup  ==============================================================================================


    protected void btnupdate_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(hd_value.Value.Trim());

        update_user(txtName.Text.Trim(), txtUsrName.Text.Trim(), txtUserPwd.Text.Trim(),  id);
        ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Record Updated'); window.location='UserEntry.aspx';", true);
    }

    private bool update_user(string Name, string user_name, string password, int id)
    {
        SqlCommand cmd = new SqlCommand("Update tbl_user set name=@Name, username=@user_name,  password=@password  where id =@id");
        cmd.Parameters.AddWithValue("@user_name", user_name);       
        cmd.Parameters.AddWithValue("@password", password);
        cmd.Parameters.AddWithValue("@Name", Name);    

        cmd.Parameters.AddWithValue("@id", id);

        cmd.Connection = con;
        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        return true;
    }


}