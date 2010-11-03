<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_fleet_object_binder.ascx.cs" Inherits="UserControl_fleet_object_binder.TWebUserControl_fleet_object_binder"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~fleet_object~binder.ascx-fleet_object -->
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
      <tr>
        <td>
          <cc1:TabContainer id="TabContainer_control" runat="server" autopostback="True" cssclass="ajax__tab_ki">
            <cc1:TabPanel runat="server" headertext="Vehicle kinds" id="TabPanel_vehicle_kinds"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Chassis makes" id="TabPanel_chassis_makes"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Chassis models" id="TabPanel_chassis_models"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Custom makes" id="TabPanel_custom_makes"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Custom models" id="TabPanel_custom_models"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Fuels" id="TabPanel_fuels"></cc1:TabPanel>
          </cc1:TabContainer>
        </td>
      </tr>
      <tr>
        <td style="PADDING:8px; BORDER-BOTTOM:thin solid silver; BORDER-LEFT:thin solid silver; BORDER-RIGHT:thin solid silver;">
          <ASP:PlaceHolder id="PlaceHolder_content" runat="server"></ASP:PlaceHolder>
        </td>
      </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>