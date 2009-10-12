<%@ Page Language="c#" Debug="true" CodeBehind="report_monthly_per_agency_serial_indicators.aspx.cs" AutoEventWireup="True" Inherits="report_monthly_per_agency_serial_indicators.TWebForm_report_monthly_per_agency_serial_indicators" EnableViewState="false" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<%@ Register Src="../usercontrol/app/UserControl_serial_indicators_per_agency.ascx" TagName="UserControl_serial_indicators_per_agency" TagPrefix="uc2" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head runat="server">
    <!-- $Id$ -->
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
                  <td bgcolor="#f5f5f5"><strong>Monthly report of SERIAL INDICATORS</strong></td>
                </tr>
                <tr>
                  <td>
                    <small>
                      <p>Best practices:</p>
                      <ul>
                        <li><p>These charts show how your agency's metrics have changed over recent months.</p></li>
                        <li><p>Consider sharing these charts with your agency's upper management.</p></li>
                        <li><p>Read the definitions carefully as each word makes an important difference.</p></li>
                        <li>
                          <p>Visit the <asp:Label ID="Label_application_name" runat="server" Font-Bold="True"></asp:Label> website for additional features, such as advanced filtering, sorting, detail lookups, and QuickMessaging:</p>
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
      <uc2:UserControl_serial_indicators_per_agency ID="UserControl_serial_indicators_per_agency_control" runat="server" />
      <p>-- END --</p>
    </form>
  </body>
</html>
