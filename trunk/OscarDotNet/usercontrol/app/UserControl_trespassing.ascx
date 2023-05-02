<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_trespassing.ascx.cs" Inherits="UserControl_trespassing.TWebUserControl_trespassing"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
      <tr>
        <td>
          <table cellspacing="0" cellpadding="10" border="0">
            <tr>
              <td bgcolor="#dcdcdc">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                  <tr>
                    <td>
                      <strong>Filter:&nbsp;<asp:DropDownList id="DropDownList_filter" runat="server" autopostback="True" OnSelectedIndexChanged="DropDownList_filter_SelectedIndexChanged"></asp:DropDownList></strong>
                    </td>
                    <td align="right">
                      <asp:Literal ID="Literal_num_trespasses" runat="server"></asp:Literal> trespass(es)
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
                    <asp:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/open_document16_h.png&quot; alt=&quot;Detail&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Select"></asp:ButtonColumn>
                    <asp:BoundColumn datafield="house_num" headertext="House#">
                      <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Right" />
                      <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Right" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="street_name" headertext="Address" sortexpression="street.name%,x.house_num,x.agency">
                      <HeaderStyle horizontalalign="Left"></HeaderStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="agencies" headertext="Agencies"></asp:BoundColumn>
                    <asp:BoundColumn datafield="street_id" visible="false"></asp:BoundColumn>
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
