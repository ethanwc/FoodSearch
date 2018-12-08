using System;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Controls the add menu page
/// Josh Lichty
/// </summary>
public partial class AddMenu : System.Web.UI.Page {

    /// <summary>
    /// Redirects unauthenticated users to the login page.
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void Page_Load(object sender, EventArgs e) {
        if (!Context.User.Identity.IsAuthenticated) {
            Response.Redirect("Login.aspx");
        }
    }

    /// <summary>
    /// Checks and inserts a new menu into the database.
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void AddRest_button_addRest_Click(object sender, EventArgs e) {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string cmdStr;
        SqlCommand cmd;

        bool valid = true;

        // Validate the inputs
        valid = Validation.ValidateString(txt_name.Text, "Menu name", 6, lbl_name);
        if (valid) valid = Validation.ValidateInt(txt_startTime.Text, "Start time", 0, 4, lbl_startTime);
        if (valid) valid = Validation.ValidateInt(txt_endTime.Text, "End time", 0, 4, lbl_endTime);

        // Insert the new menu
        if (valid) {
            cmdStr = "INSERT INTO menu VALUES (" + Global.Restaurant + ",'" + txt_name.Text + "', " + txt_startTime.Text + "," + txt_endTime.Text + ");";
            cmd = new SqlCommand(cmdStr, conn);
            cmd.ExecuteNonQuery();
            Response.Redirect("ManagementView.aspx");
        }
    }

    /// <summary>
    /// Navigates to the management view
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void AddRest_button_cancel_Click(object sender, EventArgs e) {
        Response.Redirect("ManagementView.aspx");
    }
}