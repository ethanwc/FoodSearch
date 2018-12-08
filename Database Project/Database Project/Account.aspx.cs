using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

/// <summary>
/// Controls the account page 
/// (shouldn't be a partial class of search, 
/// but I noticed it too late and don't have time to figure out how to fix it)
/// </summary>
public partial class Search : System.Web.UI.Page
{
    // The connection to the database
    SqlConnection conn;
    // The command to run
    SqlCommand cmd;
    // A string to hold the command
    string cmdStr;

    /// <summary>
    /// Initializes the connection and displays personalized user data.
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Context.User.Identity.IsAuthenticated) {
            Response.Redirect("Login.aspx");
        }
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        
        string header = Global.DisplayName;
        if (header.EndsWith("s")) {
            header += "' Profile";
        } else {
            header += "'s Profile";
        }
        lbl_welcome.Text = header;
        lbl_username.Text = Context.User.Identity.Name;
    }

    /// <summary>
    /// Add Preferences
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void btn_addPref_Click(object sender, EventArgs e) {
        txt_cuisine.Visible = true;
        txt_maxprice.Visible = true;
        btn_submitPref.Visible = true;
        btn_addPref.Visible = false;
        txt_cuisine.Enabled = true;
        txt_maxprice.Enabled = true;
        btn_submitPref.Enabled = true;
        btn_addPref.Enabled = false;
        btn_submitPref.Focus();
    }

    /// <summary>
    /// Submit Preferences
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void btn_submitPref_Click(object sender, EventArgs e) {
        bool valid = Validation.ValidateString(txt_cuisine.Text, "Food Type", 6, lbl_cuisine);
        if (valid) valid = Validation.ValidateInt(txt_maxprice.Text, "Max price", 0, 6, lbl_maxprice);
        Response.Write(valid);
        if (valid) {
            conn.Open();
            cmdStr = "INSERT INTO preferences VALUES ('" + Context.User.Identity.Name + "', '" + txt_cuisine.Text + "', " + txt_maxprice.Text + ");";
            Response.Write(cmdStr);
            cmd = new SqlCommand(cmdStr, conn);
            cmd.ExecuteNonQuery();
            list_prefs.DataBind();
            conn.Close();

            txt_cuisine.Visible = false;
            txt_maxprice.Visible = false;
            btn_submitPref.Visible = false;
            btn_addPref.Visible = true;
            txt_cuisine.Enabled = false;
            txt_maxprice.Enabled = false;
            btn_submitPref.Enabled = false;
            btn_addPref.Enabled = true;
        }
    }

    /// <summary>
    /// Add Allergy
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void btn_addAllergy_Click(object sender, EventArgs e) {
        txt_allergy.Visible = true;
        rb_severity.Visible = true;
        rb_sensitivity.Visible = true;
        btn_submitAllergy.Visible = true;
        btn_addAllergy.Visible = false;
        txt_allergy.Enabled = true;
        rb_severity.Enabled = true;
        rb_sensitivity.Enabled = true;
        btn_submitAllergy.Enabled = true;
        btn_addAllergy.Enabled = false;
        btn_submitAllergy.Focus();
    }

    /// <summary>
    /// Submit Allergy
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void btn_submitAllergy_Click(object sender, EventArgs e) {
        bool valid = Validation.ValidateString(txt_allergy.Text, "Allergy", 3, lbl_allergy);
        if (valid) {
            conn.Open();
            cmdStr = "INSERT INTO allergies VALUES ('" + txt_allergy.Text + "', '" + Context.User.Identity.Name + "', " + rb_severity.Text + ", " + rb_sensitivity.Text + ");";
            cmd = new SqlCommand(cmdStr, conn);
            cmd.ExecuteNonQuery();
            list_prefs.DataBind();
            conn.Close();

            txt_allergy.Visible = false;
            rb_severity.Visible = false;
            rb_sensitivity.Visible = false;
            btn_submitAllergy.Visible = false;
            btn_addAllergy.Visible = true;
            txt_allergy.Enabled = false;
            rb_severity.Enabled = false;
            rb_sensitivity.Enabled = false;
            btn_submitAllergy.Enabled = false;
            btn_addAllergy.Enabled = true;
        }
    }

    /// <summary>
    /// Add Party
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void btn_createParty_Click(object sender, EventArgs e) {
        btn_createParty.Visible = false;
        btn_join.Visible = false;
        txt_partyName.Visible = true;
        btn_partySubmit.Visible = true;
        lbl_partyname.Visible = true;
        btn_createParty.Enabled = false;
        btn_join.Enabled = false;
        txt_partyName.Enabled = true;
        btn_partySubmit.Enabled = true;
        lbl_partyname.Enabled = true;
        btn_partySubmit.Focus();
    }

    /// <summary>
    /// Submit Party
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void btn_partySubmit_Click(object sender, EventArgs e) {
        bool valid = Validation.ValidateString(txt_partyName.Text, "PartyName", 2, lbl_partyname);
        if (valid) {
            conn.Open();
            cmdStr = "SELECT MAX(partyId) FROM party";
            SqlCommand cmd = new SqlCommand(cmdStr, conn);
            int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            cmdStr = "INSERT INTO party VALUES (" + (temp + 1) + ", '" + txt_partyName.Text + "', '" + Context.User.Identity.Name + "');";
            cmd = new SqlCommand(cmdStr, conn);
            cmd.ExecuteNonQuery();
            list_allergies.DataBind();
            conn.Close();

            btn_createParty.Visible = true;
            btn_join.Visible = true;
            txt_partyName.Visible = false;
            btn_partySubmit.Visible = false;
            lbl_partyname.Visible = false;
            btn_createParty.Enabled = true;
            btn_join.Enabled = true;
            txt_partyName.Enabled = false;
            btn_partySubmit.Enabled = false;
            lbl_partyname.Enabled = false;
        }
    }

    /// <summary>
    /// Join an existing party.
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void btn_join_Click(object sender, EventArgs e) {
        btn_createParty.Visible = false;
        btn_join.Visible = false;
        txt_search_party.Visible = true;
        lbl_search_party.Visible = true;
        txt_search_user.Visible = true;
        lbl_search_user.Visible = true;
        btn_searchpartysubmit.Visible = true;
        btn_createParty.Enabled = false;
        btn_join.Enabled = false;
        txt_search_party.Enabled = true;
        lbl_search_party.Enabled = true;
        txt_search_user.Enabled = true;
        lbl_search_user.Enabled = true;
        btn_searchpartysubmit.Enabled = true;
        btn_searchpartysubmit.Focus();
    }

    /// <summary>
    /// Search for a party.
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void btn_searchpartysubmit_Click(object sender, EventArgs e) {
        bool valid = Validation.ValidateString(txt_search_party.Text, "Search parameter", 0, lbl_search_party);
        if (valid) valid = Validation.ValidateString(txt_search_user.Text, "Search parameter", 0, lbl_search_user);
        if (valid) {
            list_PartySearch.Enabled = true;
            list_PartySearch.Visible = true;
            list_PartySearch.DataBind();
        }
    }

    /// <summary>
    /// Select a party.
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void btn_partySearch_Click(object sender, EventArgs e) {
        bool success = false;
        conn.Open();
        cmdStr = "INSERT INTO party VALUES (" + ((Button)sender).CommandArgument + ", '" + txt_partyName.Text + "', '" + Context.User.Identity.Name + "');";
        cmd = new SqlCommand(cmdStr, conn);

        try {
            cmd.ExecuteNonQuery();
            success = true;
        } catch {
            lbl_search_user.Text = "You already belong to this group";
        }
        if (success) {
            list_allergies.DataBind();
            conn.Close();

            btn_createParty.Visible = true;
            btn_join.Visible = true;
            txt_search_party.Visible = false;
            lbl_search_party.Visible = false;
            txt_search_user.Visible = false;
            lbl_search_user.Visible = false;
            btn_searchpartysubmit.Visible = false;
            btn_createParty.Enabled = true;
            btn_join.Enabled = true;
            txt_search_party.Enabled = false;
            lbl_search_party.Enabled = false;
            txt_search_user.Enabled = false;
            lbl_search_user.Enabled = false;
            btn_searchpartysubmit.Enabled = false;
            list_PartySearch.Enabled = false;
            list_PartySearch.Visible = false;
        }
    }
}