<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_field_situation.ascx.cs" Inherits="UserControl_field_situation.TWebUserControl_field_situation"%>
<%@ Register src="UserControl_recent_oscalert_samples.ascx" tagname="UserControl_recent_oscalert_samples" tagprefix="uc1" %>
<%@ Register Src="~/usercontrol/app/UserControl_recent_oscalert_samples.ascx" TagPrefix="uc2" TagName="UserControl_recent_oscalert_samples" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<h2>Virginia Beach EMS & Fire Active Case Board - <a href="http://vbrescuecouncil.org/pub/streaming_radio_traffic.aspx" target="_blank">&raquo;Listen!&laquo;</a></h2>
<asp:UpdatePanel id="UpdatePanel_cases" runat="server" updatemode="Conditional">
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
                    <td id="TableData_none" runat="server"><em>--&nbsp;NONE&nbsp;--</em></td>
                    <td>
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
                          <asp:BoundColumn DataField="nature" HeaderText="Nature" Visible="false">
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
      <table>
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
                <td>It pulls data from a rather sloppy external data source.&nbsp; Cases older than three hours are filtered out unless multiple units are still assigned.&nbsp; Some cases may linger after actual closure.</td>
              </tr>
              <tr>
                <td valign="top">&bull;</td>
                <td>It runs behind when the 911 center is very busy.</td>
              </tr>
              <tr>
                <td valign="top">&bull;</td>
                <td>It only forms a rough "Impression" of the nature of the case (for OSCALERT purposes) because the external data source does not reliably reveal specific natures.</td>
              </tr>
              <tr>
                <td valign="top">&bull;</td>
                <td>It sometimes shows case nature &quot;reclassifications&quot;.&nbsp; These are not actually assigned units.&nbsp; It is poor practice to "reclassify" your cases.&nbsp; Document the true nature in the run report instead.</td>
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
                      <td>&nbsp;</td>
                      <td style="text-decoration: underline">Common</td>
                    </tr>
                    <tr valign="top">
                      <td>
                        <table>
                          <tr>
                            <td>###</td>
                            <td>Ambulance</td>
                          </tr>
                          <tr>
                            <td>AIR</td>
                            <td>Va Beach air ambulance</td>
                          </tr>
                          <tr>
                            <td>BRIG</td>
                            <td>Brigade chief</td>
                          </tr>
                          <tr>
                            <td>EMS</td>
                            <td>Supervisor or higher command officer</td>
                          </tr>
                          <tr>
                            <td>HOLD</td>
                            <td>Placeholder - ambulance</td>
                          </tr>
                          <tr>
                            <td>HZC</td>
                            <td>Placeholder - zone car or ALS provider</td>
                          </tr>
                          <tr>
                            <td>LG</td>
                            <td>Lifeguard supervisor</td>
                          </tr>
                          <tr>
                            <td>MRTK</td>
                            <td>Marine rescue truck</td>
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
                            <td>R</td>
                            <td>Rescue district (info only)</td>
                          </tr>
                          <tr>
                            <td>RB</td>
                            <td>Rescue boat</td>
                          </tr>
                          <tr>
                            <td>SQ</td>
                            <td>Squad (crash)</td>
                          </tr>
                          <tr>
                            <td>Z</td>
                            <td>Zone car ALS</td>
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
                            <td>BRU</td>
                            <td>Brush truck</td>
                          </tr>
                          <tr>
                            <td>CAR</td>
                            <td>Division chief or higher command officer</td>
                          </tr>
                          <tr>
                            <td>CHE</td>
                            <td>Chesapeake engine</td>
                          </tr>
                          <tr>
                            <td>COCH</td>
                            <td>City Of Chesapeake auto-aid</td>
                          </tr>
                          <tr>
                            <td>CONF</td>
                            <td>City Of Norfolk auto-aid</td>
                          </tr>
                          <tr>
                            <td>E</td>
                            <td>Engine</td>
                          </tr>
                          <tr>
                            <td>FBOA</td>
                            <td>Fire boat</td>
                          </tr>
                          <tr>
                            <td>FI</td>
                            <td>Fire investigator</td>
                          </tr>
                          <tr>
                            <td>FM</td>
                            <td>Fire marshal</td>
                          </tr>
                          <tr>
                            <td>FR</td>
                            <td>Fire rescue (crash/technical)</td>
                          </tr>
                          <tr>
                            <td>HAZ</td>
                            <td>Hazmat</td>
                          </tr>
                          <tr>
                            <td>INS</td>
                            <td>Inspector</td>
                          </tr>
                          <tr>
                            <td>L</td>
                            <td>Ladder</td>
                          </tr>
                          <tr>
                            <td>NE</td>
                            <td>Navy engine</td>
                          </tr>
                          <tr>
                            <td>NFE</td>
                            <td>Norfolk engine</td>
                          </tr>
                          <tr>
                            <td>PIO</td>
                            <td>Public information officer</td>
                          </tr>
                          <tr>
                            <td>PU</td>
                            <td>Public utilities</td>
                          </tr>
                          <tr>
                            <td>SAFE</td>
                            <td>Safety</td>
                          </tr>
                          <tr>
                            <td>T</td>
                            <td>Tanker (water tender)</td>
                          </tr>
                          <tr>
                            <td>ZOD</td>
                            <td>Zodiac boat</td>
                          </tr>
                        </table>
                      </td>
                      <td>&nbsp;</td>
                      <td>
                        <table>
                          <tr>
                            <td>TAC</td>
                            <td>Tactical radio channel</td>
                          </tr>
                          <tr>
                            <td>SUP</td>
                            <td>Support</td>
                          </tr>
                          <tr>
                            <td>U</td>
                            <td>Utility</td>
                          </tr>
                        </table>
                        <br />
                        <table>
                          <tr><td colspan="2"><span style="text-decoration: underline">Suffixes</span>:</td></tr>
                          <tr>
                            <td>~R</td>
                            <td>BLS</td>
                          </tr>
                          <tr>
                            <td>~S</td>
                            <td>Shock-trauma/Enhanced/Advanced</td>
                          </tr>
                          <tr>
                            <td>~P</td>
                            <td>Intermediate/Paramedic/MD</td>
                          </tr>
                          <tr>
                            <td>~DR</td>
                            <td>Driver-only</td>
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
                            <td>Thalia</td>
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
       [station number][twenty number][common suffix]
    Examples:
       [ 1][20][R] →  120R (Ocean Park station, ambulance 20, staffed BLS)
       [ 2][21][S] →  221S (Davis Corner station, ambulance 21, staffed Shock-trauma/Enhanced/Advanced)
       :
       [22][29][P] → 2229P (First Landing station, ambulance 29, staffed Intermediate/Paramedic)
    </pre>
          </td>
        </tr>
      </table>
    </small>
  </ContentTemplate>
</asp:UpdatePanel>
