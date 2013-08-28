<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_schedule_assignment_assistant_alert_travel_gap.ascx.cs"
  Inherits="UserControl_schedule_assignment_assistant_alert_travel_gap.TWebUserControl_schedule_assignment_assistant_alert_travel_gap" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<asp:Panel ID="Panel_supressed" runat="server"><p></p><em>--&nbsp;SUPRESSED&nbsp;--</em></asp:Panel>
<table id="Table_data" runat="server" cellspacing="0" cellpadding="10" border="0">
  <tr>
    <td>
      <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" width="100%" border="0">
              <tr id="TableRow_guidance" runat="server" bgcolor="WhiteSmoke" visible="false">
                <td bgcolor="Khaki">
                  <b>Guidance:</b> In the following cases, a member may be scheduled to be in two different places at shift change.&nbsp; The member may have to end the first duty early and/or start the second duty late, causing
                  a gap in service that is not otherwise evident on the schedule.&nbsp; The most common way to resolve each case is to click one of the post designators, and on the following page, change the member's post
                  assignment to match the other post designator.&nbsp; You should review these alerts before moving on to later steps, because each change may also solve other scheduling issues.
                </td>
              </tr>
              <tr>
                <td>
                  <!-- -->
                  <!-- Place invisible columns first so column-spanning will be more straightforward. -->
                  <!-- -->
                  <asp:datagrid id="W" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="2" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px" onitemdatabound="W_ItemDataBound" onitemcommand="W_ItemCommand">
                    <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                    <Columns>
                      <asp:BoundColumn DataField="member_id" Visible="false"></asp:BoundColumn>
                      <asp:BoundColumn DataField="agency_id" Visible="false"></asp:BoundColumn>
                      <asp:BoundColumn DataField="gap_day" HeaderText="At about...">
                        <ItemStyle HorizontalAlign="Right" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="gap_time"></asp:BoundColumn>
                      <asp:TemplateColumn><ItemTemplate>&nbsp;&nbsp;</ItemTemplate></asp:TemplateColumn>
                      <asp:BoundColumn DataField="name" HeaderText="...this member...">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Left" />
                      </asp:BoundColumn>
                      <asp:TemplateColumn>
                        <ItemTemplate><asp:Label ID="Label_member_agency_designator" runat="server" Font-Size="Small"></asp:Label></ItemTemplate>
                        <ItemStyle VerticalAlign="Bottom" />
                      </asp:TemplateColumn>
                      <asp:TemplateColumn><ItemTemplate>&nbsp;&nbsp;</ItemTemplate></asp:TemplateColumn>
                      <asp:ButtonColumn DataTextField="post_from" HeaderText="...leaves..." CommandName="PostFrom">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Font-Bold="true" HorizontalAlign="Right" />
                      </asp:ButtonColumn>
                      <asp:BoundColumn DataField="comment_from"></asp:BoundColumn>
                      <asp:TemplateColumn><ItemTemplate>&nbsp;&nbsp;</ItemTemplate></asp:TemplateColumn>
                      <asp:ButtonColumn DataTextField="post_to" HeaderText="...to go to..." CommandName="PostTo">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Font-Bold="true" HorizontalAlign="Right" />
                      </asp:ButtonColumn>
                      <asp:BoundColumn DataField="comment_to"></asp:BoundColumn>
                    </Columns>
                  </asp:datagrid>
                </td>
              </tr>
              <tr id="TableRow_none" runat="server"><td><p></p><em>--&nbsp;NONE&nbsp;--</em></td></tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
