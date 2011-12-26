<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ Page language="c#" Debug="true" Codebehind="change_password.aspx.cs" AutoEventWireup="True" Inherits="change_password.TWebForm_change_password" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<html>
  <head runat="server">
    <!-- $Id$ -->
    <title></title>
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
    <script type="text/javascript" src="../js/sha1.js"></script>
  </head>
  <body bgcolor="white">
    <form id="Form_control" runat="server">
      <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
      <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" border="0">
              <tr><td bgcolor="#f5f5f5"><strong>Change password</strong></td></tr>
              <tr><td>If you logged in using a temporary password, you must change your password before proceeding.<br /></td></tr>
              <tr>
                <td>
                  <table cellspacing="0" cellpadding="5" width="%" border="0">
                    <tr>
                      <td><p align="right">Enter the password you would prefer to use for this system:</p></td>
                      <td><ASP:TextBox id="TextBox_nominal_password" runat="server" textmode="Password"></ASP:TextBox></td>
                      <td>
                        <ASP:RequiredFieldValidator id="RequiredFieldValidator_nominal_password" runat="server" font-bold="True" errormessage="Please enter a nominal password." controltovalidate="TextBox_nominal_password">!ERR!</ASP:RequiredFieldValidator>
                      </td>
                    </tr>
                    <tr>
                      <td><p align="right">Re-enter your prefered password to avoid typographical errors:</p></td>
                      <td><ASP:TextBox id="TextBox_confirmation_password" runat="server" textmode="Password"></ASP:TextBox></td>
                      <td>
                        <ASP:RequiredFieldValidator id="RequiredFieldValidator_confirmation_password" runat="server" font-bold="True" errormessage="Please enter a confirmation password." controltovalidate="TextBox_confirmation_password">!ERR!</ASP:RequiredFieldValidator>
                        <ASP:CustomValidator id="CustomValidator_confirmation_password" runat="server" errormessage="Nominal and confirmation passwords must match.  Please try again." font-bold="True" onservervalidate="CustomValidator_confirmation_password_ServerValidate">!ERR!</ASP:CustomValidator>
                      </td>
                    </tr>
                    <tr>
                      <td></td>
                      <td>
                        <ASP:Button id="Button_submit" runat="server" text="Submit" onclick="Button_submit_Click"></ASP:Button>&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button id="Button_cancel" runat="server" text="Cancel" causesvalidation="False" onclick="Button_cancel_Click"></asp:Button>
                      </td>
                      <td></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
    </form>
  </body>
</html>
