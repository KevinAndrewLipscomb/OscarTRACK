<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_business_objects_binder.ascx.cs" Inherits="UserControl_business_objects_binder.TWebUserControl_business_objects_binder"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~binder.ascx-template -->
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
      <tr>
        <td>
          <cc1:TabContainer id="TabContainer_control" runat="server" autopostback="True" cssclass="ajax__tab_ki">
            <cc1:TabPanel runat="server" headertext="Agencies" id="TabPanel_agencies" enabled="False"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Satellite stations" id="TabPanel_satellite_stations" enabled="False"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Fleet objects" id="TabPanel_fleet_objects" enabled="False"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Fund drive objects" id="TabPanel_fund_drive_objects" enabled="False"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Shifts" id="TabPanel_shifts" enabled="False"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Eval objects" id="TabPanel_eval_objects" enabled="False"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="SMS gateways" id="TabPanel_sms_gateways" enabled="False"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="CAD objects" id="TabPanel_cad_objects" enabled="False"></cc1:TabPanel>
          </cc1:TabContainer>
        </td>
      </tr>
      <tr>
        <td class="ki_tab_body">
          <ASP:PlaceHolder id="PlaceHolder_content" runat="server"></ASP:PlaceHolder>
        </td>
      </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>