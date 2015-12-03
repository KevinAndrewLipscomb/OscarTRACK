<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_schedule_assignment_assistant_alert_time_off.ascx.cs"
  Inherits="UserControl_schedule_assignment_assistant_alert_time_off.TWebUserControl_schedule_assignment_assistant_alert_time_off" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<asp:Panel ID="Panel_supressed" runat="server"><p></p><em>--&nbsp;SUPRESSED&nbsp;--</em></asp:Panel>
<table id="Table_data" runat="server" cellspacing="0" cellpadding="10" border="0">
  <tr>
    <td>
      <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" width="100%" border="0">
              <tr id="TableRow_guidance" runat="server" bgcolor="WhiteSmoke">
                <td bgcolor="Khaki">
                  <b>Guidance:</b> In the table below, the whole number in the middle column shows how much <i>rest time</i> the member will get between the indicated shifts (which sum up to more than 18 hours of work).
                  <ul>
                    <li>If the member is assigned 0 (zero) hours of rest time, you should click <b>AutoFix</b> <i>unless the member specifically requests back-to-back shifts</i>.</li>
                    <li>If the member is assigned 12 hours of rest time <i>between NIGHT shifts</i>, you should probably click <b>AutoFix</b> unless the member requests two nights in a row.</li>
                    <li>If the member is assigned 12 hours of rest time between <i>DAY</i> shifts, you should probably do nothing, unless the member has asked <i>not</i> to run two days in a row.</li>
                    <li>If the member is assigned 24 hours of rest time between shifts, you should probably do nothing.</li>
                  </ul>
                  <i>If the member's availabilities allow</i>, the <b>AutoFix</b> button will spread a member's assignments <i>in an optimal manner</i> to allow more rest time between shifts.&nbsp; You should review these alerts
                  before moving on to later steps, because each change may also solve other scheduling issues.
                </td>
              </tr>
              <tr>
                <td>
                  <asp:datagrid id="W" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="2" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px" onitemdatabound="W_ItemDataBound" onitemcommand="W_ItemCommand">
                    <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                    <Columns>
                      <asp:BoundColumn DataField="level" Visible="False">
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:ButtonColumn DataTextField="name" HeaderText="This member..." CommandName="SeeDetail">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Left" />
                      </asp:ButtonColumn>
                      <asp:BoundColumn DataField="member_id" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="be_member_released" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="agency_id" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="first_nominal_day" HeaderText="..is selected for this shift.." ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="first_shift_name" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="first_schedule_assignment_id" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="first_comment"></asp:BoundColumn>
                      <asp:BoundColumn DataField="time_off" HeaderText="..with this many hours.." ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="second_nominal_day" HeaderText="..until this selected shift.." ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="second_shift_name" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="second_schedule_assignment_id" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="second_comment"></asp:BoundColumn>
                      <asp:ButtonColumn ButtonType="PushButton" CommandName="AutoFix" Text="AutoFix"></asp:ButtonColumn>
                      <asp:BoundColumn DataField="note" HeaderText="Note" ReadOnly="True">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Font-Italic="True" Font-Size="Small" />
                      </asp:BoundColumn>
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
