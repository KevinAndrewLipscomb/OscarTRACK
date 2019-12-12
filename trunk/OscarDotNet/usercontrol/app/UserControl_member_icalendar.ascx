<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_member_icalendar.ascx.cs" Inherits="UserControl_member_icalendar.TWebUserControl_member_icalendar"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<asp:DataGrid id="DataGrid_control" runat="server" autogeneratecolumns="False" onitemdatabound="DataGrid_control_ItemDataBound" style="display:none">
  <Columns>
    <asp:BoundColumn datafield="schedule_assignment_id"></asp:BoundColumn>
    <asp:BoundColumn datafield="shift_name"></asp:BoundColumn>
    <asp:BoundColumn datafield="logon_time"></asp:BoundColumn>
    <asp:BoundColumn datafield="logoff_time"></asp:BoundColumn>
    <asp:BoundColumn dataField="post_short_designator"></asp:BoundColumn>
    <asp:BoundColumn dataField="post_cardinality"></asp:BoundColumn>
    <asp:BoundColumn dataField="post_medium_designator"></asp:BoundColumn>
    <asp:BoundColumn dataField="post_long_designator"></asp:BoundColumn>
    <asp:BoundColumn dataField="post_address"></asp:BoundColumn>
    <asp:BoundColumn dataField="door_code"></asp:BoundColumn>
    <asp:BoundColumn dataField="comment"></asp:BoundColumn>
    <asp:BoundColumn dataField="partner_list"></asp:BoundColumn>
    <asp:BoundColumn datafield="reviser"></asp:BoundColumn>
    <asp:BoundColumn dataField="last_revised"></asp:BoundColumn>
  </Columns>
</asp:DataGrid>
<table cellpadding="0" cellspacing="0" border="1" bordercolor="gainsboro">
  <tr>
    <td>
      <table cellpadding="10" cellspacing="0">
        <tr><td bgcolor="khaki" colspan="2"><strong>Auto-calendaring</strong></td></tr>
        <tr><td colspan="2">To make your <asp:Literal ID="Literal_application_name" runat="server"></asp:Literal> assignments show up in your online calendaring system, do the following.&nbsp; You should <u>not</u> need to repeat this process in the future:</td></tr>
        <tr>
          <td align="right">&bull;</td>
          <td><asp:HyperLink ID="HyperLink_subscribe_via_google_calendar_render" runat="server" Font-Bold="True" Target="_blank">Subscribe using Google Calendar</asp:HyperLink></td>
        </tr>
        <tr>
          <td align="right">&bull;</td>
          <td><asp:HyperLink ID="HyperLink_subscribe_via_webcal" runat="server" Font-Bold="True" Target="_blank">Subscribe via your local calendar app</asp:HyperLink></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
