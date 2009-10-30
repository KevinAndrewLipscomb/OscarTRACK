<%@ Page Language="c#" Debug="true" CodeBehind="report_shift_fleet_status.aspx.cs" AutoEventWireup="True" Inherits="report_shift_fleet_status.TWebForm_report_shift_fleet_status" EnableViewState="false" %>

<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_roster.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head runat="server">
    <!-- $Id: report_shift_fleet_status.aspx 2817 2009-09-09 13:48:28Z KevinAnLipscomb $ -->
  </head>
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_common_header_bar ID="UserControl_common_header_bar" runat="server"></uc1:UserControl_common_header_bar>
      <p>
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
          <tr>
            <td>
              <table cellspacing="0" cellpadding="10" width="100%" border="0">
                <tr>
                  <td bgcolor="#f5f5f5">
                    <strong>Shift FLEET STATUS report</strong>
                  </td>
                </tr>
                <tr>
                  <td>
                    <small>
                      <p>
                        Best practices:</p>
                      <ul>
                        <li><p><asp:Label ID="Label_application_name_1" runat="server" Font-Bold="True"></asp:Label> &nbsp;shares this data with the Duty Street Supervisor team.</p></li>
                        <li>
                          <p>Visit the <asp:Label ID="Label_application_name_2" runat="server" Font-Bold="True"></asp:Label>&nbsp;website to make updates and to use additional features, such as advanced filtering, sorting, detail lookups, and QuickMessaging:</p>
                          <blockquote>
                            <asp:HyperLink ID="HyperLink_web_site" runat="server" Font-Bold="True"></asp:HyperLink>
                          </blockquote>
                        </li>
                      </ul>
                    </small>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </p>
      <asp:PlaceHolder ID="PlaceHolder_fleet_status" runat="server"></asp:PlaceHolder>
      </p>
    </form>
  </body>
</html>
