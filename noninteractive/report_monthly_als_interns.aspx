<%@ Page Language="c#" Debug="true" CodeBehind="report_monthly_als_interns.aspx.cs" AutoEventWireup="True" Inherits="report_monthly_als_interns.TWebForm_report_monthly_als_interns" EnableViewState="false" %>

<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_roster.ascx" %>
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
                <tr><td bgcolor="#f5f5f5"><strong>Monthly report of ALS INTERNS</strong></td></tr>
                <tr>
                  <td>
                    <small>
                      <p>Best practices:</p>
                      <ul>
                        <li>
                          <p>
                            The Department should be manually assigning ALS internship duties to these members.&nbsp; <asp:Literal id="Literal_application_name_1" runat="server"></asp:Literal> automatically assigns them to 2
                            ambulance shifts with their home agency.
                          </p>
                        </li>
                        <li>
                          <p>Visit the <asp:Literal id="Literal_application_name_2" runat="server"></asp:Literal>&nbsp;website to use additional features, such as advanced filtering, sorting, detail lookups, and QuickMessaging:</p>
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
