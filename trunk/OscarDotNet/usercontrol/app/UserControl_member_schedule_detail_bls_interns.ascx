<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_member_schedule_detail_bls_interns.ascx.cs" Inherits="UserControl_member_schedule_detail_bls_interns.TWebUserControl_member_schedule_detail_bls_interns"%>
<%@ Register src="UserControl_member_schedule_detail.ascx" tagname="UserControl_member_schedule_detail" tagprefix="uc1" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" border="0">
        <tr>
          <td bgcolor="#dcdcdc">
            <table cellspacing="0" cellpadding="5" border="0" width="100%">
              <tr>
                <td><strong>BLS Interns</strong></td>
                <td align="right"><asp:Literal ID="Literal_num_personnel" runat="server"></asp:Literal> personnel</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
        <tr>
          <td>
            <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False" ShowHeader="False">
              <Columns>
                <asp:BoundColumn DataField="member_id" Visible="False"></asp:BoundColumn>
                <asp:TemplateColumn>
                  <ItemTemplate>
                    <uc1:UserControl_member_schedule_detail ID="UserControl_member_schedule_detail" runat="server" />
                  </ItemTemplate>
                </asp:TemplateColumn>
              </Columns>
              <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
            </asp:DataGrid>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
