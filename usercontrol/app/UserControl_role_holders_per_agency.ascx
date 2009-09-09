<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_role_holders_per_agency.ascx.cs" Inherits="UserControl_role_holders_per_agency.TWebUserControl_role_holders_per_agency"%>
<table cellspacing="0" cellpadding="10" border="0">
  <tr>
    <td valign="top">
      <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" border="0">
              <tr>
                <td bgcolor="#f5f5f5"><strong>Role Holders</strong></td>
              </tr>
              <tr>
                <td>
                  <asp:GridView id="GridView_role_holders" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False" emptydatatext="No data available" bordercolor="Gainsboro" borderwidth="1px">
                    <Columns>
                      <asp:BoundField datafield="role_name" headertext="Role"></asp:BoundField>
                      <asp:BoundField datafield="member_name" headertext="Member"></asp:BoundField>
                    </Columns>
                    <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                  </asp:GridView>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td valign="top">
      <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" border="0">
              <tr>
                <td bgcolor="#f5f5f5"><strong>Unassigned Roles</strong></td>
              </tr>
              <tr>
                <td>
                  <asp:GridView id="GridView_unassigned_roles" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False" emptydatatext="None" bordercolor="Gainsboro" borderwidth="1px" showheader="False">
                    <Columns>
                      <asp:BoundField datafield="role_name"></asp:BoundField>
                    </Columns>
                  </asp:GridView>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
