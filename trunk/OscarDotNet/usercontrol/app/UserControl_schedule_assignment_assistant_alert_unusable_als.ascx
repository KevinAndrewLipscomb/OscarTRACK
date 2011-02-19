<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_schedule_assignment_assistant_alert_unusable_als.ascx.cs"
  Inherits="UserControl_schedule_assignment_assistant_alert_unusable_als.TWebUserControl_schedule_assignment_assistant_alert_unusable_als" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table cellspacing="0" cellpadding="10" width="100%" border="0">
  <tr>
    <td>
      <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" width="100%" border="0">
              <tr>
                <td>
                  <asp:datagrid id="W" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="2" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px" onitemdatabound="W_ItemDataBound" onitemcommand="W_ItemCommand">
                    <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                    <Columns>
                      <asp:ButtonColumn DataTextField="name" HeaderText="This member...">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" />
                      </asp:ButtonColumn>
                      <asp:BoundColumn DataField="member_id" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="agency_id" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="first_nominal_day" HeaderText="..is selected for this shift.." ReadOnly="True">
                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="first_shift_name" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="first_schedule_assignment_id" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="unusable_als" HeaderText="..with this many hours.." ReadOnly="True">
                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="second_nominal_day" HeaderText="..until this selected shift.." ReadOnly="True">
                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="second_shift_name" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="second_schedule_assignment_id" Visible="False"></asp:BoundColumn>
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
