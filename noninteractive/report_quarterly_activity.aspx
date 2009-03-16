<%@ Page language="c#" Debug="true" Codebehind="report_quarterly_activity.pas" AutoEventWireup="false" Inherits="report_quarterly_activity.TWebForm_report_quarterly_activity" EnableViewState="false" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_behind_the_scenes_activity" Src="~/usercontrol/app/UserControl_behind_the_scenes_activity.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <title id="Title" runat="server"></title>
    <!-- $Id: report_quarterly_activity.aspx 2649 2008-10-17 19:21:01Z kevinanlipscomb $ -->
  </head>
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_common_header_bar id="UserControl_common_header_bar" runat="server"></uc1:UserControl_common_header_bar>
      <p>
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
          <tr>
            <td>
              <table cellspacing="0" cellpadding="10" width="100%" border="0">
                <tr>
                  <td bgcolor="#f5f5f5">
                    <strong>
                      Quarterly report of Behind-The-Scenes <asp:label id="Label_application_name" runat="server"></asp:label>
                      Activity
                    </strong>
                  </td>
                </tr>
                <tr>
                  <td>
                    <small>
                      <p>Best practices:</p>
                      <ul>
                        <li><p>This report shows the level of personnel tracking activity and inter-stakeholder notifications
                          managed by <asp:label id="Label_application_name_2" runat="server"></asp:label>.</p></li>
                        <li><p>Access <asp:label id="Label_application_name_3" runat="server"></asp:label> here:&nbsp;
                          <ASP:HyperLink id="HyperLink_web_site" runat="server" font-bold="True"></ASP:HyperLink></p></li>
                      </ul>
                    </small>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </p>
      <p><uc1:UserControl_behind_the_scenes_activity id="UserControl_behind_the_scenes_activity" runat="server"></uc1:UserControl_behind_the_scenes_activity></p>
    </form>
  </body>
</html>
