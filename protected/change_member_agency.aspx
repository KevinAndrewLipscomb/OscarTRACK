<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="change_member_agency.pas" AutoEventWireup="false" Inherits="change_member_agency.TWebForm_change_member_agency" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
	<title id="Title" runat="server"></title>
      <!-- $Id$ -->
  </head>

  <body>
     <form runat="server"><uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent><p>
		  <table cellspacing="0" cellpadding="1" width="100%" bgcolor="#d3d3d3" border="0">
			  <tr>
				<td><small><asp:label id="Label_account_descriptor" runat="server"></asp:label>: [&nbsp;<ASP:LinkButton id="LinkButton_logout" runat="server" causesvalidation="False">Logout</ASP:LinkButton>&nbsp;]
							    [&nbsp; <ASP:LinkButton id="LinkButton_back" runat="server" causesvalidation="False">Go back</ASP:LinkButton>&nbsp;]&nbsp;
							    [ Change <asp:LinkButton id="LinkButton_change_password" runat="server" causesvalidation="False">password</asp:LinkButton>&nbsp;
			|
			<asp:LinkButton id="LinkButton_change_email_address" runat="server" causesvalidation="False">email address</asp:LinkButton>&nbsp;]
		</small>
	  </td><td>&nbsp;&nbsp;&nbsp;&nbsp; </td>
	  <td align="right">
		<uc1:UserControl_print_div id="UserControl_print_div" runat="server"></uc1:UserControl_print_div></td></tr></table></p>
<div id="Div_print_area">
		<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
			<tr>
			  <td>
				<table cellspacing="0" cellpadding="10" width="100%" border="0">
					<tr><td bgcolor="#f5f5f5"><strong>Change
						  <ASP:Label id="Label_member_name_1" runat="server"></ASP:Label>'s agency assignment</strong></td>
					</tr>
					<tr>
					  <td>
						<p><ASP:Label id="Label_member_name_2" runat="server"></ASP:Label>&nbsp;is a member of <ASP:DropDownList id="DropDownList_agency" runat="server"></ASP:DropDownList>.</p>
						<p><ASP:Button id="Button_submit" runat="server" text="Submit"></ASP:Button>&nbsp;<ASP:Button id="Button_cancel" runat="server" text="Cancel" causesvalidation="False"></ASP:Button></p></td>
					</tr>
				</table></td>
			</tr>
		</table>
</div>
	  <p><uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent></p>
      <p><sstchur:SmartScroller runat="server" /></p></form>
  </body>
</html>
