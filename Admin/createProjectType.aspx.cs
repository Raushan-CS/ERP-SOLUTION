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

public partial class Admin_createProjectType : System.Web.UI.Page
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
        dt = BL.dtt("Select * from tbl_project_type");
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


    //=================================================================================   method to Save data to the Database  ==============================================================================================


    protected void btnsubmit_Click(object sender, EventArgs e)
    {

        try
        {
            ms.create_project_type(txt_projectType.Text.Trim(), DateTime.Today, HiddenField2.Value);
            ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Project Type Created'); window.location='createProjectType.aspx';", true);
            clear();
        }
        catch (Exception ex) { success.InnerText = ex.Message; }
    }

    //=================================================================================   method to clear data from the form  ==============================================================================================

    void clear()
    {
        txt_projectType.Text = "";
        
    }


    //=================================================================================  Gridview operations  ==============================================================================================


    protected void Gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("del"))
        {
            int id = Convert.ToInt32(e.CommandArgument);
            BL.ExecuteNonQuery("Delete from tbl_project_type where id =" + id + "");
            ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Record Deleted'); window.location='createProjectType.aspx';", true);
        }

        if (e.CommandName.Equals("edt"))
        {
            int id = Convert.ToInt32(e.CommandArgument);
            hd_value.Value = id.ToString();
            string sql = @"Select * from tbl_project_type where id =" + id + "";
            DataTable dt = new DataTable();
            dt = BL.dtt(sql);
            if (dt.Rows.Count > 0)
            {
                MessagePnl_ModalPopupExtender.Show();

                txtPType.Text = dt.Rows[0]["project_type"].ToString();
               
            }
        }
    }

    //=================================================================================  Method to update details from Popup  ==============================================================================================


    protected void btnupdate_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(hd_value.Value.Trim());

        ms.update_project_type(txtPType.Text.Trim(), id);
        ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Record Updated'); window.location='createProjectType.aspx';", true);
    }

   

}