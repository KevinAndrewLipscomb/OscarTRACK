<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_schedule_assignments_audit.ascx.cs" Inherits="UserControl_schedule_assignments_audit.TWebUserControl_schedule_assignments_audit"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
      <tr>
        <td>
          <table cellspacing="0" cellpadding="10" border="0">
            <tr>
              <td bgcolor="#dcdcdc">
                <table cellspacing="0" cellpadding="0" border="0">
                  <tr>
                    <td>
                      <small>
                        <asp:RadioButtonList ID="RadioButtonList_relative_month" runat="server" AutoPostBack="True" onselectedindexchanged="RadioButtonList_relative_month_SelectedIndexChanged">
                          <asp:ListItem Selected="True" Value="0">This month</asp:ListItem>
                          <asp:ListItem Value="1">Next month</asp:ListItem>
                        </asp:RadioButtonList>
                      </small>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
            <tr>
              <td>
                <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False">
                  <Columns>
                    <asp:BoundColumn datafield="agency" HeaderText="Agency">
                      <HeaderStyle HorizontalAlign="Center" />
                      <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="name" headertext="Name"></asp:BoundColumn>
                    <asp:BoundColumn datafield="cad_num" headertext="CAD #">
                      <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="be_released" headertext="Released?">
                      <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="enrollment_level" headertext="Membership status">
                      <HeaderStyle HorizontalAlign="Center" />
                      <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="be_on_squad_truck_team" HeaderText="SQTM?">
                      <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="obligation" headertext="Obliged hours">
                      <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="be_compliant" headertext="Compliant?">
                      <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="num_avails" headertext="Available hours">
                      <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="num_assignments" headertext="Assigned hours">
                      <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="balance" headertext="Balance hours">
                      <ItemStyle HorizontalAlign="Right" />
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
