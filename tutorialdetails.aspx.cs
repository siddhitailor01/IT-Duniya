using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class tutorialdetails : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // URL se ID lena: tutorial-details.aspx?id=5
            if (Request.QueryString["id"] != null)
            {
                int id;
                if (int.TryParse(Request.QueryString["id"], out id))
                {
                    LoadFullTutorial(id);
                }
                else { Response.Redirect("learnit.aspx"); }
            }
            else { Response.Redirect("learnit.aspx"); }
        }
    }

    private void LoadFullTutorial(int id)
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Tutorials WHERE TutorialID = @id", con);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                rptFullTutorial.DataSource = dt;
                rptFullTutorial.DataBind();

                // Page Title update karna topic ke naam se
                this.Title = dt.Rows[0]["Title"].ToString() + " - itduniya.in";
            }
            else
            {
                Response.Redirect("learnit.aspx");
            }
        }
    }
}