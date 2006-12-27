<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="profile.pas" AutoEventWireup="false" Inherits="profile.TWebForm_profile" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
	<title id="Title" runat="server"></title>
	<!-- $Id$ -->
  </head>

  <body>
	 <form runat="server">
	  <p>
	  <asp:placeholder id="PlaceHolder_precontent" runat="server">
	  </asp:placeholder></p>
	  <p>
		<small>[
		  <ASP:LinkButton id="LinkButton_logout" runat="server" causesvalidation="False">Logout</ASP:LinkButton>&nbsp;] [ Back to <ASP:LinkButton id="LinkButton_member_overview" runat="server">member overview</ASP:LinkButton>&nbsp;form ]
		  [ Change your OSCAR
		<ASP:LinkButton id="LinkButton_change_password" runat="server">password</ASP:LinkButton>&nbsp;| <ASP:LinkButton id="LinkButton_change_email_address" runat="server">email address</ASP:LinkButton>&nbsp;]
		</small></p>
	  <p>
		<ASP:Label id="Label_member_name" runat="server" font-bold="True" font-size="Large"></ASP:Label></p>
<p><strong>
		  <ASP:Label id="Label_application_name" runat="server"></ASP:Label>&nbsp;profile</strong></p>
<p>
		<table cellspacing="0" cellpadding="0" width="%" border="1">
			<tr><td>
				<table cellspacing="0" cellpadding="5" width="%" border="0">
	  <tr>
		<td nowrap="true">
						<p align="right">Member name:</p></td>
		<td>
						<ASP:TextBox id="TextBox_member_name" runat="server" maxlength="127"></ASP:TextBox></td>
					  <td><ASP:RequiredFieldValidator id="RequiredFieldValidator_member_name" runat="server" errormessage="Member name is required." controltovalidate="TextBox_member_name" font-bold="True">!ERR!</ASP:RequiredFieldValidator><ASP:RegularExpressionValidator id="RegularExpressionValidator_member_name" runat="server" errormessage="Please leave disallowed punctuation out of your member name." font-bold="True" controltovalidate="TextBox_member_name" validationexpression="[0-9a-zA-z\.,'#%&amp;()-_ ]+">!ERR!</ASP:RegularExpressionValidator></td>
	  </tr>
					<tr>
					  <td></td>
					  <td>
				<ASP:Button id="Button_submit" runat="server" text="Submit"></ASP:Button></td>
					  <td></td>
					</tr></table></td></tr></table></p>
	<asp:placeholder id="PlaceHolder_postcontent" runat="server">
	</asp:placeholder><sstchur:SmartScroller runat="server" /></form></body></html>
