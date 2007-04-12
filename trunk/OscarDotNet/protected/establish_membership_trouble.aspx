<%@ Page language="c#" Debug="true" Codebehind="establish_membership_trouble.pas" AutoEventWireup="false" Inherits="establish_membership_trouble.TWebForm_establish_membership_trouble" %>
<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
	<title id="Title" runat="server"></title>
	  <!-- $Id$ -->
  </head>

  <body>
	 <form runat="server">
	  <asp:placeholder id="PlaceHolder_precontent" runat="server"></asp:placeholder>
	  <p>
		  <table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#d3d3d3">
			  <tr>
				<td>
		<small><asp:label id="Label_account_descriptor" runat="server"></asp:label>:&nbsp;[
		  <ASP:LinkButton id="LinkButton_logout" runat="server" causesvalidation="False">Logout</ASP:LinkButton>&nbsp;]
				          [ <ASP:LinkButton id="LinkButton_back" runat="server" causesvalidation="False">Go back</ASP:LinkButton>&nbsp;]&nbsp;
				          [ Change <asp:LinkButton id="LinkButton_change_password" runat="server" causesvalidation="False">password</asp:LinkButton>&nbsp;
			|
			<asp:LinkButton id="LinkButton_change_email_address" runat="server" causesvalidation="False">email address</asp:LinkButton>&nbsp;]
		</small>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			  <td>
				<div align="right">
				</div></td>
			  </tr>
		  </table>
	  </p>
<p>
		<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
			<tr>
			  <td>
				<table cellspacing="0" cellpadding="10" border="0">
					<tr>
					  <td bgcolor="#f5f5f5"><strong>Report trouble establishing membership</strong></td>
					</tr>
					<tr>
					  <td>
						<p>
                          <table cellspacing="0" cellpadding="10" border="0">
                              <tr>
                                <td>
						<p>Enter your full name:</p>
						<blockquote>
						  <p><ASP:TextBox id="TextBox_full_name" runat="server" columns="40"></ASP:TextBox></p>
						</blockquote></td>
                                <td valign="top" nowrap="true"><ASP:RequiredFieldValidator id="RequiredFieldValidator_full_name" runat="server" errormessage="Please enter your full name." font-bold="True" controltovalidate="TextBox_full_name">!ERR!</ASP:RequiredFieldValidator></td>
                              </tr>
                              <tr>
                                <td>
						<p>Please explain why <ASP:Label id="Label_sponsor_1" runat="server"></ASP:Label>&nbsp;may not have correct data on file for you:</p>
						<blockquote>
						  <p><ASP:TextBox id="TextBox_explanation" runat="server" columns="72" rows="7" textmode="MultiLine"></ASP:TextBox></p>
						</blockquote></td>
                                <td valign="top" nowrap="true"><ASP:RequiredFieldValidator id="RequiredFieldValidator_explanation" runat="server" errormessage="Please enter an explanation." font-bold="True" controltovalidate="TextBox_explanation">!ERR!</ASP:RequiredFieldValidator></td>
                              </tr>
                              <tr>
                                <td>
						<p>Both of the following must occur before you can use <ASP:Label id="Label_application_name_1" runat="server"></ASP:Label>:</p>
						<ul>
						  <li>
							<p>A&nbsp;liaison from <ASP:Label id="Label_sponsor_2" runat="server"></ASP:Label>&nbsp;will advise you how to get your membership record updated.</p></li>
						  <li>
							<p>The <ASP:Label id="Label_application_name_2" runat="server"></ASP:Label>&nbsp;Application Administrator will advise you when to log into <ASP:Label id="Label_application_name_3" runat="server"></ASP:Label>&nbsp;again.</p>
						  </li>
						</ul>
						<p><ASP:Button id="Button_submit" runat="server" text="Send message and LOG OUT"></ASP:Button></p></td>
                                <td></td>
                              </tr>
                          </table></p>
					  </td>
					</tr>
				</table></td>
			</tr>
		</table>
</p>
	  <asp:placeholder id="PlaceHolder_postcontent" runat="server"></asp:placeholder>
     <p><sstchur:SmartScroller runat="server" /></p></form>
  </body>
</html>
