<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_schedule_proposal.ascx.cs" Inherits="UserControl_schedule_proposal.TWebUserControl_schedule_proposal" %>
<%@ Register Src="~/usercontrol/app/UserControl_schedule_assignment_log.ascx" TagPrefix="uc1" TagName="UserControl_schedule_assignment_log" %>
<%@ Register Src="~/usercontrol/app/UserControl_ambulance_staffing_timeline_chart.ascx" TagPrefix="uc1" TagName="UserControl_ambulance_staffing_timeline_chart" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<asp:Panel ID="Panel_supressed" runat="server"><p></p><em>--&nbsp;SUPRESSED&nbsp;--</em></asp:Panel>
<table id="Table_data" runat="server" cellspacing="0" cellpadding="10" width="100%" border="0" visible="false">
  <tr bgcolor="#f5f5f5">
    <td>
      <table cellspacing="0" cellpadding="0" border="1" bordercolor="#dcdcdc" width="100%">
        <tr id="TableRow_guidance" runat="server" visible="false">
          <td bgcolor="Khaki">
            <blockquote>
              <b>Guidance:</b> Complete all other steps before working on this tab, each time you log in.&nbsp; Focus your efforts on designating which station (home or satellite) and crew (a, b, etc) a member should report
              to.&nbsp; <b>RESIST THE TEMPTATION</b> to fix partial crews or holes at the squad level.&nbsp; Partial crews and holes are much better fixed by:
              <ul>
                <li>Prompting holdouts to submit their availabilities;</li>
                <li>Encouraging all members to submit even more availabilities;</li>
                <li>Resolving alerts detected by <asp:Literal ID="Literal_application_name" runat="server"></asp:Literal>;</li>
                <li>Allowing the Department Chief Scheduler to convert partial crews into whole crews using other members of our department -- he has better visibility into the overall situation.</li>
              </ul>
              "Fixing" partial crews or holes by moving squad-level duty assignments to other times tends to <b><i>DEGRADE</i></b> the overall citywide schedule.&nbsp; Such degredation is noticable to the City Manager, City
              Council, and the community we serve.
            </blockquote>
          </td>
        </tr>
        <tr>
          <td align="center">
            <table id="Table_filters" runat="server" cellspacing="0" cellpadding="5" border="0" align="center" width="100%">
              <tr>
                <td  id="TableCell_print_scalable" runat="server" align="center">
                  <asp:HyperLink ID="HyperLink_preview_print_scalable" runat="server" Text="Print&lt;br /&gt;&lt;IMG src=&quot;~/protected/image/printer-dot_matrix.png&quot; alt=&quot;Print/scalable&quot; border=&quot;0&quot; height=&quot;48&quot; width=&quot;48&quot; /&gt;&lt;br /&gt;&lt;small&gt;scalable format&lt;br/&gt;RECOMMENDED&lt;/small&gt;" Target="_blank"></asp:HyperLink>
                </td>
                <td id="TableCell_print_maag" runat="server"  align="center">
                  <asp:HyperLink ID="HyperLink_preview_print_month_at_a_glance" runat="server" Text="Print&lt;br /&gt;&lt;IMG src=&quot;~/protected/image/printer-dot_matrix.png&quot; alt=&quot;Print/month-at-a-glance&quot; border=&quot;0&quot; height=&quot;48&quot; width=&quot;48&quot; /&gt;&lt;br /&gt;&lt;small&gt;month-at-a-glance format&lt;br/&gt;&lt;/small&gt;" Target="_blank"></asp:HyperLink>
                </td>
                <td id="TableCell_print_lineup" runat="server" align="center" visible="false">
                  <asp:HyperLink ID="HyperLink_preview_print_lineup" runat="server" Text="Print&lt;br /&gt;&lt;IMG src=&quot;~/protected/image/printer-dot_matrix.png&quot; alt=&quot;Print/lineup&quot; border=&quot;0&quot; height=&quot;48&quot; width=&quot;48&quot; /&gt;&lt;br /&gt;&lt;small&gt;LINEUP&lt;br/&gt;&lt;/small&gt;" Target="_blank"></asp:HyperLink>
                </td>
                <td align="right"><b><small>Filters:</small></b></td>
                <td id="Td_nominal_day_filter" runat="server" align="center" nowrap="nowrap">
                  <small>Nominal day<br />
                  <asp:RadioButtonList ID="RadioButtonList_be_nominal_day_mode_specific" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" onselectedindexchanged="RadioButtonList_be_nominal_day_mode_specific_SelectedIndexChanged">
                    <asp:ListItem Value="0">All</asp:ListItem>
                    <asp:ListItem Value="1" Selected="True">Specific</asp:ListItem>
                  </asp:RadioButtonList>
                  <asp:Calendar ID="Calendar_nominal_day" runat="server" BackColor="White" BorderColor="#999999" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" onselectionchanged="Calendar_nominal_day_SelectionChanged" 
                    ShowNextPrevMonth="False" ondayrender="Calendar_nominal_day_DayRender">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="Gray" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                  </asp:Calendar>
                  </small>
                </td>
                <td align="center" nowrap="nowrap">
                  <table cellpadding="3" cellspacing="0">
                    <tr>
                      <td align="right" nowrap="nowrap"><small>Depth:</small></td>
                      <td align="left">
                        <ASP:DropDownList id="DropDownList_depth" runat="server" autopostback="True" onselectedindexchanged="DropDownList_depth_SelectedIndexChanged">
                          <ASP:ListItem value="" selected="True">All</ASP:ListItem>
                          <ASP:ListItem value="1">Selected</ASP:ListItem>
                          <ASP:ListItem value="0">Not selected</ASP:ListItem>
                        </ASP:DropDownList>
                      </td>
                    </tr>
                    <tr id="TableRow_expand_station_drop_downs" runat="server">
                      <td align="right" nowrap="nowrap"><small>Expand station drop-downs:</small></td>
                      <td align="left"><asp:CheckBox ID="CheckBox_expand_posts" runat="server" AutoPostBack="True" oncheckedchanged="CheckBox_expand_posts_CheckedChanged" /></td>
                    </tr>
                    <tr id="TableRow_max_crews_at_a_station" runat="server">
                      <td align="right" nowrap="nowrap"><small>Max crew at a station:</small></td>
                      <td align="left"><asp:DropDownList ID="DropDownList_max_post_cardinality" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList_max_post_cardinality_SelectedIndexChanged"></asp:DropDownList></td>
                    </tr>
                  </table>
                  <br/>
   							</td>
              </tr>
            </table>
            <table id="Table_accumulators" runat="server" cellspacing="0" cellpadding="5" width="100%" border="0" align="center">
              <tr>
                <td align="center" valign="middle"><small><b><asp:literal id="Literal_num_members" runat="server"></asp:literal></b>&nbsp;members</small></td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td align="center" valign="middle"><small><b><ASP:literal id="Literal_num_crew_shifts" runat="server"></ASP:literal></b>&nbsp;crew-shifts</small></td>
              </tr>
            </table>
            <small>
              <asp:DataList ID="DataList_key" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" ShowFooter="False" ShowHeader="False">
                <ItemTemplate>
                  <asp:Literal ID="Literal_watchbill_rendition" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"watchbill_rendition") %>'></asp:Literal>&nbsp;=&nbsp;<asp:Literal ID="Literal_description" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"description") %>'></asp:Literal>,&nbsp;
                </ItemTemplate>
              </asp:DataList>
              g&nbsp;=&nbsp;Guest&nbsp;Provider,&nbsp;
              o&nbsp;=&nbsp;Observer,&nbsp;
              Ð&nbsp;=&nbsp;non-driver
              <br />
              001&nbsp;=&nbsp;EMS-1&nbsp;etc,&nbsp; 010&nbsp;=&nbsp;Chief&nbsp;10,&nbsp; &asymp;&nbsp;=&nbsp;Marine&nbsp;medic,&nbsp; C14&nbsp;=&nbsp;Cart-14&nbsp;etc, ALI&nbsp;=&nbsp;ALS&nbsp;Intern, SE1&nbsp;=&nbsp;Special&nbsp;Event&nbsp;1&nbsp;etc, RPP&nbsp;=Respiratory&nbsp;Protection&nbsp;Program
            </small>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
      <p></p>
      <table cellpadding="3" cellspacing="0" width="100%">
        <tr>
          <td align="right" valign="top" Width="1%"><asp:LinkButton ID="LinkButton_previous_top" runat="server" onclick="LinkButton_previous_Click" Visible="False" Text="< < <" Font-Bold="True" ToolTip="Go to the prior day"/></td>
          <td rowspan="3" valign="top" Width="98%">
            <asp:Panel ID="Panel_ambulance_staffing_timeline_chart" runat="server" Visible="false">
              <center><uc1:UserControl_ambulance_staffing_timeline_chart runat="server" ID="UserControl_ambulance_staffing_timeline_chart_control"/></center>
              <br />
            </asp:Panel>
            <table>
              <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
              <tr id="TableRow_panel_and_datagrid" runat="server">
                <td align="center">
                  <asp:Panel ID="Panel_warning_to_save" runat="server">
                    <table cellpadding="3" cellspacing="0">
                      <tr>
                        <td>
                          <asp:Image ID="Image_warning" runat="server" AlternateText="Warning!" ImageUrl="~/protected/image/dialog-warning.png" />
                        </td>
                        <td>Changes made below will not be saved until you click a member&#39;s name or an arrow, <em>or</em> click this button:</td>
                        <td>
                          <asp:Button ID="Button_save" runat="server" Font-Bold="True" onclick="Button_save_Click" Text="SAVE" />
                        </td>
                        <td>
                          <small><i>
                            <asp:Literal ID="Literal_publish_reminder" runat="server" Visible="false">Don't forget to publish!</asp:Literal></i></small>
                        </td>
                      </tr>
                    </table>
                  </asp:Panel>
                  <asp:Panel ID="Panel_timeline_mode" runat="server" Visible="false">
                    <small>Individual work timelines</small>
                    <br />
                    <nobr>
                      <asp:Button ID="Button_show_day_timelines" runat="server" Text="DAY" Width="5em" OnClick="Button_show_day_timelines_Click"/>
                      <asp:Button ID="Button_hide_timelines" runat="server" Text="NONE" Width="5em" OnClick="Button_hide_timelines_Click"/>
                      <asp:Button ID="Button_show_night_timelines" runat="server" Text="NIGHT" Width="5em" OnClick="Button_show_night_timelines_Click"/>
                    </nobr>
                  </asp:Panel>
                  <br />
                  <asp:datagrid id="A" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="1" gridlines="None" bordercolor="Gainsboro" onitemdatabound="A_ItemDataBound" onitemcommand="A_ItemCommand">
                    <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                    <Columns>
                      <asp:BoundColumn DataField="nominal_day" ReadOnly="True">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" />
                        <ItemStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Right" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="display_seq_num" ReadOnly="True" Visible="False"></asp:BoundColumn>
                      <asp:TemplateColumn><ItemTemplate><a id="Anchor_control" runat="server"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</ItemTemplate></asp:TemplateColumn>
                      <asp:BoundColumn DataField="d_num_units_from_agency" DataFormatString="{0:F1}" ReadOnly="True">
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:BoundColumn>
                      <asp:TemplateColumn>
                        <ItemStyle VerticalAlign="Bottom" />
                        <ItemTemplate>/</ItemTemplate>
                      </asp:TemplateColumn>
                      <asp:BoundColumn DataField="d_num_units_citywide" DataFormatString="{0:F1}" ReadOnly="True">
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:BoundColumn>
                      <asp:TemplateColumn><ItemTemplate>&nbsp;&nbsp;&nbsp;</ItemTemplate></asp:TemplateColumn>
                      <asp:BoundColumn DataField="d_assignment_id" ReadOnly="True" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="d_post_id" ReadOnly="True" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="d_agency_short_designator" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="d_member_id" Visible="False"></asp:BoundColumn>
                      <asp:TemplateColumn>
                        <ItemTemplate><asp:DropDownList ID="DropDownList_d_post" runat="server" Enabled="False" onselectedindexchanged="DropDownList_d_post_SelectedIndexChanged" Visible="false" Font-Size="Small"></asp:DropDownList><asp:Label ID="Label_d_post" runat="server"></asp:Label></ItemTemplate>
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:TemplateColumn>
                      <asp:BoundColumn DataField="d_post_cardinality" ItemStyle-VerticalAlign="Bottom"></asp:BoundColumn>
                      <asp:TemplateColumn Visible="false">
                        <ItemTemplate><asp:DropDownList ID="DropDownList_d_post_cardinality" runat="server" Enabled="False" onselectedindexchanged="DropDownList_d_post_cardinality_SelectedIndexChanged" Font-Size="Small"></asp:DropDownList></ItemTemplate>
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:TemplateColumn>
                      <asp:BoundColumn DataField="d_medical_release_description" ReadOnly="True">
                        <ItemStyle VerticalAlign="Bottom" HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="d_be_marine_medic" ReadOnly="True">
                        <ItemStyle VerticalAlign="Bottom" HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:TemplateColumn>
                        <ItemStyle VerticalAlign="Bottom" />
                        <ItemTemplate>:</ItemTemplate>
                      </asp:TemplateColumn>
                      <asp:BoundColumn DataField="d_cad_num" Visible="false">
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:BoundColumn>
                      <asp:ButtonColumn CommandName="SelectDayAvailMember" DataTextField="d_name" HeaderText="DAY" Visible="false">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:ButtonColumn>
                      <asp:BoundColumn DataField="d_name" HeaderText="DAY">
                        <HeaderStyle Font-Bold="True" />
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="d_be_driver_qualified" ReadOnly="True">
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="d_member_agency_id" Visible="false"></asp:BoundColumn>
                      <asp:TemplateColumn>
                        <ItemTemplate><asp:Label ID="Label_d_member_agency_designator" runat="server" Font-Size="Small"></asp:Label></ItemTemplate>
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:TemplateColumn>
                      <asp:BoundColumn DataField="d_be_selected" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="d_comment">
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="d_be_challenge" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="d_be_greenhorns" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="d_phone_num" Visible="false">
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:BoundColumn>
                      <asp:TemplateColumn><ItemTemplate>&nbsp;&nbsp;</ItemTemplate></asp:TemplateColumn>
                      <asp:BoundColumn datafield="d0000" HeaderText="0&lt;br/&gt;6&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d0030" HeaderText="0&lt;br/&gt;6&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d0100" HeaderText="0&lt;br/&gt;7&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d0130" HeaderText="0&lt;br/&gt;7&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d0200" HeaderText="0&lt;br/&gt;8&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d0230" HeaderText="0&lt;br/&gt;8&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d0300" HeaderText="0&lt;br/&gt;9&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d0330" HeaderText="0&lt;br/&gt;9&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d0400" HeaderText="1&lt;br/&gt;0&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d0430" HeaderText="1&lt;br/&gt;0&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d0500" HeaderText="1&lt;br/&gt;1&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d0530" HeaderText="1&lt;br/&gt;1&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d0600" HeaderText="N&lt;br/&gt;O&lt;br/&gt;O&lt;br/&gt;N" Visible="false"><HeaderStyle HorizontalAlign="Center" Font-Bold="true"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d0630" HeaderText="1&lt;br/&gt;2&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d0700" HeaderText="1&lt;br/&gt;3&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d0730" HeaderText="1&lt;br/&gt;3&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d0800" HeaderText="1&lt;br/&gt;4&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d0830" HeaderText="1&lt;br/&gt;4&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d0900" HeaderText="1&lt;br/&gt;5&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d0930" HeaderText="1&lt;br/&gt;5&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d1000" HeaderText="1&lt;br/&gt;6&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d1030" HeaderText="1&lt;br/&gt;6&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d1100" HeaderText="1&lt;br/&gt;7&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="d1130" HeaderText="1&lt;br/&gt;7&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n0000" HeaderText="1&lt;br/&gt;8&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n0030" HeaderText="1&lt;br/&gt;8&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n0100" HeaderText="1&lt;br/&gt;9&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n0130" HeaderText="1&lt;br/&gt;9&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n0200" HeaderText="2&lt;br/&gt;0&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n0230" HeaderText="2&lt;br/&gt;0&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n0300" HeaderText="2&lt;br/&gt;1&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n0330" HeaderText="2&lt;br/&gt;1&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n0400" HeaderText="2&lt;br/&gt;2&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n0430" HeaderText="2&lt;br/&gt;2&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n0500" HeaderText="2&lt;br/&gt;3&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n0530" HeaderText="2&lt;br/&gt;3&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n0600" HeaderText="M&lt;br/&gt;D&lt;br/&gt;N&lt;br/&gt;T" Visible="false"><HeaderStyle HorizontalAlign="Center" Font-Bold="true"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n0630" HeaderText="0&lt;br/&gt;0&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n0700" HeaderText="0&lt;br/&gt;1&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n0730" HeaderText="0&lt;br/&gt;1&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n0800" HeaderText="0&lt;br/&gt;2&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n0830" HeaderText="0&lt;br/&gt;2&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n0900" HeaderText="0&lt;br/&gt;3&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n0930" HeaderText="0&lt;br/&gt;3&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n1000" HeaderText="0&lt;br/&gt;4&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n1030" HeaderText="0&lt;br/&gt;4&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n1100" HeaderText="0&lt;br/&gt;5&lt;br/&gt;0&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:BoundColumn datafield="n1130" HeaderText="0&lt;br/&gt;5&lt;br/&gt;3&lt;br/&gt;0" Visible="false"><HeaderStyle HorizontalAlign="Center"/><ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                      <asp:TemplateColumn><ItemTemplate>&nbsp;&nbsp;</ItemTemplate></asp:TemplateColumn>
                      <asp:BoundColumn DataField="n_num_units_from_agency" DataFormatString="{0:F1}" ReadOnly="True">
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:BoundColumn>
                      <asp:TemplateColumn>
                        <ItemStyle VerticalAlign="Bottom" />
                        <ItemTemplate>/</ItemTemplate>
                      </asp:TemplateColumn>
                      <asp:BoundColumn DataField="n_num_units_citywide" DataFormatString="{0:F1}" ReadOnly="True">
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:BoundColumn>
                      <asp:TemplateColumn><ItemTemplate>&nbsp;&nbsp;&nbsp;</ItemTemplate></asp:TemplateColumn>
                      <asp:BoundColumn DataField="n_assignment_id" ReadOnly="True" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="n_post_id" ReadOnly="True" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="n_agency_short_designator" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="n_member_id" Visible="False"></asp:BoundColumn>
                      <asp:TemplateColumn>
                        <ItemTemplate><asp:DropDownList ID="DropDownList_n_post" runat="server" Enabled="False" onselectedindexchanged="DropDownList_n_post_SelectedIndexChanged" Visible="false" Font-Size="Small"></asp:DropDownList><asp:Label ID="Label_n_post" runat="server"></asp:Label></ItemTemplate>
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:TemplateColumn>
                      <asp:BoundColumn DataField="n_post_cardinality" ItemStyle-VerticalAlign="Bottom"></asp:BoundColumn>
                      <asp:TemplateColumn Visible="false">
                        <ItemTemplate><asp:DropDownList ID="DropDownList_n_post_cardinality" runat="server" Enabled="False" onselectedindexchanged="DropDownList_n_post_cardinality_SelectedIndexChanged" Font-Size="Small"></asp:DropDownList></ItemTemplate>
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:TemplateColumn>
                      <asp:BoundColumn DataField="n_medical_release_description" ReadOnly="True">
                        <ItemStyle VerticalAlign="Bottom" HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="n_be_marine_medic" ReadOnly="True">
                        <ItemStyle VerticalAlign="Bottom" HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:TemplateColumn>
                        <ItemStyle VerticalAlign="Bottom" />
                        <ItemTemplate>:</ItemTemplate>
                      </asp:TemplateColumn>
                      <asp:BoundColumn DataField="n_cad_num" Visible="false">
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:BoundColumn>
                      <asp:ButtonColumn CommandName="SelectNightAvailMember" DataTextField="n_name" HeaderText="NIGHT" Visible="false">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:ButtonColumn>
                      <asp:BoundColumn DataField="n_name" HeaderText="NIGHT">
                        <HeaderStyle Font-Bold="True" />
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="n_be_driver_qualified" ReadOnly="True">
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="n_member_agency_id" Visible="False"></asp:BoundColumn>
                      <asp:TemplateColumn>
                        <ItemTemplate><asp:Label ID="Label_n_member_agency_designator" runat="server" Font-Size="Small"></asp:Label></ItemTemplate>
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:TemplateColumn>
                      <asp:BoundColumn DataField="n_be_selected" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="n_comment">
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="n_be_challenge" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="n_be_greenhorns" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="n_phone_num" Visible="false">
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:BoundColumn>
                    </Columns>
                  </asp:datagrid>
                </td>
              </tr>
              <tr id="TableRow_log" runat="server" visible="false">
                <td align="center">
                  <br/>
                  <uc1:UserControl_schedule_assignment_log runat="server" id="UserControl_schedule_assignment_log_control" />
                </td>
              </tr>
            </table>
          </td>
          <td align="left" valign="top" Width="1%"><asp:LinkButton ID="LinkButton_next_top" runat="server" onclick="LinkButton_next_Click" Visible="False" Text="> > >" Font-Bold="True" ToolTip="Go to the next day"/></td>
        </tr>
        <tr>
          <td align="right" valign="middle"><asp:LinkButton ID="LinkButton_previous_middle" runat="server" onclick="LinkButton_previous_Click" Visible="False" Text="< < <" Font-Bold="True" ToolTip="Go to the prior day"/></td>
          <td align="left" valign="middle"><asp:LinkButton ID="LinkButton_next_middle" runat="server" onclick="LinkButton_next_Click" Visible="False" Text="> > >" Font-Bold="True" ToolTip="Go to the next day"/></td>
        </tr>
        <tr>
          <td align="right" valign="bottom"><asp:LinkButton ID="LinkButton_previous_bottom" runat="server" onclick="LinkButton_previous_Click" Visible="False" Text="< < <" Font-Bold="True" ToolTip="Go to the prior day"/></td>
          <td align="left" valign="bottom"><asp:LinkButton ID="LinkButton_next_bottom" runat="server" onclick="LinkButton_next_Click" Visible="False" Text="> > >" Font-Bold="True" ToolTip="Go to the next day"/></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
