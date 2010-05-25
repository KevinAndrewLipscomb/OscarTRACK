<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserControl_serial_indicators_per_agency.ascx.cs" Inherits="UserControl_serial_indicators_per_agency.TWebUserControl_serial_indicators_per_agency" %>
<p>&nbsp;</p>
<p><b>Agency:</b>&nbsp;&nbsp;<asp:DropDownList ID="DropDownList_agency" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList_agency_SelectedIndexChanged"></asp:DropDownList></p>
<p>&nbsp;</p>
<p><b>1. Number of released members scheduled to staff ambulances: </b></p>
<p><img id="Img_core_ops_size" runat="server" width="781" height="417" src='@serial_indicator_control_chart.aspx?indicator=core_ops_size' /></p>
<p>&nbsp;</p>
<p><b>2. Number of recruits and trainees in the pipeline: </b></p>
<p><img id="Img_num_members_in_pipeline" runat="server" width="781" height="417" src='@serial_indicator_control_chart.aspx?indicator=num_members_in_pipeline' /></p>
<p>&nbsp;</p>
<p><b>3. Potential number of ambulance crew-shifts that could have been supplied on the schedule: </b></p>
<p><img id="Img_crew_shifts_forecast" runat="server" width="781" height="417" src='@serial_indicator_control_chart.aspx?indicator=crew_shifts_forecast' /></p>
<p>&nbsp;</p>
<p><b>4. Percentage of ambulance crews expected to include a Trainee or EMT Intern: </b></p>
<p><img id="Img_third_slot_saturation" runat="server" width="781" height="417" src='@serial_indicator_control_chart.aspx?indicator=third_slot_saturation' /></p>
<p>&nbsp;</p>
<p><b>5. Percentage of released core operations personnel who were meeting their baseline duty requirements. The lower the data point, the more personnel were granted partial or full leaves-of-absence: </b></p>
<p><img id="Img_utilization" runat="server" width="781" height="417" src='@serial_indicator_control_chart.aspx?indicator=utilization' /></p>
<p>&nbsp;</p>
<p><b>6. Percentage of released core operations personnel who the agency enrolled at one of the standard levels (Regular, Life, Tenured). The lower the data point, the more personnel the agency enrolled at liberal levels (Associate, Reduced, Atypical). Standard enrollees commit more duty shifts per month than liberal enrollees: </b></p>
<p><img id="Img_standard_enrollment" runat="server" width="781" height="417" src='@serial_indicator_control_chart.aspx?indicator=standard_enrollment' /></p>
<p>&nbsp;</p>
<p><b>7. Median length of service of released core operations personnel, in years. For each data point, half of such members have given fewer years of service than indicated, half more: </b></p>
<p><img id="Img_median_length_of_service" runat="server" width="781" height="417" src='@serial_indicator_control_chart.aspx?indicator=median_length_of_service' /></p>
<p>&nbsp;</p>
<p><b>8. Degree to which the agency produced a complete initial schedule. A schedule is deemed 100% complete when each member has been scheduled for the number of duties required according to the membership and leave statuses: </b></p>
<p><img id="Img_commensuration" runat="server" width="781" height="417" src='@serial_indicator_control_chart.aspx?indicator=commensuration' /></p>
<p>&nbsp;</p>
<p><b>9. Degree to which agency personnel took each of a month's crew-shifts as an opportunity to make a qualifying status update to a vehicle: </b></p>
<p><img id="Img_fleet_tracking_participation" runat="server" width="781" height="417" src='@serial_indicator_control_chart.aspx?indicator=fleet_tracking_participation' /></p>
<p>&nbsp;</p>
<p><b>10. Degree to which vehicles in the agency's fleet were UP and within their PM and DMV inspection targets: </b></p>
<p><img id="Img_vehicles_up_and_current" runat="server" width="781" height="417" src='@serial_indicator_control_chart.aspx?indicator=monthly_vehicles_up_and_current' /></p>
