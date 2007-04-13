<%@ Page language="c#" Debug="true" Codebehind="overview.pas" AutoEventWireup="false" Inherits="overview.TWebForm_overview"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_establish_membership.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_roster.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title id="Title" runat="server"></title>
	<!-- $Id$ -->
  </head>
  <body>
	<form runat="server">
	  <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
	  <p>
          <table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#d3d3d3">
              <tr>
				<td>
				<small><ASP:Label id="Label_username" runat="server"></ASP:Label>:&nbsp;[
		  <ASP:LinkButton id="LinkButton_logout" runat="server" causesvalidation="False">Logout</ASP:LinkButton>&nbsp;] [ 
		  Change <ASP:LinkButton id="LinkButton_change_password" runat="server" causesvalidation="False">password</ASP:LinkButton>&nbsp;| <ASP:LinkButton id="LinkButton_change_email_address" runat="server" causesvalidation="False">email address</ASP:LinkButton>&nbsp;]</small>
	  </td>
			  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td align="right"><uc1:UserControl_print_div id="UserControl_print_div" runat="server" visible="False"></uc1:UserControl_print_div></td>
			  </tr>
		  </table></p>
	  <p></p>
      <p><ASP:PlaceHolder id="PlaceHolder_establish_membership" runat="server"></ASP:PlaceHolder><ASP:PlaceHolder id="PlaceHolder_roster" runat="server"></ASP:PlaceHolder></p>
      <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
    <p><sstchur:SmartScroller runat="server" /></p></form>
  </body>
</html>
