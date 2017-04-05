<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_schedule_assignments_audit.ascx.cs" Inherits="UserControl_schedule_assignments_audit.TWebUserControl_schedule_assignments_audit"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" border="0">
        <tr>
          <td>
            <small>
              <p>Best practices</p>
              <ul>
                <li><p>The data in this report is most useful at the very beginning of the scheduling cycle, then it rapidly becomes less useful.</p></li>
                <li>
                  <p>
                    The recommended practice is for a squad to be accountable for fielding the aggregate amount of crew-shifts that are commensurate with its overall manpower, and to manage the details internally.&nbsp; This
                    control, however, accounts for duty hours scheduled per member.
                  </p>
                </li>
                <li>
                  <p>
                    There are many valid reasons why a member may show a deficit of duty hours even though they are compliant with policy.&nbsp; For instance, a member may have compliantly found coverage for a scheduled duty,
                    and if the schedule was adjusted to show the change, the member will thereafter show a duty hour deficit.
                  </p>
                </li>
                <li><p>The <i>Ambulance hours</i> metric is only provided to support certain incentive programs.&nbsp; It is <u>not</u> a valid measure of patient care hours.</p></li>
              </ul>
            </small>
          </td>
        </tr>
        <tr>
          <td bgcolor="#dcdcdc">
            <table cellspacing="0" cellpadding="0" border="0">
              <tr>
                <td><b>Filter:</b></td>
                <td>
                  <small>
                    <asp:RadioButtonList ID="RadioButtonList_relative_month" runat="server" AutoPostBack="True" onselectedindexchanged="RadioButtonList_relative_month_SelectedIndexChanged">
                      <asp:ListItem Selected="True" Value="0">This month</asp:ListItem>
                      <asp:ListItem Value="1">Next month</asp:ListItem>
                    </asp:RadioButtonList>
                  </small>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
        <tr>
          <td>
            <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False">
              <Columns>
                <asp:BoundColumn datafield="agency" HeaderText="Agency">
                  <HeaderStyle HorizontalAlign="Center" />
                  <ItemStyle HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="name" headertext="Name"></asp:BoundColumn>
                <asp:BoundColumn datafield="cad_num" headertext="CAD #">
                  <HeaderStyle HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="be_released" headertext="Released?">
                  <ItemStyle HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="enrollment_level" headertext="Membership status">
                  <HeaderStyle HorizontalAlign="Center" />
                  <ItemStyle HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="be_on_squad_truck_team" HeaderText="SQTM?">
                  <ItemStyle HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="obligation" headertext="Obliged hours">
                  <ItemStyle HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="be_compliant" headertext="Compliant?">
                  <ItemStyle HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="num_avails" headertext="Available hours">
                  <ItemStyle HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="num_assignments" headertext="Assigned hours">
                  <ItemStyle HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="balance" headertext="Balance hours">
                  <ItemStyle HorizontalAlign="Right" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="num_ambulance_hours" headertext="Ambulance hours">
                  <ItemStyle HorizontalAlign="Right" />
                </asp:BoundColumn>
              </Columns>
              <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
            </asp:DataGrid>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
