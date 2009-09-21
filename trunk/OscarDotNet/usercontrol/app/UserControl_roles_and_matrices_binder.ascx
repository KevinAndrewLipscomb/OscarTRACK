<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_roles_and_matrices_binder.ascx.cs" Inherits="UserControl_roles_and_matrices_binder.TWebUserControl_roles_and_matrices_binder"%>
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
      <tr>
        <td>
          <cc1:TabContainer id="TabContainer_control" runat="server" autopostback="True" cssclass="ajax__tab_ki">
            <cc1:TabPanel runat="server" headertext="Roles" id="TabPanel_roles"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Role-Member mappings" id="TabPanel_role_member_mappings"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Role-Privilege mappings" id="TabPanel_role_privilege_mappings"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Role-Notification mappings" id="TabPanel_role_notification_mappings"></cc1:TabPanel>
          </cc1:TabContainer>
        </td>
      </tr>
      <tr>
        <td style="BORDER-RIGHT: silver thin solid; PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: silver thin solid; PADDING-TOP: 10px; BORDER-BOTTOM: silver thin solid">
          <p>&nbsp;</p>
          <p>Have you read the <a href="../doc/roles.aspx" target="_blank">Important Information About Roles</a>?&nbsp; <small>(opens new window)</small>
          </p>
          <ASP:PlaceHolder id="PlaceHolder_content" runat="server"></ASP:PlaceHolder>
        </td>
      </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>
