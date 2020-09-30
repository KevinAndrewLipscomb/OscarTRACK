<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_post.ascx.cs" Inherits="UserControl_post.TWebUserControl_post" %>
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
                <td><asp:TextBox ID="TextBox_id" runat="server"></asp:TextBox><asp:Button ID="Button_lookup" runat="server" CausesValidation="False" Text="LOOKUP" OnClick="Button_lookup_Click"></asp:Button></td>
                <td nowrap="nowrap"><small><small><asp:Label ID="Label_lookup_arrow" runat="server">&lt;--</asp:Label></small></small></td>
                <td><small><small><em><asp:Label ID="Label_lookup_hint" runat="server">Lookup by partial or full Post ID</asp:Label></em></small></small></td>
              </tr>
            </table>
          </td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <td valign="middle"><small><asp:LinkButton ID="LinkButton_reset" runat="server" CausesValidation="False" Enabled="False" OnClick="LinkButton_reset_Click">New lookup</asp:LinkButton></small></td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <td valign="middle"><small><asp:LinkButton ID="LinkButton_new_record" runat="server" CausesValidation="False" Visible="False" OnClick="LinkButton_new_record_Click">Enter brand new Post</asp:LinkButton></small></td>
        </tr>
      </table>
      <table>
        <tr>
          <td>
            <asp:Panel ID="Panel_match_numbers" runat="server" Visible="False"><small>(<asp:Literal ID="Literal_match_index" runat="server"></asp:Literal>/<asp:Literal ID="Literal_num_matches" runat="server"></asp:Literal>)</small></asp:Panel>
          </td>
          <td>
            <asp:LinkButton ID="LinkButton_go_to_match_first" runat="server" Text='<IMG src="~/protected/image/first_track_blue16_h.png" alt="First match" border="0" height="16" width="16" />' CausesValidation="False" Visible="False" OnClick="LinkButton_go_to_match_first_Click"></asp:LinkButton><asp:LinkButton ID="LinkButton_go_to_match_prior" runat="server" Text='<IMG src="~/protected/image/play_blue16_h-flipped.png" alt="Prior match" border="0" height="16" width="16" />' CausesValidation="False" Visible="False" OnClick="LinkButton_go_to_match_prior_Click"></asp:LinkButton><asp:LinkButton ID="LinkButton_go_to_match_next" runat="server" Text='<IMG src="~/protected/image/play_blue16_h.png" alt="Next match" border="0" height="16" width="16" />' CausesValidation="False" Visible="False" OnClick="LinkButton_go_to_match_next_Click"></asp:LinkButton><asp:LinkButton ID="LinkButton_go_to_match_last" runat="server" Text='<IMG src="~/protected/image/last_track_blue16_h.png" alt="Last match" border="0" height="16" width="16" />' CausesValidation="False" Visible="False" OnClick="LinkButton_go_to_match_last_Click"></asp:LinkButton>
          </td>
          <td>
            <div style="width: 0px; white-space: nowrap;"><asp:DropDownList ID="DropDownList_id" runat="server" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_id_SelectedIndexChanged"></asp:DropDownList></div>
          </td>
        </tr>
      </table>
    </td>
    <td valign="top"><asp:RequiredFieldValidator ID="RequiredFieldValidator_id" runat="server" ErrorMessage="Please enter an ID." Display="Dynamic" Font-Bold="True" ControlToValidate="TextBox_id">!ERR!</asp:RequiredFieldValidator></td>
  </tr>
  <tr>
    <td>Short designator:</td>
    <td><asp:TextBox ID="TextBox_short_designator" runat="server" Columns="3" MaxLength="3" Enabled="false"></asp:TextBox></td>
    <td>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator_short_designator" runat="server" ErrorMessage="Please enter a Short designator." Display="Dynamic" Font-Bold="True" ControlToValidate="TextBox_short_designator">!ERR!</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td>Medium designator:</td>
    <td><asp:TextBox ID="TextBox_medium_designator" runat="server" Columns="23" MaxLength="23" Enabled="False"></asp:TextBox></td>
    <td>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator_medium_designator" runat="server" ErrorMessage="Please enter a Medium designator." Display="Dynamic" Font-Bold="True" ControlToValidate="TextBox_medium_designator">!ERR!</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td>Long designator:</td>
    <td><asp:TextBox ID="TextBox_long_designator" runat="server" Columns="63" MaxLength="63" Enabled="False"></asp:TextBox></td>
    <td>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator_long_designator" runat="server" ErrorMessage="Please enter Long designator." Display="Dynamic" Font-Bold="True" ControlToValidate="TextBox_long_designator">!ERR!</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td>Door code:</td>
    <td><asp:TextBox ID="TextBox_door_code" runat="server" Columns="63" MaxLength="63" Enabled="False" /></td>
    <td>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator_door_code" runat="server" ControlToValidate="TextBox_door_code" ErrorMessage="Please enter a valid Door code." Font-Bold="True" Display="Dynamic" ValidationExpression="[0-9a-zA-Z@#*+,()-+; ]+">!ERR!</asp:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td>Address:</td>
    <td><asp:TextBox ID="TextBox_address" runat="server" Columns="63" MaxLength="63" Enabled="False"></asp:TextBox>, Virginia Beach, VA</td>
    <td>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator_address" runat="server" ErrorMessage="Please enter a valid Address." ControlToValidate="TextBox_address" Font-Bold="True" Display="Dynamic" ValidationExpression="[0-9a-zA-Z*()-{} ]+">!ERR!</asp:RegularExpressionValidator>
    </td>
  </tr>
</table>
<asp:Button ID="Button_submit" Text="Submit" runat="server" Enabled="False" OnClick="Button_submit_Click"></asp:Button>&nbsp;&nbsp;<asp:Button ID="Button_delete" Text="Delete" runat="server" Enabled="False" OnClick="Button_delete_Click"></asp:Button>
