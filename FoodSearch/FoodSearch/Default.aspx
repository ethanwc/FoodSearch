<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="FoodSearchDB" DataTextField="DisplayName" DataValueField="UserId">
            </asp:DropDownList>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PartyId,UserId" DataSourceID="FoodSearchDB">
                <Columns>
                    <asp:BoundField DataField="PartyId" HeaderText="PartyId" ReadOnly="True" SortExpression="PartyId" />
                    <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" SortExpression="UserId" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="FoodSearchDB" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Party]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
