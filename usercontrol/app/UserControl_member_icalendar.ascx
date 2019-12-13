<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_member_icalendar.ascx.cs" Inherits="UserControl_member_icalendar.TWebUserControl_member_icalendar"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<asp:DataGrid id="DataGrid_control" runat="server" autogeneratecolumns="False" onitemdatabound="DataGrid_control_ItemDataBound" style="display:none" ShowHeader="False" BorderStyle="None" GridLines="None">
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
