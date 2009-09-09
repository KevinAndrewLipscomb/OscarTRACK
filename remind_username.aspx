<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ Page language="c#" Debug="true" Codebehind="remind_username.aspx.cs" AutoEventWireup="True" Inherits="remind_username.TWebForm_remind_username" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<html>
  <head>
	<title id="Title" runat="server"></title>
      <!-- $Id$ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>

  <body bgcolor="white">
     <form runat="server">

     <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent><p>
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
            <tr>
              <td>
                <table cellspacing="0" cellpadding="10" border="0">
                    <tr>
                      <td bgcolor="#f5f5f5"><strong>Forgotten username</strong></td>
                    </tr>
                    <tr>
                      <td>
                        <table cellspacing="0" cellpadding="10" border="0">
                            <tr><td valign="top">•</td>
                              <td>
								<p>If your email address has stayed the same, <ASP:Label id="Label_application_name_1" runat="server"></ASP:Label>&nbsp;can send you a reminder.&nbsp; What email address had you registered with <ASP:Label id="Label_application_name_2" runat="server"></ASP:Label>?</p><p><asp:textbox id="TextBox_noop_ie_behavior_workaround" runat="server" style="DISPLAY: none; VISIBILITY: hidden" width="2px" /><!-- To work around an IE bug that otherwise prevents Enter in a textbox from submitting a form. --><ASP:TextBox id="TextBox_email_address" runat="server" columns="40"></ASP:TextBox><ASP:RequiredFieldValidator id="RequiredFieldValidator_email_address" runat="server" errormessage="Please enter an email address." font-bold="True" controltovalidate="TextBox_email_address">!ERR!</ASP:RequiredFieldValidator><ASP:RegularExpressionValidator id="RegularExpressionValidator_email_address" runat="server" errormessage="Please enter a valid email address." font-bold="True" controltovalidate="TextBox_email_address" validationexpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">!ERR!</ASP:RegularExpressionValidator></p><p><ASP:Button id="Button_submit" runat="server" text="Submit" onclick="Button_submit_Click"></ASP:Button>&nbsp; <ASP:Button id="Button_cancel" runat="server" text="Cancel" causesvalidation="False" onclick="Button_cancel_Click"></ASP:Button></p></td>
							</tr>
							<tr>
							  <td valign="top">•</td>
							  <td>
                                <p>If your email address has changed, you must <ASP:LinkButton id="LinkButton_register_new_user" runat="server" causesvalidation="False" onclick="LinkButton_register_new_user_Click">register as a new user</ASP:LinkButton>.&nbsp; After re-registering, <ASP:Label id="Label_application_name_3" runat="server"></ASP:Label>&nbsp;will let you re-associate yourself with your existing profile.</p></td>
                            </tr>
                        </table>
                        <p align="center"><table id="Table_return" runat="server" visible="False" bordercolor="#0000ff" cellspacing="0" cellpadding="10" border="3">
    <tr>
      <td><ASP:LinkButton id="LinkButton_return" runat="server" font-bold="True" onclick="LinkButton_return_Click">Return to login page</ASP:LinkButton></td>
    </tr>
</table></p></td>
                    </tr>
                </table></td>
            </tr>
        </table></p><uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent></form>
  </body>
</html>
