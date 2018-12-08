<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="Reviews.aspx.cs" Inherits="Reviews" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Food Search</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://getbootstrap.com.vn/examples/equal-height-columns/equal-height-columns.css" />
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
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
        <div class="col-md-2 col-md-offset-5" style="background: white; border-color: white">
            <center>
                <img src="icon.png"/>
            </center>
        </div>
    </div>
    <form id="form1" runat="server">
        <div class="row">
            <center>
                <h1>Reviews</h1>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="source_selectreviews" DataTextField="RestName" DataValueField="RestId"></asp:DropDownList>
                <asp:SqlDataSource ID="source_selectreviews" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Restaurant]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="source_viewreviews" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                   SelectCommand="SELECT Username as 'Username', CleanlinessR as 'Cleanliness Quality', CleanlinessNote as 'Cleanliness Note', FoodR as 'Food Quality', 
                                                  FoodNote as 'Food Note',ServiceR as 'Service Quality', ServiceNote as 'Service Note', ValueR as 'Value Quality', ValueNote as 'Value Note' 
                                                  FROM [Reviews] 
                                                  WHERE ([RestId] = @RestId);">
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
                    <h1>Highest Rated Restaurants</h1>
                    <p>
                        <center>
                            <asp:SqlDataSource ID="source_highestreview" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                SelectCommand="SELECT TOP 5 r.RestName as 'Restaurant', CAST(((AVG(re.CleanlinessR) + AVG(re.FoodR) + AVG(re.ServiceR) + AVG(re.ValueR))/4.0) AS DECIMAL(3,2)) as 'Rating' 
                                                    FROM Restaurant r, Reviews re 
                                                    WHERE r.RestId = re.RestId 
	                                                GROUP BY RestName
                                                    ORDER BY Rating DESC;">
                            </asp:SqlDataSource>
                        </center>
                    </p>
                    <h1>
                        <asp:GridView ID="view_highestrated" runat="server" AutoGenerateColumns="False" DataSourceID="source_highestreview">
                            <Columns>
                                <asp:BoundField DataField="Restaurant" HeaderText="Restaurant" SortExpression="Restaurant" />
                                <asp:BoundField DataField="Rating" HeaderText="Rating" ReadOnly="True" SortExpression="Rating" />
                            </Columns>
                        </asp:GridView>
                    </h1>
                </center>
        </div>
        <div>
            <center>
                    <h1>&nbsp;</h1>
                </center>
        </div>
        <center>
                <h1>Leave a review</h1>
                    <asp:Label ID="label_restaurant_to_review" runat="server" Text="Pick a Restaurant:"></asp:Label>
                    <asp:DropDownList ID="DropDownList2" runat="server" Height="16px" DataSourceID="SqlDataSource4" DataTextField="RestName" DataValueField="RestId"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Restaurant]"></asp:SqlDataSource>
                <p>
                    <asp:Label ID="CleanLabel" runat="server" Text="Cleanliness"></asp:Label>
                </p>
                <asp:RadioButtonList ID="CleanRating" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem id="Clean1" runat="server" Text="1"></asp:ListItem>
                    <asp:ListItem id="Clean2" runat="server" Text="2"></asp:ListItem>
                    <asp:ListItem id="Clean3" runat="server" Text="3"></asp:ListItem>
                    <asp:ListItem id="Clean4" runat="server" Text="4"></asp:ListItem>
                    <asp:ListItem id="Clean5" runat="server" Text="5"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:TextBox ID="CleanNote" runat="server" Height="100px" Width="400px" TextMode="MultiLine"></asp:TextBox>
                <p>
                    <asp:Label ID="FoodLabel" runat="server" Text="Food"></asp:Label>
                </p>
                <asp:RadioButtonList ID="FoodRating" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem id="Food1" runat="server" Text="1"></asp:ListItem>
                    <asp:ListItem id="Food2" runat="server" Text="2"></asp:ListItem>
                    <asp:ListItem id="Food3" runat="server" Text="3"></asp:ListItem>
                    <asp:ListItem id="Food4" runat="server" Text="4"></asp:ListItem>
                    <asp:ListItem id="Food5" runat="server" Text="5"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:TextBox ID="FoodNote" runat="server" Height="100px" Width="400px" TextMode="MultiLine"></asp:TextBox>
                <p>
                    <asp:Label ID="ServiceLabel" runat="server" Text="Service"></asp:Label>
                </p>
                <p>
                    <asp:RadioButtonList ID="ServiceRating" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem id="Serve1" runat="server" Text="1"></asp:ListItem>
                        <asp:ListItem id="Serve2" runat="server" Text="2"></asp:ListItem>
                        <asp:ListItem id="Serve3" runat="server" Text="3"></asp:ListItem>
                        <asp:ListItem id="Serve4" runat="server" Text="4"></asp:ListItem>
                        <asp:ListItem id="Serve5" runat="server" Text="5"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:TextBox ID="ServiceNote" runat="server" Height="100px" Width="400px" TextMode="MultiLine"></asp:TextBox>
                </p>
                <p>
                    <asp:Label ID="ValueLabel" runat="server" Text="Value"></asp:Label>
                </p>
                    <asp:RadioButtonList ID="ValueRating" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem id="Value1" runat="server" Text="1"></asp:ListItem>
                        <asp:ListItem id="Value2" runat="server" Text="2"></asp:ListItem>
                        <asp:ListItem id="Value3" runat="server" Text="3"></asp:ListItem>
                        <asp:ListItem id="Value4" runat="server" Text="4"></asp:ListItem>
                        <asp:ListItem id="Value5" runat="server" Text="5"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:TextBox ID="ValueNote" runat="server" Height="100px" Width="400px" TextMode="MultiLine"></asp:TextBox>
                <br />
                <p>
            <asp:TextBox ID="Submitted" runat="server" Visible="false" Text="Review Submitted" ></asp:TextBox>
                <asp:Button ID="button_submitreview" runat="server" OnClick="SubmitButton_Click" Text="Submit" />
            </p>
        </center>
    </form>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
</body>
</html>
