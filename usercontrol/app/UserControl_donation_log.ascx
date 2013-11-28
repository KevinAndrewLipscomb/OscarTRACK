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
                <table id="Table_filter_and_count" runat="server" visible="false" cellspacing="0" cellpadding="0" border="0">
                  <tr>
                    <td><strong>Filter:&nbsp;<asp:DropDownList id="DropDownList_filter" runat="server" autopostback="True"></asp:DropDownList></strong></td>
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
                    <asp:BoundColumn datafield="per_clerk_seq_num" ReadOnly="True" HeaderText="#" SortExpression="per_clerk_seq_num%">
                      <HeaderStyle HorizontalAlign="Center" />
                      <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="amount" dataformatstring="{0:C}" headertext="Amount" ReadOnly="True" SortExpression="amount%">
                      <ItemStyle horizontalalign="Right"></ItemStyle>
                      <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="name" ReadOnly="True" headertext="Name"></asp:BoundColumn>
                    <asp:BoundColumn datafield="address" headertext="Address" ReadOnly="True" SortExpression="street.name%,house_num">
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="city" headertext="City" ReadOnly="True" SortExpression="city%">
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="state" HeaderText="St" ReadOnly="True" SortExpression="state%"></asp:BoundColumn>
                    <asp:ButtonColumn CommandName="Watermark" HeaderText="Mail merge all down to..." Text="Here">
                      <ItemStyle HorizontalAlign="Center" />
                    </asp:ButtonColumn>
                  </Columns>
                  <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                </asp:DataGrid>
                <asp:DataGrid id="DataGrid_entries_to_export" runat="server" autogeneratecolumns="False" style="display:none">
                  <Columns>
                    <asp:BoundColumn datafield="name" ReadOnly="True" headertext="Name"></asp:BoundColumn>
                    <asp:BoundColumn datafield="address" headertext="Address" ReadOnly="True">
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="city" headertext="City" ReadOnly="True">
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="state" HeaderText="St" ReadOnly="True"></asp:BoundColumn>
                  </Columns>
                </asp:DataGrid>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>
