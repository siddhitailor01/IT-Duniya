using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Collections;

public partial class learnit : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    public int CurrentPage
    {
        get { return ViewState["CurrentPage"] != null ? (int)ViewState["CurrentPage"] : 0; }
        set { ViewState["CurrentPage"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindFilterButtons();
            string selectedCat = Request.QueryString["cat"] ?? "All";
            BindTutorials(selectedCat);
            SetActiveButton(selectedCat);
        }
    }

    private void BindFilterButtons()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT CategoryName FROM Categories ORDER BY CategoryName ASC", con);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            rptFilterCategories.DataSource = dt;
            rptFilterCategories.DataBind();
        }
    }

    protected void Filter_Click(object sender, EventArgs e)
    {
        CurrentPage = 0; 
        LinkButton btn = (LinkButton)sender;
        string category = btn.CommandArgument;
        SetActiveButton(category);
        BindTutorials(category);
    }

    private void BindTutorials(string category)
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "SELECT * FROM Tutorials";
            if (category != "All") query += " WHERE Category = @cat";
            query += " ORDER BY TutorialID DESC";

            SqlCommand cmd = new SqlCommand(query, con);
            if (category != "All") cmd.Parameters.AddWithValue("@cat", category);

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = dt.DefaultView;
                pds.AllowPaging = true;
                pds.PageSize = 6; 
                pds.CurrentPageIndex = CurrentPage;

                rptTutorials.DataSource = pds;
                rptTutorials.DataBind();
                rptTutorials.Visible = true;
                pnlNoTutorials.Visible = false;

                ArrayList pages = new ArrayList();
                for (int i = 0; i < pds.PageCount; i++) pages.Add(i);
                rptPagination.DataSource = pages;
                rptPagination.DataBind();
                rptPagination.Visible = (pds.PageCount > 1);
            }
            else
            {
                rptTutorials.Visible = false;
                rptPagination.Visible = false;
                pnlNoTutorials.Visible = true;
            }
        }
    }

    protected void rptPagination_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Page")
        {
            CurrentPage = Convert.ToInt32(e.CommandArgument);
            BindTutorials(GetActiveCategoryName());
            ClientScript.RegisterStartupScript(this.GetType(), "scroll", "window.scrollTo(0, 500);", true);
        }
    }

    private string GetActiveCategoryName()
    {
        if (btnAll.CssClass.Contains("btn-active")) return "All";
        foreach (RepeaterItem item in rptFilterCategories.Items)
        {
            LinkButton btn = (LinkButton)item.FindControl("btnCat");
            if (btn != null && btn.CssClass.Contains("btn-active")) return btn.CommandArgument;
        }
        return "All";
    }

    private void SetActiveButton(string category)
    {
        btnAll.CssClass = (category == "All") ? "btn btn-active tut-category-btn" : "btn btn-inactive tut-category-btn";
        foreach (RepeaterItem item in rptFilterCategories.Items)
        {
            LinkButton btn = (LinkButton)item.FindControl("btnCat");
            if (btn != null)
                btn.CssClass = (btn.CommandArgument == category) ? "btn btn-active tut-category-btn" : "btn btn-inactive tut-category-btn";
        }
    }

    public string StripHTML(string input)
    {
        return string.IsNullOrEmpty(input) ? "" : Regex.Replace(input, "<.*?>", string.Empty);
    }
}