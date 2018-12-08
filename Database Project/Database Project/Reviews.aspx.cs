//Review page
//Ethan Cheatham
//Displays and allows custoemr to create reviews
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Reviews : System.Web.UI.Page

{
    //establish connection to database
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);


    protected void Page_Load(object sender, EventArgs e)
    {
           //verify ligin status
        if (!Context.User.Identity.IsAuthenticated) {
            Response.Redirect("Login.aspx");
        }
            con.Open();
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {   
           //if user is logged in, submit review
        if (Context.User.Identity.IsAuthenticated) {
            string cmdStr = "INSERT INTO reviews VALUES('" + Context.User.Identity.Name +
                                            "', '" + DropDownList2.SelectedValue +
                                            "', " + CleanRating.Text + ", '" + CleanNote.Text +
                                            "', " + FoodRating.Text + ", '" + ValueNote.Text +
                                            "', " + ServiceRating.Text + ", '" + ServiceNote.Text +
                                            "', " + ValueRating.Text + ", '" + FoodNote.Text + "')";
            SqlCommand cmd = new SqlCommand(cmdStr, con);
            cmd.ExecuteNonQuery();
            button_submitreview.Visible = false;
            Submitted.Visible = true;
            view_reviews.DataBind();
        }

        con.Close();            
    }
}