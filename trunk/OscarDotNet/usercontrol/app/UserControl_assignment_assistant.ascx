<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_assignment_assistant.ascx.cs"
  Inherits="UserControl_assignment_assistant.TWebUserControl_assignment_assistant" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" width="100%" border="1">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" width="100%" border="0">
        <tr bgcolor="#f5f5f5"><td><strong>The <i>Schedule Assignment Assistant</i> is a work in progress.</strong></td></tr>
        <tr>
          <td>
            <small>
              <p>Currently, it does the following, in this order:&nbsp; (1) Loads new availabilities submitted by members; (2) Accounts for member flexibility and shift popularity; (3) Corrects imbalances based on need; (4) Gives EMT Interns and Trainees the
              minimum intended number of shifts; (5) Takes turns giving Trainees extra shifts to the extent requested and possible.</p>
            </small>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
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
                <td align="center" nowrap="nowrap">
                  <small>Depth</small><br/>
                  <ASP:DropDownList id="DropDownList_depth" runat="server" autopostback="True" onselectedindexchanged="DropDownList_depth_SelectedIndexChanged">
                    <ASP:ListItem value="" selected="True">All</ASP:ListItem>
                    <ASP:ListItem value="1">Selected</ASP:ListItem>
                    <ASP:ListItem value="0">Not selected</ASP:ListItem>
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
            <table cellspacing="0" cellpadding="5" width="100%" border="0" align="center">
              <tr>
                <td align="center" valign="middle"><small><b><asp:literal id="Literal_num_members" runat="server"></asp:literal></b><br/>members</small></td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td align="center" valign="middle"><small><b><ASP:literal id="Literal_num_crew_shifts" runat="server"></ASP:literal></b><br/>crew-shifts</small></td>
              </tr>
            </table>
            <small>
              <asp:DataList ID="DataList_key" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" ShowFooter="False" ShowHeader="False">
                <ItemTemplate>
                  <asp:Literal ID="Literal_watchbill_rendition" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"watchbill_rendition") %>'></asp:Literal>&nbsp;=&nbsp;<asp:Literal ID="Literal_description" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"description") %>'></asp:Literal>,&nbsp;
                </ItemTemplate>
              </asp:DataList>
              Ð&nbsp;=&nbsp;non-driver
            </small>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr id="TableRow_none" runat="server"><td><p></p><em>--&nbsp;NONE&nbsp;--</em></td></tr>
  <tr>
    <td>
      <asp:datagrid id="A" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="2" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px" onitemdatabound="A_ItemDataBound">
        <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
        <Columns>
          <asp:BoundColumn DataField="nominal_day" HeaderText="Nominal day" ReadOnly="True">
            <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="XX-Large" Font-Strikeout="False" Font-Underline="False" />
            <ItemStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="XX-Large" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Right" />
          </asp:BoundColumn>
          <asp:BoundColumn DataField="display_seq_num" ReadOnly="True" Visible="False"></asp:BoundColumn>
          <asp:TemplateColumn><ItemTemplate>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</ItemTemplate></asp:TemplateColumn>
          <asp:BoundColumn DataField="d_num_units_from_agency" DataFormatString="{0:F1}" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:TemplateColumn>
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
            <ItemTemplate>/</ItemTemplate>
          </asp:TemplateColumn>
          <asp:BoundColumn DataField="d_num_units_citywide" DataFormatString="{0:F1}" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:TemplateColumn><ItemTemplate>&nbsp;&nbsp;&nbsp;</ItemTemplate></asp:TemplateColumn>
          <asp:BoundColumn DataField="d_assignment_id" ReadOnly="True" Visible="False"></asp:BoundColumn>
          <asp:BoundColumn DataField="d_post_id" ReadOnly="True" Visible="False"></asp:BoundColumn>
          <asp:BoundColumn DataField="d_agency_short_designator" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:BoundColumn DataField="d_post_cardinality" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:BoundColumn DataField="d_medical_release_description" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" HorizontalAlign="Center" />
          </asp:BoundColumn>
          <asp:TemplateColumn>
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
            <ItemTemplate>:</ItemTemplate>
          </asp:TemplateColumn>
          <asp:BoundColumn DataField="d_name" HeaderText="DAY" ReadOnly="True">
            <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" />
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:BoundColumn DataField="d_be_driver_qualified" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:BoundColumn DataField="d_be_selected" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:BoundColumn DataField="d_comment">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:TemplateColumn><ItemTemplate>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</ItemTemplate></asp:TemplateColumn>
          <asp:BoundColumn DataField="n_num_units_from_agency" DataFormatString="{0:F1}" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:TemplateColumn>
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
            <ItemTemplate>/</ItemTemplate>
          </asp:TemplateColumn>
          <asp:BoundColumn DataField="n_num_units_citywide" DataFormatString="{0:F1}" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:TemplateColumn><ItemTemplate>&nbsp;&nbsp;&nbsp;</ItemTemplate></asp:TemplateColumn>
          <asp:BoundColumn DataField="n_assignment_id" ReadOnly="True" Visible="False"></asp:BoundColumn>
          <asp:BoundColumn DataField="n_post_id" ReadOnly="True" Visible="False"></asp:BoundColumn>
          <asp:BoundColumn DataField="n_agency_short_designator" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:BoundColumn DataField="n_post_cardinality" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:BoundColumn DataField="n_medical_release_description" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" HorizontalAlign="Center" />
          </asp:BoundColumn>
          <asp:TemplateColumn>
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
            <ItemTemplate>:</ItemTemplate>
          </asp:TemplateColumn>
          <asp:BoundColumn DataField="n_name" HeaderText="NIGHT" ReadOnly="True">
            <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" />
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:BoundColumn DataField="n_be_driver_qualified" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:BoundColumn DataField="n_be_selected" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:BoundColumn DataField="n_comment">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
        </Columns>
      </asp:datagrid>
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
                  <asp:datagrid id="W" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="2" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px" onitemdatabound="W_ItemDataBound">
                    <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                    <Columns>
                      <asp:BoundColumn DataField="name" HeaderText="This member.." ReadOnly="True">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" />
                      </asp:BoundColumn>
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
