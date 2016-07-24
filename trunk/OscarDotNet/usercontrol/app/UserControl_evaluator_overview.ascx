<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_evaluator_overview.ascx.cs" Inherits="UserControl_evaluator_overview.TWebUserControl_evaluator_overview"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
      <tr>
        <td>
          <table cellspacing="0" cellpadding="10" border="0">
            <tr>
              <td bgcolor="#dcdcdc">
                <table cellpadding="10" cellspacing="0" width="100%">
                  <tr>
                    <td><b>Your evaluations <em>of other members</em></b></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td align="right"><asp:LinkButton ID="LinkButton_add" runat="server" onclick="LinkButton_add_Click" Font-Bold="True">Add new eval</asp:LinkButton></td>
                  </tr>
                  <tr>
                    <td>
                      <strong>Range:</strong>
                      <asp:DropDownList id="DropDownList_range" runat="server" autopostback="True" onselectedindexchanged="DropDownList_range_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="InProcess">In process</asp:ListItem>
                        <asp:ListItem Value="Archived">Archived</asp:ListItem>
                        <asp:ListItem Value="">All</asp:ListItem>
                      </asp:DropDownList>
                      &nbsp;&nbsp;&nbsp;
                      <asp:CheckBox ID="CheckBox_aic_me_only" runat="server" AutoPostBack="True" oncheckedchanged="CheckBox_aic_me_only_CheckedChanged" Text="AIC&nbsp;=&nbsp;Me" Visible="False" />
                      &nbsp;&nbsp;&nbsp;
                      <strong>3rd sxn:</strong>
                      <asp:DropDownList ID="DropDownList_third_section" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList_third_section_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                    <td></td>
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
                    <asp:BoundColumn DataField="third_member_name" HeaderText="Third">
                      <HeaderStyle horizontalalign="Center"></HeaderStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="aic_member_name" HeaderText="AIC" Visible="false">
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
