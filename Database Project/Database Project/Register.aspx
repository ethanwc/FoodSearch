<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    <p>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" OnPageIndexChanging="FormView1_PageIndexChanging">
            <ItemTemplate>
                <input id="username" type="text" />
        <input id="email" type="text" />
                <input id="password" type="password" />
                <br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Button" />
            </ItemTemplate>
        </asp:FormView>
        </p>
        <p>
            &nbsp;</p>
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</body>
</html>
