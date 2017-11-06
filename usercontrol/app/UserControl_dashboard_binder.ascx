<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_dashboard_binder.ascx.cs" Inherits="UserControl_dashboard_binder.TWebUserControl_dashboard_binder" %>
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
          <td>
            <cc1:TabContainer id="TabContainer_control" autopostback="True" runat="server" cssclass="ajax__tab_ki" CssTheme="None">
              <cc1:TabPanel runat="server" headertext="Current" id="TabPanel_current"></cc1:TabPanel>
              <cc1:TabPanel runat="server" headertext="Serial" id="TabPanel_serial"></cc1:TabPanel>
            </cc1:TabContainer></td>
        </tr>
        <tr>
          <td class="ki_tab_body">
            <ASP:PlaceHolder id="PlaceHolder_content" runat="server"></ASP:PlaceHolder></td>
        </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>
