<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_dashboard_binder.ascx.cs" Inherits="UserControl_dashboard_binder.TWebUserControl_dashboard_binder" %>
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
          <td>
            <cc1:TabContainer id="TabContainer_control" autopostback="True" runat="server" cssclass="ajax__tab_ki">
              <cc1:TabPanel runat="server" headertext="Current" id="TabPanel_current"></cc1:TabPanel>
              <cc1:TabPanel runat="server" headertext="Serial" id="TabPanel_serial"></cc1:TabPanel>
            </cc1:TabContainer></td>
        </tr>
        <tr>
          <td style="BORDER-RIGHT: silver thin solid; PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: silver thin solid; PADDING-TOP: 10px; BORDER-BOTTOM: silver thin solid">
            <ASP:PlaceHolder id="PlaceHolder_content" runat="server"></ASP:PlaceHolder></td>
        </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>
