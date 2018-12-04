using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        default_label.Text = "Welcome " + Context.User.Identity.Name;
    }

    protected void default_logout_Click(object sender, EventArgs e) {
        FormsAuthentication.SignOut();
        Response.Redirect("Login.aspx");
    }
}