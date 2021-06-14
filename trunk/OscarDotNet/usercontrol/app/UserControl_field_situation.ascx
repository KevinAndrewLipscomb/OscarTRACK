<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_field_situation.ascx.cs" Inherits="UserControl_field_situation.TWebUserControl_field_situation"%>
<%@ Register src="UserControl_recent_oscalert_samples.ascx" tagname="UserControl_recent_oscalert_samples" tagprefix="uc1" %>
<%@ Register Src="~/usercontrol/app/UserControl_recent_oscalert_samples.ascx" TagPrefix="uc2" TagName="UserControl_recent_oscalert_samples" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<table>
  <tr>
    <td align="right">
      <strong><big><big>Virginia Beach EMS & Fire Active Case Board</big></big></strong>
      <br />
      <small><small><a href="https://www.broadcastify.com/listen/feed/14744" target="_blank">Scanner feed details</a></small></small>
    </td>
    <td>&nbsp;&nbsp;&nbsp;</td>
    <td><audio id="Audio_control" runat="server" controls preload="none">Sorry, your bowser does not support the audio control.</audio></td>
  </tr>
</table>
<asp:UpdatePanel id="UpdatePanel_cases" runat="server" updatemode="Conditional" Visible="false">
  <ContentTemplate>
    <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
      <tr>
        <td>
          <table cellspacing="0" cellpadding="10" border="0">
            <tr>
              <td bgcolor="#dcdcdc">
                <table cellspacing="0" cellpadding="0" border="0" style="width: 100%">
                  <tr>
                    <td><strong>Field situation</strong></td>
                    <td align="right"><asp:Literal ID="Literal_num_cases" runat="server"></asp:Literal></td>
                  </tr>
                  <tr>
                    <td><small><i>Not for responses or system status management</i></small></td>
                    <td align="right"><small>Auto-refresh: <span id="Span_countdown">60</span></small></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td>
                <table>
                  <tr valign="top">
                    <td id="TableData_none" runat="server" nowrap="nowrap"><em>--&nbsp;NONE&nbsp;--</em></td>
                    <td id="TableData_cases" runat="server">
                      <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="5" autogeneratecolumns="False" allowsorting="True" OnItemCommand="DataGrid_control_ItemCommand">
                        <Columns>
                          <asp:BoundColumn DataField="id" Visible="False"></asp:BoundColumn>
                          <asp:TemplateColumn HeaderText="Pin">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                          </asp:TemplateColumn>
                          <asp:BoundColumn datafield="time_initialized" HeaderText="Time initialized">
                            <HeaderStyle horizontalalign="Center"></HeaderStyle>
                            <ItemStyle VerticalAlign="Top" Font-Size="Small"/>
                          </asp:BoundColumn>
                          <asp:BoundColumn DataField="nature" HeaderText="Nature">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle horizontalalign="Center" VerticalAlign="Top"></ItemStyle>
                          </asp:BoundColumn>
                          <asp:HyperLinkColumn DataTextField="address" HeaderText="Address (click for dynomap)" Target="_blank">
                            <HeaderStyle horizontalalign="Left"></HeaderStyle>
                            <ItemStyle Font-Bold="True" VerticalAlign="Top"/>
                          </asp:HyperLinkColumn>
                          <asp:BoundColumn datafield="assignment" headertext="Assignment">
                            <ItemStyle horizontalalign="Left" VerticalAlign="Top"></ItemStyle>
                          </asp:BoundColumn>
                          <asp:BoundColumn datafield="impression" headertext="Impression">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle horizontalalign="Center" VerticalAlign="Top"></ItemStyle>
                          </asp:BoundColumn>
                          <asp:ButtonColumn Text="&lt;IMG src=&quot;~/protected/image/delete_x16_h.png&quot; alt=&quot;Delete&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Remove" Visible="False"></asp:ButtonColumn>
                        </Columns>
                        <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                      </asp:DataGrid>
                    </td>
                    <td><asp:Image ID="Image_control" runat="server" AlternateText="Static overview map" ToolTip="Static overview map" EnableViewState="False" Height="400px" Width="400px"/></td>
                    <td id="TableData_supression_notice" runat="server" visible="false" width="250em">
                      <table cellpadding="10" cellspacing="0">
                        <tr>
                          <td>
                            <small>
                              Members of the Virginia Beach EMS Department and its volunteer rescue squads can access the full field situation display by logging into
                              <asp:HyperLink ID="HyperLink_application_login_link" runat="server"></asp:HyperLink>.
                            </small>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td>
                <uc2:UserControl_recent_oscalert_samples runat="server" ID="UserControl_recent_oscalert_samples_control" />
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <asp:Timer ID="Timer_control" runat="server" OnTick="Timer_control_Tick"></asp:Timer>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdatePanel id="UpdatePanel_explanations" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <small>
      <br />
      <table id="Table_notes" runat="server" visible="false">
        <tr><td><asp:LinkButton ID="LinkButton_toggle_notes" runat="server" OnClick="LinkButton_toggle_notes_Click">[Show]</asp:LinkButton> CAVEATS</td></tr>
        <tr id ="TableRow_notes_body" runat="server" visible="false">
          <td>
            <table>
              <tr>
                <td valign="top">&bull;</td>
                <td>This control shows addresses that are ambiguated to the hundred-block.</td>
              </tr>
              <tr>
                <td valign="top">&bull;</td>
                <td>The external data source does not reveal specific natures for all cases.</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <br />
      <table>
        <tr><td><asp:LinkButton ID="LinkButton_toggle_assignment_designator_prefixes" runat="server" OnClick="LinkButton_toggle_assignment_designator_prefixes_Click">[Show]</asp:LinkButton> ASSIGNMENT DESIGNATOR AFFIXES</td></tr>
        <tr id ="TableRow_assignment_designator_prefixes_body" runat="server" visible="false">
          <td>
            <table>
              <tr>
                <td>
                  <table>
                    <tr>
                      <td style="text-decoration: underline">EMS Department</td>
                      <td>&nbsp;</td>
                      <td style="text-decoration: underline">Fire Department</td>
                    </tr>
                    <tr valign="top">
                      <td>
                        <table>
                          <tr>
                            <td>A</td>
                            <td>Ambulance</td>
                          </tr>
                          <tr>
                            <td>CART</td>
                            <td>Multipurpose off-highway utility vehicle (ambulette)</td>
                          </tr>
                          <tr>
                            <td>CSM</td>
                            <td>Community (proactive) Service Medic</td>
                          </tr>
                          <tr>
                            <td>ECH</td>
                            <td>EMS Chief</td>
                          </tr>
                          <tr>
                            <td>EMS</td>
                            <td>Field supervisor</td>
                          </tr>
                          <tr>
                            <td>MATV</td>
                            <td>Medical All-Terrain Vehicle</td>
                          </tr>
                          <tr>
                            <td>MD</td>
                            <td>Physician</td>
                          </tr>
                          <tr>
                            <td>MM</td>
                            <td>Marine medic</td>
                          </tr>
                          <tr>
                            <td>MMTK</td>
                            <td>Marine rescue truck</td>
                          </tr>
                          <tr>
                            <td>MUTK</td>
                            <td>Medical utility truck</td>
                          </tr>
                          <tr>
                            <td>NGALE</td>
                            <td>Nightingale air ambulance</td>
                          </tr>
                          <tr>
                            <td>NR</td>
                            <td>Navy rescue (ambulance)</td>
                          </tr>
                          <tr>
                            <td>RLG</td>
                            <td>Resort lifeguard supervisor</td>
                          </tr>
                          <tr>
                            <td>SLG</td>
                            <td>Sandbridge lifeguard supervisor</td>
                          </tr>
                          <tr>
                            <td>ZM</td>
                            <td>Zone medic ALS car</td>
                          </tr>
                        </table>
                      </td>
                      <td>&nbsp;</td>
                      <td>
                        <table>
                          <tr>
                            <td>BAT</td>
                            <td>Battalion chief</td>
                          </tr>
                          <tr>
                            <td>CAR</td>
                            <td>Division chief or higher command officer</td>
                          </tr>
                          <tr>
                            <td>E</td>
                            <td>Engine</td>
                          </tr>
                          <tr>
                            <td>FR</td>
                            <td>Fire rescue (crash/technical)</td>
                          </tr>
                          <tr>
                            <td>L</td>
                            <td>Ladder</td>
                          </tr>
                          <tr>
                            <td>NE</td>
                            <td>Navy Engine</td>
                          </tr>
                          <tr>
                            <td>SAFE</td>
                            <td>Safety</td>
                          </tr>
                          <tr>
                            <td>SUP</td>
                            <td>Support</td>
                          </tr>
                          <tr>
                            <td>T</td>
                            <td>Tanker (water tender)</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <br />
      <table>
        <tr><td><asp:LinkButton ID="LinkButton_toggle_station_numbers" runat="server" OnClick="LinkButton_toggle_station_numbers_Click">[Show]</asp:LinkButton> STATION NUMBERS</td></tr>
        <tr id ="TableRow_station_numbers_body" runat="server" visible="false">
          <td>
            <table>
              <tr>
                <td>
                  <table>
                    <tr valign="top">
                      <td>
                        <table>
                          <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>1</td>
                            <td>Ocean Park</td>
                          </tr>
                          <tr>
                            <td>2</td>
                            <td>Davis Corner</td>
                          </tr>
                          <tr>
                            <td>3</td>
                            <td>London Bridge</td>
                          </tr>
                          <tr>
                            <td>4</td>
                            <td>Chesapeake Beach</td>
                          </tr>
                          <tr>
                            <td>5</td>
                            <td>Princess Anne Courthouse</td>
                          </tr>
                          <tr>
                            <td>6</td>
                            <td>Creeds</td>
                          </tr>
                          <tr>
                            <td>7</td>
                            <td>Town Center</td>
                          </tr>
                          <tr>
                            <td>8</td>
                            <td>Oceana</td>
                          </tr>
                          <tr>
                            <td>9</td>
                            <td>Kempsville</td>
                          </tr>
                        </table>
                      </td>
                      <td>&nbsp;</td>
                      <td>
                        <table>
                          <tr>
                            <td>10</td>
                            <td>Woodstock</td>
                          </tr>
                          <tr>
                            <td>11</td>
                            <td>Beach Borough</td>
                          </tr>
                          <tr>
                            <td>12</td>
                            <td>Seatack</td>
                          </tr>
                          <tr>
                            <td>13</td>
                            <td>Blackwater</td>
                          </tr>
                          <tr>
                            <td>14</td>
                            <td>Virginia Beach (oceanfront)</td>
                          </tr>
                          <tr>
                            <td>15</td>
                            <td>Thalia (EMS) / Fort Story (Fire)</td>
                          </tr>
                          <tr>
                            <td>16</td>
                            <td>Plaza</td>
                          </tr>
                          <tr>
                            <td>17</td>
                            <td>Sandbridge</td>
                          </tr>
                          <tr>
                            <td>18</td>
                            <td>Green Run</td>
                          </tr>
                          <tr>
                            <td>19</td>
                            <td>Stumpy Lake</td>
                          </tr>
                        </table>
                      </td>
                      <td>&nbsp;</td>
                      <td>
                        <table>
                          <tr>
                            <td>20</td>
                            <td>Little Neck</td>
                          </tr>
                          <tr>
                            <td>21</td>
                            <td>Strawbridge</td>
                          </tr>
                          <tr>
                            <td>22</td>
                            <td>First Landing</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <br />
      <table>
        <tr><td><asp:LinkButton ID="LinkButton_toggle_ambulance_callsigns" runat="server" OnClick="LinkButton_toggle_ambulance_callsigns_Click">[Show]</asp:LinkButton> AMBULANCE CALLSIGNS</td></tr>
        <tr id ="TableRow_ambulance_callsigns_body" runat="server" visible="false">
          <td>
    <pre>
    The format for an ambulance callsign is:
       A[volunteer rescue squad number][twenty number]
    Examples:
       A[ 1][20] →  A120 (Ocean Park VRS, Ambulance 20)
       A[ 2][21] →  A221 (Davis Corner VRS, Ambulance 21)
       :
       A[17][29] → A1729 (Sandbridge VRS, Ambulance 29)
    A &quot;P&quot; suffix indicates an ALS unit.
    </pre>
          </td>
        </tr>
      </table>
    </small>
  </ContentTemplate>
</asp:UpdatePanel>
