using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls; // Required for SEO Tags
using System.Text.RegularExpressions; // Required for stripping HTML

public partial class projectdetails : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string projectId = Request.QueryString["id"];

            if (!string.IsNullOrEmpty(projectId))
            {
                LoadProjectDetails(projectId);
            }
            else
            {
                Response.Redirect("projects.aspx");
            }
        }
    }

    private void LoadProjectDetails(string id)
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
                DataRow dr = dt.Rows[0];

                // 1. Data Binding to UI
                string title = dr["Title"].ToString();
                string description = dr["Description"] != DBNull.Value ? dr["Description"].ToString() : "Industrial Project details by IT Duniya.";
                string thumbnail = dr["Thumbnail"].ToString();

                litTitle.Text = title;
                litLevel.Text = dr["Level"].ToString();
                litComplexity.Text = dr["Level"].ToString();
                litDesc.Text = description;
                imgProject.ImageUrl = "/admin/img/projects/" + thumbnail;

                // 2. DYNAMIC SEO LOGIC START

                // Page Browser Title
                Page.Title = title + " | Project Details & Source Code - IT Duniya";

                // Meta Description (Description se HTML hata kar pehle 160 characters lena)
                string plainTextDescription = Regex.Replace(description, "<.*?>", string.Empty).Replace("&nbsp;", " ");
                string metaDescription = plainTextDescription.Length > 160 ? plainTextDescription.Substring(0, 157) + "..." : plainTextDescription;

                AddMetaTag("description", metaDescription);

                // OpenGraph Tags (Social Media Sharing)
                AddOgTag("og:title", title);
                AddOgTag("og:description", metaDescription);
                AddOgTag("og:image", "https://www.itduniya.in/admin/img/projects/" + thumbnail);
                AddOgTag("og:url", Request.Url.AbsoluteUri);
                AddOgTag("og:type", "article");

                // 3. Tech stack badges
                string techs = dr["TechStack"].ToString();
                litTechList.Text = techs;
                string[] techArray = techs.Split(',');
                litTechBadges.Text = ""; // Clear existing
                foreach (string t in techArray)
                {
                    litTechBadges.Text += "<span class='tech-badge-startup'>" + t.Trim() + "</span>";
                }
            }
            else
            {
                Response.Redirect("projects.aspx");
            }
        }
    }

    // Helper method to add Meta Description
    private void AddMetaTag(string name, string content)
    {
        HtmlMeta meta = new HtmlMeta();
        meta.Name = name;
        meta.Content = content;
        Page.Header.Controls.Add(meta);
    }

    // Helper method to add OpenGraph Tags
    private void AddOgTag(string property, string content)
    {
        HtmlMeta ogTag = new HtmlMeta();
        ogTag.Attributes.Add("property", property);
        ogTag.Content = content;
        Page.Header.Controls.Add(ogTag);
    }
}