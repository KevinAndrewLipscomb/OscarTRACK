<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ Page language="c#" Debug="true" Codebehind="change_password.pas" AutoEventWireup="false" Inherits="change_password.TWebForm_change_password" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %>
<html>
  <head runat="server">
    <title id="Title"></title>
    <!-- $Id$ -->
  </head>
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
      <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" border="0">
              <tr><td bgcolor="#f5f5f5"><strong>Change password</strong></td></tr>
              <tr><td>If you logged in using a temporary password, you must change your password before proceeding.<br></td></tr>
              <tr>
                <td>
                  <table cellspacing="0" cellpadding="5" width="%" border="0">
                    <tr>
                      <td><p align="right">Enter the password you would prefer to use for this system:</p></td>
                      <td><ASP:TextBox id="TextBox_nominal_password" runat="server" textmode="Password"></ASP:TextBox></td>
                      <td>
                        <ASP:RequiredFieldValidator id="RequiredFieldValidator_nominal_password" runat="server" font-bold="True" errormessage="Please enter a nominal password." controltovalidate="TextBox_nominal_password">!ERR!</ASP:RequiredFieldValidator><ASP:RegularExpressionValidator id="RegularExpressionValidator_password" runat="server" errormessage='Please use only letters, numbers, and the underscore ("_") character (or local equivalents) in your password.' font-bold="True" controltovalidate="TextBox_nominal_password" validationexpression="\w+">!ERR!</ASP:RegularExpressionValidator>
                      </td>
                    </tr>
                    <tr>
                      <td><p align="right">Re-enter your prefered password to avoid typographical errors:</p></td>
                      <td><ASP:TextBox id="TextBox_confirmation_password" runat="server" textmode="Password"></ASP:TextBox></td>
                      <td>
                        <ASP:RequiredFieldValidator id="RequiredFieldValidator_confirmation_password" runat="server" font-bold="True" errormessage="Please enter a confirmation password." controltovalidate="TextBox_confirmation_password">!ERR!</ASP:RequiredFieldValidator>
                        <ASP:CompareValidator id="CompareValidator1" runat="server" font-bold="True" errormessage="Nominal and confirmation passwords must match.  Please try again." controltovalidate="TextBox_confirmation_password" controltocompare="TextBox_nominal_password">!ERR!</ASP:CompareValidator>
                      </td>
                    </tr>
                    <tr>
                      <td></td>
                      <td>
                        <ASP:Button id="Button_submit" runat="server" text="Submit"></ASP:Button>&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button id="Button_cancel" runat="server" text="Cancel" causesvalidation="False"></asp:Button>
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
      <p><sstchur:SmartScroller runat="server" id="SmartScroller_control" /></p>
    </form>
  </body>
</html>
