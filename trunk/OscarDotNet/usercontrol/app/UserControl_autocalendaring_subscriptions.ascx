<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_autocalendaring_subscriptions.ascx.cs" Inherits="UserControl_autocalendaring_subscriptions.TWebUserControl_autocalendaring_subscriptions"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table cellpadding="0" cellspacing="0" border="1" bordercolor="gainsboro">
  <tr>
    <td>
      <table cellpadding="10" cellspacing="0">
        <tr><td bgcolor="khaki" colspan="2"><strong>Auto-calendaring</strong></td></tr>
        <tr>
          <td>
            <small>
              <p><b>Tired of manually entering your <asp:Literal ID="Literal_application_name" runat="server"></asp:Literal> assignments into your online calendaring system?</b></p>
              <p>
                <asp:Literal ID="Literal_application_name_2" runat="server"></asp:Literal> now provides a personalized read-only <i>iCalendar</i> overlay that your online calendaring system can display.&nbsp; Once you set this up, you should
                <u>not</u> need to repeat the process in the future (unless your officer code or first name change in <asp:Literal ID="Literal_application_name_3" runat="server"></asp:Literal>).
              </p>
              <table align="center" bgcolor="whitesmoke" cellpadding="10" width="80%">
                <tr>
                  <td>
                    <b>NOTE:&nbsp; Email notifications from <asp:Literal ID="Literal_application_name_4" runat="server"></asp:Literal> always take precedence over the information displayed in your calendaring system.</b>&nbsp;
                    <asp:Literal ID="Literal_application_name_5" runat="server"></asp:Literal> has no ability to "push" updates to your calendaring system.&nbsp; Your calendaring system should automatically "pull" your assignments from
                    <asp:Literal ID="Literal_application_name_6" runat="server"></asp:Literal>.
                  </td>
                </tr>
              </table>
              <p>
                The setup process is currently different depending on which online calendaring system you use.&nbsp; The following setup OPTIONS are listed from easiest, most secure, and most standards-compliant to most difficult, least-secure,
                and least standards compliant.&nbsp; Try option 1 first, and only move on if it doesn't work for you.&nbsp; Once an option causes your <asp:Literal ID="Literal_application_name_7" runat="server"></asp:Literal> assignments to be
                displayed in your calendaring system, STOP.
              </p>
              <p>
                Calendar integration is an evolving technology.&nbsp; If you detect that updates should be made to these instructions, please
                <asp:HyperLink ID="HyperLink_mailto_appadmin" runat="server" Font-Italic="True" Target="_blank">notify the Application Administrator</asp:HyperLink>.
              </p>
            </small>
          </td>
        </tr>
        <tr>
          <td>
            <small>
              <table cellpadding="10" cellspacing="0" border="1" bordercolor="gainsboro">
                <tr>
                  <td bgcolor="gainsboro"><b>Sophistication</b></td>
                  <td bgcolor="gainsboro"><b>OPTION</b></td>
                  <td bgcolor="gainsboro"><b>Process</b></td>
                  <td bgcolor="gainsboro"><b>Tested in...</b></td>
                </tr>
                <tr>
                  <td valign="top">Easiest<br />Most secure<br />Most standards-compliant</td>
                  <td align="center" valign="top">1</td>
                  <td valign="top"><asp:HyperLink ID="HyperLink_subscribe_via_webcals" runat="server" Font-Bold="True" Target="_blank">Just click this link and follow the instructions.</asp:HyperLink></td>
                  <td valign="top">Microsoft Outlook 2016</td>
                </tr>
                <tr>
                  <td valign="top">&nbsp;</td>
                  <td align="center" valign="top">2</td>
                  <td valign="top">
                    Use your calendaring software to "subscribe" or "add" a calendar "from the internet" or "from URL", and enter the following address:
                    <blockquote><b><code><asp:Literal ID="Literal_webcals_url" runat="server"></asp:Literal></code></b></blockquote>
                  </td>
                  <td valign="top">&nbsp;</td>
                </tr>
                <tr>
                  <td valign="top">&nbsp;</td>
                  <td align="center" valign="top">3</td>
                  <td valign="top">
                    Unsubscribe what you added in the above step, then try again using the following address:
                    <blockquote><b><code><asp:Literal ID="Literal_webcal_url" runat="server"></asp:Literal></code></b></blockquote>
                  </td>
                  <td valign="top">&nbsp;</td>
                </tr>
                <tr>
                  <td valign="top">&nbsp;</td>
                  <td align="center" valign="top">4</td>
                  <td valign="top">
                    Unsubscribe what you added in the above step, then try again using the following address:
                    <blockquote><b><code><asp:Literal ID="Literal_https_url" runat="server"></asp:Literal></code></b></blockquote>
                  </td>
                  <td valign="top">&nbsp;</td>
                </tr>
                <tr>
                  <td valign="top">Most difficult<br />Least secure<br />Least standards-compliant</td>
                  <td align="center" valign="top">5</td>
                  <td valign="top">
                    Unsubscribe what you added in the above step, then try again using the following address:
                    <blockquote><b><code><asp:Literal ID="Literal_http_url" runat="server"></asp:Literal></code></b></blockquote>
                  </td>
                  <td valign="top">Google Calendar</td>
                </tr>
              </table>
            </small>
          </td>
        </tr>
        <tr>
          <td>
            <small>
              NOTES
              <ul>
                <li>Reminder alerts and display colors for events in your subscribed calendar are under your control, not <asp:Literal ID="Literal_application_name_8" runat="server"></asp:Literal>'s.</li>
                <li>Your local calendar app probably gives you control over how often your duty assignment data gets "pulled" from <asp:Literal ID="Literal_application_name_9" runat="server"></asp:Literal>.</li>
                <li>
                  Google retains sole control over how often your duty assignment data gets "pulled" from <asp:Literal ID="Literal_application_name_10" runat="server"></asp:Literal> into your calendar.&nbsp; It may be a day or more before
                  changes are reflected in Google Calendar.&nbsp; Neither you nor <asp:Literal ID="Literal_application_name_11" runat="server"></asp:Literal> can control this.
                </li>
                <li>Anyone you share these URLs with will be able to see your <asp:Literal ID="Literal_application_name_12" runat="server"></asp:Literal> assignments.</li>
              </ul>
            </small>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
