<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 349px;
            text-align: right;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            font-weight: normal;
        }
        .auto-style5 {
            width: 349px;
            text-align: right;
            height: 23px;
        }
        .auto-style6 {
            height: 23px;
        }
        .auto-style7 {
            width: 349px;
            text-align: right;
            height: 26px;
        }
        .auto-style8 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="auto-style3">
                <h1 class="auto-style4"><strong>Login</strong></h1>
            </div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Username</td>
                    <td>
                        <asp:TextBox ID="login_textfield_username" runat="server" Width="180px"></asp:TextBox>
                        <asp:Label ID="login_label_error" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">Password</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="login_textfield_password" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="login_button_login" runat="server" OnClick="Login_button_login_Click" Text="Login" Width="180px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="login_button_register" runat="server" OnClick="Login_button_register_Click" Text="Register" Width="180px" />
                    </td>
                </tr>
                </table>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LoginString %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
    </form>
</body>
</html>
