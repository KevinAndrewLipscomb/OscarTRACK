<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_privilege.ascx.cs" Inherits="UserControl_privilege.TWebUserControl_privilege"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<asp:ValidationSummary ID="ValidationSummary_quick_message" runat="server" ValidationGroup="QuickMessage"/>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
        <tr>
          <td bgcolor="gainsboro" valign="top"><font class="">Name:</font></td>
          <td valign="top">
            <font class="">
              <table  id="Table_lookup_controls" runat="server" visible="false" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                  <td valign="middle">
                    <table cellspacing="0" cellpadding="0" border="0">
                      <tr>
                        <td>
              <ASP:TextBox id="TextBox_name" runat="server" columns="63" maxlength="63" cssclass=""></ASP:TextBox><ASP:Button id="Button_lookup" runat="server" causesvalidation="False" text="LOOKUP" onclick="Button_lookup_Click"></ASP:Button>
                        </td>
                        <td nowrap="nowrap"><small><small><asp:Label id="Label_lookup_arrow" runat="server">&lt;--</asp:Label></small></small></td>
                        <td><small><small><em><asp:Label id="Label_lookup_hint" runat="server">Lookup by partial or full Privilege name</asp:Label></em></small></small></td>
                      </tr>
                    </table>
                  </td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td valign="middle">
                    <small>
                      <ASP:LinkButton id="LinkButton_reset" runat="server" causesvalidation="False" enabled="False" onclick="LinkButton_reset_Click">New lookup</ASP:LinkButton>
                    </small>
                  </td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td valign="middle">
                    <small>
                      <ASP:LinkButton id="LinkButton_new_record" runat="server" causesvalidation="False" visible="False" onclick="LinkButton_new_record_Click">Enter brand new Privilege</ASP:LinkButton>
                    </small>
                  </td>
                </tr>
              </table>
      <table>
        <tr>
          <td id="TableData_match_controls" runat="server" visible="false"><asp:Panel ID="Panel_match_numbers" runat="server" Visible="False"><small>(<asp:Literal ID="Literal_match_index" runat="server"></asp:Literal>/<asp:Literal ID="Literal_num_matches" runat="server"></asp:Literal>)</small></asp:Panel></td>
          <td id="TableData_goto_controls" runat="server" visible="false">
            <asp:LinkButton id="LinkButton_go_to_match_first" runat="server" text='<IMG src="~/protected/image/first_track_blue16_h.png" alt="First match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_first_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_prior" runat="server" text='<IMG src="~/protected/image/play_blue16_h-flipped.png" alt="Prior match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_prior_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_next" runat="server" text='<IMG src="~/protected/image/play_blue16_h.png" alt="Next match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_next_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_last" runat="server" text='<IMG src="~/protected/image/last_track_blue16_h.png" alt="Last match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_last_Click"></asp:LinkButton>
          </td>
          <td>
            <div style="width:0px;white-space:nowrap;"><ASP:DropDownList id="DropDownList_name" runat="server" visible="False" autopostback="True" onselectedindexchanged="DropDownList_name_SelectedIndexChanged"></ASP:DropDownList></div>
          </td>
        </tr>
      </table></font>
          </td>
          <td nowrap="nowrap" valign="top">
            <ASP:RequiredFieldValidator id="RequiredFieldValidator_name" runat="server" errormessage="Please enter Name." font-bold="True" controltovalidate="TextBox_name" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
            <asp:RegularExpressionValidator id="RegularExpressionValidator_name" runat="server" errormessage="Please enter a valid Privilege title." font-bold="True" controltovalidate="TextBox_name" validationexpression="[a-zA-Z\-. ']+">!ERR!</asp:RegularExpressionValidator>
          </td>
        </tr>
        </table>
    </td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server" visible="False" onclick="Button_submit_Click"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" visible="False" onclick="Button_delete_Click"></ASP:Button>
