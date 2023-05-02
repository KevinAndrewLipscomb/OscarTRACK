<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_trespass.ascx.cs" Inherits="UserControl_trespass.TWebUserControl_trespass"%>
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
                      <strong>
                        <a href="http://google.com/maps?q=" target="_blank"></a>
                          <asp:Literal ID="Literal_address" runat="server"></asp:Literal><br />
                          VIRGINIA BEACH VA
                        </a>
                      </strong>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td align="right" valign="top"><asp:Literal ID="Literal_num_claims" runat="server"></asp:Literal> claims</td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
            <tr>
              <td>
                <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False" allowsorting="True" OnDeleteCommand="DataGrid_control_DeleteCommand">
                  <Columns>
                    <asp:BoundColumn datafield="name" headertext="Resident/Occupant Name" sortexpression="name%"></asp:BoundColumn>
                    <asp:BoundColumn datafield="agency" headertext="Agency" sortexpression="agency_id%"></asp:BoundColumn>
                    <asp:ButtonColumn ButtonType="LinkButton" CommandName="Delete" Text="Delete"></asp:ButtonColumn>
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
