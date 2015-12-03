<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_schedule_assignment_assistant_special_requests.ascx.cs"
  Inherits="UserControl_schedule_assignment_assistant_special_requests.TWebUserControl_schedule_assignment_assistant_special_requests" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<asp:Panel ID="Panel_supressed" runat="server"><p></p><em>--&nbsp;SUPRESSED&nbsp;--</em></asp:Panel>
<table id="Table_data" runat="server" cellspacing="0" cellpadding="10" border="0" visible="false">
  <tr>
    <td>
      <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" width="100%" border="0">
              <tr id="TableRow_guidance" runat="server" bgcolor="WhiteSmoke">
                <td bgcolor="Khaki">
                  <b>Guidance:</b> Review these requests for serious unusual situations that <asp:Literal ID="Literal_application_name" runat="server"></asp:Literal> is unable to detect or correct by itself.&nbsp;
                  <b><i>NOTE</i></b> that the conventional wisdom, developed over many scheduling cycles by experienced schedulers, is that you can safely <i>ignore</i> most requests related to interpersonal relations.&nbsp;
                  In fact, changes made here usually <i>degrade</i> the overall quality of the schedule.&nbsp; <i>If you must</i> make changes here, make them before moving on to later steps.
                </td>
              </tr>
              <tr>
                <td>
                  <asp:datagrid id="Q" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="2" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px" onitemdatabound="Q_ItemDataBound" onitemcommand="Q_ItemCommand" AllowSorting="True" OnSortCommand="Q_SortCommand">
                    <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                    <Columns>
                      <asp:BoundColumn DataField="level" HeaderText="~" SortExpression="medical_release_code_description_map.pecking_order%,member.last_name,member.first_name" Visible="False">
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:ButtonColumn CommandName="ReviewHandle" DataTextField="name" HeaderText="Name" SortExpression="member.last_name%,member.first_name">
                        <ItemStyle Wrap="False" />
                      </asp:ButtonColumn>
                      <asp:BoundColumn DataField="member_id" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="be_released" HeaderText="Released?" SortExpression="be_released%,member.last_name,member.first_name">
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="note" HeaderText="Note">
                        <ItemStyle Font-Italic="True" Font-Size="Small" />
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
