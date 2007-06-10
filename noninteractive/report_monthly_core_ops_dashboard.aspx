<%@ Page language="c#" Debug="true" Codebehind="report_monthly_core_ops_dashboard.pas" AutoEventWireup="false" Inherits="report_monthly_core_ops_dashboard.TWebForm_report_monthly_core_ops_dashboard" EnableViewState="false" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_ranked_core_ops_size.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_ranked_crew_shifts_forecast.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_ranked_utilization.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_ranked_standard_enrollment.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_ranked_length_of_service.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title id="Title" runat="server"></title>
	<!-- $Id$ -->
  </head>
  <body>
	<form runat="server">
	  <uc1:UserControl_common_header_bar id="UserControl_common_header_bar" runat="server"></uc1:UserControl_common_header_bar>
	  <p>
		<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
			<tr>
			  <td>
				<table cellspacing="0" cellpadding="10" width="100%" border="0">
					<tr>
					  <td bgcolor="#f5f5f5"><strong>Best practices</strong> - Monthly core operations dashboard</td>
					</tr>
					<tr>
					  <td>
						<small>
						<ul>
						  <li><p>For each of these analyses, you can interpret agencies shown at the top of the list to be better
							performers than agencies ranked at the bottom.</p></li>
						  <li><p>Although demographics may affect performance to some extent, agency policies and practices tend to
						    have the largest effect.</p></li>
						  <li>
							<p>Visit the <asp:label id="Label_application_name_1" runat="server" font-bold="True"></asp:label>
							website for additional features, such as advanced filtering, sorting, detail lookups, and
							QuickMessaging:</p>
							<blockquote>
							  <ASP:HyperLink id="HyperLink_web_site" runat="server" font-bold="True"></ASP:HyperLink>
							</blockquote>
						  </li>
						</ul>
						</small>
					  </td>
					</tr>
				</table></td>
			</tr>
		</table></p>
	  <table cellspacing="0" cellpadding="0" border="0" width="100%">
		<tr>
		  <td valign="top" width="50%">
			<p><ASP:PlaceHolder id="PlaceHolder_ranked_core_ops_size" runat="server"></ASP:PlaceHolder></p>
			<p><ASP:PlaceHolder id="PlaceHolder_ranked_utilization" runat="server"></ASP:PlaceHolder></p>
			<p><ASP:PlaceHolder id="PlaceHolder_ranked_length_of_service" runat="server"></ASP:PlaceHolder></p>
		  </td>
		  <td>&nbsp;&nbsp;</td>
		  <td valign="top" width="50%">
			<p><ASP:PlaceHolder id="PlaceHolder_ranked_crew_shifts_forecast" runat="server"></ASP:PlaceHolder></p>
			<p><ASP:PlaceHolder id="PlaceHolder_ranked_standard_enrollment" runat="server"></ASP:PlaceHolder></p>
		  </td>
	</form>
  </body>
</html>
