<%@ Page language="c#" Debug="true" Codebehind="salogin.pas" AutoEventWireup="false" Inherits="salogin.TWebForm_salogin" %>
<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
  <head>
	<title id="Title" runat="server"></title>
	<!-- $Id$ -->
  </head>

  <body ms_positioning="FlowLayout">
  <form runat="server">
		  <asp:placeholder id="PlaceHolder_precontent" runat="server"></asp:placeholder>
		  <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
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
							  <ASP:CustomValidator id="CustomValidator_account_exists" runat="server" errormessage="Invalid user/password combination. Please try again." font-bold="True">!ERR!</ASP:CustomValidator>
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
						<ASP:LinkButton id="LinkButton_new_user" runat="server" causesvalidation="False" tabindex="5">New user?</ASP:LinkButton><br>
						<ASP:LinkButton id="LinkButton_forgot_username" runat="server" causesvalidation="False" tabindex="6">Forgot username?</ASP:LinkButton>
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
                            <td><small><ASP:LinkButton id="LinkButton_forgot_password" runat="server" causesvalidation="False" tabindex="7">Forgot password?</ASP:LinkButton></small></td>
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
								runat="server" text="Log in" font-bold="True" tabindex="4">
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
  <asp:placeholder id="PlaceHolder_postcontent" runat="server"></asp:placeholder>
<p><sstchur:SmartScroller runat="server" /></p></form>
</body>
</html>
