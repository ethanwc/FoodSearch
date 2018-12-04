using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;

public partial class Default2 : System.Web.UI.Page {

    protected void Page_Load(object sender, EventArgs e) {

    }

    protected void TextBox1_TextChanged(object sender, EventArgs e) {

    }

    protected void register_submit_Click(object sender, EventArgs e) {
        if (IsPostBack) {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string cmdStr;
            SqlCommand cmd;

            bool valid = true;


            // Validate username
            if (register_username.Text.Length < 6) {
                register_label_username.Text = "Username must be at least 6 characters.";
                valid = false;
            } else {
                if (ValidateString(register_username.Text)) {
                    cmdStr = "SELECT count(*) FROM Customer WHERE username = '" + register_username.Text + "'";
                    cmd = new SqlCommand(cmdStr, conn);
                    int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                    if (temp != 0) {
                        register_label_username.Text = "Username already taken.";
                        valid = false;
                    } else {
                        register_label_username.Text = "";
                    }
                } else {
                    register_label_username.Text = "Username may contain only alphanumeric characters.";
                    valid = false;
                }


            }

            // Validate password
            if (register_password.Text.Length < 6) {
                register_label_password.Text = "Passwords must be at least 6 characters.";
                valid = false;
            } else {
                if (ValidateString(register_password.Text)) {
                    register_label_password.Text = "";
                } else {
                    register_label_password.Text = "Password may contain only alphanumeric characters.";
                    valid = false;
                }
            }

            // Validate password
            if (register_display.Text.Length < 2) {
                register_label_display.Text = "Display name must be at least 2 characters.";
                valid = false;
            } else {
                if (ValidateString(register_display.Text)) {
                    register_label_display.Text = "";
                } else {
                    register_label_display.Text = "Display name may contain only alphanumeric characters."; ;
                    valid = false;
                }
            }

            if (valid) {
                cmdStr = "INSERT INTO customer VALUES ('" + register_username.Text + "', '" + register_password.Text + "', '" + register_display.Text + "');";
                Response.Write(cmdStr);
                cmd = new SqlCommand(cmdStr, conn);
                cmd.ExecuteNonQuery();
                Response.Redirect("Login.aspx");
            }
            conn.Close();
        }
    }

    private bool ValidateString(string input) {
        try {
            return Regex.IsMatch(input, "^[a-zA-Z0-9]*$");
        } catch {
            return false;
        }
    }

    protected void register_button_cancel_Click(object sender, EventArgs e) {
        Response.Redirect("Login.aspx");
    }
}