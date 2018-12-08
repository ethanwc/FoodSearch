//Search page cs 
//Ethan Cheatham
//Handles different types of searches based on select menu
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if user is not logged in, redirect
        if (!Context.User.Identity.IsAuthenticated) {
            Response.Redirect("Login.aspx");
        }

        lbl_welcome.Text = "Welcome " + Global.DisplayName;

    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {   
        //If selection is name, search for food
        if (RadioButtonList1.SelectedItem.Text == "Item Name") {
            SqlDataSource1.SelectCommand = "SELECT mi.ItemName as 'Item', r.RestName as 'Restaurant', mi.Calories, mi.Price as 'Price', mi.ItemDescription as 'Description' " +
                                           "FROM MenuItem mi, Restaurant r, Menu m WHERE(r.RestName LIKE '%' + @ItemName + '%') AND r.RestId = M.MenuId AND m.MenuId = mi.MenuId; ";
            //if selection is price, find items less than or equal to specific price
        } else if (RadioButtonList1.SelectedItem.Text == "Max Price") {
            double val;
            if (double.TryParse(search_text.Text, out val)) {
                SqlDataSource1.SelectCommand = "SELECT DISTINCT mi.ItemName as 'Item', r.RestName as 'Restaurant', mi.Calories, mi.Price, mi.ItemDescription as 'Description' " +
                                               "FROM MenuItem mi, Restaurant r, Menu m " +
                                               "WHERE(mi.price <= " + val + ") AND r.RestId = M.MenuId AND m.MenuId = mi.MenuId ORDER BY Price DESC;";
            }
            //if selection is restaurant, sort for restaurant name specifically
        }  else if (RadioButtonList1.SelectedItem.Text == "Restaurant") {
            SqlDataSource1.SelectCommand = "SELECT mi.ItemName as 'Item', r.RestName as 'Restaurant', mi.Calories, " + "mi.Price, mi.ItemDescription as 'Description' " +
                                           "FROM MenuItem mi, Restaurant r, Menu m " +
                                           "WHERE(r.RestName LIKE '%' + @ItemName + '%') AND r.RestId = M.MenuId AND m.MenuId = mi.MenuId";
        }
        //finalize change
        GridView1.DataBind();
    }
}