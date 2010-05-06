<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_fleet.ascx.cs" Inherits="UserControl_fleet.TWebUserControl_fleet" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" border="0">
        <tr>
          <td bgcolor="#f5f5f5">
            <table cellspacing="0" cellpadding="5" border="0" width="100%">
              <tr>
                <td rowspan="2">
                  <table cellspacing="0" cellpadding="0" border="1" bordercolor="#dcdcdc">
                    <tr>
                      <td>
                        <table cellspacing="0" cellpadding="5" border="0" align="center">
                          <tr>
                            <td>
                              <b><small>Filters:</small></b>
                            </td>
                            <td id="TableDate_quarters_filter" runat="server">
                              <p align="center">
                                <small>Quarters</small><br>
                                <asp:DropDownList ID="DropDownList_quarters_filter" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList_quarters_filter_SelectedIndexChanged"></asp:DropDownList>
                            </td>
                            <td id="TableData_vehicle_kind_filter" runat="server">
                              <p align="center">
                                <small>Kind</small><br>
                                <asp:DropDownList ID="DropDownList_vehicle_kind_filter" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_vehicle_kind_filter_SelectedIndexChanged"></asp:DropDownList>
                            </td>
                            <td id="TableData_be_four_or_all_wheel_drive_filter" runat="server">
                              <p align="center">
                                <small>4WD/AWD only</small><br>
                                <asp:CheckBox ID="CheckBox_be_four_or_all_wheel_drive_filter" runat="server" AutoPostBack="True" oncheckedchanged="CheckBox_be_four_or_all_wheel_drive_filter_CheckedChanged" />
                            </td>
                            <td id="TableData_agency_filter" runat="server">
                              <p align="center">
                                <small>Agency</small><br>
                                <asp:DropDownList ID="DropDownList_agency_filter" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_agency_filter_SelectedIndexChanged"></asp:DropDownList>
                            </td>
                          </tr>
                        </table>
                        <table cellspacing="0" cellpadding="5" width="100%" border="0" align="center">
                          <tr>
                            <td align="center" valign="middle">
                              <small>
                                <b><asp:Literal ID="Literal_num_rows" runat="server"></asp:Literal></b><br>
                                vehicles</small></td>
                            <td>
                              &nbsp;&nbsp;&nbsp;
                            </td>
                            <td align="center" valign="middle">
                              <small>
                                <b><asp:Literal ID="Literal_num_usable" runat="server"></asp:Literal>&nbsp;&nbsp;(<asp:Literal ID="Literal_percent_usable" runat="server"></asp:Literal>)</b><br />
                                up
                              </small>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
                <td align="right" valign="top"><asp:LinkButton ID="LinkButton_add_vehicle" runat="server" Visible="False" onclick="LinkButton_add_vehicle_Click" Enabled="false">Add vehicle(s)</asp:LinkButton></td>
              </tr>
              <tr>
                <td align="right" valign="bottom">
                  <table id="Table_ambulances_citywide" runat="server" cellspacing="0" cellpadding="0" border="1" bordercolor="#dcdcdc">
                    <tr>
                      <td>
                        <table cellspacing="0" cellpadding="20" border="0" align="center">
                          <tr>
                            <td align="center">
                              <small>
                                <b><asp:Literal ID="Literal_num_ambulances_usable_citywide" runat="server"></asp:Literal>&nbsp;&nbsp;(<asp:Literal ID="Literal_percent_ambulances_usable_citywide" runat="server"></asp:Literal>)</b><br />
                                ambulances up citywide
                              </small>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr id="TableRow_none" runat="server">
          <td>
            <p></p><em>--&nbsp;NONE&nbsp;--</em>
          </td>
        </tr>
        <tr id="TableRow_data" runat="server">
          <td>
            <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
              <tr id="TableRow_interest" runat="server">
                <td>
                  <asp:RadioButtonList ID="RadioButtonList_interest" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" onselectedindexchanged="RadioButtonList_interest_SelectedIndexChanged">
                    <asp:ListItem Text="&lt;small&gt;Dynamic&lt;/small&gt;" Value="Dynamic" Selected="True"/>
                    <asp:ListItem Text="&lt;small&gt;Static&lt;/small&gt;" Value="Static"/>
                  </asp:RadioButtonList>
                </td>
              </tr>
            </table>
            <p></p>
            <asp:DataGrid ID="DataGrid_control" runat="server" GridLines="Horizontal" CellPadding="10" AutoGenerateColumns="False" AllowSorting="True">
              <HeaderStyle BackColor="WhiteSmoke"></HeaderStyle>
              <Columns>
                <asp:ButtonColumn Text="&lt;IMG src=&quot;~/protected/image/open_document16_h.png&quot; alt=&quot;Detail&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" CommandName="Select"></asp:ButtonColumn>
                <asp:BoundColumn DataField="vehicle_id" ReadOnly="True" SortExpression="vehicle_id" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="vehicle_name" HeaderText="Name" ReadOnly="True" SortExpression="vehicle_name%"></asp:BoundColumn>
                <asp:BoundColumn DataField="status" ReadOnly="True" Visible="False"></asp:BoundColumn>
                <asp:ButtonColumn CommandName="MarkDown" HeaderText="Up" SortExpression="status%,vehicle_name" Text="&lt;tt&gt;&amp;nbsp;UP&amp;nbsp;&lt;/tt&gt;">
                  <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                  <ItemStyle BackColor="Lime" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle"/>
                </asp:ButtonColumn>
                <asp:ButtonColumn CommandName="MarkUp" HeaderText="Down" SortExpression="status%,vehicle_name" Text="&lt;tt&gt;DOWN&lt;/tt&gt;">
                  <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                  <ItemStyle BackColor="LightGray" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle"/>
                </asp:ButtonColumn>
                <asp:ButtonColumn Text="&lt;IMG src=&quot;~/protected/image/draw_freehand_16_h.png&quot; alt=&quot;Journal&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" CommandName="AppendNote" Visible="false">
                  <ItemStyle BackColor="LightGray" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:ButtonColumn>
                <asp:ButtonColumn CommandName="ChangeQuarters" DataTextField="quarters" HeaderText="Quarters" SortExpression="quarters%,vehicle_name" >
                  <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                  <ItemStyle Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                </asp:ButtonColumn>
                <asp:ButtonColumn CommandName="UpdateMileage" DataTextField="last_known_mileage" HeaderText="Recent mileage" SortExpression="CAST(vehicle.recent_mileage AS unsigned)%,vehicle_name">
                  <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                  <ItemStyle Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Right" />
                </asp:ButtonColumn>
                <asp:BoundColumn DataField="miles_from_pm" HeaderText="Miles from PM" ReadOnly="True" SortExpression="CAST((recent_mileage - target_pm_mileage) AS signed)%,vehicle_name">
                  <ItemStyle HorizontalAlign="Right" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="dmv_inspection_due" HeaderText="DMV inspection due" ReadOnly="True" SortExpression="dmv_inspection_due%,vehicle_name">
                  <ItemStyle HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="model_year" HeaderText="Model year" ReadOnly="True" SortExpression="model_year%,vehicle_name"></asp:BoundColumn>
                <asp:BoundColumn DataField="chassis_make" HeaderText="Chassis make" ReadOnly="True" SortExpression="chassis_make%,chassis_model,vehicle_name">
                  <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Right" />
                  <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Right" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="chassis_model" HeaderText="Chassis model" ReadOnly="True" SortExpression="chassis_model%,chassis_make,vehicle_name"></asp:BoundColumn>
                <asp:BoundColumn DataField="be_four_or_all_wheel_drive" HeaderText="AWD / 4WD" ReadOnly="True" SortExpression="be_four_or_all_wheel_drive%,vehicle_name">
                  <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                  <ItemStyle Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="custom_make" HeaderText="Custom make" ReadOnly="True" SortExpression="custom_make%,custom_model,vehicle_name">
                  <HeaderStyle HorizontalAlign="Right" />
                  <ItemStyle HorizontalAlign="Right" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="custom_model" HeaderText="Custom model" ReadOnly="True" SortExpression="custom_model%,custom_make,vehicle_name"></asp:BoundColumn>
                <asp:BoundColumn DataField="fuel_description" HeaderText="Fuel" ReadOnly="True" SortExpression="fuel_description%,vehicle_name"></asp:BoundColumn>
                <asp:BoundColumn DataField="vehicle_kind" HeaderText="Kind" ReadOnly="True" SortExpression="vehicle_kind%,vehicle_name">
                  <HeaderStyle HorizontalAlign="Center" />
                  <ItemStyle HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="agency" HeaderText="Agency" ReadOnly="True" SortExpression="agency%,vehicle_name"></asp:BoundColumn>
                <asp:BoundColumn DataField="bumper_number" HeaderText="Bumper #" ReadOnly="True" SortExpression="bumper_number%">
                  <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="tag" HeaderText="Tag" ReadOnly="True" SortExpression="tag%"></asp:BoundColumn>
                <asp:BoundColumn DataField="vin" HeaderText="VIN" ReadOnly="True" SortExpression="vin%"></asp:BoundColumn>
              </Columns>
            </asp:DataGrid>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
