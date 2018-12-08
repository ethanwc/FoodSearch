using System;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Add a menu item.
/// Josh Lichty
/// </summary>
public partial class AddMenuItem : System.Web.UI.Page {

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
    /// Validates inputs and creates a new menu item
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void AddRest_button_addRest_Click(object sender, EventArgs e) {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string cmdStr;
        SqlCommand cmd;

        bool valid = true;
        
        // Validation
        valid = Validation.ValidateString(txt_name.Text, "Item name", 2, lbl_name);
        if (valid) valid = Validation.ValidateString(txt_description.Text, "Description", 0, lbl_description);
        if (valid) valid = Validation.ValidateInt(txt_calories.Text, "Calories", 0, 5, lbl_calories);
        if (valid) valid = Validation.ValidateInt(txt_calories.Text, "Price", 0, 4, lbl_price);

        // Insert into database
        if (valid) {
            cmdStr = "INSERT INTO menuitem VALUES (" + Global.Menu + ",'" + txt_name.Text + "', '" + txt_description.Text + "', '" + txt_calories.Text + "', '" + txt_price.Text + "');";
            cmd = new SqlCommand(cmdStr, conn);
            cmd.ExecuteNonQuery();
            Response.Redirect("ManagementView.aspx");
        }
    }

    /// <summary>
    /// Redirects to the management view page.
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void AddRest_button_cancel_Click(object sender, EventArgs e) {
        Response.Redirect("ManagementView.aspx");
    }
}