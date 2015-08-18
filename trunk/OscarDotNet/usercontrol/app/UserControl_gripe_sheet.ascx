<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_gripe_sheet.ascx.cs" Inherits="UserControl_gripe_sheet.TWebUserControl_gripe_sheet"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" border="0" width="100%">
        <tr>
          <td bgcolor="#dcdcdc">
            <table cellspacing="0" cellpadding="10" border="0" width="100%">
              <tr>
                <td nowrap="nowrap">
                  <b>Gripes for vehicle <asp:Literal ID="Literal_vehicle_name" runat="server"></asp:Literal></b>&nbsp; (<asp:Literal ID="Literal_num_requests" runat="server"></asp:Literal>&nbsp;items)
                </td>
                <td align="center">
                  <asp:Panel ID="Panel_generation_timestamp" runat="server" Visible="False"><small>Generated&nbsp;<asp:Literal ID="Literal_generation_timestamp" runat="server"></asp:Literal></small></asp:Panel>                      
                </td>
                <td align="center"><asp:CheckBox ID="CheckBox_be_work_order_mode" runat="server" AutoPostBack="True" Text="Work order mode" Visible="False" oncheckedchanged="CheckBox_be_work_order_mode_CheckedChanged" /></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr id="TableRow_best_practices" runat="server">
          <td>
            <small>
              <p>Best practices:</p>
              <ul>
                <li>This is a log of requested <b>vehicular</b> repairs or improvements that do not require putting the vehicle DOWN immediately.</li>
                <li>Do not use this log to request work relating to supplies or portable or EMS-specific equipment.</li>
                <li>Check to see if known issues are already documented.</li>
                <li>To enter a new gripe, scroll to the bottom of this page and click the NEW GRIPE button.</li>
              </ul>
            </small>
          </td>
        </tr>
        <tr id="TableRow_work_order_instructions" runat="server" visible="false">
          <td>
            <table cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td width="99%"><big><big><b><u>TECHNICIAN and/or SERVICE ADVISOR:</u></b></big></big></td>
                <td align="right" width="1%">
                  <asp:Button ID="Button_send_to_city_garage" runat="server" Text="Email to City Garage" onclick="Button_send_to_city_garage_Click" Width="100%" />
                  <br /><br />
                  <asp:Button ID="Button_send_to_comit" runat="server" Text="Email to ComIT" onclick="Button_send_to_comit_Click" Width="100%" />
                </td>
              </tr>
            </table>
            <p>Reference this vehicle:</p>
            <blockquote>
              <small>
                <table cellspacing="0" cellpadding="3" border="1" bordercolor="Gainsboro">
                  <tr>
                    <td>
                      <table cellspacing="0" cellpadding="5" border="0">
                        <tr>
                          <td valign="top">
                            <table cellspacing="0" cellpadding="1" border="0">
                              <tr>
                                <td align="right" nowrap="nowrap">Kind/name:&nbsp;</td>
                                <td nowrap="nowrap"><asp:Literal ID="Literal_kind" runat="server"></asp:Literal>&nbsp;<asp:Literal ID="Literal_vehicle_name_2" runat="server"></asp:Literal></td>
                              </tr>
                              <tr>
                                <td align="right" nowrap="nowrap">Bumper #:&nbsp;</td>
                                <td nowrap="nowrap"><asp:Literal ID="Literal_bumper_number" runat="server"></asp:Literal></td>
                              </tr>
                            </table>
                          </td>
                          <td>&nbsp;</td>
                          <td valign="top">
                            <table cellspacing="0" cellpadding="1" border="0">
                              <tr>
                                <td align="right" nowrap="nowrap">Model year:&nbsp;</td>
                                <td nowrap="nowrap"><asp:Literal ID="Literal_model_year" runat="server"></asp:Literal></td>
                              </tr>
                              <tr>
                                <td align="right" nowrap="nowrap">Chassis make/model:&nbsp;</td>
                                <td nowrap="nowrap"><asp:Literal ID="Literal_chassis_make" runat="server"></asp:Literal>&nbsp;<asp:Literal ID="Literal_chassis_model" runat="server"></asp:Literal></td>
                              </tr>
                              <tr>
                                <td align="right" nowrap="nowrap">Custom make/model:&nbsp;</td>
                                <td nowrap="nowrap"><asp:Literal ID="Literal_custom_make" runat="server"></asp:Literal>&nbsp;<asp:Literal ID="Literal_custom_model" runat="server"></asp:Literal></td>
                              </tr>
                              <tr>
                                <td align="right" nowrap="nowrap">VIN:&nbsp;</td>
                                <td nowrap="nowrap"><asp:Literal ID="Literal_vin" runat="server"></asp:Literal></td>
                              </tr>
                              <tr>
                                <td align="right" nowrap="nowrap">Fuel:&nbsp;</td>
                                <td nowrap="nowrap"><asp:Literal ID="Literal_fuel" runat="server"></asp:Literal></td>
                              </tr>
                              <tr>
                                <td align="right" nowrap="nowrap">License plate:&nbsp;</td>
                                <td nowrap="nowrap"><asp:Literal ID="Literal_tag" runat="server"></asp:Literal></td>
                              </tr>
                              <tr>
                                <td align="right" nowrap="nowrap">4WD/AWD:&nbsp;</td>
                                <td nowrap="nowrap"><asp:Literal ID="Literal_be_four_or_all_wheel_drive" runat="server"></asp:Literal></td>
                              </tr>
                            </table>
                          </td>
                          <td>&nbsp;</td>
                          <td valign="top">
                            <table cellspacing="0" cellpadding="1" border="0">
                              <tr>
                                <td align="right" nowrap="nowrap">Recent mileage:&nbsp;</td>
                                <td nowrap="nowrap">as of <asp:Literal ID="Literal_recent_mileage_update_time_2" runat="server"></asp:Literal> = <asp:Literal ID="Literal_recent_mileage" runat="server"></asp:Literal></td>
                              </tr>
                              <tr>
                                <td align="right" nowrap="nowrap">Miles from PM:&nbsp;</td>
                                <td nowrap="nowrap">as of <asp:Literal ID="Literal_recent_mileage_update_time" runat="server"></asp:Literal> = <asp:Literal ID="Literal_miles_from_pm" runat="server"></asp:Literal></td>
                              </tr>
                              <tr>
                                <td align="right" nowrap="nowrap">DMV inspection due:&nbsp;</td>
                                <td nowrap="nowrap"><asp:Literal ID="Literal_dmv_inspection_due" runat="server"></asp:Literal></td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </small>
            </blockquote>
            <p></p>
            <p>You can reach me as follows:</p>
            <blockquote>
              <table cellspacing="0" cellpadding="3" border="1" bordercolor="Gainsboro">
                <tr>
                  <td>
                    <table cellspacing="0" cellpadding="1" border="0">
                      <tr>
                        <td align="right"><asp:Literal ID="Literal_work_order_coordinator_title" runat="server"></asp:Literal>:&nbsp;</td>
                        <td><asp:Literal ID="Literal_work_order_coordinator_name" runat="server"></asp:Literal></td>
                      </tr>
                      <tr>
                        <td align="right">on behalf of:&nbsp;</td>
                        <td><asp:Literal ID="Literal_agency_long_designator" runat="server"></asp:Literal></td>
                      </tr>
                      <tr>
                        <td align="right">tel:&nbsp;</td>
                        <td><asp:Literal ID="Literal_work_order_coordinator_phone_num" runat="server"></asp:Literal></td>
                      </tr>
                      <tr>
                        <td align="right">mailto:&nbsp;</td>
                        <td><i><asp:Literal ID="Literal_work_order_coordinator_email_address" runat="server"></asp:Literal></i></td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </blockquote>
            <p></p>
            <b>PLEASE RESOLVE THE FOLLOWING ISSUES DOCUMENTED BY THE INDICATED MEMBERS:</b>
          </td>
        </tr>
        <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
        <tr>
          <td>
            <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False" allowsorting="True">
              <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
              <Columns>
                <asp:ButtonColumn text="YES" commandname="ToggleInclusion" HeaderText="Include on work order">
                  <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                  <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top" HorizontalAlign="Center" />
                </asp:ButtonColumn>
                <asp:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/delete_x16_h.png&quot; alt=&quot;Delete&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Delete" Visible="False" HeaderText="Delete">
                  <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Bottom" />
                  <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top" />
                </asp:ButtonColumn>
                <asp:BoundColumn datafield="id" headertext="#" SortExpression="id%">
                  <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Bottom" />
                  <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top" HorizontalAlign="Right" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="description" headertext="Description">
                  <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
                </asp:BoundColumn>
                <asp:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/draw_freehand_16_h.png&quot; alt=&quot;Append&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Append" HeaderText="Append note">
                  <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Bottom" />
                  <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top" HorizontalAlign="Center" />
                </asp:ButtonColumn>
              </Columns>
            </asp:DataGrid>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<p><asp:Button ID="Button_new" runat="server" CausesValidation="False" Font-Bold="True" Text="NEW GRIPE" onclick="Button_new_Click"></asp:Button></p>
<asp:Panel ID="Panel_page_break" runat="server" Visible="false"><i>--&nbsp;END&nbsp;--</i><div style="page-break-before:always;" /></asp:Panel>