using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Text.RegularExpressions;

/// <summary>
/// Controls the login controls.
/// Josh Lichty
/// </summary>
public partial class Login : System.Web.UI.Page {

    /// <summary>
    /// Sign out
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void Page_Load(object sender, EventArgs e) {
        if (!Context.User.Identity.IsAuthenticated) {
            FormsAuthentication.SignOut();
        }
    }

    /// <summary>
    /// Validate the username and password and log in.
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void Login_button_login_Click(object sender, EventArgs e) {
        if (IsPostBack) {
            if (ValidateString(login_textfield_username.Text) && ValidateString(login_textfield_password.Text)) {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string cmdStr = "SELECT count(*) FROM Customer WHERE username = '" + login_textfield_username.Text + "' AND passwordHash = '" + login_textfield_password.Text + "'";
                SqlCommand cmd = new SqlCommand(cmdStr, conn);
                int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                if (temp == 1) {
                    cmdStr = "SELECT displayname, username FROM Customer WHERE username = '" + login_textfield_username.Text + "'";
                    cmd = new SqlCommand(cmdStr, conn);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read()) {
                        Global.DisplayName = dr["displayname"].ToString();
                        FormsAuthentication.RedirectFromLoginPage(dr["username"].ToString(), false);
                    }
                } else {
                    login_label_error.Text = "Username and password do not match.";
                }
                conn.Close();
            } else {
                login_label_error.Text = "Invalid characters entered.";
            }
        }

    }

    /// <summary>
    /// Ensure that a string contains only alphanumeric characters.
    /// </summary>
    /// <param name="input">The string to check</param>
    /// <returns>Whether the string is valid</returns>
    private bool ValidateString(string input) {
        try {
            return Regex.IsMatch(input, "^[a-zA-Z0-9]*$");
        } catch {
            return false;
        }
    }

    /// <summary>
    /// Redirects to the registration page.
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void Login_button_register_Click(object sender, EventArgs e) {
        Response.Redirect("Register.aspx");
    }
}