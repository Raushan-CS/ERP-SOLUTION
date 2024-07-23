 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class index : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    Message ms = new Message();
    DataSet ds = new DataSet();
    DataSet dts = new DataSet();
    string userType;

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (txtyourUsername.Value == "Admin" || txtyourUsername.Value == "admin" || txtyourUsername.Value == "ADMIN")
        {
            ds = ms.login(txtyourUsername.Value, txtyourPassword.Value);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["admin"] = txtyourUsername.Value;
                Response.Redirect("Admin/AdminDashboard.aspx");
            }
            else
            {
                lblMessage.InnerText = "Please Check your credentials";
            }
        }
        else if (txtyourUsername.Value != "Admin" || txtyourUsername.Value != "admin" || txtyourUsername.Value != "ADMIN")
        {
            ds = ms.user_login(txtyourUsername.Value, txtyourPassword.Value);
            dts = ms.maker_checker_login(txtyourUsername.Value, txtyourPassword.Value);
            if (ds.Tables[0].Rows.Count > 0)
            {
                bool Stat = Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]);
                if (Stat)
                {
                    Session["User"] = txtyourUsername.Value;
                    Response.Redirect("User/UserDashboard.aspx");
                }
                else
                    {
                        lblMessage.InnerText = "User Not Authorised!!Please ask Admin for Authorization";
                   }
                
            }
            else if (dts.Tables[0].Rows.Count > 0)
            {
                userType = Convert.ToString(dts.Tables[0].Rows[0]["user_type"]);
                bool Stat = Convert.ToBoolean(dts.Tables[0].Rows[0]["status"]);
                if (userType == "Invoice Maker")
                {
                    if (Stat)
                    {
                        Session["Maker"] = txtyourUsername.Value;
                        Response.Redirect("Maker/MakerDashboard.aspx");
                    }
                    else
                    {
                        lblMessage.InnerText = "Maker Not Authorised!!Please ask Admin for Authorization";
                    }
                }
                else
                {
                    if (Stat)
                    {
                        Session["Checker"] = txtyourUsername.Value;
                        Response.Redirect("Checker/checker_dashboard.aspx");
                    }
                    else
                    {
                        lblMessage.InnerText = "Checker Not Authorised!!Please ask Admin for Authorization";
                    }
                }
            }
            else
            {
                lblMessage.InnerText = "Please Check your credentials";
            }
        }
        else
        {
            lblMessage.InnerText = "Invalid Credentials!! Check your Username and Password and try Again";  
        }
    }
}