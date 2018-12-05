using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateMenu : System.Web.UI.Page {

    private void ShowSearchControls(bool toggle) {
        label_selectRestaurant.Visible = toggle;
        label_selectRestaurant.Enabled = toggle;
        txt_searchbar.Visible = toggle;
        txt_searchbar.Enabled = toggle;
        btn_search.Visible = toggle;
        btn_search.Enabled = toggle;
        btn_cancel.Enabled = !toggle;
        btn_cancel.Visible = !toggle;
        ShowRestaurants(false);
    }

    private void ShowRestaurants(bool toggle) {
        list_restaurantList.Enabled = toggle;
        list_restaurantList.Visible = toggle;
        Btn_createRest.Enabled = toggle;
        Btn_createRest.Visible = toggle;
        if (toggle) list_restaurantList.DataBind();
    }

    protected void CreateMenu_search_Click(object sender, EventArgs e) {
        ShowRestaurants(true);   
    }

    private void ShowMenus(bool toggle) {
        list_menuList.Enabled = toggle;
        list_menuList.Visible = toggle;
        lbl_menuSelection.Visible = toggle;
        lbl_menuSelection.Enabled = toggle;
        Btn_createMenu.Enabled = toggle;
        Btn_createMenu.Visible = toggle;
    }

    protected void SelectRestaurant(object sender, EventArgs e) {
        ShowRestaurants(false);
        ShowSearchControls(false);
        ShowMenus(true);
        lbl_selectedRestaurant.Text = ((Button)sender).CommandArgument;
    }

    protected void SelectMenu(object sender, EventArgs e) {
        ShowMenus(false);
        ShowMenuItems(true);
        Response.Write(((Button)sender).CommandArgument);
        lbl_selectedMenu.Text = ((Button)sender).CommandArgument;
    }

    private void ShowMenuItems(bool toggle) {
        list_menuItemList.Enabled = toggle;
        list_menuItemList.Visible = toggle;
        if (toggle) list_menuItemList.DataBind();
        Btn_createMenuItem.Enabled = toggle;
        Btn_createMenuItem.Visible = toggle;
    }

    protected void CreateMenu_cancel_Click(object sender, EventArgs e) {
        ShowSearchControls(true);
        ShowRestaurants(false);
        ShowMenus(false);
        ShowMenuItems(false);
    }

    protected void Btn_createRest_Click(object sender, EventArgs e) {
        Response.Redirect("AddRestaurant.aspx");
    }

    protected void Btn_createMenu_Click(object sender, EventArgs e) {
        Global.Restaurant = Convert.ToInt32(lbl_selectedRestaurant.Text);
        Response.Redirect("AddMenu.aspx");
    }

    protected void Btn_createMenuItem_Click(object sender, EventArgs e) {
        Global.Menu = Convert.ToInt32(lbl_selectedMenu.Text);
        Response.Redirect("AddMenuItem.aspx");
    }
}

/*

*/

