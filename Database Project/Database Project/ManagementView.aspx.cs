using System;
using System.Web.UI.WebControls;

/// <summary>
/// Controls the create menu controls.
/// Josh Lichty
/// </summary>
public partial class ManagementView : System.Web.UI.Page {

    /// <summary>
    /// Redirects unauthenticated users to the login page.
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void Page_Load(object sender, EventArgs e) {
        if (!Context.User.Identity.IsAuthenticated) {
            Response.Redirect("Login.aspx");
        }
    }

    /// <summary>
    /// Show the search controls
    /// </summary>
    /// <param name="toggle">Show or hide T/F</param>
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

    /// <summary>
    /// Show the restaurant list
    /// </summary>
    /// <param name="toggle">Show or hide T/F</param>
    private void ShowRestaurants(bool toggle) {
        list_restaurantList.Enabled = toggle;
        list_restaurantList.Visible = toggle;
        Btn_createRest.Enabled = toggle;
        Btn_createRest.Visible = toggle;
        if (toggle) list_restaurantList.DataBind();
    }

    /// <summary>
    /// Executes the search.
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void CreateMenu_search_Click(object sender, EventArgs e) {
        ShowRestaurants(true);   
    }

    /// <summary>
    /// Show the menu controls
    /// </summary>
    /// <param name="toggle">Show or hide T/F</param>
    private void ShowMenus(bool toggle) {
        list_menuList.Enabled = toggle;
        list_menuList.Visible = toggle;
        lbl_menuSelection.Visible = toggle;
        lbl_menuSelection.Enabled = toggle;
        Btn_createMenu.Enabled = toggle;
        Btn_createMenu.Visible = toggle;
    }

    /// <summary>
    /// Selects a restaurant
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void SelectRestaurant(object sender, EventArgs e) {
        ShowRestaurants(false);
        ShowSearchControls(false);
        ShowMenus(true);
        lbl_selectedRestaurant.Text = ((Button)sender).CommandArgument;
    }

    /// <summary>
    /// Selects a menu.
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void SelectMenu(object sender, EventArgs e) {
        ShowMenus(false);
        ShowMenuItems(true);
        lbl_selectedMenu.Text = ((Button)sender).CommandArgument;
    }

    /// <summary>
    /// Show the menu item controls
    /// </summary>
    /// <param name="toggle">Show or hide T/F</param>
    private void ShowMenuItems(bool toggle) {
        list_menuItemList.Enabled = toggle;
        list_menuItemList.Visible = toggle;
        if (toggle) list_menuItemList.DataBind();
        Btn_createMenuItem.Enabled = toggle;
        Btn_createMenuItem.Visible = toggle;
    }

    /// <summary>
    /// Cancels the operation.
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void CreateMenu_cancel_Click(object sender, EventArgs e) {
        ShowSearchControls(true);
        ShowRestaurants(false);
        ShowMenus(false);
        ShowMenuItems(false);
    }

    /// <summary>
    /// Redirects to the add restaurant page.
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void Btn_createRest_Click(object sender, EventArgs e) {
        Response.Redirect("AddRestaurant.aspx");
    }

    /// <summary>
    /// Redirects to the add menu page.
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void Btn_createMenu_Click(object sender, EventArgs e) {
        Global.Restaurant = Convert.ToInt32(lbl_selectedRestaurant.Text);
        Response.Redirect("AddMenu.aspx");
    }

    /// <summary>
    /// Redirects to the add menu item page.
    /// </summary>
    /// <param name="sender">The object that triggered the method</param>
    /// <param name="e">Event arguments</param>
    protected void Btn_createMenuItem_Click(object sender, EventArgs e) {
        Global.Menu = Convert.ToInt32(lbl_selectedMenu.Text);
        Response.Redirect("AddMenuItem.aspx");
    }
}
