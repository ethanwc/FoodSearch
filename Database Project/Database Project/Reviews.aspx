<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reviews.aspx.cs" Inherits="Reviews" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

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
                <h1>Food Search</h1>
                </center>
                </div>   
        <div class="row">
            <center>
                <h1>Highest Rated Restaurants</h1>
                </center>
                </div>   
         <div class="row">
             //<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                 <Columns>
                     <asp:BoundField DataField="RestName" HeaderText="RestName" SortExpression="RestName" />
                     <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
                 </Columns>
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT r.RestName, (re.CleanlinessR + re.FoodR + re.ServiceR + re.ValueR)/4.0 as Total
FROM Restaurant r, Reviews re
WHERE r.RestId = re.RestId
ORDER BY Total DESC;"></asp:SqlDataSource>
&nbsp;<center>
                <h1>Reviews</h1>
                </center>
                </div>  
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="RestName" DataValueField="RestId">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Restaurant]"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Username,RestId" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                <Columns>
                    <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                    <asp:BoundField DataField="RestId" HeaderText="RestId" ReadOnly="True" SortExpression="RestId" />
                    <asp:BoundField DataField="CleanlinessR" HeaderText="CleanlinessR" SortExpression="CleanlinessR" />
                    <asp:BoundField DataField="CleanlinessNote" HeaderText="CleanlinessNote" SortExpression="CleanlinessNote" />
                    <asp:BoundField DataField="FoodR" HeaderText="FoodR" SortExpression="FoodR" />
                    <asp:BoundField DataField="FoodNote" HeaderText="FoodNote" SortExpression="FoodNote" />
                    <asp:BoundField DataField="ServiceR" HeaderText="ServiceR" SortExpression="ServiceR" />
                    <asp:BoundField DataField="ServiceNote" HeaderText="ServiceNote" SortExpression="ServiceNote" />
                    <asp:BoundField DataField="ValueR" HeaderText="ValueR" SortExpression="ValueR" />
                    <asp:BoundField DataField="ValueNote" HeaderText="ValueNote" SortExpression="ValueNote" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
           <center>
                <h1>Leave a review</h1>
                </center>
                </div>   
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Reviews] WHERE ([RestId] = @RestId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="RestId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="DropDownList2" runat="server" Height="16px" DataSourceID="SqlDataSource4" DataTextField="RestName" DataValueField="RestId">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Restaurant]"></asp:SqlDataSource>
            <asp:TextBox ID="TextBox4" runat="server">Test</asp:TextBox>
            <asp:TextBox ID="TextBox5" runat="server" OnTextChanged="TextBox5_TextChanged"></asp:TextBox>
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <p>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:DropDownList ID="DropDownList6" runat="server" OnSelectedIndexChanged="DropDownList6_SelectedIndexChanged">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:DropDownList ID="DropDownList7" runat="server">
                     <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <asp:DropDownList ID="DropDownList8" runat="server">
                     <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                <asp:DropDownList ID="DropDownList9" runat="server">
                     <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
            </p>
            <asp:TextBox ID="Submitted" runat="server" Visible="false" Text="Review Submitted" OnTextChanged="TextBox4_TextChanged"></asp:TextBox>
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</body>
</html>
