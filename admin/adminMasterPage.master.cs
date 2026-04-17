using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adminMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminUser"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // 1. Session ko puri tarah khatam karein
        Session.Abandon();

        // 2. Browser ko login page par bhej dein
        Response.Redirect("Login.aspx");
    }

}
