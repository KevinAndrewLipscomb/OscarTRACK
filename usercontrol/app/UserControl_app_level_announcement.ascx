<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_app_level_announcement.ascx.cs" Inherits="UserControl_app_level_announcement.TWebUserControl_app_level_announcement"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<asp:Panel ID="Panel_content" runat="server" visible="true">
  <asp:Panel ID="Panel_inner" runat="server">
    <table bgcolor="khaki" border="2" bordercolor="red" cellspacing="0" cellpadding="10" width="100%">
      <tr>
        <td align="center">
          <i>
            <ASP:Label id="Label_application_name" runat="server" font-bold="True"></ASP:Label> will be unavailable beginning <b>22:00 Friday 17 February 2023</b> for a major server migration.&nbsp; This outage may also affect the OscarDASH
            live display boards at some stations.&nbsp; We anticipate the work may take up to 6 hours.&nbsp; As part of the migration, a change to FromPaper2Web.com's IP address may take hours to propagate to the Domain Name Servers used by
            your internet connection.&nbsp; Please assume that the system will be <u>unavailable</u> for the start of the Saturday DAY shift.
          </i>
        </td>
      </tr>
    </table>
  </asp:Panel>
  <ajaxToolkit:DropShadowExtender ID="Panel_inner_DropShadowExtender" runat="server" BehaviorID="Panel_inner_DropShadowExtender" TargetControlID="Panel_inner" />
  <br />
</asp:Panel>