<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ Page language="c#" Debug="true" Codebehind="new_user_registration.pas" AutoEventWireup="false" Inherits="new_user_registration.TWebForm_new_user_registration" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %>
<html>
  <head>
	<title id="Title" runat="server"></title>
      <!-- $Id$ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>

  <body bgcolor="white">
     <form runat="server">
      <asp:ScriptManager id="ScriptManager_control" runat="server"></asp:ScriptManager>
     <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent><p>
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
            <tr>
              <td>
                <table cellspacing="0" cellpadding="10" border="0">
                    <tr>
                      <td bgcolor="#f5f5f5"><strong>New user registration</strong></td>
                    </tr>
                    <tr>
                      <td>
                        <p>The following basic information is required from&nbsp;<ASP:Label id="Label_application_name" runat="server"></ASP:Label> users:</p>
                        <p>
                          <table cellspacing="0" cellpadding="10" border="0">
                              <tr>
                                <td>
                                  <p align="right">Enter your preferred <strong>username</strong>:
                                  </p></td>
                                <td><ASP:TextBox id="TextBox_username" runat="server" maxlength="40"></ASP:TextBox></td>
                                <td><ASP:RequiredFieldValidator id="RequiredFieldValidator_username" runat="server" errormessage="Please enter a username." font-bold="True" controltovalidate="TextBox_username">!ERR!</ASP:RequiredFieldValidator><ASP:RegularExpressionValidator id="RegularExpressionValidator_username" runat="server" errormessage="Please use only letter, number, hyphen ('-'), and underscore ('_') characters (or local equivalents) in your username." controltovalidate="TextBox_username" validationexpression="[\w-]+" font-bold="True">!ERR!</ASP:RegularExpressionValidator><ASP:CustomValidator id="CustomValidator_username" runat="server" errormessage="That username is already taken in this system.  Please choose another." font-bold="True" controltovalidate="TextBox_username">!ERR!</ASP:CustomValidator></td>
                              </tr>
                              <tr>
                                <td>
                                  <p align="right">Enter your preferred <strong>password</strong>:
                                  </p></td>
                                <td><ASP:TextBox id="TextBox_nominal_password" runat="server" maxlength="40" textmode="Password"></ASP:TextBox></td>
                                <td><ASP:RequiredFieldValidator id="RequiredFieldValidator_nominal_password" runat="server" errormessage="Please enter a nominal password." font-bold="True" controltovalidate="TextBox_nominal_password">!ERR!</ASP:RequiredFieldValidator><ASP:RegularExpressionValidator id="RegularExpressionValidator_nominal_password" runat="server" errormessage="Please use only letter, number, hyphen ('-'), and underscore ('_') characters (or local equivalents) in your password." font-bold="True" controltovalidate="TextBox_nominal_password" validationexpression="[\w-]+">!ERR!</ASP:RegularExpressionValidator></td>
                              </tr>
                              <tr>
                                <td>
                                  <p align="right">Re-enter your preferred <strong>password</strong>:
                                  </p></td>
                                <td><ASP:TextBox id="TextBox_confirmation_password" runat="server" maxlength="40" textmode="Password"></ASP:TextBox></td>
                                <td><ASP:RequiredFieldValidator id="RequiredFieldValidator_confirmation_password" runat="server" errormessage="Please enter a confirmation password." font-bold="True" controltovalidate="TextBox_confirmation_password">!ERR!</ASP:RequiredFieldValidator><ASP:CompareValidator id="CompareValidator_confirmation_password" runat="server" errormessage="Nominal and confirmation password must match.  Please try again." font-bold="True" controltovalidate="TextBox_confirmation_password" controltocompare="TextBox_nominal_password" enableclientscript="False">!ERR!</ASP:CompareValidator></td>
                              </tr>
                              <tr>
                                <td>
                                  <p align="right">Enter your <strong>email address</strong>:
                                  </p></td>
                                <td><ASP:TextBox id="TextBox_email_address" runat="server" maxlength="63" columns="40"></ASP:TextBox></td>
                                <td><ASP:RequiredFieldValidator id="RequiredFieldValidator_email_address" runat="server" errormessage="Please enter an email address." font-bold="True" controltovalidate="TextBox_email_address">!ERR!</ASP:RequiredFieldValidator><ASP:RegularExpressionValidator id="RegularExpressionValidator_email_address" runat="server" errormessage="Please enter a valid email address." font-bold="True" controltovalidate="TextBox_email_address" validationexpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">!ERR!</ASP:RegularExpressionValidator><ASP:CustomValidator id="CustomValidator_email_address_domain" runat="server" errormessage="Please enter an email address with a valid domain name (the part after the @ sign)." font-bold="True" controltovalidate="TextBox_email_address" width="35px">!ERR!</ASP:CustomValidator><ASP:CustomValidator id="CustomValidator_email_address_novelty" runat="server" errormessage="A user with that email address already exists in the system.  Click the Cancel button to return to the login page, then click one of the 'forgot' links." font-bold="True" controltovalidate="TextBox_email_address">!ERR!</ASP:CustomValidator></td>
                              </tr>
                              <tr>
                                <td></td>
                                <td><ASP:Button id="Button_submit" runat="server" text="Submit"></ASP:Button>&nbsp; <ASP:Button id="Button_cancel" runat="server" text="Cancel" causesvalidation="False"></ASP:Button></td>
                                <td></td>
                              </tr>
                          </table>
                        </p></td>
                    </tr>
                </table></td>
            </tr>
        </table></p><uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent><p><sstchur:SmartScroller runat="server" /></p></form>
  </body>
</html>
