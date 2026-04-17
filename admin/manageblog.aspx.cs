using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class admin_manageblog : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminUser"] == null) Response.Redirect("Login.aspx");
        if (!IsPostBack) BindBlogs();
    }

    private void BindBlogs()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Blogs ORDER BY BlogID DESC", con);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            gvBlogs.DataSource = dt;
            gvBlogs.DataBind();
        }
    }

    protected void btnSaveBlog_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "";
            if (string.IsNullOrEmpty(hfBlogID.Value))
                query = "INSERT INTO Blogs (Title, Content, Theme, PostDate) VALUES (@title, @content, @theme, @date)";
            else
                query = "UPDATE Blogs SET Title=@title, Content=@content, Theme=@theme WHERE BlogID=@id";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@title", txtBlogTitle.Text.Trim());
            cmd.Parameters.AddWithValue("@content", txtBlogContent.Text.Trim());
            cmd.Parameters.AddWithValue("@theme", txtTheme.Text.Trim());
            cmd.Parameters.AddWithValue("@date", DateTime.Now);
            if (!string.IsNullOrEmpty(hfBlogID.Value)) cmd.Parameters.AddWithValue("@id", hfBlogID.Value);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            ClearFields();
            BindBlogs();
            Response.Write("<script>alert('Blog saved successfully!');</script>");
        }
    }

    protected void gvBlogs_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditBlog")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Blogs WHERE BlogID=@id", con);
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    hfBlogID.Value = id.ToString();
                    txtBlogTitle.Text = dt.Rows[0]["Title"].ToString();
                    txtTheme.Text = dt.Rows[0]["Theme"].ToString();
                    txtBlogContent.Text = dt.Rows[0]["Content"].ToString();
                    btnSaveBlog.Text = "Update Blog";
                    btnCancel.Visible = true;
                }
            }
        }
    }

    protected void gvBlogs_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvBlogs.DataKeys[e.RowIndex].Value);
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Blogs WHERE BlogID=@id", con);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open(); cmd.ExecuteNonQuery(); con.Close();
            BindBlogs();
        }
    }

    private void ClearFields()
    {
        txtBlogTitle.Text = txtTheme.Text = txtBlogContent.Text = hfBlogID.Value = "";
        btnSaveBlog.Text = "Publish Blog";
        btnCancel.Visible = false;
    }

    protected void btnCancel_Click(object sender, EventArgs e) { ClearFields(); }
}