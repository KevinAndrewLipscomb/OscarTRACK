<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_watchbill_maag.ascx.cs"
  Inherits="UserControl_watchbill_maag.TWebUserControl_watchbill_maag" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table id="Table_data" runat="server" cellspacing="0" cellpadding="10" width="100%" border="0">
  <tr>
    <td>
      <asp:Calendar ID="Calendar_day" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Full" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="432pt" ondayrender="Calendar_day_DayRender" 
        Width="648pt" SelectionMode="None" ShowGridLines="True" ShowNextPrevMonth="False">
        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
        <NextPrevStyle VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#808080" />
        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
        <SelectorStyle BackColor="#CCCCCC" />
        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" Font-Size="XX-Large" />
        <TodayDayStyle BackColor="White" ForeColor="Black" />
        <WeekendDayStyle BackColor="#FFFFCC" />
      </asp:Calendar>
      <asp:Panel ID="Panel_page_break" runat="server"><div style="page-break-before:always;" /></asp:Panel>
      <asp:Calendar ID="Calendar_night" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Full" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="432pt" ondayrender="Calendar_night_DayRender" 
        Width="648pt" SelectionMode="None" ShowGridLines="True" ShowNextPrevMonth="False">
        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
        <NextPrevStyle VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#808080" />
        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
        <SelectorStyle BackColor="#CCCCCC" />
        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" Font-Size="XX-Large" />
        <TodayDayStyle BackColor="White" ForeColor="Black" />
        <WeekendDayStyle BackColor="#FFFFCC" />
      </asp:Calendar>
    </td>
  </tr>
</table>