<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_role.ascx.cs" Inherits="UserControl_role.TWebUserControl_role"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
        <tr>
          <td bgcolor="gainsboro" valign="top"><font class="">Title:</font></td>
          <td valign="top">
            <font class="">
              <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                  <td valign="middle">
                    <table cellspacing="0" cellpadding="0" border="0">
                      <tr>
                        <td>
              <ASP:TextBox id="TextBox_name" runat="server" columns="63" maxlength="63" cssclass=""></ASP:TextBox><ASP:Button id="Button_lookup" runat="server" causesvalidation="False" text="LOOKUP" onclick="Button_lookup_Click"></ASP:Button>
                        </td>
                        <td nowrap="True"><small><small><asp:Label id="Label_lookup_arrow" runat="server">&lt;--</asp:Label></small></small></td>
                        <td><small><small><em><asp:Label id="Label_lookup_hint" runat="server">Lookup by partial or full Role title</asp:Label></em></small></small></td>
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
                      <ASP:LinkButton id="LinkButton_new_record" runat="server" causesvalidation="False" visible="False" onclick="LinkButton_new_record_Click">Enter brand new Role</ASP:LinkButton>
                    </small>
                  </td>
                </tr>
              </table>
      <table>
        <tr>
          <td>
            <asp:LinkButton id="LinkButton_go_to_match_first" runat="server" text='<IMG src="~/protected/image/first_track_blue16_h.png" alt="First match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_first_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_prior" runat="server" text='<IMG src="~/protected/image/play_blue16_h-flipped.png" alt="Prior match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_prior_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_next" runat="server" text='<IMG src="~/protected/image/play_blue16_h.png" alt="Next match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_next_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_last" runat="server" text='<IMG src="~/protected/image/last_track_blue16_h.png" alt="Last match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_last_Click"></asp:LinkButton>
          </td>
          <td>
            <div style="width:0px;white-space:nowrap;"><ASP:DropDownList id="DropDownList_name" runat="server" visible="False" autopostback="True" onselectedindexchanged="DropDownList_name_SelectedIndexChanged"></ASP:DropDownList></div>
          </td>
        </tr>
      </table></font>
          </td>
          <td nowrap="true" valign="top">
            <ASP:RequiredFieldValidator id="RequiredFieldValidator_name" runat="server" errormessage="Please enter Name." font-bold="True" controltovalidate="TextBox_name" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
            <asp:RegularExpressionValidator id="RegularExpressionValidator_name" runat="server" errormessage="Please enter a valid Role title." font-bold="True" controltovalidate="TextBox_name" validationexpression="[a-zA-Z\-. ']+">!ERR!</asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr>
          <td><font class="">Tier:</font></td>
          <td><font class=""><asp:DropDownList id="DropDownList_tier" runat="server" enabled="False"></asp:DropDownList></font></td>
          <td nowrap="True"><asp:RequiredFieldValidator id="RequiredFieldValidator_tier" runat="server" errormessage="Please select a Tier." display="Dynamic" font-bold="True" controltovalidate="DropDownList_tier">!ERR!</asp:RequiredFieldValidator></td>
        </tr>
        <tr id="TableRow_pecking_order" runat="server" visible="False">
          <td><font class="">Pecking order:</font></td>
          <td><font class=""><ASP:TextBox id="TextBox_pecking_order" runat="server" columns="10" maxlength="10" cssclass="" enabled="False"></ASP:TextBox></font></td>
          <td nowrap="True">
            <asp:RequiredFieldValidator id="RequiredFieldValidator_pecking_order" runat="server" errormessage="Please enter Pecking order." display="Dynamic" font-bold="True" controltovalidate="TextBox_pecking_order">!ERR!</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator id="RegularExpressionValidator_pecking_order" runat="server" errormessage="Please enter a valid Pecking order." display="Dynamic" font-bold="True" controltovalidate="TextBox_pecking_order" validationexpression="\d{1,10}">!ERR!</asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr id="TableRow_soft_hyphenation_text" runat="server" visible="False">
          <td><font class="">Soft hyphenation text:</font></td>
          <td><font class=""><ASP:TextBox id="TextBox_soft_hyphenation_text" runat="server" columns="72" maxlength="127" cssclass="" enabled="False"></ASP:TextBox></font></td>
          <td nowrap="True"><ASP:RequiredFieldValidator id="RequiredFieldValidator_soft_hyphenation_text" runat="server" errormessage="Please enter Soft hyphenation text." font-bold="True" controltovalidate="TextBox_soft_hyphenation_text" display="Dynamic">!ERR!</ASP:RequiredFieldValidator></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server" enabled="False" onclick="Button_submit_Click"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False" onclick="Button_delete_Click"></ASP:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="Anchor_quick_message_shortcut" runat="server" visible="False">QuickMessage</a>
<p>
  <table id="Table_holders" runat="server" bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" visible="False">
    <tr>
      <td>
        <table cellspacing="0" cellpadding="10" border="0">
          <tr><td bgcolor="whitesmoke"><strong>Holders&nbsp;(<asp:Label id="Label_num_rows" runat="server"></asp:Label>)</strong></td></tr>
          <tr>
            <td>
              <asp:GridView id="GridView_holders" runat="server" autogeneratecolumns="False" gridlines="None" allowsorting="True" cellpadding="5" borderstyle="None">
                <Columns>
                  <asp:BoundField datafield="member_name" headertext="Name" sortexpression="member_name%">
                    <ItemStyle wrap="False" font-size="X-Small"></ItemStyle>
                  </asp:BoundField>
                  <asp:BoundField datafield="agency_designator" headertext="Agen&#173;cy" sortexpression="agency_designator%">
                    <ItemStyle font-size="X-Small"></ItemStyle>
                  </asp:BoundField>
                  <asp:BoundField datafield="email_address"></asp:BoundField>
                </Columns>
              </asp:GridView>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</p>
<p>
  <table id="Table_quick_message" runat="server" bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" width="100%" border="1" visible="False">
    <tr>
      <td>
        <table cellspacing="0" cellpadding="10" width="100%" border="0">
          <tr><td bgcolor="#f5f5f5"><a id="QuickMessage"><strong>QuickMessage</strong></a></td></tr>
          <tr>
            <td>
              <table cellspacing="0" cellpadding="10" width="100%" border="0">
                <tr>
                  <td>To:</td>
                  <td>The parties shown in the adjacent table (see below for resolution)</td>
                  <td></td>
                </tr>
                <tr>
                  <td>Bcc:</td>
                  <td><ASP:Label id="Label_author_email_address" runat="server"></ASP:Label></td>
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
                  <td nowrap="true" valign="top"><ASP:RequiredFieldValidator id="RequiredFieldValidator_quick_message_body" runat="server" errormessage="Please enter a message body." font-bold="True" controltovalidate="TextBox_quick_message_body" display="Dynamic" validationgroup="QuickMessage">!ERR!</ASP:RequiredFieldValidator></td>
                </tr>
                <tr>
                  <td></td>
                  <td><ASP:Button id="Button_send" runat="server" text="Send" validationgroup="QuickMessage" onclick="Button_send_Click"></ASP:Button></td>
                  <td></td>
                </tr>
                <tr>
                  <td valign="top"><small><font color="#c0c0c0">Resolves to:</small></font></td>
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
</p>
