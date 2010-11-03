<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_fund_drive_object_binder.ascx.cs" Inherits="UserControl_fund_drive_object_binder.TWebUserControl_fund_drive_object_binder"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~fund_drive_object~binder.ascx-fund_drive_object -->
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
      <tr>
        <td>
          <cc1:TabContainer id="TabContainer_control" runat="server" autopostback="True" cssclass="ajax__tab_ki">
            <cc1:TabPanel runat="server" headertext="Street" id="TabPanel_street"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="City" id="TabPanel_city"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="State" id="TabPanel_state"></cc1:TabPanel>
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