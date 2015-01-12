<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_coverage_assistant.ascx.cs" Inherits="UserControl_coverage_assistant.TWebUserControl_coverage_assistant"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <asp:ValidationSummary ID="ValidationSummary_quick_message" runat="server" ValidationGroup="quick_message"/>
	  <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
	    <tr>
		    <td>
		      <table cellspacing="0" cellpadding="10" width="100%" border="0">
			      <tr><td bgcolor="#f5f5f5"><strong>Coverage Assistant</strong></td></tr>
			      <tr>
				      <td>
                <p>According to OSCAR data, the following member(s) might be available for the following assignment:</p>
                <blockquote><strong><asp:Literal ID="Literal_conventional_spec" runat="server"></asp:Literal></strong> <asp:Literal ID="Literal_comment" runat="server"></asp:Literal></blockquote>
                <asp:Panel ID="Panel_best_practices" runat="server" Visible="false">
                  <p>Best practices:</p>
				          <ul>
					          <li>You are expected to stand this duty, or take responsibility for getting it covered.</li>
                    <li>If you are the only scheduled driver on the unit, you must be covered by a driver.</li>
                    <li>One-on-one contacts -- especially in person or by phone -- are usually much more effective than broadcast requests.</li>
					          <li>First, try proposing a <u>swap</u>.&nbsp;If that doesn't work out, ask for coverage.</li>
                    <li>If no one on this list can help, go to the Personnel / Roster tab and start calling other members, first at your squad, then citywide.</li>
				          </ul>
                </asp:Panel>
              </td>
			      </tr>
		      </table>
		    </td>
	    </tr>
	  </table>
    <br />
    <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
      <tr>
        <td>
          <table cellspacing="0" cellpadding="10" border="0">
            <tr>
              <td bgcolor="#dcdcdc"><table cellspacing="0" cellpadding="0" border="0"><tr><td align="right"><asp:Literal ID="Literal_num_potential_helpers" runat="server"></asp:Literal> potential helper(s)</td></tr></table></td>
            </tr>
            <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
            <tr>
              <td>
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
                    <asp:BoundColumn datafield="name" headertext="Name"></asp:BoundColumn>
                    <asp:BoundColumn datafield="agency" headertext="Agency" SortExpression="be_same_agency desc, object_medical_release_level.pecking_order desc">
                      <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="medical_release_level" headertext="Released cert level" SortExpression="object_medical_release_level.pecking_order desc">
                      <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="be_driver" headertext="Released driver">
                      <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundColumn>
                    <asp:TemplateColumn HeaderText="Email address">
                      <ItemTemplate>
                        <asp:HyperLink ID="HyperLink_email_address" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.email_address") %>'></asp:HyperLink>
                      </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Phone #">
                      <ItemTemplate>
                        <asp:HyperLink ID="HyperLink_phone_num" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.phone_num") %>'></asp:HyperLink>
                      </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn datafield="email_target" Visible="false"></asp:BoundColumn>
                    <asp:BoundColumn datafield="sms_target" Visible="false"></asp:BoundColumn>
                    <asp:TemplateColumn HeaderText="Swap-ortunities">
                      <ItemTemplate><pre><asp:Literal ID="Literal_swaportunities" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.swaportunities") %>'></asp:Literal></pre></ItemTemplate>
                    </asp:TemplateColumn>
                  </Columns>
                  <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                </asp:DataGrid>
                <br/>
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
                                  <asp:RadioButtonList ID="RadioButtonList_quick_message_mode" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" onselectedindexchanged="RadioButtonList_quick_message_mode_SelectedIndexChanged" Visible="false">
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
                              <tr id="TableRow_reply_to" runat="server" visible="false">
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
  </ContentTemplate>
</asp:UpdatePanel>
