<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="change_member_agency.pas" AutoEventWireup="false" Inherits="change_member_agency.TWebForm_change_member_agency" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
  <head runat="server">
	<title id="Title" runat="server"></title>
      <!-- $Id$ -->
  </head>

  <body bgcolor="white">
	 <form runat="server">
	   <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
<div id="Div_print_area">
		<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
			<tr>
			  <td>
				<table cellspacing="0" cellpadding="10" width="100%" border="0">
					<tr><td bgcolor="#f5f5f5"><strong>Change
						  <ASP:Label id="Label_member_name_1" runat="server"></ASP:Label>'s agency assignment&nbsp;&nbsp;&nbsp;&nbsp; <uc1:UserControl_print_div id="UserControl_print_div" runat="server"></uc1:UserControl_print_div></strong></td>
					</tr>
					<tr>
					  <td>
						<p><ASP:Label id="Label_member_name_2" runat="server"></ASP:Label>&nbsp;is a member of <ASP:DropDownList id="DropDownList_agency" runat="server"></ASP:DropDownList>.</p>
						<p><ASP:Button id="Button_submit" runat="server" text="Submit"></ASP:Button>&nbsp;<ASP:Button id="Button_cancel" runat="server" text="Cancel" causesvalidation="False"></ASP:Button></p></td>
					</tr>
				</table></td>
			</tr>
		</table></div><uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent></div>
      <p><sstchur:SmartScroller runat="server" /></p></form>
  </body>
</html>
