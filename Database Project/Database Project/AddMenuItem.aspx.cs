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

        valid = Validation.ValidateString(txt_name.Text, "Item name", 2, lbl_name);
        if (valid) valid = Validation.ValidateString(txt_description.Text, "Description", 0, lbl_description);
        if (valid) valid = Validation.ValidateInt(txt_calories.Text, "Calories", 0, 5, lbl_calories);
        if (valid) valid = Validation.ValidateInt(txt_calories.Text, "Price", 0, 4, lbl_price);

        Response.Write(valid);

        if (valid) {
            cmdStr = "INSERT INTO menuitem VALUES (" + Global.Menu + ",'" + txt_name.Text + "', '" + txt_description.Text + "', '" + txt_calories.Text + "', '" + txt_price.Text + "');";
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