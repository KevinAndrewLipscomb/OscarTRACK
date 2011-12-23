<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_schedule_assignment_assistant_holdouts.ascx.cs"
  Inherits="UserControl_schedule_assignment_assistant_holdouts.TWebUserControl_schedule_assignment_assistant_holdouts" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
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
                      <td align="right"><b><small>Filters:</small></b></td>
                      <td align="center" nowrap="nowrap">
                        <small>Compliancy</small><br/>
                        <ASP:DropDownList id="DropDownList_compliancy" runat="server" autopostback="True" onselectedindexchanged="DropDownList_compliancy_SelectedIndexChanged">
                          <ASP:ListItem value="">All</ASP:ListItem>
                          <ASP:ListItem value="0" selected="True">Holdouts</ASP:ListItem>
                          <ASP:ListItem value="1">Submitters</ASP:ListItem>
                          <ASP:ListItem value="A">Atypicals</ASP:ListItem>
                        </ASP:DropDownList>
   							      </td>
                    </tr>
                  </table>
                  <table cellspacing="0" cellpadding="5" width="100%" border="0" align="center">
                    <tr>
                      <td align="center" valign="middle"><small><b><asp:literal id="Literal_num_members" runat="server"></asp:literal></b><br/>members</small></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <asp:datagrid id="DataGrid_control" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="3" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px" onitemdatabound="DataGrid_control_ItemDataBound" 
                    AllowSorting="True" OnSortCommand="DataGrid_control_SortCommand" onitemcommand="DataGrid_control_ItemCommand">
                    <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                    <Columns>
                      <asp:ButtonColumn CommandName="Select" DataTextField="name" HeaderText="Name" SortExpression="member.last_name%,member.first_name"></asp:ButtonColumn>
                      <asp:BoundColumn DataField="member_id" Visible="False"></asp:BoundColumn>
                      <asp:BoundColumn DataField="be_released" HeaderText="Released?" SortExpression="be_released%,member.last_name,member.first_name">
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundColumn>
                      <asp:BoundColumn DataField="be_compliant" Visible="false"></asp:BoundColumn>
                      <asp:TemplateColumn HeaderText="Compliant?">
                        <ItemTemplate>
                          <asp:Image ID="Image_compliant" runat="server" ImageUrl="~/protected/image/dialog-clean.png" Visible="False" />
                          <asp:Image ID="Image_noncompliant" runat="server" ImageUrl="~/protected/image/appointment-missed.png" Visible="False" />
                        </ItemTemplate>
                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Right" />
                      </asp:TemplateColumn>
                      <asp:ButtonColumn CommandName="Select" DataTextField="be_notification_pending" HeaderText="**" SortExpression="be_notification_pending%,member.last_name,member.first_name">
                        <ItemStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                      </asp:ButtonColumn>
                      <asp:BoundColumn DataField="email_address" HeaderText="Email address"></asp:BoundColumn>
                      <asp:BoundColumn DataField="phone_num" HeaderText="Phone #"></asp:BoundColumn>
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
