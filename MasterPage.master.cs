using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Yahan aapka page load logic rahega
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // 1. Session ka saara data saaf karein
        Session.Clear();

        // 2. Session ko puri tarah khatam karein
        Session.Abandon();

        // 3. User ko wapas Home page (index.aspx) par bhej dein
        Response.Redirect("index.aspx");
    }
    protected void lnkSearch_Click(object sender, EventArgs e)
    {
        string q = txtSearch.Text.Trim();
        if (string.IsNullOrEmpty(q)) return;

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString))
        {
            // SQL Query jo sabhi tables mein search karegi aur sirf Pehla (TOP 1) result degi
            string sql = @"
            SELECT TOP 1 ID, Link FROM (
                SELECT TutorialID AS ID, 'tutorialdetails.aspx' AS Link, Title FROM Tutorials 
                UNION ALL
                SELECT BlogID, 'blogdetails.aspx', Title FROM Blogs 
                UNION ALL
               
              
                SELECT ProjectID, 'projectdetails.aspx', Title FROM Projects 
            ) AS CombinedSearch 
            WHERE Title LIKE @q";

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@q", "%" + q + "%");

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                // Agar result mila, toh uski ID aur Link nikal kar redirect karo
                string finalUrl = dr["Link"].ToString() + "?id=" + dr["ID"].ToString();
                con.Close();    
                Response.Redirect(finalUrl);
            }
            else
            {
                // Agar kuch nahi mila toh alert dikhao
                con.Close();
                Response.Write("<script>alert('Kripya sahi keyword likhein, \"" + q + "\" se juda kuch nahi mila!');</script>");
            }
        }
    }
}