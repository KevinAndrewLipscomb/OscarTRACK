<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_agency.ascx.cs" Inherits="UserControl_agency.TWebUserControl_agency"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<table cellspacing="0" cellpadding="5" border="0">
  <tr>
	<td bgcolor="gainsboro" valign="top">ID:</td>
	<td valign="top">
              <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                  <td valign="middle">
                    <table cellspacing="0" cellpadding="0" border="0">
                      <tr>
                        <td>
	  <ASP:TextBox id="TextBox_id" runat="server"></ASP:TextBox><ASP:Button id="Button_lookup" runat="server" causesvalidation="False" text="LOOKUP" onclick="Button_lookup_Click"></ASP:Button>
                        </td>
                        <td nowrap="nowrap"><small><small><asp:Label id="Label_lookup_arrow" runat="server">&lt;--</asp:Label></small></small></td>
                        <td><small><small><em><asp:Label id="Label_lookup_hint" runat="server">Lookup by partial or full Agency ID</asp:Label></em></small></small></td>
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
                      <ASP:LinkButton id="LinkButton_new_record" runat="server" causesvalidation="False" visible="False" onclick="LinkButton_new_record_Click">Enter brand new Agency</ASP:LinkButton>
                    </small>
                  </td>
                </tr>
              </table>
      <table>
        <tr>
          <td><asp:Panel ID="Panel_match_numbers" runat="server" Visible="False"><small>(<asp:Literal ID="Literal_match_index" runat="server"></asp:Literal>/<asp:Literal ID="Literal_num_matches" runat="server"></asp:Literal>)</small></asp:Panel></td>
          <td>
            <asp:LinkButton id="LinkButton_go_to_match_first" runat="server" text='<IMG src="~/protected/image/first_track_blue16_h.png" alt="First match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_first_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_prior" runat="server" text='<IMG src="~/protected/image/play_blue16_h-flipped.png" alt="Prior match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_prior_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_next" runat="server" text='<IMG src="~/protected/image/play_blue16_h.png" alt="Next match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_next_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_last" runat="server" text='<IMG src="~/protected/image/last_track_blue16_h.png" alt="Last match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_last_Click"></asp:LinkButton>
          </td>
          <td>
            <div style="width:0px;white-space:nowrap;"><ASP:DropDownList id="DropDownList_id" runat="server" visible="False" autopostback="True" onselectedindexchanged="DropDownList_id_SelectedIndexChanged"></ASP:DropDownList></div>
          </td>
        </tr>
      </table>
	</td>
	<td valign="top"><ASP:RequiredFieldValidator id="RequiredFieldValidator_id" runat="server" errormessage="Please enter an ID." display="Dynamic" font-bold="True" controltovalidate="TextBox_id">!ERR!</ASP:RequiredFieldValidator>
	</td>
  </tr>
  <tr>
	<td>Short designator:</td>
	<td>
	  <ASP:TextBox id="TextBox_short_designator" runat="server" columns="3" maxlength="3" Enabled="false"></ASP:TextBox>
	</td>
	<td><ASP:RequiredFieldValidator id="RequiredFieldValidator_short_designator" runat="server" errormessage="Please enter a Short designator." display="Dynamic" font-bold="True" controltovalidate="TextBox_short_designator">!ERR!</ASP:RequiredFieldValidator>
	</td>
  </tr>
  <tr>
	<td>Medium designator:</td>
	<td>
	  <ASP:TextBox id="TextBox_medium_designator" runat="server" columns="23" maxlength="23" enabled="False"></ASP:TextBox>
	</td>
	<td><ASP:RequiredFieldValidator id="RequiredFieldValidator_medium_designator" runat="server" errormessage="Please enter a Medium designator." display="Dynamic" font-bold="True" controltovalidate="TextBox_medium_designator">!ERR!</ASP:RequiredFieldValidator>
	</td>
  </tr>
  <tr>
	<td>Long designator:</td>
	<td>
	  <ASP:TextBox id="TextBox_long_designator" runat="server" columns="63" maxlength="63" enabled="False"></ASP:TextBox>
	</td>
				<td><ASP:RequiredFieldValidator id="RequiredFieldValidator_long_designator" runat="server" errormessage="Please enter Long designator." display="Dynamic" font-bold="True" controltovalidate="TextBox_long_designator">!ERR!</ASP:RequiredFieldValidator></td>
  </tr>
  <tr>
	<td>Be active:</td>
	<td>
	  <ASP:CheckBox id="CheckBox_be_active" runat="server" enabled="False"></ASP:CheckBox>
	</td>
	<td>
	</td>
  </tr>
  <tr>
	<td>KEYclick enumerator:</td>
	<td>
	  <ASP:TextBox id="TextBox_keyclick_enumerator" runat="server" columns="7" maxlength="7" enabled="False"/>
	</td>
	<td>
	  <asp:RegularExpressionValidator ID="RegularExpressionValidator_keyclick_enumerator" runat="server" ControlToValidate="TextBox_keyclick_enumerator" ErrorMessage="Please enter a valid KEYclick enumerator (letters only)." Font-Bold="True" display="Dynamic" 
      ValidationExpression="[a-zA-Z]+">!ERR!</asp:RegularExpressionValidator>
	</td>
  </tr>
  <tr>
	<td>OSCAR Classic enumerator:</td>
	<td>
	  <ASP:TextBox id="TextBox_oscar_classic_enumerator" runat="server" columns="8" maxlength="8" enabled="False"/>
	</td>
	<td>
	  <asp:RegularExpressionValidator ID="RegularExpressionValidator_oscar_classic_enumerator" runat="server" ControlToValidate="TextBox_oscar_classic_enumerator" ErrorMessage="Please enter a valid OSCAR Classic enumerator." Font-Bold="True" display="Dynamic"
      ValidationExpression="[0-9a-zA-Z]+">!ERR!</asp:RegularExpressionValidator>
	</td>
  </tr>
  <tr>
	<td>Be EMS post:</td>
	<td>
	  <ASP:CheckBox id="CheckBox_be_ems_post" runat="server" enabled="False"></ASP:CheckBox>
	</td>
	<td>
	</td>
  </tr>
  <tr>
	<td>Door code:</td>
	<td>
	  <ASP:TextBox id="TextBox_door_code" runat="server" columns="15" maxlength="15" enabled="False"/>
	</td>
	<td>
	  <asp:RegularExpressionValidator ID="RegularExpressionValidator_door_code" runat="server" ControlToValidate="TextBox_door_code" 
      ErrorMessage="Please enter a valid Door code using only numbers, letters, stars (&quot;*&quot;), pound (&quot;#&quot;), commas, and plus (&quot;+&quot;) signs." Font-Bold="True" display="Dynamic" ValidationExpression="[0-9a-zA-Z#*+,]+">!ERR!</asp:RegularExpressionValidator>
	</td>
  </tr>
  <tr>
	<td>Be ok to nag:</td>
	<td>
	  <ASP:CheckBox id="CheckBox_be_ok_to_nag" runat="server" enabled="False"></ASP:CheckBox>
	</td>
	<td>
	</td>
  </tr>
  <tr>
	<td>Be ok to send duty reminders:</td>
	<td>
	  <ASP:CheckBox id="CheckBox_be_ok_to_send_duty_reminders" runat="server" enabled="False"></ASP:CheckBox>
	</td>
	<td>
	</td>
  </tr>
  <tr>
	<td>Address:</td>
	<td>
	  <ASP:TextBox id="TextBox_address" runat="server" columns="63" maxlength="63" enabled="False"></ASP:TextBox>, Virginia Beach, VA
	</td>
				<td><asp:RegularExpressionValidator ID="RegularExpressionValidator_address" runat="server" ErrorMessage="Please enter a valid Address." ControlToValidate="TextBox_address" Font-Bold="True" display="Dynamic" ValidationExpression="[0-9a-zA-Z ]+">!ERR!</asp:RegularExpressionValidator></td>
  </tr>
  <tr>
	<td>Be KEYclick enabled:</td>
	<td>
	  <ASP:CheckBox id="CheckBox_be_keyclick_enabled" runat="server" enabled="False"></ASP:CheckBox>
	</td>
	<td>
	</td>
  </tr>
  <tr>
	<td>Be EfficiPay enabled:</td>
	<td>
	  <ASP:CheckBox id="CheckBox_be_efficipay_enabled" runat="server" enabled="False"></ASP:CheckBox>
	</td>
	<td>
	</td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server" enabled="False" onclick="Button_submit_Click"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False" onclick="Button_delete_Click"></ASP:Button>
