<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_coverage_assistant.ascx.cs" Inherits="UserControl_coverage_assistant.TWebUserControl_coverage_assistant"%>
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
                      <strong>Filter:&nbsp;<asp:DropDownList id="DropDownList_filter" runat="server" autopostback="True"></asp:DropDownList></strong>
                    </td>
                    <td align="right">
                      <asp:Literal ID="Literal_num_potential_helpers" runat="server"></asp:Literal> potential helpers
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
            <tr>
              <td>
                <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False" allowsorting="True">
                  <Columns>
                    <asp:BoundColumn datafield="name" headertext="Name"></asp:BoundColumn>
                    <asp:BoundColumn datafield="agency" headertext="Agency" SortExpression="be_same_agency desc, medical_release_code_description_map.pecking_order desc">
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundColumn>
                    <asp:BoundColumn datafield="medical_release_level" headertext="Released cert level" SortExpression="medical_release_code_description_map.pecking_order desc">
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundColumn>
                    <asp:BoundColumn datafield="be_driver" headertext="Released driver">
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:TemplateColumn HeaderText="Email address">
                          <ItemTemplate>
                              <asp:HyperLink ID="HyperLink_email_address" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.email_address") %>'></asp:HyperLink>
                          </ItemTemplate>
                      </asp:TemplateColumn>
                      <asp:TemplateColumn HeaderText="Phone #">
                          <ItemTemplate>
                              <asp:HyperLink ID="HyperLink_phone_num" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.phone_num") %>'></asp:HyperLink>
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
  </ContentTemplate>
</asp:UpdatePanel>
