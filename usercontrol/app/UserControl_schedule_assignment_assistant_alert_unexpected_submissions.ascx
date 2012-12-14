<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_schedule_assignment_assistant_alert_unexpected_submissions.ascx.cs"
  Inherits="UserControl_schedule_assignment_assistant_alert_unexpected_submissions.TWebUserControl_schedule_assignment_assistant_alert_unexpected_submissions" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table cellspacing="0" cellpadding="10" border="0">
  <tr>
    <td>
      <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" width="100%" border="0">
              <tr id="TableRow_guidance" runat="server" bgcolor="WhiteSmoke">
                <td bgcolor="Khaki">
                  <b>Guidance:</b> The following members submitted availabilities, but <asp:Literal ID="Literal_application_name" runat="server"></asp:Literal> did not expect them to, and did not select them for any duties.
                    <ul>
                      <li>If a member <strong>may or should</strong> run duties, click their name and FORCE them ON for the correct number of shifts.&nbsp; Consider getting the member's status updated under the Personnel tab.</li>
                      <li>If a member should <strong>not</strong> run duties, no action is required.</li>
                    </ul>
                  You should review these alerts before moving on to later steps, because each change may also solve other scheduling issues.
                </td>
              </tr>
              <tr>
                <td>
                  <asp:datagrid id="W" runat="server" border="0" autogeneratecolumns="False" useaccessibleheader="True" onitemdatabound="W_ItemDataBound" onitemcommand="W_ItemCommand" ShowHeader="False" GridLines="None">
                    <Columns>
                      <asp:ButtonColumn DataTextField="name">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Left" />
                      </asp:ButtonColumn>
                      <asp:BoundColumn DataField="member_id" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="target_agency_id" Visible="False"></asp:BoundColumn>
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
