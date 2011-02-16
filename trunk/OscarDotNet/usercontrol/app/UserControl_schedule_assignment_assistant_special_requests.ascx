<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_schedule_assignment_assistant_special_requests.ascx.cs"
  Inherits="UserControl_schedule_assignment_assistant_special_requests.TWebUserControl_schedule_assignment_assistant_special_requests" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table cellspacing="0" cellpadding="10" border="0">
  <tr>
    <td><asp:Button ID="Button_refresh" runat="server" OnClick="Button_refresh_Click" Text="Refresh" /></td>
  </tr>
  <tr>
    <td>
      <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" width="100%" border="0">
              <tr>
                <td>
                  <asp:datagrid id="Q" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="2" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px" onitemdatabound="Q_ItemDataBound" onitemcommand="Q_ItemCommand" AllowSorting="True" OnSortCommand="Q_SortCommand">
                    <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                    <Columns>
                      <asp:BoundColumn DataField="name" HeaderText="Name" SortExpression="member.last_name%,member.first_name">
                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="member_id" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="be_released" HeaderText="Released?" SortExpression="be_released%,member.last_name,member.first_name">
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:ButtonColumn CommandName="ReviewHandle" Text="&lt;IMG src=&quot;~/protected/image/open_document16_h.png&quot; alt=&quot;Review/handle&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;"></asp:ButtonColumn>
                      <asp:BoundColumn DataField="note" HeaderText="Note">
                        <ItemStyle Font-Bold="False" Font-Italic="True" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" />
                      </asp:BoundColumn>
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
