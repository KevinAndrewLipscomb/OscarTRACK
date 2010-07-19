<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_mini_fix_log.ascx.cs" Inherits="UserControl_mini_fix_log.TWebUserControl_mini_fix_log"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
      <tr>
        <td>
          <table cellspacing="0" cellpadding="10" border="0">
            <tr>
              <td bgcolor="#dcdcdc">
                <table cellspacing="0" cellpadding="10" border="0" width="100%">
                  <tr>
                    <td nowrap="true">
                      <asp:Literal ID="Literal_num_requests" runat="server"></asp:Literal> MiniFix requests for <b><asp:Literal ID="Literal_vehicle_name" runat="server"></asp:Literal></b>
                    </td>
                    <td align="center">
                      <asp:Panel ID="Panel_filter" runat="server" Visible="false">
                        <strong>Filter:&nbsp;<asp:DropDownList id="DropDownList_filter" runat="server" autopostback="True"></asp:DropDownList></strong>
                      </asp:Panel>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td>
                <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False" allowsorting="True">
                  <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                  <Columns>
                    <asp:TemplateColumn HeaderText="Include on work order">
                      <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                      <ItemTemplate>
                        <asp:CheckBox ID="CheckBox_include" runat="server" Checked="True" />
                      </ItemTemplate>
                      <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top" HorizontalAlign="Center" />
                    </asp:TemplateColumn>
                    <asp:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/delete_x16_h.png&quot; alt=&quot;Delete&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Delete" Visible="False">
                      <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top" />
                    </asp:ButtonColumn>
                    <asp:BoundColumn datafield="id" headertext="#" SortExpression="id%">
                      <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                      <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="description" headertext="Description"></asp:BoundColumn>
                    <asp:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/draw_freehand_16_h.png&quot; alt=&quot;Append&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Append">
                      <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top" />
                    </asp:ButtonColumn>
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
<p><asp:Button ID="Button_new" runat="server" CausesValidation="False" Font-Bold="True" Text="Enter a new MiniFix request" onclick="Button_new_Click"></asp:Button></p>