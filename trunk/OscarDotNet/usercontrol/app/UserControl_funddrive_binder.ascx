<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_funddrive_binder.ascx.cs" Inherits="UserControl_funddrive_binder.TWebUserControl_funddrive_binder"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~funddrive~binder.ascx-funddrive -->
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
      <tr>
        <td>
          <cc1:TabContainer id="TabContainer_control" runat="server" autopostback="True" cssclass="ajax__tab_ki">
            <cc1:TabPanel runat="server" headertext="About this module" id="TabPanel_about"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="KEYclick" id="TabPanel_keyclick" visible="False"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Love letters" id="TabPanel_love_letters" visible="False"></cc1:TabPanel>
<%--        
            <cc1:TabPanel runat="server" headertext="New donation" id="TabPanel_new_donation" enabled="False"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Old donation" id="TabPanel_old_donation" enabled="False"></cc1:TabPanel>
--%>
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