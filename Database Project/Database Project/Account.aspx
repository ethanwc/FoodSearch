<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Food Search</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="http://getbootstrap.com.vn/examples/equal-height-columns/equal-height-columns.css" />
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display" rel="stylesheet"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
        <div class="row">
            <center>
                <h1>
                <asp:Label ID="lbl_welcome" runat="server"></asp:Label>
                </h1>
                <br />
                <strong><span class="auto-style1">Preferences</span></strong><br />
                <asp:ListView ID="list_prefs" runat="server" DataSourceID="Preferences">
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td></td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Label ID="FoodLabel0" runat="server" Text='<%# Eval("CuisineName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# "$" + Eval("MaxPrice") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style=""></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:Button ID="btn_addPref" runat="server" Text="Add Preference" OnClick="btn_addPref_Click" />
                <br />
                    <asp:TextBox ID="txt_cuisine" runat="server" placeholder="Food" Enabled="False" Visible="False"></asp:TextBox>
                <br />
                <asp:Label ID="lbl_cuisine" runat="server" ForeColor="Red"></asp:Label>
                <br />
                    <asp:TextBox ID="txt_maxprice" runat="server" placeholder="Max Price" Enabled="False" Visible="False"></asp:TextBox>
                <br />
                <asp:Label ID="lbl_maxprice" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <asp:Button ID="btn_submitPref" runat="server" Enabled="False" OnClick="btn_submitPref_Click" Text="Submit" Visible="False" />
                <br />
                <br />
                <strong><span class="auto-style1">Allergies</span></strong><asp:ListView ID="ListView2" runat="server" DataSourceID="Allergies">
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td></td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Label ID="AllergenLabel" runat="server" Text='<%# Eval("AllergenName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="SeverityLabel" runat="server" Text='<%# Eval("Severity") %>' />
                            </td>
                            <td>
                                <asp:Label ID="SensitivityLabel" runat="server" Text='<%# Eval("Sensitivity") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                        <tr runat="server" style="">
                                            <th runat="server">Allergen</th>
                                            <th runat="server">Severity</th>
                                            <th runat="server">Sensitivity</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style=""></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:Button ID="btn_addAllergy" runat="server" Text="Add Allergy" OnClick="btn_addAllergy_Click" />
                <br />
                    <asp:TextBox ID="txt_allergy" runat="server" placeholder="Allergy" Enabled="False" Visible="False"></asp:TextBox>
                <br />
                <asp:Label ID="lbl_allergy" runat="server" ForeColor="Red"></asp:Label>
                <br />
                    <asp:RadioButtonList ID="rb_severity" runat="server" RepeatDirection="Horizontal" Enabled="False" Visible="False">
                        <asp:ListItem ID="Sev1" runat="server" Text="1"></asp:ListItem>
                        <asp:ListItem ID="Sev2" runat="server" Text="2"></asp:ListItem>
                        <asp:ListItem ID="Sev3" runat="server" Text="3"></asp:ListItem>
                        <asp:ListItem ID="Sev4" runat="server" Text="4"></asp:ListItem>
                        <asp:ListItem ID="Sev5" runat="server" Text="5 (Death)"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:RadioButtonList ID="rb_sensitivity" runat="server" RepeatDirection="Horizontal" Enabled="False" Visible="False">
                    <asp:ListItem ID="Sen1" runat="server" Text="1"></asp:ListItem>
                    <asp:ListItem ID="Sen2" runat="server" Text="2"></asp:ListItem>
                    <asp:ListItem ID="Sen3" runat="server" Text="3"></asp:ListItem>
                    <asp:ListItem ID="Sen4" runat="server" Text="4"></asp:ListItem>
                    <asp:ListItem ID="Sen5" runat="server" Text="5 (Extreme)"></asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <asp:Button ID="btn_submitAllergy" runat="server" Enabled="False" OnClick="btn_submitAllergy_Click" Text="Submit" Visible="False" />
                <br />
                <br />
                <strong><span class="auto-style1">Parties</span></strong><asp:ListView ID="list_allergies" runat="server" DataSourceID="Party">
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td></td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Label ID="PartyLabel" runat="server" Text='<%# Eval("Party") + " ("+ Eval("Members") + " members)"%>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                        <tr runat="server" style="">
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style=""></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:Button ID="btn_createParty" runat="server" OnClick="btn_createParty_Click" Text="Create New Party" />
                <br />
                <asp:TextBox ID="txt_partyName" runat="server" placeholder="Party Name" Enabled="False" Visible="False"></asp:TextBox>
                <br />
                <asp:Label ID="lbl_partyname" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <asp:Button ID="btn_partySubmit" runat="server" Enabled="False" Text="Submit" Visible="False" OnClick="btn_partySubmit_Click" />
                <br />
                <asp:Button ID="btn_join" runat="server" Text="Join Party" OnClick="btn_join_Click" />
                <br />
                <asp:TextBox ID="txt_search_party" runat="server" placeholder="Party name" Width="137px" Enabled="False" Visible="False"> </asp:TextBox>
                <br />
                <asp:Label ID="lbl_search_party" runat="server" ForeColor="Red" Enabled="False" Visible="False"></asp:Label>
                <br />
                <asp:TextBox ID="txt_search_user" runat="server" placeholder="And/or Member name" Enabled="False" Visible="False"> </asp:TextBox>
                <br />
                <asp:Label ID="lbl_search_user" runat="server" ForeColor="Red" Enabled="False" Visible="False"></asp:Label>
                <br />
                <asp:Button ID="btn_searchpartysubmit" runat="server" Enabled="False" OnClick="btn_searchpartysubmit_Click" Text="Submit" Visible="False" />
                <br />
                <asp:ListView ID="list_PartySearch" runat="server" DataSourceID="PartySearch" Visible="False">
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>No Parties Found</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="PartyLabel" runat="server"  ToolTip="Click to join party" Text='<%# Eval("Partyname") %>' OnClick="btn_partySearch_Click" CommandName='<%# Eval("Partyname") %>' CommandArgument='<%# Eval("PartyId") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style=""></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="PartySearch" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT(partyid), partyname
FROM party
WHERE (partyname LIKE '%'+@party+'%' OR username LIKE '%'+@user+'%')  AND partyid NOT IN (SELECT PartyId 
		FROM Party
		WHERE username = '%'+@current+'%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lbl_search_party" Name="party" PropertyName="Text" />
                        <asp:ControlParameter ControlID="lbl_search_user" Name="user" PropertyName="Text" />
                        <asp:ControlParameter ControlID="lbl_username" Name="current" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="Party" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT partyName as Party, Members
FROM (  SELECT PartyId, count(*) as Members
		FROM Party
		GROUP BY PartyId) as ps, Party p
WHERE p.PartyId = ps.PartyId AND username = @username">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lbl_username" Name="username" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="Allergies" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT allergenname, Severity, Sensitivity
FROM Allergies
WHERE username = @username
ORDER BY severity">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lbl_username" Name="username" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="Preferences" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT CuisineName, MaxPrice
FROM Preferences
WHERE username = @username">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lbl_username" Name="username" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Label ID="lbl_username" runat="server"></asp:Label>
                <br />
            </center>
        </div>
    </form>
    </body>
</html>
