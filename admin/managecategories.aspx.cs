using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_managecategories : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Admin security check
        if (Session["AdminUser"] == null) Response.Redirect("Login.aspx");

        if (!IsPostBack) BindCategories();
    }

    protected void btnSaveCat_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "INSERT INTO Categories (CategoryName, IconClass, ShortDesc) VALUES (@name, @icon, @desc)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@name", txtCatName.Text.Trim());
            cmd.Parameters.AddWithValue("@icon", txtIcon.Text.Trim());
            cmd.Parameters.AddWithValue("@desc", txtDesc.Text.Trim());

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            // Clear inputs and refresh grid
            txtCatName.Text = txtIcon.Text = txtDesc.Text = "";
            BindCategories();
        }
    }

    private void BindCategories()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            // GridView mein categories ko dikhana
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Categories ORDER BY CategoryName ASC", con);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            gvCategories.DataSource = dt;
            gvCategories.DataBind();
        }
    }

    protected void gvCategories_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
    {
        int catID = Convert.ToInt32(gvCategories.DataKeys[e.RowIndex].Value);
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Categories WHERE CategoryID = @id", con);
            cmd.Parameters.AddWithValue("@id", catID);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            BindCategories();
        }
    }
}