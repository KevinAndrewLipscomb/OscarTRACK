<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ Page Language="c#" Debug="true" CodeBehind="login.aspx.cs" AutoEventWireup="True" Inherits="login.TWebForm_login" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<html>
  <head runat="server">
    <!-- $Id$ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>
  <body bgcolor="white">
    <form runat="server">
    <uc1:UserControl_precontent ID="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
    <table>
      <tr>
        <td>
          <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
            <tr>
              <td>
                <table cellspacing="0" cellpadding="5" border="0">
                  <tr>
                    <td bgcolor="#f5f5f5">
                      <strong>
                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                          <tr>
                            <td><strong>Log in</strong></td>
                            <td>
                              <div align="right">
                                <asp:CustomValidator ID="CustomValidator_account_exists" runat="server" ErrorMessage="Invalid user/password combination. Please try again." Font-Bold="True" OnServerValidate="CustomValidator_account_exists_ServerValidate">!ERR!</asp:CustomValidator>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </strong>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <table cellspacing="0" cellpadding="5">
                        <tr>
                          <td><p align="right">Username:</p></td>
                          <td><small><asp:TextBox ID="TextBox_username" runat="server" MaxLength="40" TabIndex="1"></asp:TextBox></small></td>
                          <td>
                            <p>
                              <small>
                                <asp:LinkButton ID="LinkButton_new_user" runat="server" CausesValidation="False" TabIndex="5" OnClick="LinkButton_new_user_Click">New user?</asp:LinkButton><br>
                                <asp:LinkButton ID="LinkButton_forgot_username" runat="server" CausesValidation="False" TabIndex="6" OnClick="LinkButton_forgot_username_Click">Forgot username?</asp:LinkButton>
                              </small>
                            </p>
                          </td>
                          <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_username" runat="server" ErrorMessage="Please enter a username." Font-Bold="True" ControlToValidate="TextBox_username">!ERR!</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator_username" runat="server" ErrorMessage='Please use only letter, number, hyphen ("-"), and underscore ("_") characters (or local equivalents) in your username.' Font-Bold="True" ControlToValidate="TextBox_username" ValidationExpression="[\w-]+">!ERR!</asp:RegularExpressionValidator>
                          </td>
                        </tr>
                        <tr>
                          <td><p align="right">Password:</p></td>
                          <td><asp:TextBox ID="TextBox_password" runat="server" TextMode="Password" TabIndex="2"></asp:TextBox></td>
                          <td><small><asp:LinkButton ID="LinkButton_forgot_password" runat="server" CausesValidation="False" TabIndex="7" OnClick="LinkButton_forgot_password_Click">Forgot password?</asp:LinkButton></small></td>
                          <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_password" runat="server" ErrorMessage="Please enter a password." Font-Bold="True" ControlToValidate="TextBox_password">!ERR!</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator_password" runat="server" ErrorMessage='Please use only letter, number, hyphen ("-"), and underscore ("_") characters (or local equivalents) in your password.' Font-Bold="True" ControlToValidate="TextBox_password" ValidationExpression="[\w-]+">!ERR!</asp:RegularExpressionValidator>
                          </td>
                        </tr>
                        <tr>
                          <td></td>
                          <td><asp:CheckBox ID="CheckBox_keep_me_logged_in" runat="server" Text="Keep me logged in on this computer" Enabled="False" Visible="False" TabIndex="3"></asp:CheckBox></td>
                          <td></td>
                          <td></td>
                        </tr>
                        <tr>
                          <td valign="top"></td>
                          <td><asp:Button ID="Button_log_in" runat="server" Text="Log in" Font-Bold="True" TabIndex="4" OnClick="Button_log_in_Click"></asp:Button></td>
                          <td></td>
                          <td></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr><td>&nbsp;</td></tr>
      <tr>
        <td>
          <table bordercolor="gainsboro" cellspacing="0" cellpadding="0" border="1" width="100%">
            <tr>
              <td>
                <table cellspacing="0" cellpadding="5" border="0" width="100%">
                  <tr>
                    <td bgcolor="whitesmoke" width="1%"><small><strong><em>EfficiPay:</em></strong></small></td>
                    <td width="99%"><small>No login required to <asp:LinkButton ID="LinkButton_verify_efficipay_signature" runat="server" onclick="LinkButton_verify_efficipay_signature_Click" CausesValidation="False">verify a check signature</asp:LinkButton></small></td>
                   </tr>
                </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <input id="Hidden_client_timezone_offset" runat="server" type="hidden" />
    <uc1:UserControl_postcontent ID="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
    </form>
  </body>
</html>
