<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_member_schedule_detail.ascx.cs" Inherits="UserControl_member_schedule_detail.TWebUserControl_member_schedule_detail"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<style type="text/css">
  .style1
  {
    color: #FFFFFF;
  }
  .style2
  {
    color: #808080;
  }
  .style3
  {
    text-decoration: underline;
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
            <hr size="1" />
            <p><asp:Literal ID="Literal_name_2" runat="server"></asp:Literal> offered the following:</p>
            <table cellpadding="5" cellspacing="0">
              <tr>
                <td align="right" nowrap="nowrap" valign="top">Extra shifts will run:</td>
                <td valign="top"><strong><asp:Literal ID="Literal_num_extra" runat="server"></asp:Literal></strong></td>
              </tr>
              <tr>
                <td align="right" nowrap="nowrap" valign="top">Special request:</td>
                <td valign="top"><code><asp:Label ID="Label_special_request_comment" runat="server">(none)</asp:Label></code></td>
              </tr>
            </table>
            <hr size="1" />
            <p><asp:Button ID="Button_done" runat="server" Text="Done" onclick="Button_done_Click"/></p>
            <asp:UpdatePanel ID="UpdatePanel_control" runat="server">
              <ContentTemplate>
                <table cellspacing="0" cellpadding="0" border="0">
                  <tr id="TableRow_data" runat="server">
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
                          <ASP:EditCommandColumn buttontype="LinkButton" updatetext="&lt;IMG src=&quot;~/protected/image/document-save-5.png&quot; alt=&quot;Update&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" canceltext="&lt;IMG src=&quot;~/protected/image/edit-undo-8.png&quot; alt=&quot;Cancel&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" edittext="&lt;IMG src=&quot;~/protected/image/draw_freehand_16_h.png&quot; alt=&quot;Edit&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;">
                            <ItemStyle Wrap="false" HorizontalAlign="Center" />
                          </ASP:EditCommandColumn>
                          <ASP:BoundColumn datafield="be_selected" Visible="false" ReadOnly="true"></ASP:BoundColumn>
                          <ASP:BoundColumn datafield="on_duty" Visible="false" ReadOnly="true"></ASP:BoundColumn>
                          <ASP:BoundColumn datafield="off_duty" Visible="false" ReadOnly="true"></ASP:BoundColumn>
                          <ASP:BoundColumn datafield="time_off" HeaderText="Time off before duty (hours)" ReadOnly="true">
                            <ItemStyle HorizontalAlign="Center" />
                          </ASP:BoundColumn>
                          <ASP:BoundColumn datafield="shift_population_from_agency" HeaderText="Crews local" DataFormatString="{0:F1}" ReadOnly="true">
                            <ItemStyle HorizontalAlign="Center" />
                          </ASP:BoundColumn>
                          <ASP:BoundColumn datafield="shift_population_citywide" HeaderText="Crews citywide" DataFormatString="{0:F1}" ReadOnly="true">
                            <ItemStyle HorizontalAlign="Center" />
                          </ASP:BoundColumn>
                          <ASP:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/go-up-4.png&quot; alt=&quot;Earlier&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Earlier" HeaderText="SWAP">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                          </ASP:ButtonColumn>
                          <ASP:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/go-down-4.png&quot; alt=&quot;Later&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Later"></ASP:ButtonColumn>
                          <ASP:BoundColumn datafield="others_available" HeaderText="Other squad members available" ReadOnly="true">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Font-Size="Small" />
                          </ASP:BoundColumn>
                          <ASP:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/list-remove-4.png&quot; alt=&quot;Force Off&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="ForceOff" HeaderText="FORCE">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                          </ASP:ButtonColumn>
                          <ASP:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/list-add-4.png&quot; alt=&quot;Force On&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="ForceOn"></ASP:ButtonColumn>
                          <asp:BoundColumn DataField="be_notification_pending" ReadOnly="True" Visible="False"></asp:BoundColumn>
                          <asp:TemplateColumn Visible="False">
                            <ItemTemplate><asp:Label ID="Label_revised" runat="server" Visible="false">&lt;&lt;&lt;REVISED<sup>*</sup></asp:Label></ItemTemplate>
                            <ItemStyle Font-Bold="True" ForeColor="Red" Wrap="False" />
                          </asp:TemplateColumn>
                        </Columns>
                      </ASP:DataGrid>
                      <small>
                        <asp:Label ID="Label_revision_explanation" runat="server" ForeColor="Red" Visible="False"><sup>*</sup>If a scheduler revises AND un-revises an assignment in a single session, it will be marked as REVISED even though there may ultimately be no impact.</asp:Label>
                      </small>
                    </td>
                  </tr>
                  <tr id="TableRow_none" runat="server"><td><p></p><em>--&nbsp;NONE&nbsp;--</em></td></tr>
                </table>
                <br/>
                <table cellpadding="5" cellspacing="0">
                  <tr id="TableRow_instruction_for_calendars" runat="server">
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
                    <td>
                      <table cellpadding="5" cellspacing="2">
                        <tr><td align="center" class="style3"><small>KEY</small></td></tr>
                        <tr><td align="center" bgcolor="Green" class="style1"><strong>SELECTED FOR DUTY</strong></td></tr>
                        <tr><td align="center" bgcolor="PaleGreen" class="style2">UNSELECTED AVAILABILITY</td></tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </ContentTemplate>
            </asp:UpdatePanel>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
