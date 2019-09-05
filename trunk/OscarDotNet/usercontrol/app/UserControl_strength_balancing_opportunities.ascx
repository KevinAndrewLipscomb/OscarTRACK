<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_strength_balancing_opportunities.ascx.cs" Inherits="UserControl_strength_balancing_opportunities.TWebUserControl_strength_balancing_opportunities"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <small>
      <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" border="0">
              <tr>
                <td align="center" bgcolor="#dcdcdc">
                  <table cellspacing="0" cellpadding="0" border="0" width="100%">
                    <tr><td align="left"><b>Consider rescheduling members</b></td></tr>
                    <tr>
                      <td>
                        <table cellpadding="2" cellspacing="0">
                          <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td align="left">From a heavily staffed shift:</td>
                            <td align="left">(<asp:RadioButton ID="RadioButton_dummy_heavy" runat="server" BackColor="PaleGreen" Checked="True" Enabled="False" /></td>
                            <td align="left"><b><asp:Literal ID="Literal_heavy_staffed_shift" runat="server">[select above]</asp:Literal></b>)</td>
                          </tr>
                          <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td align="left">To a lightly staffed shift:</td>
                            <td align="left">(<asp:RadioButton ID="RadioButton_dummy_light" runat="server" BackColor="LightSalmon" Checked="True" Enabled="False" /></td>
                            <td align="left"><b><asp:Literal ID="Literal_light_staffed_shift" runat="server">[select above]</asp:Literal></b>)</td>
                          </tr>
                        </table>                        
                      </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr><td align="right" valign="bottom"><asp:Literal ID="Literal_num_opportunities" runat="server">0</asp:Literal> balancing opportunitie(s)</td></tr>
                  </table>
                </td>
              </tr>
              <tr id="TableRow_none" runat="server" align="center"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
              <tr>
                <td align="center">
                  <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False" allowsorting="True">
                    <Columns>
                      <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                          <asp:CheckBox ID="CheckBox_force_all" runat="server" AutoPostBack="True" oncheckedchanged="CheckBox_force_all_CheckedChanged" style="outline:2px solid SlateGray" ToolTip="Select/Unselect all for QuickMessage" Checked="True" />
                        </HeaderTemplate>
                        <ItemTemplate>
                          <asp:CheckBox ID="CheckBox_selected" runat="server" Checked="True" AutoPostBack="True" oncheckedchanged="CheckBox_selected_CheckedChanged" ToolTip="Select/Unselect for QuickMessage" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:TemplateColumn>
                      <asp:BoundColumn datafield="member_id" Visible="false"></asp:BoundColumn>
                      <asp:ButtonColumn CommandName="Select" DataTextField="member" HeaderText="Member" sortexpression="last_name%, first_name, cad_num">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" />
                      </asp:ButtonColumn>
                      <asp:BoundColumn datafield="current_assignment" HeaderText="Current assignment" sortexpression="current_assignment%">
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:BoundColumn datafield="comment" headertext="Comment">
                        <ItemStyle HorizontalAlign="Left" />
                      </asp:BoundColumn>
                      <asp:BoundColumn datafield="email_target" Visible="false"></asp:BoundColumn>
                      <asp:BoundColumn datafield="sms_target" Visible="false"></asp:BoundColumn>
                    </Columns>
                    <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                  </asp:DataGrid>
                  <br />
                  <asp:ValidationSummary ID="ValidationSummary_quick_message" runat="server" ValidationGroup="quick_message"/>
                  <table id="Table_quick_message" runat="server" bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
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
                                  <td>Recipients selected (<asp:CheckBox ID="CheckBox_item_sample" runat="server" Checked="True" Enabled="false" />) above.</td>
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
                                  <td><ASP:Button id="Button_send" runat="server" text="Send" validationgroup="quick_message" onclick="Button_send_Click"></ASP:Button></td>
                                  <td></td>
                                </tr>
                                <tr><td valign="top"><font color="#c0c0c0"><small>Resolves to:</small></font></td><td valign="top"><small><ASP:Label id="Label_distribution_list" runat="server" forecolor="Silver"></ASP:Label></small></td>
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
          </td>
        </tr>
      </table>
    </small>
  </ContentTemplate>
</asp:UpdatePanel>
