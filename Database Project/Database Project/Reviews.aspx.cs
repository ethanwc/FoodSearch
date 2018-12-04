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
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);


    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Context.User.Identity.IsAuthenticated)
        {
            SqlCommand cmd = new SqlCommand("insert into reviews values('" + Context.User.Identity.Name + "', '" + DropDownList2.SelectedValue
+ "', '" + CleanRating.Text + "', '" + CleanNote.Text + "'," +
      " '" + FoodRating.Text + "', '" + ValueNote.Text + "', '" + ServiceRating.Text + "', '" + ServiceNote.Text + "', " +
      "'" + ValueRating.Text + "', '" + FoodNote.Text + "')", con);
            cmd.ExecuteNonQuery();
            button_submitreview.Visible = false;
            Submitted.Visible = true;
        }

        con.Close();            
    }


    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void TextBox4_TextChanged(object sender, EventArgs e)
    {

    }

    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void TextBox5_TextChanged(object sender, EventArgs e)
    {

    }

    protected void TextBox4_TextChanged1(object sender, EventArgs e)
    {

    }

    protected void source_browsereviews_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ListBox1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
}