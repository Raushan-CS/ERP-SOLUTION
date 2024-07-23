using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class User_user_chng_pwd : System.Web.UI.Page
{
    SqlConnection con = Connection.connect();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            HiddenField2.Value = Session["User"].ToString();
        }
        else { Response.Redirect("../index.aspx"); }
    }


    protected void empty_list()
    {
        txt_old_pwd.Text = "";
        txt_new_pwd.Text = "";
        txt_confirm.Text = "";
        HiddenField2.Value = "";

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            System.Threading.Thread.Sleep(4000);
            DataSet ds = new DataSet();
            ds = BL.dss("SELECT username, password FROM tbl_user WHERE username='" + HiddenField2.Value.Trim() + "'");
            if (ds.Tables[0].Rows.Count > 0)
            {
                string Username = ds.Tables[0].Rows[0]["username"].ToString();
                string pwd = ds.Tables[0].Rows[0]["password"].ToString();
                if (txt_old_pwd.Text != pwd.Trim())
                {
                    td_message.InnerText = "Provide Correct Old Password Details";
                    return;
                }
                else
                {
                    SqlCommand update = new SqlCommand();
                    update.CommandText = "UPDATE tbl_user set password=@Password where username=@UserName";
                    update.Parameters.AddWithValue("@Password", txt_new_pwd.Text.Trim());
                    update.Parameters.AddWithValue("@UserName", Username);

                    update.Connection = con;
                    update.Connection.Open();
                    update.ExecuteNonQuery();
                    update.Connection.Close();
                    empty_list();
                    td_message.InnerText = "Password Successfully Changed";
                }
            }
        }
        catch (Exception ex) { td_message.InnerText = ex.Message; }
    }
}