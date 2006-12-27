<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="salogin.pas" AutoEventWireup="false" Inherits="salogin.TWebForm_salogin" %>
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
							  <td><strong>System Administrator log in</strong></td>
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
				  <td>Mimic what kind of
							  <ASP:Label id="Label_application_name" runat="server"></ASP:Label>&nbsp;user?</td>
				  <td>
									  <ASP:DropDownList id="DropDownList_user_kind" runat="server" autopostback="True">
								<ASP:ListItem value="0">-- Select (then wait for form to refresh) --</ASP:ListItem>
								<ASP:ListItem value="member">Member</ASP:ListItem>
								<ASP:ListItem value="agency">Agency</ASP:ListItem>
								<ASP:ListItem value="department_staffer">Department Staffer</ASP:ListItem></ASP:DropDownList><ASP:RegularExpressionValidator id="RegularExpressionValidator_user_kind" runat="server" errormessage="Please select a user kind." font-bold="True" controltovalidate="DropDownList_user_kind" validationexpression="[a-z_]+">!ERR!</ASP:RegularExpressionValidator>
									</td>
				</tr>
				<tr>
				  <td>
					<p align="right"><ASP:Label id="Label_user" runat="server" enabled="False">User</ASP:Label>:</p>
				  </td>
				  <td>
							<asp:dropdownlist id="DropDownList_user"
											  runat="server">
							</asp:dropdownlist><ASP:RegularExpressionValidator id="RegularExpressionValidator_user" runat="server" errormessage="Please select a user." font-bold="True" controltovalidate="DropDownList_user" validationexpression="[^0].+">!ERR!</ASP:RegularExpressionValidator>
				  </td>
				</tr>
				<tr>
				  <td>
					<p align="right">System Administrator password:</p>
				  </td>
				  <td>
					<asp:textbox id="TextBox_noop_ie_behavior_workaround" runat="server" style="DISPLAY: none; VISIBILITY: hidden" /><!-- To work around an IE bug that otherwise prevents Enter in a textbox from submitting a form. -->
					<asp:textbox id="TextBox_password" runat="server" textmode="Password"></asp:textbox><ASP:RegularExpressionValidator id="RegularExpressionValidator_password" runat="server" errormessage='Please use only letters, numbers, and the underscore ("_") character (or local equivalents) in your password.' font-bold="True" controltovalidate="TextBox_password" validationexpression="\w+">!ERR!</ASP:RegularExpressionValidator>
				  </td>
				</tr>
				<tr>
				  <td>
				  </td>
				  <td>
					<asp:checkbox id="CheckBox_keep_me_logged_in"
								  runat="server"
								  text="Keep me logged in on this computer" enabled="False" visible="False">
					</asp:checkbox>
				  </td>
				</tr>
				<tr>
				  <td valign="top">
				  </td>
				  <td>

						<table cellspacing="0" cellpadding="5" width="1%">
							<tr>
							  <td><asp:button id="Button_log_in"
								runat="server" text="Log in" font-bold="True">
					</asp:button></td>
							  <td nowrap="true">
								<ASP:button id="Button_new_password" runat="server" text="Email new password"></ASP:button></td>
							</tr>
						</table>
				  </td>
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
<sstchur:SmartScroller runat="server" /></form>
</body>
</html>
