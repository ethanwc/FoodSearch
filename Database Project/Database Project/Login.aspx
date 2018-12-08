<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Food Search</title>
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

        .auto-style7 {
            width: 349px;
            text-align: right;
            height: 26px;
        }

        .auto-style8 {
            height: 26px;
        }

        .div_data {
            margin-left: 20px;
            margin-right: 20px;
            margin-bottom: 20px;
            background-color: #FFFFFF;
        }

        h1 {
            font-size: 60px;
            font-family: 'Playfair Display', serif;
        }

        .wrapper {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            grid-gap: 0px;
        }

        img {
            max-width: 300px;
        }

        .img_food {
            max-width: 400px;
            max-height: 400px;
        }

        .auto-style9 {
            width: 349px;
            text-align: right;
            height: 25px;
        }

        .auto-style10 {
            height: 25px;
        }
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://getbootstrap.com.vn/examples/equal-height-columns/equal-height-columns.css" />
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
</head>

<body>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <div>
        <div class="col-md-2 col-md-offset-5" style="background: white; border-color: white">
            <center><img src="icon.png"/></center>
        </div>
        <form id="form1" runat="server">
            <div class="col-md-4 col-md-offset-4 rounded" style="background: white; border-color: white">
                <div class="form-group">
                    <center>
                        <asp:TextBox ID="login_textfield_username" runat="server" placeholder="Username"></asp:TextBox>
                    </center>
                </div>
                <div class="form-group">
                    <center>
                        <asp:Label ID="login_label_error" runat="server" ForeColor="Red"></asp:Label>
                    </center>
                </div>
                <div class="form-group">
                    <center>
                        <asp:TextBox ID="login_textfield_password" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                    </center>
                </div>
                <div class="form-group">
                    <center>
                        <asp:Button ID="login_button_login" runat="server" OnClick="Login_button_login_Click" Text="Login" Width="180px" />
                    </center>
                </div>
                <div>
                    <center>
                        <asp:Button ID="login_button_register" runat="server" OnClick="Login_button_register_Click" Text="Register" Width="180px" />
                    </center>
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
        </form>
    </div>
</body>

</html>
