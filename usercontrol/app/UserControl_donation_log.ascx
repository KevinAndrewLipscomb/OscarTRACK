<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_donation_log.ascx.cs" Inherits="UserControl_donation_log.TWebUserControl_donation_log"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
      <tr>
        <td>
          <table cellspacing="0" cellpadding="10" border="0">
            <tr>
              <td bgcolor="#dcdcdc">
                <h3>Entries</h3>
                <table id="Table_filter_and_count" runat="server" cellspacing="0" cellpadding="5" border="0" width="100%">
                  <tr>
                    <td>
                      <table cellpadding="2" cellspacing="0">
                        <tr>
                          <td rowspan="2" align="center" valign="middle"><strong>Filters:&nbsp;</strong></td>
                          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                          <td align="center"><small>Range:</small></td>
                          <td id="Td_conditional_spacer_header" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                          <td id="Td_entered_by_header" runat="server" align="center" visible="false"><small>Entered by:</small></td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                          <td align="center">
                            <small>
                              <asp:DropDownList id="DropDownList_range" runat="server" autopostback="True" OnSelectedIndexChanged="DropDownList_range_SelectedIndexChanged">
                                <asp:ListItem Value="LastThreeMonths" Selected="True">Last 3 months</asp:ListItem>
                                <asp:ListItem Value="LastSixMonths">Last 6 months</asp:ListItem>
                                <asp:ListItem Value="LastTwelveMonths">Last 12 months</asp:ListItem>
                                <asp:ListItem Value="">All</asp:ListItem>
                              </asp:DropDownList>
                            </small>
                          </td>
                          <td id="Td_conditional_spacer_body" runat="server">&nbsp;</td>
                          <td id="Td_entered_by_body" runat="server" align="center" visible="false">
                            <small>
                              <asp:DropDownList id="DropDownList_entered_by" runat="server" autopostback="True" OnSelectedIndexChanged="DropDownList_entered_by_SelectedIndexChanged">
                                <asp:ListItem Value="" Selected="True">All</asp:ListItem>
                                <asp:ListItem>You</asp:ListItem>
                                <asp:ListItem>Others</asp:ListItem>
                              </asp:DropDownList>
                            </small>
                          </td>
                        </tr>
                      </table>
                    <td align="right"><asp:Literal ID="Literal_num_donations" runat="server"></asp:Literal> donations</td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
            <tr>
              <td>
                <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False" allowsorting="True">
                  <Columns>
                    <asp:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/open_document16_h.png&quot; alt=&quot;Detail&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Select" Visible="false"></asp:ButtonColumn>
                    <asp:BoundColumn datafield="key" ReadOnly="True" HeaderText="Key" SortExpression="entered_by%, per_clerk_seq_num desc">
                      <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="timestamp" HeaderText="Time logged" ReadOnly="True" SortExpression="timestamp%, entered_by, per_clerk_seq_num">
                      <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="amount" dataformatstring="{0:C}" headertext="Amount" ReadOnly="True" SortExpression="amount%, timestamp">
                      <ItemStyle horizontalalign="Right"></ItemStyle>
                      <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="name" ReadOnly="True" headertext="Name"></asp:BoundColumn>
                    <asp:BoundColumn datafield="address" headertext="Address" ReadOnly="True" SortExpression="street.name%,house_num, timestamp">
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="city" headertext="City" ReadOnly="True" SortExpression="city%, street.name, house_num, timestamp">
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="state" HeaderText="St" ReadOnly="True" SortExpression="state%, city, street.name, house_num, timestamp"></asp:BoundColumn>
                    <asp:ButtonColumn CommandName="Watermark" HeaderText="Mail merge all down to..." Text="Here">
                      <ItemStyle HorizontalAlign="Center" />
                    </asp:ButtonColumn>
                  </Columns>
                  <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                </asp:DataGrid>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>
