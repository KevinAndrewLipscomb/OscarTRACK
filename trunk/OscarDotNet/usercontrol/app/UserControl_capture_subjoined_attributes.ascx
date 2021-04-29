<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_capture_subjoined_attributes.ascx.cs" Inherits="UserControl_capture_subjoined_attributes.TWebUserControl_capture_subjoined_attributes"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
      <tr>
        <td>
          <table cellspacing="0" cellpadding="10" border="0">
            <tr><td bgcolor="#dcdcdc"><h3>We need to collect some additional information from you before proceeding...</h3></td></tr>
            <tr>
              <td>
                <asp:DataGrid id="DataGrid_control" runat="server" gridlines="None" cellpadding="10" autogeneratecolumns="False" ShowHeader="False">
                  <Columns>
                    <asp:BoundColumn DataField="involvement" ReadOnly="True" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn DataField="name" ReadOnly="True" Visible="False"></asp:BoundColumn>
                    <asp:TemplateColumn>
                      <ItemTemplate>
                        <asp:PlaceHolder ID="PlaceHolder_control" runat="server"></asp:PlaceHolder>
                      </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn>
                      <ItemTemplate>
                        <asp:CustomValidator ID="CustomValidator_control" runat="server" Font-Bold="True">&lt;ERR!</asp:CustomValidator>
                      </ItemTemplate>
                      <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top" />
                    </asp:TemplateColumn>
                  </Columns>
                </asp:DataGrid>
                <br />
                <asp:Button ID="Button_submit" runat="server" Text="Submit" OnClick="Button_submit_Click" />
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>
