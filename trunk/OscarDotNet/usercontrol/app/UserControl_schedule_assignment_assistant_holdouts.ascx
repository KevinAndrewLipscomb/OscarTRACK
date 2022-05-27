<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_schedule_assignment_assistant_holdouts.ascx.cs"
  Inherits="UserControl_schedule_assignment_assistant_holdouts.TWebUserControl_schedule_assignment_assistant_holdouts" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<asp:ValidationSummary ID="ValidationSummary_quick_message" runat="server" ValidationGroup="QuickMessage"/>
<asp:Panel ID="Panel_supressed" runat="server"><p></p><em>--&nbsp;SUPRESSED&nbsp;--</em></asp:Panel>
<table id="Table_data" runat="server" cellspacing="0" cellpadding="10" border="0" visible="false">
  <tr>
    <td>
      <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" width="100%" border="0">
              <tr bgcolor="#f5f5f5">
                <td>
                  <table cellspacing="0" cellpadding="5" border="0" align="center" width="100%">
                    <tr>
                      <td width="48%">&nbsp;</td>
                      <td width="1%"><b><small>Filters:</small></b></td>
                      <td nowrap="nowrap" width="1%" align="center">
                        <small>Compliancy</small><br/>
                        <ASP:DropDownList id="DropDownList_compliancy" runat="server" autopostback="True" onselectedindexchanged="DropDownList_compliancy_SelectedIndexChanged">
                          <ASP:ListItem value="">All</ASP:ListItem>
                          <ASP:ListItem value="0" selected="True">Holdouts</ASP:ListItem>
                          <ASP:ListItem value="1">Submitters</ASP:ListItem>
                          <ASP:ListItem value="A">Field staff, College, Atypical, ResDoc</ASP:ListItem>
                          <ASP:ListItem value="G">Guest Providers</ASP:ListItem>
                          <ASP:ListItem value="Z">Observers</ASP:ListItem>
                        </ASP:DropDownList>
   							      </td>
                      <td width="48%">&nbsp;</td>
                    </tr>
                  </table>
                  <table cellspacing="0" cellpadding="5" width="100%" border="0" align="center">
                    <tr>
                      <td align="center" valign="middle"><small><b><asp:literal id="Literal_num_members" runat="server"></asp:literal></b><br/>members</small></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr id="TableRow_guidance" runat="server" bgcolor="#f5f5f5">
                <td bgcolor="Khaki">
                  <b>Guidance:</b> You should prompt holdouts <b>early</b> and <b>often</b> to submit their availabilities.&nbsp; Doing so will allow <asp:Literal ID="Literal_application_name" runat="server"></asp:Literal> to fix
                  many squad and system-wide scheduling issues automatically and optimally.&nbsp; You can use the QuickMessage feature, below, to send emails to holdouts, and each holdout's email address and phone number, if known,
                  are shown below for your convenience.&nbsp; <asp:Literal ID="Literal_application_name_2" runat="server"></asp:Literal> automatically nags holdouts once per day via email that their submissions are late, but this should
                  not take the place of you making personal contact with the holdouts, too.
                </td>
              </tr>
              <tr id="TableRow_restriction" runat="server" bgcolor="#f5f5f5" visible="false">
                <td bgcolor="Khaki">
                  In this context, only Released Field staff members are shown below, regardless of the above <i>Release level</i> and <i>Compliancy</i> filters.</td>
              </tr>
              <tr>
                <td>
                  <asp:datagrid id="DataGrid_control" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="3" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px" onitemdatabound="DataGrid_control_ItemDataBound" 
                    AllowSorting="True" OnSortCommand="DataGrid_control_SortCommand" onitemcommand="DataGrid_control_ItemCommand">
                    <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                    <Columns>
                      <asp:BoundColumn DataField="level" HeaderText="~" SortExpression="medical_release_code_description_map.pecking_order%,member.last_name,member.first_name" Visible="False">
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:ButtonColumn CommandName="Select" DataTextField="name" HeaderText="Name" SortExpression="member.last_name%,member.first_name"></asp:ButtonColumn>
                      <asp:BoundColumn DataField="member_id" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="agency" HeaderText="Agency" ReadOnly="True" SortExpression="agency%,member.last_name,member.first_name" Visible="False">
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="section_num" HeaderText="Section" ReadOnly="True" SortExpression="section_num%,member.last_name,member.first_name" Visible="False">
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="be_released" HeaderText="Released?" SortExpression="be_released%,member.last_name,member.first_name">
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="be_compliant" Visible="false"></asp:BoundColumn>
                      <asp:TemplateColumn HeaderText="Compliant?">
                        <ItemTemplate>
                          <asp:Image ID="Image_compliant" runat="server" ImageUrl="~/protected/image/dialog-clean.png" Visible="False" />
                          <asp:Image ID="Image_noncompliant" runat="server" ImageUrl="~/protected/image/appointment-missed.png" Visible="False" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:TemplateColumn>
                      <asp:BoundColumn DataField="be_notification_pending" HeaderText="**" SortExpression="be_notification_pending%,member.last_name,member.first_name">
                        <ItemStyle Font-Bold="True" Wrap="False" />
                      </asp:BoundColumn>
                      <asp:TemplateColumn HeaderText="Email address">
                        <ItemTemplate>
                          <asp:HyperLink ID="HyperLink_email_address" runat="server" Text='<%# Eval("email_address") %>' NavigateUrl='<%# "mailto:" + Eval("email_address") %>' ></asp:HyperLink>
                        </ItemTemplate>
                      </asp:TemplateColumn>
                      <asp:TemplateColumn HeaderText="Phone #">
                        <ItemTemplate>
                          <asp:HyperLink ID="HyperLink_phone_num" runat="server" Text='<%# Eval("phone_num") %>' NavigateUrl='<%# "tel:" + Eval("phone_num") %>' ></asp:HyperLink>
                        </ItemTemplate>
                      </asp:TemplateColumn>
                    </Columns>
                  </asp:datagrid>
                </td>
              </tr>
              <tr id="TableRow_none" runat="server"><td><p></p><em>--&nbsp;NONE&nbsp;--</em></td></tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<p></p>
