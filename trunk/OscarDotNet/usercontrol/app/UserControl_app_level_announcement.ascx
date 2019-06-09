<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_app_level_announcement.ascx.cs" Inherits="UserControl_app_level_announcement.TWebUserControl_app_level_announcement"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<asp:Panel ID="Panel_content" runat="server" visible="false">
  <asp:Panel ID="Panel_inner" runat="server">
    <table bgcolor="khaki" border="2" bordercolor="red" cellspacing="0" cellpadding="10" width="100%">
      <tr>
        <td align="center">
          <i>
            <ASP:Label id="Label_application_name" runat="server" font-bold="True"></ASP:Label> will be unavailable beginning <b>19:00 Saturday 1 June 2019</b> for a database subsystem upgrade.&nbsp; We anticipate the work may take up to 12
            hours.&nbsp; Please plan accordingly.
          </i>
        </td>
      </tr>
    </table>
  </asp:Panel>
  <ajaxToolkit:DropShadowExtender ID="Panel_inner_DropShadowExtender" runat="server" BehaviorID="Panel_inner_DropShadowExtender" TargetControlID="Panel_inner" />
  <br />
</asp:Panel>