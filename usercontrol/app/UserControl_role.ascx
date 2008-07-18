<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_role.pas" Inherits="UserControl_role.TWebUserControl_role"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<div id="Div_print_area">
  <table cellspacing="0" cellpadding="5" width="100%" border="0">
    <tr>
      <td valign="top">
        <table cellspacing="0" cellpadding="5" border="0">
          <tr>
            <td valign="top"><font class="">Name:</font></td>
            <td valign="top">
              <font class="">
                <ASP:TextBox id="TextBox_name" runat="server" columns="63" maxlength="63" cssclass=""></ASP:TextBox>&nbsp;&nbsp;&nbsp;&nbsp; <ASP:LinkButton id="LinkButton_search" runat="server" causesvalidation="False" font-bold="True">Lookup</ASP:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp; <ASP:LinkButton id="LinkButton_reset" runat="server" causesvalidation="False">Reset</ASP:LinkButton><br>
                <ASP:DropDownList id="DropDownList_name" runat="server" visible="False" autopostback="True"></ASP:DropDownList><br></font>
            </td>
            <td valign="top">
              <ASP:RequiredFieldValidator id="RequiredFieldValidator_name" runat="server" errormessage="Please enter Name." font-bold="True" controltovalidate="TextBox_name" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
            </td>
          </tr>
          <tr>
            <td><font class="">Tier:</font></td>
            <td><font class="">
                    <asp:DropDownList id="DropDownList_tier" runat="server" enabled="False"></asp:DropDownList></font></td>
            <td>
                  <asp:RequiredFieldValidator id="RequiredFieldValidator_tier" runat="server" errormessage="Please select a Tier." display="Dynamic" font-bold="True" controltovalidate="DropDownList_tier">!ERR!</asp:RequiredFieldValidator>
            </td>
          </tr>
          <tr id="TableRow_soft_hyphenation_text" runat="server" visible="False">
            <td><font class="">Soft hyphenation text:</font></td>
            <td><font class=""><ASP:TextBox id="TextBox_soft_hyphenation_text" runat="server" columns="72" maxlength="127" cssclass=""></ASP:TextBox></font></td>
            <td>
              <ASP:RequiredFieldValidator id="RequiredFieldValidator_soft_hyphenation_text" runat="server" errormessage="Please enter Soft hyphenation text." font-bold="True" controltovalidate="TextBox_soft_hyphenation_text" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<ASP:Button id="Button_submit" text="Submit" runat="server" enabled="False"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False"></ASP:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<uc1:UserControl_print_div id="UserControl_print_div" runat="server"></uc1:UserControl_print_div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="Anchor_quick_message_shortcut" runat="server" visible="False">QuickMessage</a>
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
</div>
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
                  <td nowrap="true" valign="top"><ASP:RequiredFieldValidator id="RequiredFieldValidator_quick_message_body" runat="server" errormessage="Please enter a message body." font-bold="True" controltovalidate="TextBox_quick_message_body" display="Dynamic">!ERR!</ASP:RequiredFieldValidator></td>
                </tr>
                <tr>
                  <td></td>
                  <td><ASP:Button id="Button_send" runat="server" text="Send"></ASP:Button></td>
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
