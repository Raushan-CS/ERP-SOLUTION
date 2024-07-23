using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// Summary description for BL
/// </summary>
public class BL
{
    static SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["tishcon"].ToString());
	public BL()
	{
		
	}

    public static void OpenConnection()
    {
        if (con == null)
          
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        if (con.State == ConnectionState.Closed)
            con.Open();
    }
    public static void CloseConnection()
    {
        if (con.State == ConnectionState.Open)
            con.Close();
    }
//---------------------------Added for book dropdown in student and faculty profile----------------------------------
    public static void Fillcombo(DropDownList ddl, string sqlStr, string vField, string tField)
    {
        BL.OpenConnection();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(sqlStr, con);
        da.Fill(dt);

        ddl.DataValueField = vField;
        ddl.DataTextField = tField;

        ddl.DataSource = dt;
        ddl.DataBind();
        ddl.Items.Insert(0, "-------Select One-------");
        con.Close();
    }

    public static DataTable dtt(string sqlStr)
    {
        BL.OpenConnection();
        if (con.State.ToString() == "Closed") con.Open();

        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(sqlStr, con);
        da.Fill(dt);
        BL.CloseConnection();
        con.Close();
        return dt;

    }

    public static SqlDataReader drr(string str)
    {
        BL.OpenConnection();
        SqlCommand cmd = new SqlCommand(str, con);
        SqlDataReader dr = cmd.ExecuteReader();
        return dr;

    }

    public static DataSet dss(String str)
    {
        BL.OpenConnection();
        SqlDataAdapter da = new SqlDataAdapter(str, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        BL.CloseConnection();
        return ds;
    }

    public static void ExecuteNonQuery(string sqlStr)
    {
        BL.OpenConnection();
        if (con.State.ToString() == "Closed") con.Open();
        SqlCommand cmd = new SqlCommand(sqlStr, con);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        con.Close();
        BL.CloseConnection();
    }

    public static object ExecuteScalar(string str)
    {
        BL.OpenConnection();
        SqlCommand cmd = new SqlCommand(str, con);
        Object ob1 = cmd.ExecuteScalar();
        return ob1;

    }

    
}