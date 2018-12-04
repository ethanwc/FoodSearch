<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="auto-style1">
                <asp:Label ID="default_label" runat="server"></asp:Label>
                <br/>
                <asp:Button ID="default_logout" runat="server" OnClick="default_logout_Click" Text="Logout" />
            </h1>
            </div>
    </form>
</body>
</html>
