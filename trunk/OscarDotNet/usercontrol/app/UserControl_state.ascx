<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_state.ascx.cs" Inherits="UserControl_state.TWebUserControl_state" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~trivial~item.ascx-template -->
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
        <tr>
          <td bgcolor="gainsboro" valign="top">
            <font class="compact">ID: </font>
          </td>
          <td valign="top">
            <font class="compact">
              <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                  <td valign="middle">
                    <table cellspacing="0" cellpadding="0" border="0">
                      <tr>
                        <td>
                          <asp:TextBox ID="TextBox_id" runat="server" Columns="3" MaxLength="3" CssClass="compact"></asp:TextBox><asp:Button ID="Button_lookup" runat="server" CausesValidation="False" Text="LOOKUP" OnClick="Button_lookup_Click"></asp:Button>
                        </td>
                        <td>
                          <small><small>
                            <asp:Label ID="Label_lookup_arrow" runat="server">&lt;--
                            </asp:Label></small></small>
                        </td>
                        <td>
                          <small><small><em>
                            <asp:Label ID="Label_lookup_hint" runat="server">Lookup by partial or full abbreviation
                            </asp:Label></em></small></small>
                        </td>
                      </tr>
                    </table>
                  </td>
                  <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  <td valign="middle">
                    <small>
                      <asp:LinkButton ID="LinkButton_reset" runat="server" CausesValidation="False" Enabled="False" OnClick="LinkButton_reset_Click">New lookup
                      </asp:LinkButton>
                    </small>
                  </td>
                  <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  <td valign="middle">
                    <small>
                      <asp:LinkButton ID="LinkButton_new_record" runat="server" CausesValidation="False" Visible="False" OnClick="LinkButton_new_record_Click">Enter brand new state
                      </asp:LinkButton>
                    </small>
                  </td>
                </tr>
              </table>
              <table>
                <tr>
                  <td>
                    <asp:Panel ID="Panel_match_numbers" runat="server" Visible="False">
                      <small>(<asp:Literal ID="Literal_match_index" runat="server"></asp:Literal>/<asp:Literal ID="Literal_num_matches" runat="server"></asp:Literal>)</small></asp:Panel>
                  </td>
                  <td>
                    <asp:LinkButton ID="LinkButton_go_to_match_first" runat="server" Text='<IMG src="~/protected/image/first_track_blue16_h.png" alt="First match" border="0" height="16" width="16" />' CausesValidation="False" Visible="False" OnClick="LinkButton_go_to_match_first_Click"></asp:LinkButton><asp:LinkButton
                      ID="LinkButton_go_to_match_prior" runat="server" Text='<IMG src="~/protected/image/play_blue16_h-flipped.png" alt="Prior match" border="0" height="16" width="16" />' CausesValidation="False" Visible="False" OnClick="LinkButton_go_to_match_prior_Click"></asp:LinkButton><asp:LinkButton
                        ID="LinkButton_go_to_match_next" runat="server" Text='<IMG src="~/protected/image/play_blue16_h.png" alt="Next match" border="0" height="16" width="16" />' CausesValidation="False" Visible="False" OnClick="LinkButton_go_to_match_next_Click"></asp:LinkButton><asp:LinkButton
                          ID="LinkButton_go_to_match_last" runat="server" Text='<IMG src="~/protected/image/last_track_blue16_h.png" alt="Last match" border="0" height="16" width="16" />' CausesValidation="False" Visible="False" OnClick="LinkButton_go_to_match_last_Click"></asp:LinkButton>
                  </td>
                  <td>
                    <div style="width: 0px; white-space: nowrap;">
                      <asp:DropDownList ID="DropDownList_code" runat="server" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_code_SelectedIndexChanged">
                      </asp:DropDownList>
                    </div>
                  </td>
                </tr>
              </table>
            </font>
          </td>
          <td valign="top">
          </td>
        </tr>
        <tr>
          <td>
            <font class="compact">Abbreviation: </font>
          </td>
          <td>
            <font class="compact">
              <asp:TextBox ID="TextBox_abbreviation" runat="server" Columns="2" MaxLength="2" CssClass="compact" Enabled="False"></asp:TextBox>
            </font>
          </td>
          <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_abbreviation" runat="server" ErrorMessage="Please enter Description." Font-Bold="True" ControlToValidate="TextBox_abbreviation" Display="Dynamic">!ERR!
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator_abbreviation" runat="server" ControlToValidate="TextBox_abbreviation" Display="Dynamic" ErrorMessage="Please enter a valid Abbreviation" Font-Bold="True" 
              ValidationExpression="[a-zA-Z]{2}">!ERR!</asp:RegularExpressionValidator>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<asp:Button ID="Button_submit" Text="Submit" runat="server" Enabled="False" OnClick="Button_submit_Click"></asp:Button>&nbsp;&nbsp;<asp:Button ID="Button_delete" Text="Delete" runat="server" Enabled="False" OnClick="Button_delete_Click"></asp:Button>
