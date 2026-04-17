using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections; // PagedDataSource ke liye zaroori
using System.Web.UI.WebControls;

public partial class errors : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    // Current Page maintain karne ke liye property
    public int CurrentPage
    {
        get { return ViewState["CurrentPage"] != null ? (int)ViewState["CurrentPage"] : 0; }
        set { ViewState["CurrentPage"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Initial Load
            if (Request.QueryString["id"] != null)
            {
                BindErrors("", Request.QueryString["id"].ToString());
            }
            else
            {
                BindErrors("", "");
            }
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        CurrentPage = 0; // Nayi search par hamesha Page 1 se shuru karein
        BindErrors(txtSearch.Text.Trim(), "");
    }

    private void BindErrors(string searchTerm, string specificId)
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "SELECT * FROM ErrorSolutions";

            // Filtering Logic
            if (!string.IsNullOrEmpty(specificId))
                query += " WHERE ErrorID = @id";
            else if (!string.IsNullOrEmpty(searchTerm))
                query += " WHERE ErrorTitle LIKE @search OR Technology LIKE @search OR Cause LIKE @search";

            query += " ORDER BY ErrorID DESC";

            SqlCommand cmd = new SqlCommand(query, con);
            if (!string.IsNullOrEmpty(specificId))
                cmd.Parameters.AddWithValue("@id", specificId);
            else if (!string.IsNullOrEmpty(searchTerm))
                cmd.Parameters.AddWithValue("@search", "%" + searchTerm + "%");

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);

            // --- PAGINATION START ---
            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = dt.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 10; // Ek page par sirf 10 errors dikhayega
            pds.CurrentPageIndex = CurrentPage;

            // Main Repeater Bind
            rptErrors.DataSource = pds;
            rptErrors.DataBind();

            // Pagination Repeater (Numbers 1, 2, 3...)
            ArrayList pages = new ArrayList();
            for (int i = 0; i < pds.PageCount; i++)
            {
                pages.Add(i);
            }
            rptPagination.DataSource = pages;
            rptPagination.DataBind();

            // Hide pagination if only 1 page exists
            rptPagination.Visible = (pds.PageCount > 1);
            pnlNoData.Visible = (dt.Rows.Count == 0);
        }
    }

    protected void rptPagination_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Page")
        {
            CurrentPage = Convert.ToInt32(e.CommandArgument);
            // Search term ko maintain rakhein paging ke waqt
            BindErrors(txtSearch.Text.Trim(), "");

            // Smooth Scroll to top of list
            ClientScript.RegisterStartupScript(this.GetType(), "scroll", "window.scrollTo(0, 450);", true);
        }
    }
}