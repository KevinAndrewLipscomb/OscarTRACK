<%@ Page language="c#" codebehind="report_monthly_core_ops_dashboard.aspx.cs" AutoEventWireup="True" Inherits="report_monthly_core_ops_dashboard.TWebForm_report_monthly_core_ops_dashboard" EnableViewState="false" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<!DOCTYPE html>
<html>
  <head runat="server">
	<title></title>
	<!-- $Id$ -->
  </head>
  <body bgcolor="white">
	<form runat="server">
	  <uc1:UserControl_common_header_bar id="UserControl_common_header_bar" runat="server"></uc1:UserControl_common_header_bar>
	  <p>
		<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
			<tr>
			  <td>
				<table cellspacing="0" cellpadding="10" width="100%" border="0">
					<tr>
					  <td bgcolor="#f5f5f5"><strong>Monthly core operations dashboard</strong></td>
					</tr>
					<tr>
					  <td>
						<small>
						<p>Best practices:</p>
						<ul>
						  <li><p>This report allows members to compare squad-to-squad metrics from various perspectives.</p></li>
              <li><p>Changes in one metric can have direct or inverse affects on other metrics.</p></li>
						  <li><p>Factors affecting these metrics include demographics and squad policies and practices.</p></li>
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
        <ASP:PlaceHolder id="PlaceHolder_current" runat="server"></ASP:PlaceHolder>
	</form>
  </body>
</html>
