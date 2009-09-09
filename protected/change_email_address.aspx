<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ Page language="c#" Debug="true" Codebehind="change_email_address.aspx.cs" AutoEventWireup="True" Inherits="change_email_address.TWebForm_change_email_address" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<html>
  <head runat="server">
    <title id="Title"></title>
    <!-- $Id$ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
        <table cellspacing="0" cellpadding="0" width="%" border="1" bordercolor="#dcdcdc">
          <tr>
            <td>
              <table cellspacing="0" cellpadding="10" width="%" border="0">
                <tr><td bgcolor="#f5f5f5" colspan="3"><strong>Change email address</strong></td></tr>
                <tr>
                  <td><p align="right">Enter the email_address you would prefer to use for this system:</p></td>
                  <td><ASP:TextBox id="TextBox_nominal_email_address" runat="server"></ASP:TextBox></td>
                  <td>
                    <ASP:RequiredFieldValidator id="RequiredFieldValidator_nominal_email_address" runat="server" font-bold="True" errormessage="Please enter a nominal email address." controltovalidate="TextBox_nominal_email_address">!ERR!</ASP:RequiredFieldValidator><ASP:RegularExpressionValidator id="RegularExpressionValidator_nominal_email_address" runat="server" errormessage="Please enter a valid email address." font-bold="True" controltovalidate="TextBox_nominal_email_address" validationexpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">!ERR!</ASP:RegularExpressionValidator>
                    <ASP:CustomValidator id="CustomValidator_nominal_email_address" runat="server" errormessage="Please enter a valid domain name (the part after the @ sign)." controltovalidate="TextBox_nominal_email_address" font-bold="True" onservervalidate="CustomValidator_nominal_email_address_ServerValidate">!ERR!</ASP:CustomValidator>
                  </td>
                </tr>
                <tr>
                  <td><p align="right">Re-enter your prefered email_address to avoid typographical errors:</p></td>
                  <td><ASP:TextBox id="TextBox_confirmation_email_address" runat="server"></ASP:TextBox></td>
                  <td>
                    <ASP:RequiredFieldValidator id="RequiredFieldValidator_confirmation_email_address" runat="server" font-bold="True" errormessage="Please enter a confirmation email address." controltovalidate="TextBox_confirmation_email_address">!ERR!</ASP:RequiredFieldValidator>
                    <ASP:CustomValidator id="CustomValidator_confirmation_email_address" runat="server" errormessage="Nominal and confirmation email addresss must match.  Please try again." font-bold="True" onservervalidate="CustomValidator_confirmation_email_address_ServerValidate">!ERR!</ASP:CustomValidator>
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
      <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
    </form>
  </body>
</html>
