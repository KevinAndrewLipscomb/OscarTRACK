<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_recent_oscalert_samples.ascx.cs" Inherits="UserControl_recent_oscalert_samples.TWebUserControl_recent_oscalert_samples"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <small>
      <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="2" border="0" width="100%">
              <tr>
                <td bgcolor="#dcdcdc">
                  <table cellspacing="0" cellpadding="0" border="0" width="100%">
                    <tr>
                      <td><b>Selected recent <a href="http://frompaper2web.com/OscarTRACK">OSCALERT</a> / <a href="http://broadcastify.com" target="_blank">Broadcastify</a> activations</b></td>
                      <td>
                        <table align="center" cellpadding="2" cellspacing="0">
                          <tr>
                            <td>Filter:</td>
                            <td align="center">
                              Impression<br />
                              <asp:DropDownList id="DropDownList_impression" runat="server" autopostback="True" OnSelectedIndexChanged="DropDownList_impression_SelectedIndexChanged" Font-Size="Small">
                                <asp:ListItem Value="">(all)</asp:ListItem>
                                <asp:ListItem Value="AirportAlert">AirportAlert</asp:ListItem>
                                <asp:ListItem Value="CardiacArrest">CardiacArrest</asp:ListItem>
                                <asp:ListItem Value="Fire">Fire-related</asp:ListItem>
                                <asp:ListItem Value="FireSurge">- FireSurge</asp:ListItem>
                                <asp:ListItem Value="TwoAlarmFire">- TwoAlarmFire</asp:ListItem>
                                <asp:ListItem Value="MultiAlarmFire">- MultiAlarmFire</asp:ListItem>
                                <asp:ListItem Value="Mci">Mci</asp:ListItem>
                                <asp:ListItem Value="MciSmall">- MciSmall</asp:ListItem>
                                <asp:ListItem Value="MciMedium">- MciMedium</asp:ListItem>
                                <asp:ListItem Value="MciLarge">- MciLarge</asp:ListItem>
                                <asp:ListItem Value="MciHuge">- MciHuge</asp:ListItem>
                                <asp:ListItem Value="MrtCall">MrtCall</asp:ListItem>
                                <asp:ListItem Value="SarCall">SarCall</asp:ListItem>
                                <asp:ListItem Value="Trap">Trap</asp:ListItem>
                              </asp:DropDownList>
                            </td>
                            <td align="center">
                              Recency<br />
                              <asp:DropDownList ID="DropDownList_recency" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList_recency_SelectedIndexChanged" Font-Size="Small">
                                <asp:ListItem Value="" Selected="True">This 24 hours</asp:ListItem>
                                <asp:ListItem Value="ThisWeek">This week</asp:ListItem>
                                <asp:ListItem Value="ThisMonth">This month</asp:ListItem>
                                <asp:ListItem Value="ThisQuarter">This quarter</asp:ListItem>
                              </asp:DropDownList>
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td align="right"><asp:Literal ID="Literal_num_alerts" runat="server"></asp:Literal>&nbsp;cases</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
              <tr>
                <td>
                  <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="2" autogeneratecolumns="False" Width="100%">
                    <Columns>
                      <asp:BoundColumn datafield="timestamp" headertext="Time">
                        <HeaderStyle Width="1%" />
                        <ItemStyle Wrap="False" VerticalAlign="Top" />
                      </asp:BoundColumn>
                      <asp:BoundColumn datafield="content" headertext="Content">
                        <HeaderStyle Width="99%" />
                        <ItemStyle VerticalAlign="Top" />
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
    </small>
  </ContentTemplate>
</asp:UpdatePanel>
