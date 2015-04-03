<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_recent_oscalert_samples.ascx.cs" Inherits="UserControl_recent_oscalert_samples.TWebUserControl_recent_oscalert_samples"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
      <tr>
        <td>
          <table cellspacing="0" cellpadding="10" border="0">
            <tr>
              <td bgcolor="#dcdcdc">
                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                  <tr>
                    <td>
                      <strong>Filter:&nbsp;<asp:DropDownList id="DropDownList_filter" runat="server" autopostback="True">
                        <asp:ListItem>(all)</asp:ListItem>
                        <asp:ListItem>AirportAlert</asp:ListItem>
                        <asp:ListItem Value="Fire">Fire-related</asp:ListItem>
                        <asp:ListItem>- FireSurge</asp:ListItem>
                        <asp:ListItem>- TwoAlarmFire</asp:ListItem>
                        <asp:ListItem>- MultiAlarmFire</asp:ListItem>
                        <asp:ListItem>Mci</asp:ListItem>
                        <asp:ListItem Value="MciSmall">- MciSmall</asp:ListItem>
                        <asp:ListItem Value="MciMedium">- MciMedium</asp:ListItem>
                        <asp:ListItem Value="MciLarge">- MciLarge</asp:ListItem>
                        <asp:ListItem Value="MciHuge">- MciHuge</asp:ListItem>
                        <asp:ListItem>MrtCall</asp:ListItem>
                        <asp:ListItem>SarCall</asp:ListItem>
                        <asp:ListItem>Trap</asp:ListItem>
                      </asp:DropDownList></strong>
                    </td>
                    <td align="right">
                      <asp:Literal ID="Literal_num_alerts" runat="server"></asp:Literal> alerts
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
            <tr>
              <td>
                <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="2" autogeneratecolumns="False">
                  <Columns>
                    <asp:BoundColumn datafield="timestamp" headertext="Time">
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="content" headertext="Event">
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
