<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_schedule_assignment_assistant_holdouts.ascx.cs"
  Inherits="UserControl_schedule_assignment_assistant_holdouts.TWebUserControl_schedule_assignment_assistant_holdouts" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table cellspacing="0" cellpadding="10" border="0">
  <tr>
    <td>
      <p>The following members have not submitted availabilities for the selected month:</p>
      <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" width="100%" border="0">
              <tr bgcolor="#f5f5f5">
                <td>
                  <table cellspacing="0" cellpadding="5" width="100%" border="0" align="center">
                    <tr>
                      <td align="center" valign="middle"><small><b><asp:literal id="Literal_num_members" runat="server"></asp:literal></b><br/>members</small></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <asp:datagrid id="DataGrid_control" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="3" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px" onitemdatabound="DataGrid_control_ItemDataBound" AllowSorting="true" OnSortCommand="DataGrid_control_SortCommand">
                    <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                    <Columns>
                      <asp:BoundColumn DataField="name" HeaderText="Name" SortExpression="member.last_name%,member.first_name"></asp:BoundColumn>
                      <asp:BoundColumn DataField="be_released" HeaderText="Released?" SortExpression="be_released%,member.last_name,member.first_name">
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundColumn>
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
<table id="Table_quick_message" runat="server" bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" width="100%" border="1">
  <tr>
	  <td>
	    <table cellspacing="0" cellpadding="10" width="100%" border="0">
		    <tr><td bgcolor="#f5f5f5"><a id="QuickMessage"><strong>QuickMessage</strong></a></td></tr>
		    <tr>
			    <td>
			      <table cellspacing="0" cellpadding="10" width="100%" border="0">
				      <tr>
					      <td>To:</td>
					      <td>The parties shown in the above filtered table</td>
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
