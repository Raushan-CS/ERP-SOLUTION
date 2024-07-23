using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


public partial class Admin_funder_register : System.Web.UI.Page
{
    Message ms = new Message();
    Connection cn = new Connection();
    SqlConnection con = Connection.connect();
    string projectTypeSelected = string.Empty;

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
        else
        {
            
        }
    }

    //=================================================================================  details() method for getting data from database  ==============================================================================================

    public void details()
    {
        DataTable dt = new DataTable();
        dt = BL.dtt("Select * from tbl_funder");
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
             ms.create_funder(txtFunderName.Text.Trim(), txtContact.Text.Trim(), txtEmail.Text.Trim(), ddlFunderType.SelectedValue.Trim(), txtPan.Text.Trim(), txtUid.Text.Trim(), txtAddress.Text.Trim(), DateTime.Today, HiddenField2.Value);
             ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Funder Registered'); window.location='funder_register.aspx';", true);
             //clear();
         }
         catch (Exception ex) { success.InnerText = ex.Message; }
    }



    //=================================================================================  Gridview operations  ==============================================================================================
    protected void Gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
        if (e.CommandName.Equals("edt"))
        {
            int id = Convert.ToInt32(e.CommandArgument);
            hd_value.Value = id.ToString();
            string sql = @"Select * from tbl_funder where ID =" + id + "";
            DataTable dt = new DataTable();
            dt = BL.dtt(sql);
            if (dt.Rows.Count > 0)
            {
                MessagePnl_ModalPopupExtender.Show();

                txtName.Text = dt.Rows[0]["funder_name"].ToString();
                txtFunderMob.Text = dt.Rows[0]["funder_contact"].ToString();
                txtFunderEmail.Text = dt.Rows[0]["funder_email"].ToString();
                txtFunderPan.Text = dt.Rows[0]["pan"].ToString();
                txtUid_edit.Text = dt.Rows[0]["uid"].ToString();
                txtAddressLine.Text = dt.Rows[0]["address"].ToString();


                DropDownList1.SelectedItem.Text = dt.Rows[0]["funder_type"].ToString();
                // Type.SelectedIndex = Type.Items.IndexOf(Type.Items.FindByText(dt.Rows[0]["user_type"].ToString()));

            }
        }
    }

    //=================================================================================  Method to update details from Popup  ==============================================================================================


    protected void btnupdate_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(hd_value.Value.Trim());

        update_funder(txtName.Text.Trim(), txtFunderMob.Text.Trim(), txtFunderEmail.Text.Trim(), txtFunderPan.Text.Trim(), txtUid_edit.Text.Trim(), DropDownList1.SelectedItem.Text.Trim(), txtAddressLine.Text.Trim(), id);
        ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "alert('Record Updated'); window.location='funder_register.aspx';", true);
    }

    private bool update_funder(string Name, string Mobile, string Email, string pan, string Uid, string type, string Address, int id)
    {
        SqlCommand cmd = new SqlCommand("Update tbl_funder set funder_name=@Name, funder_contact=@mobile, funder_email= @email, pan= @pan, uid=@uid, funder_type=@type, address=@address  where ID =@id");
        cmd.Parameters.AddWithValue("@Name", Name);
        cmd.Parameters.AddWithValue("@mobile", Mobile);
        cmd.Parameters.AddWithValue("@email", Email);
        cmd.Parameters.AddWithValue("@pan", pan);
        cmd.Parameters.AddWithValue("@uid", Uid);
        cmd.Parameters.AddWithValue("@type", type);
        cmd.Parameters.AddWithValue("@address", Address);
        cmd.Parameters.AddWithValue("@id", id);

        cmd.Connection = con;
        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        return true;
    }
}