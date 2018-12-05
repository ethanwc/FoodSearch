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

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {

 
  
            if (RadioButtonList1.SelectedItem.Text == "Name")
        { 
            SqlDataSource1.SelectCommand = "SELECT mi.ItemName as 'Item', r.RestName as 'Restaurant', mi.Calories, mi.Price as 'Price', mi.ItemDescription as 'Description' " +
                     "FROM MenuItem mi, Restaurant r, Menu m WHERE(r.RestName LIKE '%' + @ItemName + '%') AND r.RestId = M.MenuId AND m.MenuId = mi.MenuId; ";
    }

        if (RadioButtonList1.SelectedItem.Text == "Price")
        { 
            SqlDataSource1.SelectCommand = "SELECT DISTINCT mi.ItemName as 'Item', r.RestName as 'Restaurant', mi.Calories, mi.Price, mi.ItemDescription as 'Description' FROM MenuItem mi, Restaurant r, Menu m " +
                "WHERE(mi.price <= " + double.Parse(search_text.Text) + ") AND r.RestId = M.MenuId AND m.MenuId = mi.MenuId ORDER BY Price DESC;";
                       //double.Parse(search_text.Text) + ") AND r.RestId = M.MenuId AND m.MenuId = mi.MenuId; ";
        }

        if (RadioButtonList1.SelectedItem.Text == "Restaurant")
        {
            SqlDataSource1.SelectCommand = "SELECT mi.ItemName as 'Item', r.RestName as 'Restaurant', mi.Calories, " +
                "mi.Price, mi.ItemDescription as 'Description' " +
                "FROM MenuItem mi, Restaurant r, Menu m " +
                "WHERE(r.RestName LIKE '%' + @ItemName + '%') AND r.RestId = M.MenuId AND m.MenuId = mi.MenuId";
        }
    }

    protected void search_text_TextChanged(object sender, EventArgs e)
    {


    }
}