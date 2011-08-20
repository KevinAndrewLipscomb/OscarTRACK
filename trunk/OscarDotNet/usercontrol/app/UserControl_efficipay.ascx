<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_efficipay.ascx.cs" Inherits="UserControl_efficipay.TWebUserControl_efficipay"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
      <tr>
        <td>
          <table cellspacing="0" cellpadding="10" border="0">
            <tr>
              <td bgcolor="#dcdcdc">
                <table cellspacing="10" cellpadding="0" border="0">
                  <tr>
                    <td>
                      <strong>Filter:&nbsp;<asp:DropDownList id="DropDownList_filter" runat="server" autopostback="True" onselectedindexchanged="DropDownList_filter_SelectedIndexChanged">
                        <asp:ListItem Selected="True">All</asp:ListItem>
                        <asp:ListItem Value="0">Not ready for review</asp:ListItem>
                        <asp:ListItem Value="1">Ready for review</asp:ListItem>
                      </asp:DropDownList></strong>
                    </td>
                    <td align="right"><asp:Literal ID="Literal_num_efficipay_dockets" runat="server"></asp:Literal> dockets</td>
                    <td><asp:LinkButton ID="LinkButton_add_docket" runat="server" CausesValidation="False" onclick="LinkButton_add_docket_Click" Visible="False" Font-Bold="True">Add docket</asp:LinkButton></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
            <tr>
              <td>
                <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False" allowsorting="True">
                  <Columns>
                    <asp:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/open_document16_h.png&quot; alt=&quot;Detail&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Select"></asp:ButtonColumn>
                    <asp:BoundColumn datafield="id" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn datafield="num" headertext="Docket #" sortexpression="num%">
                      <HeaderStyle horizontalalign="Left"></HeaderStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="be_ready_for_review" headertext="Ready for sigs" sortexpression="be_ready_for_review%,num">
                      <ItemStyle horizontalalign="Right"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="signer_1" HeaderText="First signer"></asp:BoundColumn>
                    <asp:BoundColumn datafield="signer_2" HeaderText="Second signer"></asp:BoundColumn>
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
