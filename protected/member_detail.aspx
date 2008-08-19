<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="member_detail.pas" AutoEventWireup="false" Inherits="member_detail.TWebForm_member_detail" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

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
					<tr><td bgcolor="#f5f5f5"><strong>Member detail record&nbsp;&nbsp;&nbsp;&nbsp; </strong><uc1:UserControl_print_div id="UserControl_print_div" runat="server"></uc1:UserControl_print_div></td></tr>
					<tr>
					  <td>
						<table cellspacing="0" cellpadding="10" width="100%" border="0">
							<tr>
							  <td>Name:</td>
							  <td><ASP:Label id="Label_member_designator" runat="server" font-bold="True"></ASP:Label></td>
							  <td></td>
								<td><ASP:LinkButton id="LinkButton_change_name" runat="server" visible="False"><IMG src="~/protected/image/draw_freehand_16_h.png" alt="Edit" border="0" height="16" width="16" /></ASP:LinkButton></td>
							</tr>
							<tr>
							  <td>CAD #:</td>
							  <td><ASP:Label id="Label_cad_num" runat="server"></ASP:Label></td>
							  <td></td>
								<td><ASP:LinkButton id="LinkButton_change_cad_num" runat="server" visible="False"><IMG src="~/protected/image/draw_freehand_16_h.png" alt="Edit" border="0" height="16" width="16" /></ASP:LinkButton></td>
							</tr>
							<tr>
							  <td>Email address:</td>
							  <td><ASP:Label id="Label_email_address" runat="server"></ASP:Label></td>
							  <td></td>
								<td><ASP:LinkButton id="LinkButton_change_member_email_address" runat="server" visible="False"><IMG src="~/protected/image/draw_freehand_16_h.png" alt="Edit" border="0" height="16" width="16" /></ASP:LinkButton></td>
							</tr>
							<tr>
							  <td>Leave:</td>
							  <td valign="middle">
								<table cellspacing="0" cellpadding="1" border="0">
									  <tr>
										<td>This month:</td>
										<td>&nbsp;&nbsp;&nbsp;</td>
										<td><ASP:Label id="Label_leave_this_month" runat="server" font-bold="True"></ASP:Label></td>
									  </tr>
									  <tr>
										<td>Next month:</td>
										<td>&nbsp;&nbsp;&nbsp;</td>
										<td><ASP:Label id="Label_leave_next_month" runat="server" font-bold="True"></ASP:Label></td>
									  </tr>
								</table>
								</td>
							  <td><ASP:LinkButton id="LinkButton_leave_detail" runat="server"><IMG src="~/protected/image/open_document16_h.png" alt="Detail" border="0" height="16" width="16" /></ASP:LinkButton></td>
								<td></td>
							</tr>
							<tr>
							  <td>Officership:</td>
							  <td><ASP:Label id="Label_officership" runat="server"></ASP:Label></td>
							  <td><ASP:LinkButton id="LinkButton_officership_detail" runat="server"><IMG src="~/protected/image/open_document16_h.png" alt="Detail" border="0" height="16" width="16" /></ASP:LinkButton></td>
								<td></td>
							</tr>
							<tr>
							  <td>Agency:</td>
							  <td><ASP:Label id="Label_agency" runat="server"></ASP:Label></td>
							  <td></td>
								<td><ASP:LinkButton id="LinkButton_change_agency" runat="server"><IMG src="~/protected/image/draw_freehand_16_h.png" alt="Edit" border="0" height="16" width="16" /></ASP:LinkButton></td>
							</tr>
							<tr>
							  <td>Section:</td>
							  <td><ASP:Label id="Label_section" runat="server"></ASP:Label></td>
							  <td></td>
								<td><ASP:LinkButton id="LinkButton_change_section" runat="server"><IMG src="~/protected/image/draw_freehand_16_h.png" alt="Edit" border="0" height="16" width="16" /></ASP:LinkButton></td>
							</tr>
							<tr>
							  <td>Released cert level:</td>
							  <td><ASP:Label id="Label_medical_release_level" runat="server"></ASP:Label></td>
							  <td></td>
								<td><ASP:LinkButton id="LinkButton_change_medical_release_level" runat="server"><IMG src="~/protected/image/draw_freehand_16_h.png" alt="Edit" border="0" height="16" width="16" /></ASP:LinkButton></td>
							</tr>
							<tr>
							  <td valign="top">Membership status:</td>
							  <td valign="top">
								  <p><ASP:Label id="Label_enrollment" runat="server"></ASP:Label></p>
								  <blockquote><small><ASP:Label id="Label_elaboration" runat="server" font-italic="True"></ASP:Label></small></blockquote>
							  </td>
							  <td valign="top"><ASP:LinkButton id="LinkButton_enrollment_detail" runat="server"><IMG src="~/protected/image/open_document16_h.png" alt="Detail" border="0" height="16" width="16" /></ASP:LinkButton></td>
							  <td valign="top"></td>
							</tr>
							<tr>
							  <td valign="top">Years of service:</td>
							  <td valign="top"><ASP:Label id="Label_years_of_service" runat="server"></ASP:Label></td>
							  <td valign="top"></td>
							  <td valign="top"></td>
							</tr>
							<tr>
							  <td>Driver qualified:</td>
							  <td><ASP:Label id="Label_be_driver_qualified" runat="server"></ASP:Label></td>
							  <td></td>
								<td><ASP:LinkButton id="LinkButton_change_driver_qual" runat="server"><IMG src="~/protected/image/draw_freehand_16_h.png" alt="Edit" border="0" height="16" width="16" /></ASP:LinkButton></td>
							</tr>
						</table></td>
					</tr>
				</table></td>
			</tr>
		</table><uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent></div><p><sstchur:SmartScroller runat="server" /></p></form>
  </body>
</html>
