<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_precontent.pas" Inherits="UserControl_precontent.TWebUserControl_precontent"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_bread_crumb_trail" Src="~/usercontrol/ki/UserControl_bread_crumb_trail.ascx" %>
<asp:ScriptManager id="ScriptManager_control" runat="server"></asp:ScriptManager>
<table width="100%" bgcolor="#b0c4de" border="1" bordercolor="lightsteelblue" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <table width="100%" cellspacing="0" cellpadding="5">
        <tr>
          <td align="left"><small><a href="#ReferenceMaterial">Reference material</a></small></td>
          <td align="center"><ASP:Label id="Label_application_name" runat="server" font-bold="True"></ASP:Label></td>
          <td align="right"><small><a href="#ProcessImprovement">Process improvement</a></small></td>
        </tr>
        <tr id="TableRow_account_control" runat="server">
          <td align="left" colspan="3">
            <hr align="center" noshade="true" width="100%" size="1">
            <small>
              <ASP:Label id="Label_username" runat="server"></ASP:Label>:&nbsp;<ASP:LinkButton id="LinkButton_logout" runat="server" causesvalidation="False">logout</ASP:LinkButton>&nbsp;|&nbsp;<ASP:LinkButton id="LinkButton_change_password" runat="server" causesvalidation="False">password</ASP:LinkButton>&nbsp;|&nbsp;<ASP:LinkButton id="LinkButton_change_email_address" runat="server" causesvalidation="False">email address</ASP:LinkButton>
            </small>
            <hr align="center" noshade="true" width="100%" size="1">
            <small><i><uc1:UserControl_bread_crumb_trail id="UserControl_bread_crumb_trail" runat="server"></uc1:UserControl_bread_crumb_trail></i></small>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table cellspacing="0" cellpadding="10" width="100%" border="0">
  <tr>
    <td valign="top">
      <ASP:ValidationSummary id="ValidationSummary_control" runat="server"></ASP:ValidationSummary>
