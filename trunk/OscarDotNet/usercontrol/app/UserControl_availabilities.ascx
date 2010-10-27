<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_availabilities.ascx.cs" Inherits="UserControl_availabilities.TWebUserControl_availabilities" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table cellspacing="10">
  <tr><td colspan="5"><h3>Actions</h3></td></tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td align="right" valign="top">Submit</td>
    <td valign="top">
      an&nbsp;availability&nbsp;sheet for
      <asp:HyperLink ID="HyperLink_submit_avails_for_month_next" runat="server" NavigateUrl="$OSCAR/form-submit-avails-2.phtml" Target="_blank" Font-Bold="True">[HyperLink_submit_avails_for_month_next]</asp:HyperLink>&nbsp;or&nbsp;<asp:HyperLink 
        ID="HyperLink_submit_avails_for_month_following" runat="server" NavigateUrl="$OSCAR/form-submit-avails-2.phtml" Target="_blank" Font-Bold="True">[HyperLink_submit_avails_for_month_following]</asp:HyperLink>
      <br />
      <br />
      <small><i>Surrogates,&nbsp;make&nbsp;submissions&nbsp;<asp:HyperLink id="HyperLink_surrogate" runat="server" target="_blank" NavigateUrl="$OSCAR/form-surrogate-submissions-1.phtml">here</asp:HyperLink>.<br /></i></small>
    </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td rowspan="3" valign="top">
      <table border="1" cellspacing="0" cellpadding="1">
        <tr bgcolor="#D0D0D0">
          <td colspan="3" align="center">
            <small><i>Submissions from <asp:HyperLink id="HyperLink_vorps" runat="server" target="_blank" NavigateUrl="$OSCAR/meaning-of-vorp.phtml">VORPs</asp:HyperLink><small>&nbsp;<asp:HyperLink id="HyperLink_more_stats" runat="server" target="_blank" NavigateUrl="$OSCAR/stats.phtml">(more&nbsp;stats)</asp:HyperLink></i></small>
          </td>
        </tr>
      </table>
      <br>
      <p>
        <asp:HyperLink id="HyperLink_oscar_u" runat="server" target="_blank" NavigateUrl="$OSCAR/training.phtml">
          <img id="Img_mortarboard" runat="server" align="middle" border="1" src="$OSCAR/doc/mortarboard.gif">&nbsp;<b>OSCAR&nbsp;U.</b></asp:HyperLink></p>
      <p>
        <asp:HyperLink id="HyperLink_class_act" runat="server" target="_blank" NavigateUrl="$OSCAR/form-submit-class-act.phtml">
          <img id="Img_trophy" runat="server" align="middle" border="1" src="$OSCAR/static-image/trophy-icon.gif">&nbsp;<b>Class&nbsp;Act</b></asp:HyperLink></p>
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right" valign="top">
      <b><asp:HyperLink id="HyperLink_request" runat="server" target="_blank" NavigateUrl="$OSCAR/form-request-report-1.phtml">Request</asp:HyperLink></b>
    </td>
    <td valign="top">
      a compiled availability report.
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right" valign="top">
      <b><asp:HyperLink id="HyperLink_reconfirm_or_retract" runat="server" target="_blank" NavigateUrl="$OSCAR/form-request-retraction.phtml">Reconfirm or Retract</asp:HyperLink></b>
    </td>
    <td valign="top">
      previous submissions.
    </td>
  </tr>
  <tr>
    <td colspan="5">
      <h3>
        <br>
        Administrivia</h3>
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right" valign="top">
      <b><asp:HyperLink id="HyperLink_catch_up" runat="server" target="_blank" NavigateUrl="$OSCAR/whats-new.phtml">Catch up</asp:HyperLink></b>
    </td>
    <td valign="top">
      on what's new.
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right" valign="top">
      <b><asp:HyperLink id="HyperLink_faq" runat="server" target="_blank" NavigateUrl="$OSCAR/faq.phtml">FAQ</asp:HyperLink></b>
    </td>
    <td valign="top">
      Answers to frequently asked questions.
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right" valign="top">
      <b><asp:HyperLink id="HyperLink_modify" runat="server" target="_blank" NavigateUrl="$OSCAR/modify.phtml">Modify</asp:HyperLink></b>
    </td>
    <td valign="top">
      system settings (OSCAR Authorities only).
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right" valign="top">
      <b><asp:HyperLink id="HyperLink_read" runat="server" target="_blank" NavigateUrl="$OSCAR/privacy.phtml">Read</asp:HyperLink></b>
    </td>
    <td valign="top">
      the privacy policy.
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right" valign="top">
      <b><asp:HyperLink id="HyperLink_contribute" runat="server" target="_blank" NavigateUrl="$OSCAR/develop.phtml">Contribute</asp:HyperLink></b>
    </td>
    <td valign="top">
      to the <b>kveo-it-project</b> as a programmer or content developer.
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right" valign="top">
      <b><asp:HyperLink ID="HyperLink_contact" runat="server" href="mailto:oscartrack@frompaper2web.com">Contact</asp:HyperLink></b>
    </td>
    <td valign="top">
      the OSCAR System Administrator.
    </td>
  </tr>
</table>
