<%@ Page language="c#" Debug="true" Codebehind="report_monthly_role_holders.pas" AutoEventWireup="false" Inherits="report_monthly_role_holders.TWebForm_report_monthly_role_holders" EnableViewState="false" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_role_holders_per_agency.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title id="Title" runat="server"></title>
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
                <tr>
                  <td bgcolor="#f5f5f5"><strong>Monthly report of Role Holders</strong></td>
                </tr>
                <tr>
                  <td>
                    <small>
                      <p>Best practices:</p>
                      <ul>
                        <li>
                          <p>In <asp:label id="Label_application_name_1" runat="server"></asp:label>, it is <u>critical</u> to keep
                            this list current (see the <em>Role-Member Matrix</em>), because these settings tell the
                            application:</p>
                          <p>
                            <ul>
                              <li>Who is allowed to make certain changes (see the <em>Role-Privilege Matrix</em>);</li>
                              <li>Who gets notified when certain changes get made (see the <em>Role-Notification Matrix</em>);</li>
                              <li>Who receives certain monthly reports.</li>
                            </ul>
                          </p>
                        </li>
                        <li><p>The accuracy of the Role Holders list has a major impact on recruitment & retention.</p></li>
                        <li><p>Access the <asp:label id="Label_application_name_2" runat="server"></asp:label> Config / Roles &
                          Matrices area here:</p>
                          <blockquote>
                            <ASP:HyperLink id="HyperLink_web_site" runat="server" font-bold="True"></ASP:HyperLink>
                          </blockquote>
                        </li>
                        <li><p>Read the <ASP:HyperLink id="HyperLink_roles_help" runat="server">Important Information About Roles</ASP:HyperLink>.</p></li>
                      </ul>
                    </small>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </p>
      <p><ASP:PlaceHolder id="PlaceHolder_control" runat="server"></ASP:PlaceHolder></p>
    </form>
  </body>
</html>
