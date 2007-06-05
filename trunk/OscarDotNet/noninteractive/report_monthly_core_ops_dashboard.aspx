<%@ Page language="c#" Debug="true" Codebehind="report_monthly_core_ops_dashboard.pas" AutoEventWireup="false" Inherits="report_monthly_core_ops_dashboard.TWebForm_report_monthly_core_ops_dashboard" EnableViewState="false" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_ranked_core_ops_size.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_ranked_crew_shifts_forecast.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_ranked_utilization.ascx" %>
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
					  <td bgcolor="#f5f5f5"><strong>Best practices</strong></td>
					</tr>
					<tr>
					  <td>
						<p>Monthly core operations dashboard</p>
						<small>
						<ul>
						  <li><p>...</p></li>
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
	  <p><ASP:PlaceHolder id="PlaceHolder_ranked_core_ops_size" runat="server"></ASP:PlaceHolder></p>
	  <p><ASP:PlaceHolder id="PlaceHolder_ranked_crew_shifts_forecast" runat="server"></ASP:PlaceHolder></p>
	  <p><ASP:PlaceHolder id="PlaceHolder_ranked_utilization" runat="server"></ASP:PlaceHolder></p>
	</form>
  </body>
</html>
