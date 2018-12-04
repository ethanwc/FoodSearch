using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Text.RegularExpressions;

public partial class Login : System.Web.UI.Page {

    protected void Page_Load(object sender, EventArgs e) {
        
    }

    protected void Login_button_login_Click(object sender, EventArgs e) {
        if (IsPostBack) {
            if (ValidateString(login_textfield_username.Text) && ValidateString(login_textfield_password.Text)) {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginString"].ConnectionString);
                conn.Open();
                string cmdStr = "SELECT count(*) FROM Customer WHERE username = '" + login_textfield_username.Text + "' AND passwordHash = '" + login_textfield_password.Text + "'";
                SqlCommand cmd = new SqlCommand(cmdStr, conn);
                int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                if (temp == 1) {
                    cmdStr = "SELECT displayname FROM Customer WHERE username = '" + login_textfield_username.Text + "'";

                    cmd = new SqlCommand(cmdStr, conn);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read()) {
                        FormsAuthentication.RedirectFromLoginPage(dr["displayname"].ToString(), false);
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

    private bool ValidateString(string input) {
        try {
            return Regex.IsMatch(input, "^[a-zA-Z0-9]*$");
        } catch {
            return false;
        }
    }


    protected void Login_button_register_Click(object sender, EventArgs e) {
        Response.Redirect("Register.aspx");
    }
}