<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagementView.aspx.cs" Inherits="ManagementView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Food Search</title>
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }
        .auto-style2 {
            font-size: large;
        }
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="http://getbootstrap.com.vn/examples/equal-height-columns/equal-height-columns.css" />
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display" rel="stylesheet"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
</head>
<body>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <ul class="nav navbar-nav">
                <li><a href="Login.aspx">Logout</a></li>
                <li><a href="Account.aspx">My Account</a></li>
                <li><a href="Search.aspx">Search</a></li>
                <li><a href="Reviews.aspx">Reviews</a></li>
                <li><a href="ManagementView.aspx">Management View</a></li>
            </ul>
        </div>
    </nav>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <strong><span class="auto-style2">Menu Builder</span></strong><br />
            <br />
            <asp:Label ID="label_selectRestaurant" runat="server" Text="Select Restaurant" Font-Bold="True"></asp:Label>
            <br />
            <asp:TextBox ID="txt_searchbar" runat="server" Width="180px"></asp:TextBox>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Restaurant]"></asp:SqlDataSource>
            <asp:Button ID="btn_search" runat="server" OnClick="CreateMenu_search_Click" Text="Search" Width="180px" />
            <asp:ListView ID="list_restaurantList" runat="server" DataSourceID="SqlDataSource2" EnableTheming="True" Visible="False">
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td></td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <tr style="" onmouseover="style.background = 'lightgray'" onmouseout="style.background = 'white'"">
                        <td>
                            <asp:Button ID="RestNameLabel" runat="server" OnClick="SelectRestaurant" Text='<%# Eval("RestName") %>' CommandArgument='<%# Eval("RestId") %>'/>
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server">RestName</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="RestNameLabel" runat="server" Text='<%# Eval("RestName") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            
            <asp:Button ID="Btn_createRest" runat="server" OnClick="Btn_createRest_Click" Text="New Restaurant" Visible="False" Width="180px" />


            <br />
            <asp:Label ID="lbl_menuSelection" runat="server" Font-Bold="True" Text="Select Menu" Visible="False"></asp:Label>
            <asp:ListView ID="list_menuList" runat="server" DataSourceID="MenuSelection" Enabled="False" DataKeyNames="MenuId">
                <ItemTemplate>
                    <span style="">
                    <asp:Button ID="MenuNameLabel" runat="server" OnClick="SelectMenu" Text='<%# Eval("MenuName") +  ":   Hours (" + Eval("StartTime") + "-"+ Eval("EndTime") + ")"  %>' CommandArgument='<%# Eval("MenuId") %>' />
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            


            <asp:SqlDataSource ID="MenuSelection" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT *
FROM menu
WHERE restid = @restid">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lbl_selectedRestaurant" Name="restid" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT RestName, RestId FROM Restaurant WHERE (RestName LIKE '%' + @search + '%')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txt_searchbar" DefaultValue="" Name="search" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            <asp:Button ID="Btn_createMenu" runat="server" OnClick="Btn_createMenu_Click" Text="New Menu" Visible="False" Width="180px" />
             
            <br />
            <asp:ListView ID="list_menuItemList" runat="server" DataSourceID="MenuItemSelection" DataKeyNames="MenuItemId">
                <EmptyDataTemplate>
                    <span></span>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") + "     $" + Eval("Price")%>' ToolTip='<%# Eval("ItemDescription") + "   Calories: " + Eval("Calories") %>'/>
                    <br />
                </ItemTemplate>
                <LayoutTemplate>
                    <div style="" id="itemPlaceholderContainer" runat="server">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            


            <asp:SqlDataSource ID="MenuItemSelection" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * 
FROM menuItem
WHERE menuid = @menuid">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lbl_selectedMenu" Name="menuid" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
             
            <asp:Button ID="Btn_createMenuItem" runat="server" OnClick="Btn_createMenuItem_Click" Text="New Menu Item" Visible="False" Width="180px" />
             
            <br />
        </div>
        <p>
            <asp:Button ID="btn_cancel" runat="server" Enabled="False" OnClick="CreateMenu_cancel_Click" Text="Cancel" Visible="False" Width="180px" />
        </p>
        <p>
            <asp:Label ID="lbl_selectedRestaurant" runat="server" Visible="False"></asp:Label>
            </p>
        <p>
            <asp:Label ID="lbl_selectedMenu" runat="server" Visible="False"></asp:Label>
            </p>
    </form>
</body>
</html>
