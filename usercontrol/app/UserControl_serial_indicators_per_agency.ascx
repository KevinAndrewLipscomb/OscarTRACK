<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserControl_serial_indicators_per_agency.ascx.cs" Inherits="UserControl_serial_indicators_per_agency.TWebUserControl_serial_indicators_per_agency" %>
<p>&nbsp;</p>
<table width="100%">
  <tr>
    <td nowrap="nowrap"><b>Agency:</b>&nbsp;&nbsp;<asp:DropDownList ID="DropDownList_agency" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList_agency_SelectedIndexChanged"></asp:DropDownList></td>
    <td nowrap="nowrap" align="right">
      <b>Width in months:</b>
      <asp:TextBox ID="TextBox_width_in_months" runat="server" Columns="3" Text="27"></asp:TextBox>
      <asp:Button ID="Button_go" runat="server" Text="Go" visible="false" OnClick="Button_go_Click"/>
      <asp:Button ID="Button_max" runat="server" CausesValidation="False" OnClick="Button_max_Click" Text="Max" UseSubmitBehavior="False" Visible="False" />
      <asp:Button ID="Button_default" runat="server" CausesValidation="False" OnClick="Button_default_Click" Text="Default" UseSubmitBehavior="False" Visible="False" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator_width_in_months" runat="server" ControlToValidate="TextBox_width_in_months" ErrorMessage="Please specify a Width in months." Font-Bold="True">&lt;ERR!</asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator_width_in_months" runat="server" ControlToValidate="TextBox_width_in_months" ErrorMessage="Please enter numeric values only for Width in months." Font-Bold="True" ValidationExpression="\d+">&lt;ERR!</asp:RegularExpressionValidator>
      <asp:RangeValidator ID="RangeValidator_width_in_months" runat="server" ControlToValidate="TextBox_width_in_months" ErrorMessage="The Width in months must currently be between 2 and #." Font-Bold="True" MinimumValue="2" MaximumValue="27" Type="Integer">&lt;ERR!</asp:RangeValidator>
    </td>
  </tr>
</table>
<p>&nbsp;</p>
<p><b>1. Number of released members scheduled to staff ambulances: </b></p>
<p><img id="Img_core_ops_size" runat="server" width="781" height="417" src="@serial_indicator_control_chart.aspx?indicator=core_ops_size" alt="core_ops_size"/></p>
<p>&nbsp;</p>
<p><b>2. Number of recruits and trainees in the pipeline: </b></p>
<p><img id="Img_num_members_in_pipeline" runat="server" width="781" height="417" src="@serial_indicator_control_chart.aspx?indicator=num_members_in_pipeline" alt="num_members_in_pipeline" /></p>
<p>&nbsp;</p>
<p><b>3. Potential number of ambulance crew-shifts that could have been supplied on the schedule: </b></p>
<p><img id="Img_crew_shifts_forecast" runat="server" width="781" height="417" src="@serial_indicator_control_chart.aspx?indicator=crew_shifts_forecast" alt="crew_shifts_forecast" /></p>
<p>&nbsp;</p>
<p><b>4. Median length of service of released core operations personnel, in years. For each data point, half of such members have given fewer years of service than indicated, half more: </b></p>
<p><img id="Img_median_length_of_service" runat="server" width="781" height="417" src="@serial_indicator_control_chart.aspx?indicator=median_length_of_service" alt="median_length_of_service" /></p>
<p>&nbsp;</p>
<p><b>5. Percentage of released core operations personnel who the agency enrolled at one of the standard levels (Regular, Life, Senior, Tenured BLS, Tenured ALS, EDP). The lower the data point, the more personnel the agency enrolled at liberal levels (Associate, Reduced, Staff, ALS Intern, College, Atypical). Standard enrollees commit more duty shifts per month than liberal enrollees: </b></p>
<p><img id="Img_standard_enrollment" runat="server" width="781" height="417" src="@serial_indicator_control_chart.aspx?indicator=standard_enrollment" alt="standard_enrollment" /></p>
<p>&nbsp;</p>
<p><b>6. Percentage of released core operations personnel who were meeting their baseline duty requirements. The lower the data point, the more personnel were granted leaves or reductions: </b></p>
<p><img id="Img_utilization" runat="server" width="781" height="417" src="@serial_indicator_control_chart.aspx?indicator=utilization" alt="utilization" /></p>
<p>&nbsp;</p>
<p><b>7. Degree to which agency personnel submitted availability sheets by the most recent deadline: </b></p>
<p><img id="Img_avail_submission_compliance" runat="server" width="781" height="417" src="@serial_indicator_control_chart.aspx?indicator=avail_submission_compliance" alt="avail_submission_compliance" /></p>
<p>&nbsp;</p>
<p><b>8. Degree to which the agency produced a complete initial schedule. A schedule is deemed 100% complete when each member has been scheduled for the number of duties required according to the membership and leave/reduction statuses: </b></p>
<p><img id="Img_commensuration" runat="server" width="781" height="417" src="@serial_indicator_control_chart.aspx?indicator=commensuration" alt="commensuration" /></p>
<p>&nbsp;</p>
<p><b>9. Percentage of ambulance crews expected to include a BLS Intern or Student: </b></p>
<asp:Panel ID="Panel_third_slot_saturation_image" runat="server"><p><img id="Img_third_slot_saturation" runat="server" width="781" height="417" src="@serial_indicator_control_chart.aspx?indicator=third_slot_saturation" alt="third_slot_saturation" /></p></asp:Panel>
<asp:Panel ID="Panel_third_slot_saturation_not_meaningful_here" runat="server" Visible="false"><blockquote><small><em>A squad-by-squad breakdown is not currently meaningful for this metric.</em></small></blockquote></asp:Panel>
<p>&nbsp;</p>
<p><b>10. Approximate degree to which members ran their duties as scheduled, without qualifying as "tapouts".&nbsp; This metric is affected by the way schedule changes are recorded, and by the agency's associated crew-shifts forecast as recorded at the beginning of the same month: </b></p>
<p><img id="Img_scheduled_duty_compliance" runat="server" width="781" height="417" src="@serial_indicator_control_chart.aspx?indicator=scheduled_duty_compliance" alt="scheduled_duty_compliance" /></p>
<p>&nbsp;</p>
<p><b>11. Degree to which agency personnel took each of a month's crew-shifts as an opportunity to make a qualifying status update to a vehicle: </b></p>
<p><img id="Img_fleet_tracking_participation" runat="server" width="781" height="417" src="@serial_indicator_control_chart.aspx?indicator=fleet_tracking_participation" alt="fleet_tracking_participation" /></p>
<p>&nbsp;</p>
<p><b>12. Degree to which vehicles in the agency's fleet were UP and within their PM and DMV inspection targets: </b></p>
<p><img id="Img_vehicles_up_and_current" runat="server" width="781" height="417" src="@serial_indicator_control_chart.aspx?indicator=monthly_vehicles_up_and_current" alt="monthly_vehicles_up_and_current" /></p>