<table id="Table_quick_message" runat="server" bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" width="100%" border="1" visible="false">
  <tr>
	  <td>
	    <table cellspacing="0" cellpadding="10" width="100%" border="0">
		    <tr><td bgcolor="#f5f5f5"><a id="QuickMessage"><strong>QuickMessage</strong></a></td></tr>
		    <tr>
			    <td>
			      <table cellspacing="0" cellpadding="10" width="100%" border="0">
				      <tr>
					      <td>To:</td>
					      <td>The <b>holdouts</b> shown in the above filtered table</td>
					      <td></td>
				      </tr>
				      <tr>
					      <td>Bcc:</td>
					      <td><ASP:Literal id="Literal_author_email_address" runat="server"></ASP:Literal></td>
					      <td></td>
				      </tr>
				      <tr>
					      <td>Subject:</td>
					      <td><ASP:TextBox id="TextBox_quick_message_subject" runat="server" maxlength="255" columns="72"></ASP:TextBox></td>
					      <td></td>
				      </tr>
				      <tr>
					      <td valign="top">Body:</td>
					      <td><ASP:TextBox id="TextBox_quick_message_body" runat="server" columns="72" rows="18" textmode="MultiLine"></ASP:TextBox></td>
					      <td nowrap="true" valign="top"><ASP:RequiredFieldValidator id="RequiredFieldValidator_quick_message_body" runat="server" errormessage="Please enter a message body." font-bold="True" controltovalidate="TextBox_quick_message_body" 
                    ValidationGroup="QuickMessage">!ERR!</ASP:RequiredFieldValidator></td>
				      </tr>
				      <tr>
					      <td></td>
					      <td><ASP:Button id="Button_send" runat="server" text="Send" onclick="Button_send_Click" ValidationGroup="QuickMessage"></ASP:Button></td>
					      <td></td>
				      </tr>
			      </table>
          </td>
		    </tr>
	    </table>
    </td>
  </tr>
</table>
