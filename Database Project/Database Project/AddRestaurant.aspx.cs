using System;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Add a restaurant
/// Josh Lichty
/// </summary>
public partial class AddRestaurant : System.Web.UI.Page {

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
    /// Validates inputs and creates a new restaurant.
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
        valid = Validation.ValidateString(AddRest_text_name.Text, "Restaurant name", 6, AddRest_label_name);
        if (valid) valid = Validation.ValidateString(AddRest_text_address.Text, "Address", 6, AddRest_label_address);
        if (valid) valid = Validation.ValidateString(AddRest_text_zip.Text, "Zipcode", 5, AddRest_label_zip);

        // Insert into the database
        if (valid) {
            cmdStr = "INSERT INTO restaurant VALUES ('" + AddRest_text_name.Text + "', " + 1 + ");";
            cmd = new SqlCommand(cmdStr, conn);
            cmd.ExecuteNonQuery();
            cmdStr = "SELECT max(restId) FROM restaurant";
            cmd = new SqlCommand(cmdStr, conn);
            int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            cmdStr = "INSERT INTO locations VALUES (" + temp + ", '" + AddRest_text_address.Text + "', " + AddRest_text_zip.Text + ");";
            cmd = new SqlCommand(cmdStr, conn);
            cmd.ExecuteNonQuery();
        }
    }

    /// <summary>
    /// Redirect to the management view
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void AddRest_button_cancel_Click(object sender, EventArgs e) {
        Response.Redirect("ManagementView.aspx");
    }
}