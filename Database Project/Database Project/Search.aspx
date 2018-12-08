<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Food Search</title>
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
    <div class="row">
        <div class="text-center">
        </div>
        <div class="col-md-2 col-md-offset-5" style="background: white; border-color: white">
            <center>
                <img src="icon.png"/>
            </center>
        </div>
    </div>

    <form id="form1" runat="server">
        <div class="row">
            <center>
                <h1>Food Search</h1>
                <asp:Label ID="lbl_welcome" runat="server"></asp:Label>
                <br />
                <br />
            </center>
            <div class="col-xs-4 col-xs-offset-4" style="background: white; border-color: white &lt;div" style="white-space: nowrap;">
                <asp:TextBox class="form-control" placeholder="Search" ID="search_text" runat="server" autocomplete="off"></asp:TextBox>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                    <asp:ListItem Value="0" Selected="true">Item name</asp:ListItem>
                    <asp:ListItem Value="1">Max Price</asp:ListItem>
                    <asp:ListItem Value="2">Restaurant</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <asp:Button class="invisible" ID="search_button" runat="server" Text="Search" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                           SelectCommand="SELECT mi.ItemName as 'Item', r.RestName as 'Restaurant', mi.Calories, mi.Price, mi.ItemDescription as 'Description'
                                          FROM MenuItem mi, Restaurant r, Menu m
                                          WHERE ([ItemName] LIKE '%' + @ItemName + '%')
                                          AND r.RestId = M.MenuId 
                                          AND m.MenuId = mi.MenuId;">
            <SelectParameters>
                <asp:ControlParameter ControlID="search_text" Name="ItemName" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
 
        <div class="col-xs-12" style="background: white; border-color: white" align="center">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                    <asp:BoundField DataField="Restaurant" HeaderText="Restaurant" SortExpression="Restaurant" />
                    <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
        </div>
    </form>
    </body>
</html>
