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
        if (!Context.User.Identity.IsAuthenticated) {
            FormsAuthentication.SignOut();
        }
    }

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

/*        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
*/