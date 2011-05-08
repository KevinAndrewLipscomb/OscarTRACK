<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_member_schedule_detail.ascx.cs" Inherits="UserControl_member_schedule_detail.TWebUserControl_member_schedule_detail"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<style type="text/css">
  .revised
    {
    border: 2px solid red;
    }
  .selected_for_duty
    {
    background-color: Green;
    color: White;
    font-weight: bold;
    }
  .unselected_availability
    {
    background-color: PaleGreen;
    color: Gray;
    }
</style>
<table cellpadding="0" cellspacing="0" border="1" bordercolor="gainsboro">
  <tr>
    <td>
      <table cellpadding="10" cellspacing="0">
        <tr>
          <td bgcolor="WhiteSmoke"><strong>Member schedule detail</strong></td>
        </tr>
        <tr>
          <td>
            <table cellpadding="5" cellspacing="0" width="100%">
              <tr>
                <td>
                  <table cellpadding="5" cellspacing="0">
                    <tr>
                      <td align="right">Member:</td>
                      <td><strong><asp:Literal ID="Literal_name" runat="server"></asp:Literal></strong></td>
                    </tr>
                    <tr>
                      <td align="right">Month:</td>
                      <td><strong><asp:Literal ID="Literal_month" runat="server"></asp:Literal></strong></td>
                    </tr>
                  </table>
                </td>
                <td align="center">
                  <table cellpadding="0" cellspacing="0" border="1" bordercolor="gainsboro">
                    <tr>
                      <td>
                        <table cellpadding="0" cellspacing="0">
                          <tr>
                            <td align="left">
                              <table cellpadding="5" cellspacing="0" width="100%">
                                <tr>
                                  <td><small>Ph#:&nbsp;<strong><asp:HyperLink ID="HyperLink_phone_num" runat="server"/></strong></small></td>
                                  <td>&nbsp;</td>
                                  <td><small>Agency:&nbsp;<strong><asp:Literal ID="Literal_agency" runat="server"/></strong></small></td>
                                  <td>&nbsp;</td>
                                  <td><small>Membership Status:&nbsp;<strong><asp:Literal ID="Literal_membership_status" runat="server"/></strong></small></td>
                                  <td>&nbsp;</td>
                                  <td><small>Cert:&nbsp;<strong><asp:Literal ID="Literal_released_cert_level" runat="server"/></strong></small></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td align="left">
                              <table cellpadding="5" cellspacing="0" width="100%">
                                <tr>
                                  <td><small>Email:&nbsp;<strong><asp:HyperLink ID="HyperLink_email_address" runat="server"/></strong></small></td>
                                  <td>&nbsp;</td>
                                  <td><small>Leave:&nbsp;<strong><asp:Literal ID="Literal_leave" runat="server"/></strong></small></td>
                                  <td>&nbsp;</td>
                                  <td><small>Driver:&nbsp;<strong><asp:Literal ID="Literal_be_driver" runat="server"/></strong></small></td>
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
            </table>
            <hr size="1" />
            <asp:Panel ID="Panel_sensitive_submission_detail" runat="server" Visible="false">
              <small><asp:Literal ID="Literal_name_2" runat="server"></asp:Literal> offered the following:</small>
              <table cellpadding="3" cellspacing="0">
                <tr>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td align="right" nowrap="nowrap" valign="top"><small>Extra shifts will run:</small></td>
                  <td valign="top"><small><strong><asp:Literal ID="Literal_num_extra" runat="server"></asp:Literal></strong></small></td>
                </tr>
                <tr>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td align="right" nowrap="nowrap" valign="top"><small>Special request:</small></td>
                  <td valign="top"><small><code><asp:Label ID="Label_special_request_comment" runat="server">(none)</asp:Label></code></small></td>
                </tr>
              </table>
              <hr size="1" />
            </asp:Panel>
            <table cellpadding="5">
              <tr>
                <td id="HtmlTableCell_button_done" runat="server" visible="false"><asp:Button ID="Button_done" runat="server" Text="DONE" onclick="Button_done_Click" UseSubmitBehavior="False"/></td>
                <td><small>See below for the <u>**KEY**</u> to reading this data.</small></td>
                <td id="HtmlTableCell_scheduler_actions" runat="server" visible="false"><asp:Button ID="Button_mark_tbr" runat="server" Text="Mark TBR" onclick="Button_mark_tbr_Click" UseSubmitBehavior="False"/></td>
              </tr>
            </table>
            <table cellspacing="0" cellpadding="0" border="0">
              <tr id="HtmlTableRow_data" runat="server">
                <td>
                  <ASP:DataGrid id="DataGrid_control" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="5" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px" onitemdatabound="DataGrid_control_ItemDataBound" onitemcommand="DataGrid_control_ItemCommand">
                    <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                    <Columns>
                      <ASP:BoundColumn datafield="schedule_assignment_id" Visible="false" ReadOnly="true"></ASP:BoundColumn>
                      <ASP:BoundColumn datafield="nominal_day" HeaderText="Shift" ReadOnly="true">
                        <HeaderStyle HorizontalAlign="Right" />
                        <ItemStyle HorizontalAlign="Right" />
                      </ASP:BoundColumn>
                      <ASP:BoundColumn datafield="shift_name" ReadOnly="true"></ASP:BoundColumn>
                      <asp:BoundColumn DataField="post_designator" HeaderText="Station" ReadOnly="True">
                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Right" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="post_cardinality" HeaderText="Crew" ReadOnly="True">
                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" />
                      </asp:BoundColumn>
                      <ASP:BoundColumn datafield="comment" HeaderText="Comment"></ASP:BoundColumn>
                      <ASP:EditCommandColumn buttontype="LinkButton" updatetext="&lt;IMG src=&quot;~/protected/image/document-save-5.png&quot; alt=&quot;Update&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" canceltext="&lt;IMG src=&quot;~/protected/image/edit-undo-8.png&quot; alt=&quot;Cancel&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" edittext="&lt;IMG src=&quot;~/protected/image/draw_freehand_16_h.png&quot; alt=&quot;Edit&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" Visible="false">
                        <ItemStyle Wrap="false" HorizontalAlign="Center" />
                      </ASP:EditCommandColumn>
                      <ASP:BoundColumn datafield="be_selected" Visible="false" ReadOnly="true"></ASP:BoundColumn>
                      <ASP:BoundColumn datafield="on_duty" Visible="false" ReadOnly="true"></ASP:BoundColumn>
                      <ASP:BoundColumn datafield="off_duty" Visible="false" ReadOnly="true"></ASP:BoundColumn>
                      <ASP:BoundColumn datafield="time_off" HeaderText="Time off before duty (hours)" ReadOnly="true" Visible="false">
                        <ItemStyle HorizontalAlign="Center" />
                      </ASP:BoundColumn>
                      <ASP:BoundColumn datafield="shift_population_from_agency" HeaderText="Crews local" DataFormatString="{0:F1}" ReadOnly="true" Visible="false">
                        <ItemStyle HorizontalAlign="Center" />
                      </ASP:BoundColumn>
                      <ASP:BoundColumn datafield="shift_population_citywide" HeaderText="Crews citywide" DataFormatString="{0:F1}" ReadOnly="true" Visible="false">
                        <ItemStyle HorizontalAlign="Center" />
                      </ASP:BoundColumn>
                      <ASP:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/go-up-4.png&quot; alt=&quot;Earlier&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Earlier" HeaderText="SWAP" Visible="false">
                        <HeaderStyle HorizontalAlign="Right" />
                        <ItemStyle HorizontalAlign="Right" />
                      </ASP:ButtonColumn>
                      <ASP:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/go-down-4.png&quot; alt=&quot;Later&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Later" Visible="false"></ASP:ButtonColumn>
                      <ASP:BoundColumn datafield="others_available" HeaderText="Other squad members available" ReadOnly="true" Visible="false">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Font-Size="Small" />
                      </ASP:BoundColumn>
                      <ASP:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/list-remove-4.png&quot; alt=&quot;Force Off&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="ForceOff" HeaderText="FORCE" Visible="false">
                        <HeaderStyle HorizontalAlign="Right" />
                        <ItemStyle HorizontalAlign="Right" />
                      </ASP:ButtonColumn>
                      <ASP:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/list-add-4.png&quot; alt=&quot;Force On&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="ForceOn" Visible="false"></ASP:ButtonColumn>
                      <asp:BoundColumn DataField="be_notification_pending" ReadOnly="True" Visible="False"></asp:BoundColumn>
                      <asp:TemplateColumn Visible="False">
                        <ItemTemplate><asp:Label ID="Label_revised" runat="server" Visible="false">&lt;&lt;&lt;REVISED<sup>*</sup></asp:Label></ItemTemplate>
                        <ItemStyle Font-Bold="True" ForeColor="Red" Wrap="False" />
                      </asp:TemplateColumn>
                      <ASP:BoundColumn datafield="last_reviser" ReadOnly="true" HeaderText="Last revised">
                        <ItemStyle Font-Size="Small"/>
                      </ASP:BoundColumn>
                    </Columns>
                  </ASP:DataGrid>
                  <small>
                    <asp:Label ID="Label_revision_explanation" runat="server" ForeColor="Red" Visible="False"><sup>*</sup>If a scheduler revises AND un-revises an assignment in a single session, it will be marked as REVISED even though there may ultimately be no impact.</asp:Label>
                  </small>
                </td>
              </tr>
              <tr id="HtmlTableRow_none" runat="server"><td><p></p><em>--&nbsp;NONE&nbsp;--</em></td></tr>
            </table>
            <br/>
            <table cellpadding="5" cellspacing="0">
              <tr id="HtmlTableRow_instruction_for_calendars" runat="server" Visible="false">
                <td colspan="3">To force a shift into the member's availability list, click a nominal day on the appropriate shift calendar:</td>
              </tr>
              <tr align="center">
                <td valign="top">
                  <asp:Calendar ID="Calendar_day" runat="server" BackColor="White" BorderColor="#999999" Caption="DAY" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" ShowTitle="False" Width="200px" OnSelectionChanged="Calendar_day_SelectionChanged" OnDayRender="Calendar_day_DayRender">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                  </asp:Calendar>
                </td>
                <td valign="top">
                  <asp:Calendar ID="Calendar_night" runat="server" BackColor="White" BorderColor="#999999" Caption="NIGHT" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" ShowTitle="False" Width="200px" OnSelectionChanged="Calendar_night_SelectionChanged" OnDayRender="Calendar_night_DayRender">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                  </asp:Calendar>
                </td>
                <td valign="top">
                  <table cellpadding="5" cellspacing="2">
                    <tr><td align="center"><small><u>**KEY**</u></small></td></tr>
                    <tr><td align="center" class="selected_for_duty">REPORT FOR DUTY</td></tr>
                    <tr><td align="center" class="unselected_availability">Unselected availability</td></tr>
                    <tr id="HtmlTableRow_key_revised" runat="server"><td align="center" class="revised">REVISED</td></tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
