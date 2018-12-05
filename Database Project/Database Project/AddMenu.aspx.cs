using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {

    }

    protected void AddRest_button_addRest_Click(object sender, EventArgs e) {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["FoodSearch"].ConnectionString);
        conn.Open();
        string cmdStr;
        SqlCommand cmd;

        bool valid = true;

        valid = Validation.ValidateString(txt_name.Text, "Menu name", 6, lbl_name);
        if (valid) valid = Validation.ValidateInt(txt_startTime.Text, "Start time", 0, 4, lbl_startTime);
        if (valid) valid = Validation.ValidateInt(txt_endTime.Text, "End time", 0, 4, lbl_endTime);

        Response.Write(valid);

        if (valid) {
            cmdStr = "INSERT INTO menu VALUES (" + Global.Restaurant + ",'" + txt_name.Text + "', " + txt_startTime.Text + "," + txt_endTime.Text + ");";
            Response.Write(cmdStr);
            cmd = new SqlCommand(cmdStr, conn);
            cmd.ExecuteNonQuery();
            Response.Redirect("ManagementView.aspx");
        }
    }

    protected void AddRest_button_cancel_Click(object sender, EventArgs e) {
        Response.Redirect("ManagementView.aspx");
    }
}