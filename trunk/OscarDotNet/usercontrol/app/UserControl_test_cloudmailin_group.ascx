<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserControl_test_cloudmailin_group.ascx.cs" Inherits="UserControl_test_cloudmailin_group.TWebUserControl_test_cloudmailin_group" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<br />
<table cellpadding="5" cellspacing="0">
  <tr>
    <td></td>
    <td><asp:CheckBox ID="CheckBox_filter_extenders_be_enabled" runat="server" Checked="True" AutoPostBack="True" Text="Enable filter extenders" OnCheckedChanged="CheckBox_filter_extenders_be_enabled_CheckedChanged" /></td>
    <td></td>
  </tr>
  <tr>
    <td>from:</td>
    <td>
      <asp:TextBox ID="TextBox_from" runat="server" Columns="80" TextMode="Email"></asp:TextBox>
      <ajaxToolkit:FilteredTextBoxExtender runat="server" BehaviorID="TextBox_from_FilteredTextBoxExtender" FilterMode="InvalidChars" InvalidChars="<>" TargetControlID="TextBox_from" ID="TextBox_from_FilteredTextBoxExtender"></ajaxToolkit:FilteredTextBoxExtender>
    </td>
    <td>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator_from" runat="server" ErrorMessage="Please enter an from." Font-Bold="True" Text="!ERR!" Display="Dynamic" ControlToValidate="TextBox_from"></asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td>x_to_header:</td>
    <td>
      <asp:TextBox ID="TextBox_x_to_header" runat="server" Columns="80" TextMode="Email"></asp:TextBox>
      <ajaxToolkit:FilteredTextBoxExtender runat="server" BehaviorID="TextBox_x_to_header_FilteredTextBoxExtender" FilterMode="InvalidChars" InvalidChars="<>" TargetControlID="TextBox_x_to_header" ID="TextBox_x_to_header_FilteredTextBoxExtender"></ajaxToolkit:FilteredTextBoxExtender>
    </td>
    <td>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator_x_to_header" runat="server" ErrorMessage="Please enter an x_to_header." Font-Bold="True" Text="!ERR!" Display="Dynamic" ControlToValidate="TextBox_x_to_header"></asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td>subject:</td>
    <td>
      <asp:TextBox ID="TextBox_subject" runat="server" Columns="80"></asp:TextBox>
      <ajaxToolkit:FilteredTextBoxExtender ID="TextBox_subject_FilteredTextBoxExtender" runat="server" BehaviorID="TextBox_subject_FilteredTextBoxExtender" FilterMode="InvalidChars" InvalidChars="<>" TargetControlID="TextBox_subject" />
    </td>
    <td></td>
  </tr>
  <tr>
    <td valign="top">plain:</td>
    <td>
      <asp:TextBox ID="TextBox_plain" runat="server" Columns="80" Rows="8" TextMode="MultiLine"></asp:TextBox>
      <ajaxToolkit:FilteredTextBoxExtender ID="TextBox_plain_FilteredTextBoxExtender" runat="server" BehaviorID="TextBox_plain_FilteredTextBoxExtender" FilterMode="InvalidChars" InvalidChars="<>" TargetControlID="TextBox_plain"></ajaxToolkit:FilteredTextBoxExtender>
    </td>
    <td></td>
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
