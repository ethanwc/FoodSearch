<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

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
        <p>


            <div class="row">

                <center>
                <h1>Food Search</h1>
            </center>





                <div class="col-xs-4 col-xs-offset-4" style="background: white; border-color: white">



                    <div style="white-space: nowrap;">


                        <asp:TextBox class="form-control" placeholder="Search" ID="search_text" runat="server"></asp:TextBox>



                    </div>

                </div>
            </div>





            <asp:Button class="invisible" ID="search_button" runat="server" OnClick="Button1_Click" Text="Search" />
        </p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [MenuItem] WHERE ([ItemName] LIKE '%' + @ItemName + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="search_text" Name="ItemName" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
 
        <div class="col-xs-12" style="background: white; border-color: white" align="center">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="MenuItemId" DataSourceID="SqlDataSource1" GroupItemCount="3">
                <AlternatingItemTemplate>
                    <td runat="server" style="background-color:#FFF8DC;">MenuItemId:
                        <asp:Label ID="MenuItemIdLabel" runat="server" Text='<%# Eval("MenuItemId") %>' />
                        <br />MenuId:
                        <asp:Label ID="MenuIdLabel" runat="server" Text='<%# Eval("MenuId") %>' />
                        <br />ItemName:
                        <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") %>' />
                        <br />ItemDescription:
                        <asp:Label ID="ItemDescriptionLabel" runat="server" Text='<%# Eval("ItemDescription") %>' />
                        <br />Calories:
                        <asp:Label ID="CaloriesLabel" runat="server" Text='<%# Eval("Calories") %>' />
                        <br />Price:
                        <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                        <br /></td>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">MenuItemId:
                        <asp:Label ID="MenuItemIdLabel1" runat="server" Text='<%# Eval("MenuItemId") %>' />
                        <br />MenuId:
                        <asp:TextBox ID="MenuIdTextBox" runat="server" Text='<%# Bind("MenuId") %>' />
                        <br />ItemName:
                        <asp:TextBox ID="ItemNameTextBox" runat="server" Text='<%# Bind("ItemName") %>' />
                        <br />ItemDescription:
                        <asp:TextBox ID="ItemDescriptionTextBox" runat="server" Text='<%# Bind("ItemDescription") %>' />
                        <br />Calories:
                        <asp:TextBox ID="CaloriesTextBox" runat="server" Text='<%# Bind("Calories") %>' />
                        <br />Price:
                        <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        <br /></td>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
            <td runat="server" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="">MenuItemId:
                        <asp:TextBox ID="MenuItemIdTextBox" runat="server" Text='<%# Bind("MenuItemId") %>' />
                        <br />MenuId:
                        <asp:TextBox ID="MenuIdTextBox" runat="server" Text='<%# Bind("MenuId") %>' />
                        <br />ItemName:
                        <asp:TextBox ID="ItemNameTextBox" runat="server" Text='<%# Bind("ItemName") %>' />
                        <br />ItemDescription:
                        <asp:TextBox ID="ItemDescriptionTextBox" runat="server" Text='<%# Bind("ItemDescription") %>' />
                        <br />Calories:
                        <asp:TextBox ID="CaloriesTextBox" runat="server" Text='<%# Bind("Calories") %>' />
                        <br />Price:
                        <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        <br /></td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <td runat="server" style="background-color:#DCDCDC;color: #000000;">MenuItemId:
                        <asp:Label ID="MenuItemIdLabel" runat="server" Text='<%# Eval("MenuItemId") %>' />
                        <br />MenuId:
                        <asp:Label ID="MenuIdLabel" runat="server" Text='<%# Eval("MenuId") %>' />
                        <br />ItemName:
                        <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") %>' />
                        <br />ItemDescription:
                        <asp:Label ID="ItemDescriptionLabel" runat="server" Text='<%# Eval("ItemDescription") %>' />
                        <br />Calories:
                        <asp:Label ID="CaloriesLabel" runat="server" Text='<%# Eval("Calories") %>' />
                        <br />Price:
                        <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                        <br /></td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">MenuItemId:
                        <asp:Label ID="MenuItemIdLabel" runat="server" Text='<%# Eval("MenuItemId") %>' />
                        <br />MenuId:
                        <asp:Label ID="MenuIdLabel" runat="server" Text='<%# Eval("MenuId") %>' />
                        <br />ItemName:
                        <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") %>' />
                        <br />ItemDescription:
                        <asp:Label ID="ItemDescriptionLabel" runat="server" Text='<%# Eval("ItemDescription") %>' />
                        <br />Calories:
                        <asp:Label ID="CaloriesLabel" runat="server" Text='<%# Eval("Calories") %>' />
                        <br />Price:
                        <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                        <br /></td>
                </SelectedItemTemplate>
            </asp:ListView>
        </div>
    </form>
    </body>
</html>
