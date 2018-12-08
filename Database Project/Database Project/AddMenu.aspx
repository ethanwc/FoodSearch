﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddMenu.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Food Search</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            height: 23px;
            width: 350px;
        }
        .auto-style4 {
            width: 350px;
        }
        .auto-style5 {
            height: 23px;
            width: 227px;
        }
        .auto-style6 {
            width: 227px;
        }
        .auto-style7 {
            width: 350px;
            height: 26px;
        }
        .auto-style8 {
            width: 227px;
            height: 26px;
        }
        .auto-style9 {
            height: 26px;
        }
    </style>
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
    <form id="form1" runat="server">
        <div style="height: 406px">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">Menu name</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txt_name" runat="server" Width="180px"></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="lbl_name" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Start Time</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txt_startTime" runat="server" Width="180px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lbl_startTime" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">End Time</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txt_endTime" runat="server" Width="180px"></asp:TextBox>
                    </td>
                    <td class="auto-style9">
                        <asp:Label ID="lbl_endTime" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:Button ID="btn_addMenu" runat="server" OnClick="AddRest_button_addRest_Click" Text="Add Menu" Width="180px" />
                    </td>
                    <td class="auto-style9">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:Button ID="AddRest_button_cancel" runat="server" Text="Cancel" Width="180px" OnClick="AddRest_button_cancel_Click"/>
                    </td>
                    <td class="auto-style9">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
