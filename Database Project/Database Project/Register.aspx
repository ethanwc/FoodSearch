<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 331px;
            text-align: right;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            width: 331px;
            text-align: right;
            height: 30px;
        }
        .auto-style5 {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="auto-style3">
                <h1><strong>Register</strong></h1>
            </div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">Username</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="register_username" runat="server" OnTextChanged="TextBox1_TextChanged" Width="180px"></asp:TextBox>
                        <asp:Label ID="register_label_username" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td class="auto-style5"></td>
                </tr>
                <tr>
                    <td class="auto-style2">Password</td>
                    <td>
                        <asp:TextBox ID="register_password" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                        <asp:Label ID="register_label_password" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Display name</td>
                    <td>
                        <asp:TextBox ID="register_display" runat="server" Width="180px"></asp:TextBox>
                        <asp:Label ID="register_label_display" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="register_submit" runat="server" OnClick="register_submit_Click" Text="Register" Width="180px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="register_button_cancel" runat="server" OnClick="register_button_cancel_Click" Text="Cancel" Width="180px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
