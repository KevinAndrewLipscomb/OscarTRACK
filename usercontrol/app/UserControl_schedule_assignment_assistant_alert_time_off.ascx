<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_schedule_assignment_assistant_alert_time_off.ascx.cs"
  Inherits="UserControl_schedule_assignment_assistant_alert_time_off.TWebUserControl_schedule_assignment_assistant_alert_time_off" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table cellspacing="0" cellpadding="10" width="100%" border="0">
  <tr>
    <td><asp:Button ID="Button_refresh" runat="server" OnClick="Button_refresh_Click" Text="Refresh" /></td>
  </tr>
  <tr bgcolor="#f5f5f5">
    <td>
      <table cellspacing="0" cellpadding="0" border="1" bordercolor="#dcdcdc" width="100%">
        <tr>
          <td align="center">
            <table cellspacing="0" cellpadding="5" border="0" align="center" width="100%">
              <tr>
                <td align="right"><b><small>Filters:</small></b></td>
                <td id="TableData_agency_filter" runat="server" align="center">
                  <small>Agency</small><br/>
                  <asp:DropDownList ID="DropDownList_agency_filter" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_agency_filter_SelectedIndexChanged"></asp:DropDownList>
                </td>
                <td align="center" nowrap="nowrap">
                  <small>Release level</small><br/>
                  <ASP:DropDownList id="DropDownList_release_filter" runat="server" autopostback="True" onselectedindexchanged="DropDownList_release_filter_SelectedIndexChanged">
                    <ASP:ListItem value="" selected="True">All</ASP:ListItem>
                    <ASP:ListItem value="1">Released</ASP:ListItem>
                    <ASP:ListItem value="0">Not released</ASP:ListItem>
                  </ASP:DropDownList>
   							</td>
                <td nowrap="nowrap" align="left">
                  <asp:RadioButtonList ID="RadioButtonList_which_month" runat="server" Font-Size="Smaller" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList_which_month_SelectedIndexChanged">
                    <asp:ListItem Value="0" Selected="True">This&nbsp;month</asp:ListItem>
                    <asp:ListItem Value="1">Next&nbsp;month</asp:ListItem>
                  </asp:RadioButtonList>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
      <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" width="100%" border="0">
              <tr bgcolor="#f5f5f5"><td><strong>Alerts</strong></td></tr>
              <tr>
                <td>
                  <asp:datagrid id="W" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="2" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px" onitemdatabound="W_ItemDataBound" onitemcommand="W_ItemCommand">
                    <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                    <Columns>
                      <asp:ButtonColumn DataTextField="name" HeaderText="This member...">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" />
                      </asp:ButtonColumn>
                      <asp:BoundColumn DataField="member_id" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="first_nominal_day" HeaderText="..is selected for this shift.." ReadOnly="True">
                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="first_shift_name" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="first_schedule_assignment_id" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="time_off" HeaderText="..with this many hours.." ReadOnly="True">
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
              <tr id="TableRow_time_off_alert_none" runat="server"><td><p></p><em>--&nbsp;NONE&nbsp;--</em></td></tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
