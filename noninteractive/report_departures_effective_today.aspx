<%@ Page language="c#" Debug="true" Codebehind="report_departures_effective_today.aspx.cs" AutoEventWireup="True" Inherits="report_departures_effective_today.TWebForm_report_departures_effective_today" EnableViewState="false" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_departures_effective_today" Src="~/usercontrol/app/UserControl_departures_effective_today.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head runat="server">
    <title></title>
    <!-- $Id$ -->
  </head>
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_common_header_bar id="UserControl_common_header_bar" runat="server"></uc1:UserControl_common_header_bar>
      <p>
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
          <tr>
            <td>
              <table cellspacing="0" cellpadding="10" width="100%" border="0">
                <tr><td bgcolor="#f5f5f5"><strong>Departures Effective Today</strong></td></tr>
                <tr>
                  <td>
                    <small>
                      <p>Best practices:</p>
                      <ul>
                        <li><p>This report shows personnel who were set up in advance to become Past members of the Virginia Beach EMS System effective today.</p></li>
                        <li><p>Perform separation procedures for these individuals now.</p></li>
                      </ul>
                    </small>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </p>
      <p><uc1:UserControl_departures_effective_today id="UserControl_departures_effective_today_control" runat="server"></uc1:UserControl_departures_effective_today></p>
    </form>
  </body>
</html>
