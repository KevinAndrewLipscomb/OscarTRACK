<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_autocalendaring_subscriptions.ascx.cs" Inherits="UserControl_autocalendaring_subscriptions.TWebUserControl_autocalendaring_subscriptions"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table cellpadding="0" cellspacing="0" border="1" bordercolor="gainsboro">
  <tr>
    <td>
      <table cellpadding="10" cellspacing="0">
        <tr><td bgcolor="khaki" colspan="2"><strong>Auto-calendaring</strong></td></tr>
        <tr>
          <td colspan="2">
            <p>
              To make your <asp:Literal ID="Literal_application_name" runat="server"></asp:Literal> assignments show up in your online calendaring system, do the following.&nbsp; Your assignments will show up in a read-only overlay.&nbsp; As long as
              your officer code and first name stay the same in <asp:Literal ID="Literal_application_name_2" runat="server"></asp:Literal>, you should <u>not</u> need to repeat this process in the future.
            </p>
            <table align="center" bgcolor="whitesmoke" cellpadding="10" width="80%">
              <tr>
                <td>
                  <small>
                    <b>NOTE:&nbsp; Email notifications from <asp:Literal ID="Literal_application_name_3" runat="server"></asp:Literal> always take precedence over the information displayed in your calendaring system.</b>&nbsp;
                    <asp:Literal ID="Literal_application_name_4" runat="server"></asp:Literal> has no ability to "push" updates to your calendaring system.&nbsp; Your calendaring system will automatically "pull" your assignments from
                    <asp:Literal ID="Literal_application_name_5" runat="server"></asp:Literal>.
                  </small>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td align="right" valign="top">&bull;</td>
          <td>
            <asp:HyperLink ID="HyperLink_subscribe_via_google_calendar_render" runat="server" Font-Bold="True" Target="_blank">Subscribe using Google Calendar</asp:HyperLink>
            <blockquote>
              <small>
                Google retains sole control over how often your duty assignment data gets "pulled" from <asp:Literal ID="Literal_application_name_6" runat="server"></asp:Literal> into your calendar.&nbsp; It may be a day or more before changes
                are reflected in Google Calendar.&nbsp; Neither you nor <asp:Literal ID="Literal_application_name_7" runat="server"></asp:Literal> can control this.
              </small>
            </blockquote>
          </td>
        </tr>
        <tr>
          <td align="right" valign="top">&bull;</td>
          <td>
            <asp:HyperLink ID="HyperLink_subscribe_via_webcal" runat="server" Font-Bold="True" Target="_blank">Subscribe via your local calendar app</asp:HyperLink>
            <blockquote>
              <small>
                Your local calendar app probably gives you control over how often your duty assignment data gets "pulled" from <asp:Literal ID="Literal_application_name_8" runat="server"></asp:Literal>.
              </small>
            </blockquote>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            Reminder alerts and display colors for events in your subscribed calendar are under your control, not <asp:Literal ID="Literal_application_name_9" runat="server"></asp:Literal>'s.
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
