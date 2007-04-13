<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="member_detail.pas" AutoEventWireup="false" Inherits="member_detail.TWebForm_member_detail" %>
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
				<td align="right">
				<uc1:UserControl_print_div id="UserControl_print_div" runat="server"></uc1:UserControl_print_div>
				</td>
			  </tr>
		  </table>
	  </p>
<div id="Div_print_area">
	  <p>
		<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
			<tr>
			  <td>
				<table cellspacing="0" cellpadding="10" width="100%" border="0">
					<tr>
					  <td bgcolor="#f5f5f5">
	  <p>Member detail record for <ASP:Label id="Label_member_designator" runat="server" font-bold="True"></ASP:Label></p></td>
					</tr>
					<tr>
					  <td>
						<table cellspacing="0" cellpadding="10" width="100%" border="0">
							<tr>
							  <td>Email address:</td>
							  <td><ASP:Label id="Label_email_address" runat="server"></ASP:Label></td>
							  <td><ASP:LinkButton id="LinkButton_change_member_email_address" runat="server" visible="False">Change</ASP:LinkButton></td>
							</tr>
							<tr bgcolor="#dcdcdc">
							  <td>Leave:</td>
							  <td valign="middle">
								<table cellspacing="0" cellpadding="0" border="0">
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
							  <td><ASP:LinkButton id="LinkButton_leave_detail" runat="server">Detail</ASP:LinkButton></td>
							</tr>
							<tr>
							  <td>Officership:</td>
							  <td><ASP:Label id="Label_officership" runat="server"></ASP:Label></td>
							  <td><ASP:LinkButton id="LinkButton_officership_detail" runat="server">Detail</ASP:LinkButton></td>
							</tr>
							<tr bgcolor="#dcdcdc">
							  <td>Section:</td>
							  <td><ASP:Label id="Label_section" runat="server"></ASP:Label></td>
							  <td><ASP:LinkButton id="LinkButton_change_section" runat="server">Change</ASP:LinkButton></td>
							</tr>
							<tr>
							  <td>Medical release level:</td>
							  <td><ASP:Label id="Label_medical_release_level" runat="server"></ASP:Label></td>
							  <td><ASP:LinkButton id="LinkButton_change_medical_release_level" runat="server">Change</ASP:LinkButton></td>
							</tr>
							<tr bgcolor="#dcdcdc">
							  <td>Enrollment:</td>
							  <td><ASP:Label id="Label_enrollment" runat="server"></ASP:Label></td>
							  <td><ASP:LinkButton id="LinkButton_enrollment_detail" runat="server">Detail</ASP:LinkButton></td>
							</tr>
							<tr>
							  <td>Driver qualified:</td>
							  <td><ASP:Label id="Label_be_driver_qualified" runat="server"></ASP:Label></td>
							  <td><ASP:LinkButton id="LinkButton_change_driver_qual" runat="server">Change</ASP:LinkButton></td>
							</tr>
						</table></td>
					</tr>
				</table></td>
			</tr>
		</table></p>
</div><uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent><p><sstchur:SmartScroller runat="server" /></p></form>
  </body>
</html>
