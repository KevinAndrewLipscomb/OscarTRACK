<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_agency.ascx.cs" Inherits="UserControl_agency.TWebUserControl_agency"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<table cellspacing="0" cellpadding="5" border="0">
  <tr>
	<td bgcolor="gainsboro" valign="top">Short designator:</td>
	<td valign="top">
              <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                  <td valign="middle">
                    <table cellspacing="0" cellpadding="0" border="0">
                      <tr>
                        <td>
	  <ASP:TextBox id="TextBox_short_designator" runat="server" columns="3" maxlength="3"></ASP:TextBox><ASP:Button id="Button_lookup" runat="server" causesvalidation="False" text="LOOKUP" onclick="Button_lookup_Click"></ASP:Button>
                        </td>
                        <td nowrap="True"><small><small><asp:Label id="Label_lookup_arrow" runat="server">&lt;--</asp:Label></small></small></td>
                        <td><small><small><em><asp:Label id="Label_lookup_hint" runat="server">Lookup by partial or full Agency short designator</asp:Label></em></small></small></td>
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
          <td>
            <asp:LinkButton id="LinkButton_go_to_match_first" runat="server" text='<IMG src="~/protected/image/first_track_blue16_h.png" alt="First match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_first_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_prior" runat="server" text='<IMG src="~/protected/image/play_blue16_h-flipped.png" alt="Prior match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_prior_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_next" runat="server" text='<IMG src="~/protected/image/play_blue16_h.png" alt="Next match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_next_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_last" runat="server" text='<IMG src="~/protected/image/last_track_blue16_h.png" alt="Last match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_last_Click"></asp:LinkButton>
          </td>
          <td>
            <div style="width:0px;white-space:nowrap;"><ASP:DropDownList id="DropDownList_short_designator" runat="server" visible="False" autopostback="True" onselectedindexchanged="DropDownList_short_designator_SelectedIndexChanged"></ASP:DropDownList></div>
          </td>
        </tr>
      </table>
	</td>
	<td valign="top"><ASP:RequiredFieldValidator id="RequiredFieldValidator_short_designator" runat="server" errormessage="Please enter a short designator." display="Dynamic" font-bold="True" controltovalidate="TextBox_short_designator">!ERR!</ASP:RequiredFieldValidator>
	</td>
  </tr>
  <tr>
	<td>Medium designator:</td>
	<td>
	  <ASP:TextBox id="TextBox_medium_designator" runat="server" columns="23" maxlength="23" enabled="False"></ASP:TextBox>
	</td>
	<td><ASP:RequiredFieldValidator id="RequiredFieldValidator_medium_designator" runat="server" errormessage="Please enter a medium designator." display="Dynamic" font-bold="True" controltovalidate="TextBox_medium_designator">!ERR!</ASP:RequiredFieldValidator>
	</td>
  </tr>
  <tr>
	<td>Long designator:</td>
	<td>
	  <ASP:TextBox id="TextBox_long_designator" runat="server" columns="63" maxlength="63" enabled="False"></ASP:TextBox>
	</td>
				<td><ASP:RequiredFieldValidator id="RequiredFieldValidator_long_designator" runat="server" errormessage="Please enter long designator." display="Dynamic" font-bold="True" controltovalidate="TextBox_long_designator">!ERR!</ASP:RequiredFieldValidator></td>
  </tr>
  <tr>
	<td>Be active:</td>
	<td>
	  <ASP:CheckBox id="CheckBox_be_active" runat="server" enabled="False"></ASP:CheckBox>
	</td>
	<td>
	</td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server" enabled="False" onclick="Button_submit_Click"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False" onclick="Button_delete_Click"></ASP:Button>