<p>
    <table cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top">
          <table id="Table_holders" runat="server" bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" visible="False">
            <tr>
              <td>
                <table cellspacing="0" cellpadding="10" border="0">
                  <tr>
                    <td bgcolor="whitesmoke">
                      <strong>Holders&nbsp;(<asp:Label id="Label_num_rows" runat="server"></asp:Label>)</strong>
                      <small>
                        <asp:RadioButtonList ID="RadioButtonList_scope" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList_scope_SelectedIndexChanged">
                          <asp:ListItem Value="cross-agency" Selected="True">Cross-agency</asp:ListItem>
                          <asp:ListItem Value="your-agency-only">Your agency only</asp:ListItem>
                        </asp:RadioButtonList>
                      </small>
                    </td>
                  </tr>
                  <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
                  <tr>
                    <td>
                      <asp:GridView id="GridView_holders" runat="server" autogeneratecolumns="False" gridlines="None" allowsorting="True" cellpadding="5" borderstyle="None">
                        <Columns>
                          <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <HeaderTemplate>
                              <asp:CheckBox ID="CheckBox_force_all" runat="server" AutoPostBack="True" oncheckedchanged="CheckBox_force_all_CheckedChanged" style="outline:2px solid SlateGray" ToolTip="Select/Unselect all for QuickMessage" Checked="True" />
                            </HeaderTemplate>
                            <ItemTemplate>
                              <asp:CheckBox ID="CheckBox_selected" runat="server" Checked="True" AutoPostBack="True" oncheckedchanged="CheckBox_selected_CheckedChanged" ToolTip="Select/Unselect for QuickMessage" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>
                          <asp:BoundField datafield="member_name" headertext="Name" sortexpression="member_name%">
                            <ItemStyle wrap="False" font-size="X-Small"></ItemStyle>
                          </asp:BoundField>
                          <asp:BoundField datafield="agency_designator" headertext="Agency" sortexpression="agency_designator%">
                            <ItemStyle font-size="X-Small"></ItemStyle>
                          </asp:BoundField>
                          <asp:BoundField datafield="email_address"></asp:BoundField>
                          <asp:BoundField datafield="sms_target"></asp:BoundField>
                        </Columns>
                      </asp:GridView>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </td>
        <td>&nbsp;</td>
        <td valign="top">
          <table id="Table_quick_message" runat="server" bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" width="100%" border="1" visible="False">
            <tr>
              <td>
                <table cellspacing="0" cellpadding="10" width="100%" border="0">
                  <tr>
                    <td bgcolor="#f5f5f5">
                      <table width="100%">
                        <tr>
                          <td><a id="QuickMessage"><strong>QuickMessage</strong></a></td>
                          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                          <td align="right">
                            <asp:RadioButtonList ID="RadioButtonList_quick_message_mode" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" onselectedindexchanged="RadioButtonList_quick_message_mode_SelectedIndexChanged">
                              <asp:ListItem Selected="True" Value="email">Email</asp:ListItem>
                              <asp:ListItem Value="sms">SMS</asp:ListItem>
                            </asp:RadioButtonList>
                          </td>
                          <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_quick_message_mode" runat="server" ErrorMessage="Please select a QuickMessage mode (Email or SMS)." Text="!ERR!" Font-Bold="True" ControlToValidate="RadioButtonList_quick_message_mode"></asp:RequiredFieldValidator>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <table cellspacing="0" cellpadding="10" width="100%" border="0">
                        <tr>
                          <td>Send <asp:Literal ID="Literal_quick_message_kind_email" runat="server">email</asp:Literal><asp:Literal ID="Literal_quick_message_kind_sms" runat="server" Visible="false">SMS</asp:Literal> to:</td>
                          <td>Recipients selected (<asp:CheckBox ID="CheckBox_item_sample" runat="server" Checked="True" Enabled="false" />) in the adjacent table (see below for resolution).</td>
                          <td></td>
                        </tr>
                        <tr>
                          <td>Bcc:</td>
                          <td><ASP:Literal id="Literal_author_target" runat="server"></ASP:Literal></td>
                          <td></td>
                        </tr>
                        <tr id="TableRow_reply_to" runat="server">
                          <td>Reply-to:</td>
                          <td>
                            <asp:RadioButtonList ID="RadioButtonList_reply_to" runat="server" RepeatDirection="Horizontal">
                              <asp:ListItem Selected="True" Value="email">My email</asp:ListItem>
                              <asp:ListItem Value="phone">My phone</asp:ListItem>
                              <asp:ListItem Value="bouncer">BOUNCER</asp:ListItem>
                            </asp:RadioButtonList>
                          </td>
                          <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_reply_to" runat="server" ControlToValidate="RadioButtonList_reply_to" Display="Dynamic" ErrorMessage="Please specify a Reply-to target." Font-Bold="True">!ERR!</asp:RequiredFieldValidator>
                          </td>
                        </tr>
                        <tr id="TableRow_subject" runat="server">
                          <td>Subject:</td>
                          <td><ASP:TextBox id="TextBox_quick_message_subject" runat="server" maxlength="255" columns="72"></ASP:TextBox></td>
                          <td></td>
                        </tr>
                        <tr>
                          <td valign="top">Message:</td>
                          <td><ASP:TextBox id="TextBox_quick_message_body" runat="server" columns="72" rows="18" textmode="MultiLine"></ASP:TextBox></td>
                          <td nowrap="nowrap" valign="top"><ASP:RequiredFieldValidator id="RequiredFieldValidator_quick_message_body" runat="server" errormessage="Please enter a message body." font-bold="True" controltovalidate="TextBox_quick_message_body" validationgroup="quick_message">!ERR!</ASP:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                          <td></td>
                          <td><ASP:Button id="Button_send" runat="server" text="Send" validationgroup="QuickMessage" onclick="Button_send_Click"></ASP:Button></td>
                          <td></td>
                        </tr>
                        <tr>
                          <td valign="top"><small><font color="#c0c0c0">Resolves to:</font></small></td>
                          <td valign="top"><small><ASP:Label id="Label_distribution_list" runat="server" forecolor="Silver"></ASP:Label></small></td>
                          <td></td>
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
</p>
