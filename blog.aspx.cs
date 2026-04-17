using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;

public partial class blog : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            BindThemes(); // Sidebar categories ke liye

            // Check karein ki kya user ne kisi theme par click kiya hai
            string themeFilter = Request.QueryString["theme"];
            BindBlogs(themeFilter);
        }
    }

   // Sidebar mein unique themes dikhane ke liye
private void BindThemes()
{
    using (SqlConnection con = new SqlConnection(connStr))
    {
        // DISTINCT use karenge taaki ek theme baar-baar na dikhe
        string query = "SELECT DISTINCT Theme FROM Blogs WHERE Theme IS NOT NULL AND Theme <> '' ORDER BY Theme ASC";
        SqlDataAdapter adp = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        
        rptThemes.DataSource = dt;
        rptThemes.DataBind();
    }
}


// Global variable for current page
public int PageNumber {
    get {
        if (ViewState["PageNumber"] != null) return (int)ViewState["PageNumber"];
        return 0;
    }
    set { ViewState["PageNumber"] = value; }
}

private void BindBlogs(string theme) {
    using (SqlConnection con = new SqlConnection(connStr)) {
        string query = "SELECT * FROM Blogs";
        if (!string.IsNullOrEmpty(theme)) query += " WHERE Theme = @theme";
        query += " ORDER BY BlogID DESC";

        SqlCommand cmd = new SqlCommand(query, con);
        if (!string.IsNullOrEmpty(theme)) cmd.Parameters.AddWithValue("@theme", theme);

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adp.Fill(dt);

        // Pagination Logic
        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = dt.DefaultView;
        pds.AllowPaging = true;
        pds.PageSize = 3; // Ek page par kitne blog dikhane hain
        pds.CurrentPageIndex = PageNumber;

        btnPrev.Enabled = !pds.IsFirstPage;
        btnNext.Enabled = !pds.IsLastPage;

        rptBlogs.DataSource = pds;
        rptBlogs.DataBind();
    }
}

protected void btnPrev_Click(object sender, EventArgs e) {
    PageNumber -= 1;
    BindBlogs(Request.QueryString["theme"]);
}

protected void btnNext_Click(object sender, EventArgs e) {
    PageNumber += 1;
    BindBlogs(Request.QueryString["theme"]);
}
    // HTML tags hatane ke liye function
    public string StripHTML(string input)
    {
        if (string.IsNullOrEmpty(input)) return "";
        return Regex.Replace(input, "<.*?>", string.Empty);
    }
}