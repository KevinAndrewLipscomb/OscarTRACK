<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_departures_effective_today.ascx.cs" Inherits="UserControl_departures_effective_today.TWebUserControl_departures_effective_today"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
  <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
    <tr>
      <td>
        <table cellspacing="0" cellpadding="10" border="0">
          <tr>
            <td bgcolor="#dcdcdc">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr>
                  <td align="right">
                    <asp:Literal ID="Literal_num_departures" runat="server"></asp:Literal> departures
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
          <tr>
            <td>
              <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False" allowsorting="True" ShowHeader="false">
                <Columns>
                  <asp:BoundColumn datafield="departure"></asp:BoundColumn>
                </Columns>
              </asp:DataGrid>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
