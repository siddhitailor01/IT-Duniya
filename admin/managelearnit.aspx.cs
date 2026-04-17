using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;

public partial class admin_managelearnit : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminUser"] == null) Response.Redirect("Login.aspx");

        if (!IsPostBack)
        {
            BindCategories();
            BindTutorials();
        }
    }

    private void BindCategories()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("SELECT CategoryName FROM Categories ORDER BY CategoryName ASC", con);
            con.Open();
            ddlCategory.DataSource = cmd.ExecuteReader();
            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataValueField = "CategoryName";
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("-- Select Category --", ""));
        }
    }

    private void BindTutorials()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT TutorialID, Title, Category FROM Tutorials ORDER BY TutorialID DESC", con);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            gvTutorials.DataSource = dt;
            gvTutorials.DataBind();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ddlCategory.SelectedIndex == 0) return;

        using (SqlConnection con = new SqlConnection(connStr))
        {
            con.Open();

            bool isUpdate = !string.IsNullOrEmpty(hfTutorialID.Value);
            int tutorialId = 0;

            // 1️⃣ INSERT / UPDATE (without image first)
            string query = isUpdate
                ? "UPDATE Tutorials SET Title=@title, Category=@cat, TheoryContent=@theory, CodeSnippet=@code WHERE TutorialID=@id"
                : "INSERT INTO Tutorials (Title, Category, TheoryContent, CodeSnippet, DiagramUrl) OUTPUT INSERTED.TutorialID VALUES (@title, @cat, @theory, @code, '')";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@title", txtTitle.Text.Trim());
            cmd.Parameters.AddWithValue("@cat", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@theory", txtTheory.Text);
            cmd.Parameters.AddWithValue("@code", txtCode.Text);

            if (isUpdate)
            {
                tutorialId = Convert.ToInt32(hfTutorialID.Value);
                cmd.Parameters.AddWithValue("@id", tutorialId);
                cmd.ExecuteNonQuery();
            }
            else
            {
                tutorialId = Convert.ToInt32(cmd.ExecuteScalar());
            }

            // 2️⃣ IMAGE SAVE → tutorial_ID.jpg
            if (fuDiagram.HasFile)
            {
                string folder = "admin/img/tutorials/";
                string physicalFolder = Server.MapPath("~/" + folder);

                if (!Directory.Exists(physicalFolder))
                    Directory.CreateDirectory(physicalFolder);

                string fileName = "tutorial_" + tutorialId + ".jpg";
                string physicalPath = Path.Combine(physicalFolder, fileName);

                fuDiagram.SaveAs(physicalPath);

                // 3️⃣ DB UPDATE with correct filename
                SqlCommand imgCmd = new SqlCommand(
                    "UPDATE Tutorials SET DiagramUrl=@img WHERE TutorialID=@id", con);

                imgCmd.Parameters.AddWithValue("@img", fileName);
                imgCmd.Parameters.AddWithValue("@id", tutorialId);
                imgCmd.ExecuteNonQuery();
            }

            con.Close();
            ClearFields();
            BindTutorials();
        }
    }

    protected void gvTutorials_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditTut")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Tutorials WHERE TutorialID=@id", con);
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    hfTutorialID.Value = id.ToString();
                    txtTitle.Text = dt.Rows[0]["Title"].ToString();

                    if (ddlCategory.Items.FindByValue(dt.Rows[0]["Category"].ToString()) != null)
                        ddlCategory.SelectedValue = dt.Rows[0]["Category"].ToString();

                    txtTheory.Text = dt.Rows[0]["TheoryContent"].ToString();
                    txtCode.Text = dt.Rows[0]["CodeSnippet"].ToString();
                    btnSave.Text = "Update Tutorial";
                    btnCancel.Visible = true;
                }
            }
        }
    }

    protected void gvTutorials_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvTutorials.DataKeys[e.RowIndex].Value);
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Tutorials WHERE TutorialID=@id", con);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open(); cmd.ExecuteNonQuery(); con.Close();
            BindTutorials();
        }
    }

    private void ClearFields()
    {
        txtTitle.Text = txtCode.Text = txtTheory.Text = hfTutorialID.Value = "";
        ddlCategory.SelectedIndex = 0;
        btnSave.Text = "Save Tutorial";
        btnCancel.Visible = false;
    }

    protected void btnCancel_Click(object sender, EventArgs e) { ClearFields(); }
}