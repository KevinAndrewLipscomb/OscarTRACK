<%@ Page Language="c#" Debug="true" CodeBehind="report_monthly_transferees.aspx.cs" AutoEventWireup="True" Inherits="report_monthly_transferees.TWebForm_report_monthly_transferees" EnableViewState="false" %>

<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_roster.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head runat="server">
    <!-- $Id: report_monthly_transferees.aspx 2817 2009-09-09 13:48:28Z KevinAnLipscomb $ -->
  </head>
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_common_header_bar ID="UserControl_common_header_bar" runat="server"></uc1:UserControl_common_header_bar>
      <p>
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
          <tr>
            <td>
              <table cellspacing="0" cellpadding="10" width="100%" border="0">
                <tr><td bgcolor="#f5f5f5"><strong>Monthly report of TRANSFEREES</strong></td></tr>
                <tr>
                  <td>
                    <small>
                      <p>Best practices:</p>
                      <ul>
                        <li><p>Check this list for personnel who have been accepted into your squad.</p></li>
                        <li><p>The list shows which Agency the transferee is <u>leaving</u>.</p>
                        </li>
                        <li>
                          <p>To move a transferee onto your squad's roster, log into <asp:Literal id="Literal_application_name_1" runat="server"></asp:Literal>, adjust the Agency filter to reveal the transferee, pull up the transferee's record, and give the
                          transferee a new Membership Status.</p>
                        </li>
                        <li><p>If you don't have the privilege to complete a transfer in <asp:Literal ID="Literal_application_name_2" runat="server"></asp:Literal>, contact the transferee's current or new Squad Commander or Squad Membership Coordinator.</p></li>
                        <li>
                          <p>Visit the <asp:Literal id="Literal_application_name_3" runat="server"></asp:Literal>&nbsp;website to use additional features, such as advanced filtering, sorting, detail lookups, and QuickMessaging:</p>
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
