<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="squad_commander_overview.pas" AutoEventWireup="false" Inherits="squad_commander_overview.TWebForm_squad_commander_overview" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_roster" Src="~/usercontrol/app/UserControl_roster.ascx" %>
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
		  <table cellspacing="0" cellpadding="0" width="100%" border="0">
			  <tr>
				<td><small>[
				  <ASP:LinkButton id="LinkButton_logout" runat="server" causesvalidation="False">Logout</ASP:LinkButton>&nbsp;]
																			      [ Change your <asp:LinkButton id="LinkButton_change_password" runat="server">password</asp:LinkButton>&nbsp;
			|
			<asp:LinkButton id="LinkButton_change_email_address" runat="server">email address</asp:LinkButton>&nbsp;]</small></td>
				<td align="right"><uc1:UserControl_print_div id="UserControl_print_div" runat="server"></uc1:UserControl_print_div></td>
			  </tr>
		  </table>
	  </p>
	<div id="Div_print_area">
	  <asp:label id="Label_agency_name" runat="server" font-bold="True" font-size="Large"></asp:label>
	  <p></p>
	  <uc1:UserControl_roster id="UserControl_roster" runat="server"></uc1:UserControl_roster>
	</div>
	  <asp:placeholder id="PlaceHolder_postcontent" runat="server"></asp:placeholder>
	  <sstchur:smartscroller runat="server"></sstchur:smartscroller>
	</form>
  </body>
</html>
