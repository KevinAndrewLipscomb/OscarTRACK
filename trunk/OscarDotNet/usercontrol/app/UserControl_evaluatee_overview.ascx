<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_evaluatee_overview.ascx.cs" Inherits="UserControl_evaluatee_overview.TWebUserControl_evaluatee_overview"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
      <tr>
        <td>
          <table cellspacing="0" cellpadding="10" border="0">
            <tr>
              <td bgcolor="#dcdcdc">
                <table cellpadding="5" cellspacing="0" width="100%">
                  <tr>
                    <td></td>
                    <td align="right"><asp:LinkButton ID="LinkButton_add" runat="server" onclick="LinkButton_add_Click" Font-Bold="True">Add new eval</asp:LinkButton></td>
                  </tr>
                  <tr>
                    <td>
                      <strong>Range:</strong>
                      <asp:DropDownList id="DropDownList_range" runat="server" autopostback="True" onselectedindexchanged="DropDownList_range_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="InProcess">In process</asp:ListItem>
                        <asp:ListItem>Archived</asp:ListItem>
                        <asp:ListItem>All</asp:ListItem>
                      </asp:DropDownList>
                    </td>
                    <td align="right"><asp:Literal ID="Literal_num_evals" runat="server"></asp:Literal>&nbsp;evals</td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
            <tr>
              <td>
                <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False" allowsorting="True">
                  <Columns>
                    <asp:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/open_document16_h.png&quot; alt=&quot;Detail&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Open"></asp:ButtonColumn>
                    <asp:BoundColumn datafield="id" HeaderText="#">
                      <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="nominal_day" headertext="Shift">
                      <HeaderStyle horizontalalign="Right"></HeaderStyle>
                      <ItemStyle horizontalalign="Right"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="shift_name"></asp:BoundColumn>
                    <asp:BoundColumn datafield="post_designator" headertext="Station">
                      <HeaderStyle horizontalalign="Right"></HeaderStyle>
                      <ItemStyle horizontalalign="Right"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="post_cardinality" headertext="Crew"></asp:BoundColumn>
                    <asp:BoundColumn DataField="vehicle_name" HeaderText="Unit">
                      <HeaderStyle horizontalalign="Center"></HeaderStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="aic_member_name" HeaderText="AIC">
                      <HeaderStyle horizontalalign="Center"></HeaderStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="status" HeaderText="Status">
                      <HeaderStyle horizontalalign="Center"></HeaderStyle>
                    </asp:BoundColumn>
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
