<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_schedule_assignment_assistant_alert_binder.ascx.cs" Inherits="UserControl_schedule_assignment_assistant_alert_binder.TWebUserControl_schedule_assignment_assistant_alert_binder"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~binder.ascx-template -->
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
      <tr>
        <td>
          <cc1:TabContainer id="TabContainer_control" runat="server" autopostback="True" cssclass="ajax__tab_ki" CssTheme="None">
            <cc1:TabPanel runat="server" headertext="Unexpected & cross-agency submissions" id="TabPanel_unexpected_submissions"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Time off" id="TabPanel_time_off"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Time on" id="TabPanel_time_on"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Travel gap" id="TabPanel_travel_gap"></cc1:TabPanel>
          </cc1:TabContainer>
        </td>
      </tr>
      <tr>
        <td class="ki_tab_body">
          <ASP:PlaceHolder id="PlaceHolder_content" runat="server"></ASP:PlaceHolder>
        </td>
      </tr>
    </table>
