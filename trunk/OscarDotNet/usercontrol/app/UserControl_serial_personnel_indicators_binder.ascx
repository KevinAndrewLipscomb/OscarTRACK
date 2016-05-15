<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_serial_personnel_indicators_binder.ascx.cs" Inherits="UserControl_serial_personnel_indicators_binder.TWebUserControl_serial_personnel_indicators_binder"%>
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
          <td>
            <cc1:TabContainer id="TabContainer_control" autopostback="True" runat="server" cssclass="ajax__tab_ki">
              <cc1:TabPanel runat="server" headertext="# Core ops members" id="TabPanel_num_core_ops_members"></cc1:TabPanel>
              <cc1:TabPanel runat="server" headertext="# Members in pipeline" id="TabPanel_num_members_in_pipeline"></cc1:TabPanel>
              <cc1:TabPanel runat="server" headertext="# Potential crew shifts" id="TabPanel_num_potential_crew_shifts"></cc1:TabPanel>
              <cc1:TabPanel runat="server" headertext="Median yrs of service" id="TabPanel_median_years_of_service"></cc1:TabPanel>
              <cc1:TabPanel runat="server" headertext="Core ops commitment" id="TabPanel_core_ops_commitment"></cc1:TabPanel>
              <cc1:TabPanel runat="server" headertext="Roster utilization" id="TabPanel_roster_utilization"></cc1:TabPanel>
              <cc1:TabPanel runat="server" headertext="Avail submission compliance" id="TabPanel_avail_submission_compliance"></cc1:TabPanel>
              <cc1:TabPanel runat="server" headertext="Initial schedule completion" id="TabPanel_initial_schedule_completion"></cc1:TabPanel>
              <cc1:TabPanel runat="server" headertext="'Third slot' saturation" id="TabPanel_third_slot_saturation"></cc1:TabPanel>
            </cc1:TabContainer></td>
        </tr>
        <tr>
          <td class="ki_tab_body">
            <ASP:PlaceHolder id="PlaceHolder_content" runat="server"></ASP:PlaceHolder></td>
        </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>
