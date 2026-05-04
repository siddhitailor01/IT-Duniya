using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class index : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindAllHomeData();

        }
    }

    private void BindAllHomeData()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            con.Open();

            SqlDataAdapter adp1 = new SqlDataAdapter("SELECT TOP 4 * FROM Categories", con);
            DataTable dtCat = new DataTable();
            adp1.Fill(dtCat);
            rptCategories.DataSource = dtCat;
            rptCategories.DataBind();

            SqlDataAdapter adp2 = new SqlDataAdapter("SELECT TOP 4 * FROM Projects ORDER BY ProjectID DESC", con);
            DataTable dtProj = new DataTable();
            adp2.Fill(dtProj);
            rptProjects.DataSource = dtProj;
            rptProjects.DataBind();

            SqlDataAdapter adp3 = new SqlDataAdapter("SELECT TOP 5 * FROM Notes ORDER BY NoteID DESC", con);
            DataTable dtNotes = new DataTable();
            adp3.Fill(dtNotes);
            rptNotes.DataSource = dtNotes;
            rptNotes.DataBind();

            SqlDataAdapter adp4 = new SqlDataAdapter("SELECT TOP 3 * FROM ErrorSolutions ORDER BY ErrorID DESC", con);
            DataTable dtErr = new DataTable();
            adp4.Fill(dtErr);
            rptErrors.DataSource = dtErr;
            rptErrors.DataBind();

            SqlDataAdapter adp5 = new SqlDataAdapter("SELECT TOP 3 * FROM Blogs ORDER BY BlogID DESC", con);
            DataTable dtBlogs = new DataTable();
            adp5.Fill(dtBlogs);
            rptBlogs.DataSource = dtBlogs;
            rptBlogs.DataBind();
        }
    }
}