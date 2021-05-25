<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_schedule_assignment_assistant_alert_time_on.ascx.cs"
  Inherits="UserControl_schedule_assignment_assistant_alert_time_on.TWebUserControl_schedule_assignment_assistant_alert_time_on" %>
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
                  <b>Guidance:</b> Per <b><a href="http://www.vbems.com/deputychief/documents/Policies_PDF/103.01.01.Maximum_Consecutive_Shift_Duty_Policy.pdf" target="_blank">policy</a></b>, no member may work more than 27
                  continuous hours of patient care duty.&nbsp; You <b><i>must</i></b> resolve every alert listed below, otherwise the indicated duty assignments will be invalid.&nbsp; To resolve one of these alerts, click the
                  member's name, and on the following page, SWAP one or more of the member's assignments to eliminate the policy violation.&nbsp; You should review these alerts before moving on to later steps, because each
                  change may also solve other scheduling issues.
                </td>
              </tr>
              <tr>
                <td>
                  <asp:datagrid id="W" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="2" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px" onitemdatabound="W_ItemDataBound" onitemcommand="W_ItemCommand">
                    <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                    <Columns>
                      <asp:BoundColumn DataField="nominal_day" HeaderText="By the end of this shift.." ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="shift_name" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="comment" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="level" Visible="False">
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:ButtonColumn DataTextField="name" HeaderText="..this member...">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                      </asp:ButtonColumn>
                      <asp:BoundColumn DataField="member_id" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="agency_id" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="time_on" HeaderText="..will have run this many hours.." ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
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
