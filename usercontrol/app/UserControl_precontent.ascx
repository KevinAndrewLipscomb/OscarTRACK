<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_precontent.ascx.cs" Inherits="UserControl_precontent.TWebUserControl_precontent"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_bread_crumb_trail" Src="~/usercontrol/ki/UserControl_bread_crumb_trail.ascx" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register Src="~/usercontrol/app/UserControl_app_level_announcement.ascx" TagPrefix="uc1" TagName="UserControl_app_level_announcement" %>

<asp:ScriptManager ID="ScriptManager_control" runat="server" onasyncpostbackerror="ScriptManager_control_AsyncPostBackError" AsyncPostBackTimeout="300"><Scripts><asp:ScriptReference Path="~/js/ErrorHandler.js" /></Scripts></asp:ScriptManager>
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
            <hr align="center" noshade="noshade" width="100%" size="1"/>
            <table cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td align="left" valign="middle">
                  <small>
                    <ASP:Label id="Label_username" runat="server"></ASP:Label>:&nbsp;<ASP:LinkButton id="LinkButton_logout" runat="server" causesvalidation="False" onclick="LinkButton_logout_Click">logout</ASP:LinkButton>&nbsp;|&nbsp;<ASP:LinkButton id="LinkButton_profile" runat="server" causesvalidation="False" onclick="LinkButton_profile_Click">profile</ASP:LinkButton>
                  </small>
                </td>
                <td>&nbsp;&nbsp;</td>
                <td align="right" valign="middle"><asp:LinkButton ID="LinkButton_role_comms" runat="server" Visible="false" OnClick="LinkButton_role_comms_Click" CausesValidation="False">ROLE*COMMS</asp:LinkButton></td>
              </tr>
            </table>
            <hr align="center" noshade="noshade" width="100%" size="1"/>
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
      <asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Always">
        <ContentTemplate>
          <ASP:ValidationSummary id="ValidationSummary_control" runat="server"></ASP:ValidationSummary>
        </ContentTemplate>
      </asp:UpdatePanel>
      <uc1:UserControl_app_level_announcement runat="server" id="UserControl_app_level_announcement" />
      