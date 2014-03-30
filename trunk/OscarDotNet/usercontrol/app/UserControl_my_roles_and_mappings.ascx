<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_my_roles_and_mappings.ascx.cs" Inherits="UserControl_my_roles_and_mappings.TWebUserControl_my_roles_and_mappings"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table bordercolor="#dcdcdc" border="1" cellspacing="10" cellpadding="0" width="100%">
      <tr>
        <td>
          <table border="0" cellspacing="0" cellpadding="10" width="100%">
            <tr><td bgcolor="#dcdcdc"><strong>My ROLES</strong></td></tr>
            <tr id="TableRow_no_roles" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
            <tr><td><asp:BulletedList ID="BulletedList_role" runat="server"></asp:BulletedList></td></tr>
          </table>
        </td>
      </tr>
      <tr>
        <td>
          <table border="0" cellspacing="0" cellpadding="10" width="100%">
            <tr><td bgcolor="#dcdcdc"><strong>My PRIVILEGES</strong></td></tr>
            <tr id="TableRow_no_privileges" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
            <tr><td><asp:BulletedList ID="BulletedList_privilege" runat="server"></asp:BulletedList></td></tr>
          </table>
        </td>
      </tr>
      <tr>
        <td>
          <table border="0" cellspacing="0" cellpadding="10" width="100%">
            <tr><td bgcolor="#dcdcdc"><strong>My NOTIFICATIONS</strong></td></tr>
            <tr id="TableRow_no_notifications" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
            <tr><td><asp:BulletedList ID="BulletedList_notification" runat="server"></asp:BulletedList></td></tr>
          </table>
        </td>
      </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>
