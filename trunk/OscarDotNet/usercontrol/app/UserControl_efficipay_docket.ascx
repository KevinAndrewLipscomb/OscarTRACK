<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_efficipay_docket.ascx.cs" Inherits="UserControl_efficipay_docket.TWebUserControl_efficipay_docket"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~kicrudhelped~item.ascx-template -->
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<%@ Register src="../ki/UserControl_attachment_explorer.ascx" tagname="UserControl_attachment_explorer" tagprefix="uc2" %>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
  <tr>
    <td><font class="">Check #:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num" runat="server" errormessage="Please enter Num." font-bold="True" controltovalidate="TextBox_num">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num" runat="server" errormessage="Please enter a valid Num." font-bold="True" controltovalidate="TextBox_num" validationexpression="\d+">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td valign="top"><font class="">Content:</font></td>
    <td>
      <font class="">
        <uc2:UserControl_attachment_explorer ID="UserControl_attachment_explorer_control" runat="server"/>
      </font>
    </td>
    <td nowrap="nowrap" valign="top">
      <asp:CustomValidator ID="CustomValidator_content" runat="server" ErrorMessage="Please upload at least one item of content." Font-Bold="True" onservervalidate="CustomValidator_content_ServerValidate">!ERR!</asp:CustomValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Be&nbsp;ready&nbsp;for&nbsp;review:</font></td>
    <td>
      <font class="">
        <ASP:CheckBox id="CheckBox_be_ready_for_review" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr id="TableRow_signer_1" runat="server">
    <td><font class="">Signer&nbsp;1:</font></td>
    <td>
      <font class="">
        <ASP:Label id="Label_signer_1" runat="server" cssclass=""></ASP:Label>
      </font>
      <asp:Button ID="Button_apply_signature_1" runat="server" Text="Apply 1st signature" Visible="False" />
    </td>
    <td nowrap="nowrap"></td>
  </tr>
  <tr id="TableRow_signer_2" runat="server">
    <td><font class="">Signer&nbsp;2:</font></td>
    <td>
      <font class="">
        <ASP:Label id="Label_signer_2" runat="server" cssclass=""></ASP:Label>
      </font>
      <asp:Button ID="Button_apply_signature_2" runat="server" Text="Apply 2nd signature" Visible="False" />
    </td>
    <td nowrap="nowrap"></td>
  </tr>
      </table>
    </td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server" enabled="False" onclick="Button_submit_Click"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False" onclick="Button_delete_Click"></ASP:Button>

