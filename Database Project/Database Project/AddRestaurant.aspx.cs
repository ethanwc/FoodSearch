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

        valid = Validation.ValidateString(AddRest_text_name.Text, "Restaurant name", 6, AddRest_label_name);
        if (valid) valid = Validation.ValidateString(AddRest_text_address.Text, "Address", 6, AddRest_label_address);
        if (valid) valid = Validation.ValidateString(AddRest_text_zip.Text, "Zipcode", 5, AddRest_label_zip);

        Response.Write(valid);

        if (valid) {
            cmdStr = "INSERT INTO restaurant VALUES ('" + AddRest_text_name.Text + "', " + 1 + ");";
            cmd = new SqlCommand(cmdStr, conn);
            cmd.ExecuteNonQuery();
            cmdStr = "SELECT max(restId) FROM restaurant";
            cmd = new SqlCommand(cmdStr, conn);
            int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            cmdStr = "INSERT INTO locations VALUES (" + temp + ", '" + AddRest_text_address.Text + "', " + AddRest_text_zip.Text + ");";
            cmd = new SqlCommand(cmdStr, conn);
            Response.Write(cmdStr);
            cmd.ExecuteNonQuery();
            //Response.Redirect("Default.aspx");
        }
    }

    protected void AddRest_button_cancel_Click(object sender, EventArgs e) {
        Response.Redirect("ManagementView.aspx");
    }
}