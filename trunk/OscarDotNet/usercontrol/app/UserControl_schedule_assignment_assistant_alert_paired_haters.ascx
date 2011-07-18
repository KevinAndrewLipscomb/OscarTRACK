<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_schedule_assignment_assistant_alert_paired_haters.ascx.cs" Inherits="UserControl_schedule_assignment_assistant_alert_paired_haters.TWebUserControl_schedule_assignment_assistant_alert_paired_haters" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<asp:Panel ID="Panel_supressed" runat="server"><p></p><em>--&nbsp;SUPRESSED&nbsp;--</em></asp:Panel>
<table id="Table_data" runat="server" cellspacing="0" cellpadding="10" border="0">
  <tr>
    <td>
      <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" width="100%" border="0">
              <tr>
                <td>
                  <asp:datagrid id="W" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="10" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px" onitemdatabound="W_ItemDataBound" onitemcommand="W_ItemCommand">
                    <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                    <Columns>
                      <asp:ButtonColumn DataTextField="nominal_day" HeaderText="Shift">
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:ButtonColumn>
                      <asp:BoundColumn DataField="shift_name" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="post"></asp:BoundColumn>
                      <asp:BoundColumn DataField="post_cardinality"></asp:BoundColumn>
                      <asp:BoundColumn DataField="agency_id" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="member_name_1">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Left" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="member_id_1" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="member_name_2">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Left" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="member_id_2" Visible="False"></asp:BoundColumn>
                    </Columns>
                  </asp:datagrid>
                </td>
              </tr>
              <tr id="TableRow_none" runat="server"><td><p></p><em>--&nbsp;NONE&nbsp;--</em></td></tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
