﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

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
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <ul class="nav navbar-nav">
                    <li><a href="Login.aspx">Login</a></li>
                    <li><a href="Search.aspx">Search</a></li>
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
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">


        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous">


        </script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous">


        </script>
        <div class="col-md-2 col-md-offset-5" style="background: white; border-color: white">
            <center><img src="icon.png"></center>
        </div>

    </head>

    <body>
        <form id="form1" runat="server">
            <div class="col-md-4 col-md-offset-4 rounded" style="background: white; border-color: white">

                <form>
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
                </form>

            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
        </form>
    </body>

    </html>
