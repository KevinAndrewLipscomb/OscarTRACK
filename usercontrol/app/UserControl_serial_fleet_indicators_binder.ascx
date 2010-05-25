<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_serial_fleet_indicators_binder.ascx.cs" Inherits="UserControl_serial_fleet_indicators_binder.TWebUserControl_serial_fleet_indicators_binder"%>
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
          <td>
            <cc1:TabContainer id="TabContainer_control" autopostback="True" runat="server" cssclass="ajax__tab_ki">
              <cc1:TabPanel runat="server" headertext="Fleet tracking participation" id="TabPanel_fleet_tracking_participation"></cc1:TabPanel>
              <cc1:TabPanel runat="server" headertext="Vehicles UP-and-current" id="TabPanel_vehicles_up_and_current"></cc1:TabPanel>
            </cc1:TabContainer></td>
        </tr>
        <tr>
          <td style="BORDER-RIGHT: silver thin solid; PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: silver thin solid; PADDING-TOP: 10px; BORDER-BOTTOM: silver thin solid">
            <ASP:PlaceHolder id="PlaceHolder_content" runat="server"></ASP:PlaceHolder></td>
        </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>
