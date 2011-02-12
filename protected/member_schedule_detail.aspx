<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->
<%@ Page language="c#" Debug="true" Codebehind="member_schedule_detail.aspx.cs" AutoEventWireup="True" Inherits="member_schedule_detail.TWebForm_member_schedule_detail" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="uc3" TagName="UserControl_update_progress_blocker" Src="~/usercontrol/app/UserControl_update_progress_blocker.ascx" %>
<html>
  <head runat="server">
    <!-- $Id$ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
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
                  <p>The member offered the following:</p>
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
                      <ASP:DataGrid id="DataGrid_control" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="5" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px" onitemdatabound="DataGrid_control_ItemDataBound" onitemcommand="DataGrid_control_ItemCommand">
                        <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                        <Columns>
                          <ASP:BoundColumn datafield="schedule_assignment_id" Visible="false"></ASP:BoundColumn>
                          <ASP:BoundColumn datafield="nominal_day" HeaderText="Shift">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                          </ASP:BoundColumn>
                          <ASP:BoundColumn datafield="shift_name"></ASP:BoundColumn>
                          <ASP:BoundColumn datafield="be_selected" Visible="false"></ASP:BoundColumn>
                          <ASP:BoundColumn datafield="on_duty" Visible="false"></ASP:BoundColumn>
                          <ASP:BoundColumn datafield="off_duty" Visible="false"></ASP:BoundColumn>
                          <ASP:BoundColumn datafield="time_off" HeaderText="Time off before duty (hours)">
                            <ItemStyle HorizontalAlign="Center" />
                          </ASP:BoundColumn>
                          <ASP:BoundColumn datafield="shift_population_from_agency" HeaderText="Crews local" DataFormatString="{0:F1}">
                            <ItemStyle HorizontalAlign="Center" />
                          </ASP:BoundColumn>
                          <ASP:BoundColumn datafield="shift_population_citywide" HeaderText="Crews citywide" DataFormatString="{0:F1}">
                            <ItemStyle HorizontalAlign="Center" />
                          </ASP:BoundColumn>
                          <ASP:ButtonColumn text="Earlier" commandname="Earlier" HeaderText="Change">
                            <ItemStyle HorizontalAlign="Right" />
                          </ASP:ButtonColumn>
                          <ASP:ButtonColumn text="Later" commandname="Later" HeaderText="selection">
                          </ASP:ButtonColumn>
                        </Columns>
                      </ASP:DataGrid>
                      <br/>
                      <table cellpadding="5" cellspacing="0">
                        <tr>
                          <td colspan="2">To force a shift into the member's availability list, click a nominal day on the appropriate shift calendar:</td>
                        </tr>
                        <tr align="center">
                          <td valign="top">
                            <asp:Calendar ID="Calendar_day" runat="server" BackColor="White" BorderColor="#999999" Caption="DAY" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" ShowTitle="False" Width="200px" OnSelectionChanged="Calendar_day_SelectionChanged" OnDayRender="Calendar_day_DayRender">
                              <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                              <DayStyle ForeColor="Blue" />
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
                              <DayStyle ForeColor="Blue" />
                              <NextPrevStyle VerticalAlign="Bottom" />
                              <OtherMonthDayStyle ForeColor="#808080" />
                              <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                              <SelectorStyle BackColor="#CCCCCC" />
                              <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                              <WeekendDayStyle BackColor="#FFFFCC" />
                            </asp:Calendar>
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
      <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
      <uc3:UserControl_update_progress_blocker id="UserControl_update_progress_blocker_control" runat="server"></uc3:UserControl_update_progress_blocker>
    </form>
  </body>
</html>
