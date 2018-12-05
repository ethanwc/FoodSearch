<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <ul class="nav navbar-nav">
                <li><a href="Login.aspx">Login</a></li>
                <li><a href="Search.aspx">Search</a></li>
                <li><a href="about.html">About</a></li>
                <li><a href="Reviews.aspx">Reviews</a></li>
            </ul>
        </div>
    </nav>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://getbootstrap.com.vn/examples/equal-height-columns/equal-height-columns.css" />

    <link href="https://fonts.googleapis.com/css?family=Playfair+Display" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <div class="row">
        <div class="col-md-2 col-md-offset-5" style="background: white; border-color: white">
            <center><img src="icon.png"></center>
        </div>
    </div>
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">


    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous">


    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous">


    </script>
    <form id="form1" runat="server">
        <p>


            <div class="row">

                <center>
                <h1>Food Search</h1>
            </center>





                <div class="col-xs-4 col-xs-offset-4" style="background: white; border-color: white">



                    <div style="white-space: nowrap;">


                        <asp:TextBox class="form-control" placeholder="Search" ID="search_text" runat="server" OnTextChanged="search_text_TextChanged"></asp:TextBox>



            <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem Value="0" Selected="true">Name</asp:ListItem>
            <asp:ListItem Value="1">Price</asp:ListItem>
            <asp:ListItem Value="2">Restaurant</asp:ListItem>
            </asp:RadioButtonList>



                    </div>

                </div>
            </div>


            <asp:Button class="invisible" ID="search_button" runat="server" OnClick="Button1_Click" Text="Search" />
        </p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT mi.ItemName as 'Item', r.RestName as 'Restaurant', mi.Calories, mi.Price, mi.ItemDescription as 'Description'
FROM MenuItem mi, Restaurant r, Menu m
WHERE ([ItemName] LIKE '%' + @ItemName + '%')
AND r.RestId = M.MenuId 
AND m.MenuId = mi.MenuId;">
            <SelectParameters>
                <asp:ControlParameter ControlID="search_text" Name="ItemName" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
 
        <div class="col-xs-12" style="background: white; border-color: white" align="center">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
