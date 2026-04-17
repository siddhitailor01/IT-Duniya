using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;

public partial class admin_manageprojects : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminUser"] == null) Response.Redirect("Login.aspx");
        if (!IsPostBack) BindProjects();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            con.Open();

            int projectId = 0;
            bool isInsert = string.IsNullOrEmpty(hfProjectID.Value);

            // 1) INSERT / UPDATE (without thumbnail first)
            string query = isInsert
                ? "INSERT INTO Projects (Title, Level, TechStack, Thumbnail, Description) OUTPUT INSERTED.ProjectID VALUES (@title, @lvl, @tech, @thumb, @desc)"
                : "UPDATE Projects SET Title=@title, Level=@lvl, TechStack=@tech, Description=@desc WHERE ProjectID=@id";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@title", txtTitle.Text);
            cmd.Parameters.AddWithValue("@lvl", ddlLevel.SelectedValue);
            cmd.Parameters.AddWithValue("@tech", txtTech.Text);
            cmd.Parameters.AddWithValue("@desc", txtDesc.Text);

            if (isInsert)
            {
                // temporary thumb value (will update after saving image)
                cmd.Parameters.AddWithValue("@thumb", "default.png");
                projectId = Convert.ToInt32(cmd.ExecuteScalar());
            }
            else
            {
                projectId = Convert.ToInt32(hfProjectID.Value);
                cmd.Parameters.AddWithValue("@id", projectId);
                cmd.ExecuteNonQuery();
            }

            // 2) Thumbnail save with pattern: project_{id}.jpg
            if (fuThumb.HasFile)
            {
                string fileName = "project_" + projectId + ".jpg"; // required format
                string folder = "admin/img/projects/";
                string physicalFolder = Server.MapPath("~/" + folder);

                if (!Directory.Exists(physicalFolder))
                    Directory.CreateDirectory(physicalFolder);

                string physicalPath = Path.Combine(physicalFolder, fileName);

                // Save uploaded file (NOTE: this will save as whatever user uploads, extension may not truly be jpg)
                fuThumb.SaveAs(physicalPath);

                // 3) Update DB with ONLY filename
                SqlCommand cmd2 = new SqlCommand("UPDATE Projects SET Thumbnail=@thumb WHERE ProjectID=@id", con);
                cmd2.Parameters.AddWithValue("@thumb", fileName);
                cmd2.Parameters.AddWithValue("@id", projectId);
                cmd2.ExecuteNonQuery();
            }

            con.Close();

            ClearFields();
            BindProjects();
        }
    }


    protected void gvProjects_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditProject")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            LoadProjectForEdit(id);
        }
    }

    private void LoadProjectForEdit(int id)
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Projects WHERE ProjectID = @id", con);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                hfProjectID.Value = id.ToString();
                txtTitle.Text = dt.Rows[0]["Title"].ToString();
                txtTech.Text = dt.Rows[0]["TechStack"].ToString();
                ddlLevel.SelectedValue = dt.Rows[0]["Level"].ToString();
                txtDesc.Text = dt.Rows[0]["Description"].ToString();

                btnSave.Text = "Update Project";
                btnCancel.Visible = true;
            }
        }
    }

    private void ClearFields()
    {
        txtTitle.Text = txtTech.Text = txtDesc.Text = hfProjectID.Value = "";
        btnSave.Text = "Save Project";
        btnCancel.Visible = false;
    }

    protected void btnCancel_Click(object sender, EventArgs e) { ClearFields(); }

    private void BindProjects()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Projects ORDER BY ProjectID DESC", con);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            gvProjects.DataSource = dt;
            gvProjects.DataBind();
        }
    }

    protected void gvProjects_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvProjects.DataKeys[e.RowIndex].Value);
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Projects WHERE ProjectID = @id", con);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open(); cmd.ExecuteNonQuery(); con.Close();
            BindProjects();
        }
    }
}