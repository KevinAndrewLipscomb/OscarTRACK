<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_user.ascx.cs" Inherits="UserControl_user.TWebUserControl_user"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<table cellspacing="0" cellpadding="5" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
  <tr>
    <td bgcolor="gainsboro" valign="top">Username:</td>
    <td valign="top">
              <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                  <td valign="middle">
                    <table cellspacing="0" cellpadding="0" border="0">
                      <tr>
                        <td>
      <ASP:TextBox id="TextBox_username" runat="server" maxlength="40" columns="40"></ASP:TextBox><ASP:Button id="Button_lookup" runat="server" causesvalidation="False" text="LOOKUP" onclick="Button_lookup_Click"></ASP:Button>
                        </td>
                        <td nowrap="True"><small><small><asp:Label id="Label_lookup_arrow" runat="server">&lt;--</asp:Label></small></small></td>
                        <td><small><small><em><asp:Label id="Label_lookup_hint" runat="server">Lookup by partial or full Username</asp:Label></em></small></small></td>
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
                  <td valign="middle"></td>
                </tr>
              </table>
      <asp:LinkButton id="LinkButton_go_to_match_first" runat="server" text='<IMG src="~/protected/image/first_track_blue16_h.png" alt="First match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_first_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_prior" runat="server" text='<IMG src="~/protected/image/play_blue16_h-flipped.png" alt="Prior match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_prior_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_next" runat="server" text='<IMG src="~/protected/image/play_blue16_h.png" alt="Next match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_next_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_last" runat="server" text='<IMG src="~/protected/image/last_track_blue16_h.png" alt="Last match" border="0" height="16" width="16" />' causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_last_Click"></asp:LinkButton>
      <ASP:DropDownList id="DropDownList_username" runat="server" visible="False" autopostback="True" onselectedindexchanged="DropDownList_username_SelectedIndexChanged"></ASP:DropDownList><br></td>
    <td valign="top">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_username" runat="server" errormessage="Please enter Username." font-bold="True" controltovalidate="TextBox_username">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td>Encoded password:</td>
    <td>
      <ASP:TextBox id="TextBox_encoded_password" runat="server" enabled="False" maxlength="40" columns="40"></ASP:TextBox>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td>Be stale password:</td>
    <td>
      <ASP:CheckBox id="CheckBox_be_stale_password" runat="server" enabled="False"></ASP:CheckBox>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td>Password reset email address:</td>
    <td>
      <ASP:TextBox id="TextBox_password_reset_email_address" runat="server" maxlength="255" columns="60" enabled="False"></ASP:TextBox>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_password_reset_email_address" runat="server" errormessage="Please enter Password reset email address." font-bold="True" controltovalidate="TextBox_password_reset_email_address">!ERR!</ASP:RequiredFieldValidator>
    </td>
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
    <td>Num unsuccessful login attempts:</td>
    <td>
      <ASP:TextBox id="TextBox_num_unsuccessful_login_attempts" runat="server" enabled="False"></ASP:TextBox>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td>Last login:</td>
    <td>
      <ASP:TextBox id="TextBox_last_login" runat="server" enabled="False"></ASP:TextBox>
    </td>
    <td>
    </td>
  </tr>
      </table>
    </td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server" enabled="False" onclick="Button_submit_Click"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False" onclick="Button_delete_Click"></ASP:Button>
