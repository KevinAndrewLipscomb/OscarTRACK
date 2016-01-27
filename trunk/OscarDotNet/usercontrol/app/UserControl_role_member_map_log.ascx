<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_role_member_map_log.ascx.cs" Inherits="UserControl_role_member_map_log.TWebUserControl_role_member_map_log"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" border="0">
        <tr>
          <td bgcolor="#dcdcdc">
            <table width="100%">
              <tr>
                <td><b>Role history</b></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td align="right"><small>
                  <asp:LinkButton ID="LinkButton_manage_roles" runat="server" OnClick="LinkButton_manage_roles_Click">Manage roles</asp:LinkButton></small></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
        <tr>
          <td>
            <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="5" autogeneratecolumns="False" Font-Size="Small" AllowSorting="True">
              <Columns>
                <asp:BoundColumn datafield="be_granted" headertext="Action" SortExpression="be_granted%,at,role.pecking_order"></asp:BoundColumn>
                <asp:BoundColumn datafield="role" headertext="Role" SortExpression="role.pecking_order%,at"></asp:BoundColumn>
                <asp:BoundColumn datafield="actor" headertext="By" SortExpression="actor.last_name%,actor.first_name,at,role.pecking_order"></asp:BoundColumn>
                <asp:BoundColumn datafield="at" headertext="At" SortExpression="at%,role.pecking_order"></asp:BoundColumn>
              </Columns>
              <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
            </asp:DataGrid>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
