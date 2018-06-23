<%@ Page Language="c#" Debug="true" CodeBehind="report_monthly_bls_intern_assignments.aspx.cs" AutoEventWireup="True" Inherits="report_monthly_bls_intern_assignments.TWebForm_report_monthly_bls_intern_assignments" EnableViewState="false" %>

<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_roster.ascx" %>
<!DOCTYPE html>
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
                <tr><td bgcolor="#f5f5f5"><strong>Monthly report of BLS INTERN SCHEDULE ASSIGNMENTS</strong></td></tr>
                <tr>
                  <td>
                    <small>
                      <p>Best practices:</p>
                      <ul>
                        <li>
                          <p>Visit the <asp:Literal id="Literal_application_name" runat="server"></asp:Literal>&nbsp;website to use additional features, such as advanced filtering, sorting, detail lookups, and QuickMessaging:</p>
                          <blockquote><asp:HyperLink ID="HyperLink_web_site" runat="server" Font-Bold="True"></asp:HyperLink></blockquote>
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
      <p>
        <asp:PlaceHolder ID="PlaceHolder_roster" runat="server"></asp:PlaceHolder>
      </p>
    </form>
  </body>
</html>
