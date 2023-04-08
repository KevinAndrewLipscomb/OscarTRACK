<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserControl_test_cloudmailin_scenes_reached_distributor.ascx.cs" Inherits="UserControl_test_cloudmailin_scenes_reached_distributor.TWebUserControl_test_cloudmailin_scenes_reached_distributor" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<br />
<table cellpadding="5" cellspacing="0">
  <tr>
    <td></td>
    <td><asp:CheckBox ID="CheckBox_filter_extenders_be_enabled" runat="server" Checked="True" AutoPostBack="True" Text="Enable filter extenders" OnCheckedChanged="CheckBox_filter_extenders_be_enabled_CheckedChanged" /></td>
    <td></td>
  </tr>
  <tr>
    <td>envelope[to]:</td>
    <td>
      <asp:TextBox ID="TextBox_envelope_to" runat="server" Columns="80" TextMode="Email"></asp:TextBox>
      <ajaxToolkit:FilteredTextBoxExtender runat="server" BehaviorID="TextBox_envelope_to_FilteredTextBoxExtender" FilterMode="InvalidChars" InvalidChars="<>" TargetControlID="TextBox_envelope_to" ID="TextBox_envelope_to_FilteredTextBoxExtender"></ajaxToolkit:FilteredTextBoxExtender>
    </td>
    <td>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator_envelope_to" runat="server" ErrorMessage="Please enter an envelope[to]." Font-Bold="True" Text="!ERR!" Display="Dynamic" ControlToValidate="TextBox_envelope_to"></asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td>headers[to]:</td>
    <td>
      <asp:TextBox ID="TextBox_headers_to" runat="server" Columns="80" TextMode="Email"></asp:TextBox>
      <ajaxToolkit:FilteredTextBoxExtender runat="server" BehaviorID="TextBox_headers_to_FilteredTextBoxExtender" FilterMode="InvalidChars" InvalidChars="<>" TargetControlID="TextBox_headers_to" ID="TextBox_headers_to_FilteredTextBoxExtender"></ajaxToolkit:FilteredTextBoxExtender>
    </td>
    <td>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator_headers_to" runat="server" ErrorMessage="Please enter a headers[to]." Font-Bold="True" Text="!ERR!" Display="Dynamic" ControlToValidate="TextBox_headers_to"></asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td valign="top">attachments[]:</td>
    <td>
      <asp:TextBox ID="TextBox_attachments" runat="server" Columns="80" Rows="24" TextMode="MultiLine"></asp:TextBox>
      <ajaxToolkit:FilteredTextBoxExtender ID="TextBox_attachments_FilteredTextBoxExtender" runat="server" BehaviorID="TextBox_attachments_FilteredTextBoxExtender" FilterMode="InvalidChars" InvalidChars="<>" TargetControlID="TextBox_attachments"></ajaxToolkit:FilteredTextBoxExtender>
    </td>
    <td>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator_attachments" runat="server" ErrorMessage="Please enter an attachments[]." Font-Bold="True" Text="!ERR!" Display="Dynamic" ControlToValidate="TextBox_attachments"></asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td>
      <asp:Button ID="Button_clear" runat="server" OnClick="Button_clear_Click" Text="Clear" />
    </td>
    <td><asp:Button ID="Button_process" runat="server" Text="Process" OnClick="Button_process_Click" />
    </td>
    <td></td>
  </tr>
</table>
