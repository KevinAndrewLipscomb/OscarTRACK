<%@ Page language="c#" Debug="true" Codebehind="report_monthly_current_phone_list.pas" AutoEventWireup="false" Inherits="report_monthly_current_phone_list.TWebForm_report_monthly_current_phone_list" EnableViewState="false" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_roster.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <title id="Title" runat="server"></title>
    <!-- $Id: report_monthly_current_phone_list.aspx 2527 2008-09-02 16:48:45Z kevinanlipscomb $ -->
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
                  <td bgcolor="#f5f5f5"><strong>Current phone list</strong></td>
                </tr>
                <tr>
                  <td>
                    <small>
                    <p>Best practices:</p>
                    <ul>
                      <li><p>It's a team effort to keep the units staffed as scheduled.&nbsp; This report shows who's on the
                        team.</p></li>
                      <li><p>Except in cases of immediate personal emergencies, you are expected to stand, or arrange coverage for,
                        all slots on the schedule where your name appears.</p></li>
                      <li><p>Drivers must be covered by drivers.</p></li>
                      <li><p>When seeking coverage for a duty, do not hesitate to call members you don't know well.&nbsp The
                        worst they can say is no.</p></li>
                      <li><p>If unable to find coverage from within your section, call members of other sections.&nbsp; If unable
                        to find coverage from within your squad, call members of other squads.&nbsp; (Log into
                        <asp:label id="Label_application_name_1" runat="server" font-bold="True"></asp:label> to access other
                        squads' phone lists.)</p></li>
                      <li><p>Log into <asp:label id="Label_application_name_2" runat="server" font-bold="True"></asp:label> to
                        update your own phone number, and to use additional features, such as advanced filtering, sorting, and
                        detail lookups:</p>
                        <blockquote>
                          <ASP:HyperLink id="HyperLink_web_site" runat="server" font-bold="True"></ASP:HyperLink>
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
      <p<ASP:PlaceHolder id="PlaceHolder_roster" runat="server"></ASP:PlaceHolder></p>
    </form>
  </body>
</html>
