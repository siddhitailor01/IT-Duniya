using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class admin_manageerrors : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminUser"] == null) Response.Redirect("Login.aspx");
        if (!IsPostBack) BindErrors();
    }

    protected void btnSaveError_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = string.IsNullOrEmpty(hfErrorID.Value)
                ? "INSERT INTO ErrorSolutions (ErrorTitle, Technology, Cause, Solution, Severity, Status) VALUES (@title, @tech, @cause, @sol, @sev, @stat)"
                : "UPDATE ErrorSolutions SET ErrorTitle=@title, Technology=@tech, Cause=@cause, Solution=@sol, Severity=@sev, Status=@stat WHERE ErrorID=@id";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@title", txtErrorTitle.Text.Trim());
            cmd.Parameters.AddWithValue("@tech", ddlTech.SelectedValue);
            cmd.Parameters.AddWithValue("@cause", txtCause.Text.Trim());
            cmd.Parameters.AddWithValue("@sol", txtSolution.Text);
            cmd.Parameters.AddWithValue("@sev", ddlSeverity.SelectedValue);
            cmd.Parameters.AddWithValue("@stat", ddlStatus.SelectedValue);

            if (!string.IsNullOrEmpty(hfErrorID.Value)) cmd.Parameters.AddWithValue("@id", hfErrorID.Value);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            lblMsg.Text = "Data Updated Successfully!";
            lblMsg.ForeColor = System.Drawing.Color.Green;
            ClearFields();
            BindErrors();
        }
    }
    protected void gvErrors_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditError")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            LoadErrorForEdit(id);
        }
    }

    private void LoadErrorForEdit(int id)
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM ErrorSolutions WHERE ErrorID = @id", con);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                hfErrorID.Value = id.ToString();
                txtErrorTitle.Text = dt.Rows[0]["ErrorTitle"].ToString();
                ddlTech.SelectedValue = dt.Rows[0]["Technology"].ToString();
                txtCause.Text = dt.Rows[0]["Cause"].ToString();
                txtSolution.Text = dt.Rows[0]["Solution"].ToString();
                ddlSeverity.SelectedValue = dt.Rows[0]["Severity"].ToString();
                ddlStatus.SelectedValue = dt.Rows[0]["Status"].ToString();

                btnSaveError.Text = "Update Solution";
                btnSaveError.CssClass = "btn btn-primary px-5 fw-bold";
                btnCancel.Visible = true;
            }
        }
    }

    private void BindErrors()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM ErrorSolutions ORDER BY ErrorID DESC", con);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            gvErrors.DataSource = dt;
            gvErrors.DataBind();
        }
    }

    protected void gvErrors_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvErrors.DataKeys[e.RowIndex].Value);
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM ErrorSolutions WHERE ErrorID = @id", con);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open(); cmd.ExecuteNonQuery(); con.Close();
            BindErrors();
        }
    }

    private void ClearFields()
    {
        txtErrorTitle.Text = txtCause.Text = txtSolution.Text = hfErrorID.Value = "";
        btnSaveError.Text = "Save Error Solution";
        btnSaveError.CssClass = "btn btn-warning px-5 fw-bold";
        btnCancel.Visible = false;
    }

    protected void btnCancel_Click(object sender, EventArgs e) { ClearFields(); }
}