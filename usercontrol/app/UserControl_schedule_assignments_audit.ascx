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
            <table cellspacing="0" cellpadding="10" border="0" width="1%">
              <tr>
                <td><b>Filters:</b></td>
                <td nowrap="nowrap">
                  <small>
                    <asp:RadioButtonList ID="RadioButtonList_relative_month" runat="server" AutoPostBack="True" onselectedindexchanged="RadioButtonList_relative_month_SelectedIndexChanged">
                      <asp:ListItem Selected="True" Value="0">This month</asp:ListItem>
                      <asp:ListItem Value="1">Next month</asp:ListItem>
                    </asp:RadioButtonList>
                  </small>
                </td>
                <td align="center" nowrap="nowrap">
                  <small>Release level</small><br/>
                  <ASP:DropDownList id="DropDownList_release_filter" runat="server" autopostback="True" onselectedindexchanged="DropDownList_release_filter_SelectedIndexChanged">
                    <ASP:ListItem value="" selected="True">All</ASP:ListItem>
                    <ASP:ListItem value="1">Released</ASP:ListItem>
                    <ASP:ListItem value="0">Not released</ASP:ListItem>
                  </ASP:DropDownList>
   							</td>
                <td nowrap="nowrap">
                  <small>
                    <asp:CheckBox ID="CheckBox_do_limit_to_compliant" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox_do_limit_to_compliant_CheckedChanged" Text="Compliant only" />
                    <br />
                    <asp:CheckBox ID="CheckBox_do_limit_to_unused_availability" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox_do_limit_to_unused_availability_CheckedChanged" Text="Unused availability only"  enabled="false"/>
                  </small>
                </td>
                <td align="center" nowrap="nowrap">
                  <small>Balance hours</small><br />
                  <asp:DropDownList ID="DropDownList_max_balance_hours" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_max_balance_hours_SelectedIndexChanged">
                    <asp:ListItem Value="" Selected="True">Any</asp:ListItem>
                    <asp:ListItem Value="0">&lt;0</asp:ListItem>
                    <asp:ListItem Value="-4">&lt;-4</asp:ListItem>
                    <asp:ListItem Value="-16">&lt;-16</asp:ListItem>
                    <asp:ListItem Value="-28">&lt;-28</asp:ListItem>
                    <asp:ListItem Value="-40">&lt;-40</asp:ListItem>
                  </asp:DropDownList>
                </td>
              </tr>
            </table>
          </td>
          <td><asp:Button ID="Button_randomize" runat="server" Text="Randomize" OnClick="Button_randomize_Click" /></td>
        </tr>
        <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
        <tr>
          <td>
            <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False" AllowSorting="True" OnSortCommand="DataGrid_control_SortCommand">
              <Columns>
                <asp:BoundColumn datafield="agency" HeaderText="Agency" SortExpression="agency%, be_released desc, last_name, first_name, cad_num">
                  <HeaderStyle HorizontalAlign="Center" />
                  <ItemStyle HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="name" headertext="Name" SortExpression="last_name%, first_name, cad_num"></asp:BoundColumn>
                <asp:BoundColumn datafield="cad_num" headertext="CAD #" SortExpression="cad_num%">
                  <HeaderStyle HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="be_released" headertext="Released?" SortExpression="be_released%, agency, be_released desc, last_name, first_name, cad_num">
                  <ItemStyle HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="enrollment_level" headertext="Membership status" SortExpression="enrollment_level.pecking_order%, be_released desc, agency, last_name, first_name, cad_num">
                  <HeaderStyle HorizontalAlign="Center" />
                  <ItemStyle HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="be_on_squad_truck_team" HeaderText="SQTM?" visible="false" SortExpression="be_on_squad_truck_team%, agency, be_released desc, last_name, first_name, cad_num">
                  <ItemStyle HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="obligation" headertext="Obliged hours" SortExpression="CAST(obligation as DECIMAL)%, agency, be_released desc, last_name, first_name, cad_num">
                  <ItemStyle HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="be_compliant" headertext="Compliant?" SortExpression="be_compliant%, agency, be_released desc, last_name, first_name, cad_num">
                  <ItemStyle HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="num_avails" headertext="Available hours" SortExpression="CAST(num_avails AS DECIMAL)%, agency, be_released desc, last_name, first_name, cad_num">
                  <ItemStyle HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="num_assignments" headertext="Assigned hours" SortExpression="CAST(num_assignments AS DECIMAL)%, agency, be_released desc, last_name, first_name, cad_num">
                  <ItemStyle HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="balance" headertext="Balance hours" SortExpression="CAST(balance AS DECIMAL)%, agency, be_released desc, last_name, first_name, cad_num">
                  <ItemStyle HorizontalAlign="Right" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="num_ambulance_hours" headertext="Ambulance hours" SortExpression="CAST(num_ambulance_hours AS DECIMAL)%, agency, be_released desc, last_name, first_name, cad_num">
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
