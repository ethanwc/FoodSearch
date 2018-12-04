<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="Reviews.aspx.cs" Inherits="Reviews" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <ul class="nav navbar-nav">
                <li><a href="Search.aspx">Search</a></li>
                <li><a href="about.html">About</a></li>
                <li><a href="stats.html">Stats</a></li>
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
        <div class="row">
            <center>
                <h1>Reviews</h1>
                <p>  

            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="source_selectreviews" DataTextField="RestName" DataValueField="RestId">
            </asp:DropDownList>
            <asp:SqlDataSource ID="source_selectreviews" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Restaurant]" OnSelecting="source_browsereviews_Selecting"></asp:SqlDataSource>
            <asp:SqlDataSource ID="source_viewreviews" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Username as 'Username', CleanlinessR as 'Cleanliness Quality', CleanlinessNote as 'Cleanliness Note', FoodR as 'Food Quality', FoodNote as 'Food Note', ServiceR as 'Service Quality', ServiceNote as 'Service Note', ValueR as 'Value Quality', ValueNote as 'Value Note' FROM [Reviews] WHERE ([RestId] = @RestId);
">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="RestId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
                    <asp:GridView ID="view_reviews" runat="server" AutoGenerateColumns="False" DataSourceID="source_viewreviews">
                        <Columns>
                            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                            <asp:BoundField DataField="Cleanliness Quality" HeaderText="Cleanliness Quality" SortExpression="Cleanliness Quality" />
                            <asp:BoundField DataField="Cleanliness Note" HeaderText="Cleanliness Note" SortExpression="Cleanliness Note" />
                            <asp:BoundField DataField="Food Quality" HeaderText="Food Quality" SortExpression="Food Quality" />
                            <asp:BoundField DataField="Food Note" HeaderText="Food Note" SortExpression="Food Note" />
                            <asp:BoundField DataField="Service Quality" HeaderText="Service Quality" SortExpression="Service Quality" />
                            <asp:BoundField DataField="Service Note" HeaderText="Service Note" SortExpression="Service Note" />
                            <asp:BoundField DataField="Value Quality" HeaderText="Value Quality" SortExpression="Value Quality" />
                            <asp:BoundField DataField="Value Note" HeaderText="Value Note" SortExpression="Value Note" />
                        </Columns>
                    </asp:GridView>
           <center>
                </center>
                </p>
                <h1>Highest Rated Restaurants</h1>
                <p>
           <center>
                     <asp:SqlDataSource ID="source_highestreview" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 5 r.RestName as 'Restaurant', ROUND(((re.CleanlinessR + re.FoodR + re.ServiceR + re.ValueR)/5.0), 2) as 'Rating'
FROM Restaurant r, Reviews re
WHERE r.RestId = re.RestId
ORDER BY Rating DESC;"></asp:SqlDataSource>
                </center>
                </p>
                <h1>
                     <asp:GridView ID="view_highestrated" runat="server" AutoGenerateColumns="False" DataSourceID="source_highestreview" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                         <Columns>
                             <asp:BoundField DataField="Restaurant" HeaderText="Restaurant" SortExpression="Restaurant" />
                             <asp:BoundField DataField="Rating" HeaderText="Rating" ReadOnly="True" SortExpression="Rating" />
                         </Columns>
                     </asp:GridView>
                     </h1>
                </center>
                </div>   
         <div align="center">
             <center>
                <h1>&nbsp;</h1>
                </center>
                </div>  

            <center>
                <h1>Leave a review</h1>
                <p>
            <asp:DropDownList ID="DropDownList2" runat="server" Height="16px" DataSourceID="SqlDataSource4" DataTextField="RestName" DataValueField="RestId">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Restaurant]"></asp:SqlDataSource>
            <p>
            <asp:Label ID="CleanLabel" runat="server" Text="Cleanliness"></asp:Label>
                    </p>
            <p>
                <asp:TextBox ID="CleanNote" runat="server" Height="80px" Width="400px" TextMode="MultiLine"></asp:TextBox>
                <asp:DropDownList ID="CleanRating" runat="server" OnSelectedIndexChanged="DropDownList6_SelectedIndexChanged">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                </asp:DropDownList>
            </p>
            <p>
            <asp:Label ID="FoodLabel" runat="server" Text="Food"></asp:Label>
                    </p>
                <asp:TextBox ID="FoodNote" runat="server" Height="80px" Width="400px" TextMode="MultiLine"></asp:TextBox>
                <asp:DropDownList ID="FoodRating" runat="server">
                     <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                </asp:DropDownList>
                <p>
            <asp:Label ID="ServiceLabel" runat="server" Text="Service"></asp:Label>
                    </p>
                <p>
                <asp:TextBox ID="ServiceNote" runat="server" Height="80px" Width="400px" TextMode="MultiLine"></asp:TextBox>
                <asp:DropDownList ID="ServiceRating" runat="server">
                     <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                </asp:DropDownList>
                </p>
            <p>
                <asp:Label ID="ValueLabel" runat="server" Text="Value"></asp:Label>
                    </p>
                <asp:TextBox ID="ValueNote" runat="server" Height="80px" Width="400px" TextMode="MultiLine"></asp:TextBox>
                <asp:DropDownList ID="ValueRating" runat="server">
                     <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                </asp:DropDownList>
                <br />
                <p>
            <asp:TextBox ID="Submitted" runat="server" Visible="false" Text="Review Submitted" OnTextChanged="TextBox4_TextChanged"></asp:TextBox>
                <asp:Button ID="button_submitreview" runat="server" OnClick="Button1_Click" Text="Submit" />
            </p>
                </p>
                </center>
                </div>   
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</body>
</html>
