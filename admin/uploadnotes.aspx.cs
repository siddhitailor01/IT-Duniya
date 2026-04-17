using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;

public partial class admin_uploadnotes : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Admin security check
        if (Session["AdminUser"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (!IsPostBack)
        {
            BindNotes(); // Page load par list dikhane ke liye
        }
    }

    // 1. Data GridView mein bind karne ka function
    private void BindNotes()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            // Notes table se saara data fetch karein
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Notes ORDER BY NoteID DESC", con);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            gvNotes.DataSource = dt;
            gvNotes.DataBind();
        }
    }

    protected void btnUploadNote_Click(object sender, EventArgs e)
    {
        if (!fuNote.HasFile) return;

        string ext = Path.GetExtension(fuNote.FileName).ToLower();
        if (ext != ".pdf")
        {
            Response.Write("<script>alert('Sirf PDF file allowed hai');</script>");
            return;
        }

        using (SqlConnection con = new SqlConnection(connStr))
        {
            con.Open();

            // 1️⃣ INSERT first (temporary filename)
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO Notes (Title, Category, FilePath, UploadDate) OUTPUT INSERTED.NoteID " +
                "VALUES (@title, @cat, '', @date)", con);

            cmd.Parameters.AddWithValue("@title", txtNoteTitle.Text.Trim());
            cmd.Parameters.AddWithValue("@cat", ddlNoteCat.SelectedValue);
            cmd.Parameters.AddWithValue("@date", DateTime.Now);

            int noteId = Convert.ToInt32(cmd.ExecuteScalar());

            // 2️⃣ File save with correct name
            string folder = "admin/docs/";
            string physicalFolder = Server.MapPath("~/" + folder);

            if (!Directory.Exists(physicalFolder))
                Directory.CreateDirectory(physicalFolder);

            string fileName = "note_" + noteId + ".pdf";
            string fullPath = Path.Combine(physicalFolder, fileName);

            fuNote.SaveAs(fullPath);

            // 3️⃣ Update DB with clean filename
            SqlCommand updateCmd = new SqlCommand(
                "UPDATE Notes SET FilePath=@path WHERE NoteID=@id", con);

            updateCmd.Parameters.AddWithValue("@path", fileName);
            updateCmd.Parameters.AddWithValue("@id", noteId);
            updateCmd.ExecuteNonQuery();

            con.Close();

            txtNoteTitle.Text = "";
            BindNotes();

            Response.Write("<script>alert('PDF successfully upload ho gaya!');</script>");
        }
    }


    private void SaveToDatabase(string title, string category, string path)
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "INSERT INTO Notes (Title, Category, FilePath, UploadDate) VALUES (@title, @cat, @path, @date)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@title", title);
            cmd.Parameters.AddWithValue("@cat", category);
            cmd.Parameters.AddWithValue("@path", "admin/docs/" + path); // Pura path save karein
            cmd.Parameters.AddWithValue("@date", DateTime.Now);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }

    // 2. Delete functionality: Database + Physical File
    protected void gvNotes_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int noteId = Convert.ToInt32(gvNotes.DataKeys[e.RowIndex].Value);

        using (SqlConnection con = new SqlConnection(connStr))
        {
            // Pehle file path pata karein taaki folder se delete kar sakein
            SqlCommand cmdPath = new SqlCommand("SELECT FilePath FROM Notes WHERE NoteID=@id", con);
            cmdPath.Parameters.AddWithValue("@id", noteId);
            con.Open();
            string relativePath = cmdPath.ExecuteScalar().ToString();
            con.Close();

            // Physical file delete karein
            string fullPath = Server.MapPath("~/" + relativePath);
            if (File.Exists(fullPath))
            {
                File.Delete(fullPath);
            }

            // Database se record delete karein
            SqlCommand cmdDel = new SqlCommand("DELETE FROM Notes WHERE NoteID=@id", con);
            cmdDel.Parameters.AddWithValue("@id", noteId);
            con.Open();
            cmdDel.ExecuteNonQuery();
            con.Close();

            BindNotes(); // List refresh karein
        }
    }
}