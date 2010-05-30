<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ Page language="c#" Debug="true" Codebehind="salogin.aspx.cs" AutoEventWireup="True" Inherits="salogin.TWebForm_salogin" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<html>
  <head runat="server">
	<!-- $Id$ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>

  <body ms_positioning="FlowLayout" bgcolor="white">
  <form runat="server">

  <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent><table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
			  <tr>
				<td>
				  <table cellspacing="0" cellpadding="5" border="0">
					  <tr>
						<td bgcolor="#f5f5f5"><strong>
						<table cellspacing="0" cellpadding="0" width="100%" border="0">
							<tr>
							  <td><strong>System administrator log in</strong></td>
							  <td>
								<div align="right">
							  <ASP:CustomValidator id="CustomValidator_account_exists" runat="server" errormessage="Invalid user/password combination. Please try again." font-bold="True" onservervalidate="CustomValidator_account_exists_ServerValidate">!ERR!</ASP:CustomValidator>
								</div></td>
							</tr>
						</table></strong></td>
					  </tr>
					  <tr>
						<td>
			<table cellspacing="0" cellpadding="5">
			  <tbody>
				<tr>
				  <td>
					<p align="right">MIMIC WHICH Username:</p>
				  </td>
				  <td><small>
					<ASP:TextBox id="TextBox_username" runat="server" maxlength="40" tabindex="1"></ASP:TextBox></small>
				  </td>
				  <td>
					<p>
					  <small>
						<ASP:LinkButton id="LinkButton_new_user" runat="server" causesvalidation="False" tabindex="5" onclick="LinkButton_new_user_Click">New user?</ASP:LinkButton><br>
						<ASP:LinkButton id="LinkButton_forgot_username" runat="server" causesvalidation="False" tabindex="6" onclick="LinkButton_forgot_username_Click">Forgot username?</ASP:LinkButton>
					  </small>
					</p>
				  </td>
				  <td><ASP:RequiredFieldValidator id="RequiredFieldValidator_username" runat="server" errormessage="Please enter a username." font-bold="True" controltovalidate="TextBox_username">!ERR!</ASP:RequiredFieldValidator>
					<ASP:RegularExpressionValidator id="RegularExpressionValidator_username" runat="server" errormessage='Please use only letter, number, hyphen ("-"), and underscore ("_") characters (or local equivalents) in your username.' font-bold="True" controltovalidate="TextBox_username" validationexpression="[\w-]+">!ERR!</ASP:RegularExpressionValidator>
				  </td>
				</tr>
				<tr>
				  <td>
					<p align="right">SYSADMIN password:</p>
				  </td>
				  <td>
					<asp:textbox id="TextBox_password" runat="server" textmode="Password" tabindex="2"></asp:textbox>
				  </td>
                            <td><small><ASP:LinkButton id="LinkButton_forgot_password" runat="server" causesvalidation="False" tabindex="7" onclick="LinkButton_forgot_password_Click">Forgot password?</ASP:LinkButton></small></td>
                            <td><ASP:RequiredFieldValidator id="RequiredFieldValidator_password" runat="server" errormessage="Please enter a password." font-bold="True" controltovalidate="TextBox_password">!ERR!</ASP:RequiredFieldValidator>
					<ASP:RegularExpressionValidator id="RegularExpressionValidator_password" runat="server" errormessage='Please use only letter, number, hyphen ("-"), and underscore ("_") characters (or local equivalents) in your password.' font-bold="True" controltovalidate="TextBox_password" validationexpression="[\w-]+">!ERR!</ASP:RegularExpressionValidator></td>
				</tr>
				<tr>
				  <td>
				  </td>
				  <td>
					<asp:checkbox id="CheckBox_keep_me_logged_in"
								  runat="server"
								  text="Keep me logged in on this computer" enabled="False" visible="False" tabindex="3">
					</asp:checkbox>
				  </td>
                            <td></td>
                            <td></td>
				</tr>
				<tr>
				  <td valign="top">
				  </td>
				  <td><asp:button id="Button_log_in"
								runat="server" text="Log in" font-bold="True" tabindex="4" onclick="Button_log_in_Click">
					</asp:button>
				  </td>
                            <td></td>
                            <td></td>
				</tr>
			  </tbody>
			</table>
						</td>
					  </tr>
				  </table>
				</td>
			  </tr>
		  </table>
  	<input id="Hidden_client_timezone_offset" runat="server" type="hidden"/>
    <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
  </form>
</body>
</html>
