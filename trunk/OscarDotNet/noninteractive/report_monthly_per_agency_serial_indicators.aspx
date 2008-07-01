<%@ Page language="c#" Debug="true" Codebehind="report_monthly_per_agency_serial_indicators.pas" AutoEventWireup="false" Inherits="report_monthly_per_agency_serial_indicators.TWebForm_report_monthly_per_agency_serial_indicators" EnableViewState="false" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title id="Title" runat="server"></title>
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
					  <td bgcolor="#f5f5f5"><strong>Monthly report of <asp:label id="Label_agency" runat="server" font-bold="True"></asp:label> SERIAL INDICATORS</strong></td>
					</tr>
					<tr>
					  <td>
						<small>
						<p>Best practices:</p>
						<ul>
						  <li><p>These charts show how your agency's metrics have changed over recent months.</p></li>
						  <li><p>Consider sharing these charts with your agency's upper management.</p></li>
						  <li><p>Read the definitions carefully as each word makes an important difference.</p></li>
						  <li>
							<p>Visit the <asp:label id="Label_application_name" runat="server" font-bold="True"></asp:label>
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
<p><b>1. Number of released members scheduled to staff ambulances:
</b></p>
<p><img id="Img_core_ops_size" runat="server" width="781" height="417" src='@serial_indicator_control_chart.aspx?indicator=core_ops_size' /></p>
<p>&nbsp;</p>
<p><b>2. Number of recruits and trainees in the pipeline:
</b></p>
<p><img id="Img_num_members_in_pipeline" runat="server" width="781" height="417" src='@serial_indicator_control_chart.aspx?indicator=num_members_in_pipeline' /></p>
<p>&nbsp;</p>
<p><b>3. Potential number of ambulance crew-shifts that could have been supplied on the schedule:
</b></p>
<p><img id="Img_crew_shifts_forecast" runat="server" width="781" height="417" src='@serial_indicator_control_chart.aspx?indicator=crew_shifts_forecast' /></p>
<p>&nbsp;</p>
<p><b>4. Percentage of released core operations personnel who were meeting their baseline duty requirements. The lower the data point, the more personnel were granted partial or full leaves-of-absence:
</b></p>
<p><img id="Img_utilization" runat="server" width="781" height="417" src='@serial_indicator_control_chart.aspx?indicator=utilization' /></p>
<p>&nbsp;</p>
<p><b>5. Percentage of released core operations personnel who the agency enrolled at one of the standard levels (Regular, Life, Tenured). The lower the data point, the more personnel the agency enrolled at liberal levels (Associate, Reduced, Atypical). Standard enrollees commit more duty shifts per month than liberal enrollees:
</b></p>
<p><img id="Img_standard_enrollment" runat="server" width="781" height="417" src='@serial_indicator_control_chart.aspx?indicator=standard_enrollment' /></p>
<p>&nbsp;</p>
<p><b>6. Median length of service of released core operations personnel, in years. For each data point, half of such members have given fewer years of service than indicated, half more:
</b></p>
<p><img id="Img_median_length_of_service" runat="server" width="781" height="417" src='@serial_indicator_control_chart.aspx?indicator=median_length_of_service' /></p>
<p>&nbsp;</p>
<p><b>7. Degree to which the agency produced a complete initial schedule. A schedule is deemed 100% complete when each member has been scheduled for the number of duties required according to the membership and leave statuses:
</b></p>
<p><img id="Img_commensuration" runat="server" width="781" height="417" src='@serial_indicator_control_chart.aspx?indicator=commensuration' /></p>
<p>&nbsp;</p>
<p>-- END --</p>
	</form>
  </body>
</html>
