<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_availabilities.ascx.cs" Inherits="UserControl_availabilities.TWebUserControl_availabilities" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table cellspacing="10">
  <tr><td colspan="5"><h3>Actions</h3></td></tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td align="right" valign="middle"><b>Submit</b></td>
    <td valign="middle" nowrap="nowrap">
      <b>availabilities</b> to 
      <asp:DropDownList ID="DropDownList_coord_agency" runat="server" AutoPostBack="True" Font-Size="Small" onselectedindexchanged="DropDownList_coord_agency_SelectedIndexChanged"></asp:DropDownList>
      for&nbsp;<asp:HyperLink ID="HyperLink_submit_avails_for_month_next" runat="server" NavigateUrl="$OSCAR/form-submit-avails-2.phtml" Target="_blank" Font-Bold="True" Font-Underline="True">[HyperLink_submit_avails_for_month_next]</asp:HyperLink>&nbsp;or&nbsp;<asp:HyperLink ID="HyperLink_submit_avails_for_month_following" runat="server" NavigateUrl="$OSCAR/form-submit-avails-2.phtml" Target="_blank" Font-Bold="True" Font-Underline="True">[HyperLink_submit_avails_for_month_following]</asp:HyperLink>
    </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td rowspan="3" valign="top">
      <table border="1" cellspacing="0" cellpadding="1">
        <tr bgcolor="#D0D0D0">
          <td colspan="3" align="center">
            <small><i>Submissions from <asp:HyperLink id="HyperLink_vorps" runat="server" target="_blank" NavigateUrl="$OSCAR/meaning-of-vorp.phtml">VORPs</asp:HyperLink><small>&nbsp;<asp:HyperLink id="HyperLink_more_stats" runat="server" target="_blank" NavigateUrl="$OSCAR/stats.phtml">(more&nbsp;stats)</asp:HyperLink></small></i></small>
          </td>
        </tr>
      </table>
      <br/>
      <p>
        <asp:HyperLink id="HyperLink_oscar_u" runat="server" target="_blank" NavigateUrl="$OSCAR/training.phtml">
          <img id="Img_mortarboard" runat="server" align="middle" border="1" src="~/protected/image/mortarboard.gif" alt="Cap"/>&nbsp;<b>OSCAR&nbsp;U.</b></asp:HyperLink></p>
      <p>
        <asp:HyperLink id="HyperLink_class_act" runat="server" target="_blank" NavigateUrl="$OSCAR/form-submit-class-act.phtml">
          <img id="Img_trophy" runat="server" align="middle" border="1" src="~/protected/image/trophy-icon.gif" alt="Trophy"/>&nbsp;<b>Class&nbsp;Act</b></asp:HyperLink></p>
    </td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td align="right">
      <asp:ImageButton ID="ImageButton_coverage_assistant" runat="server" AlternateText="Coverage Assistant" CausesValidation="False" ImageUrl="~/protected/image/help-2--48x48.png" OnClick="ImageButton_coverage_assistant_Click" />
    </td>
    <td><small>Learn about the <asp:LinkButton ID="LinkButton_coverage_assistant" runat="server" OnClick="LinkButton_coverage_assistant_Click">Coverage Assistant (with "Swap-ortunities"!)</asp:LinkButton></small></td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right" valign="top">
      <small><asp:HyperLink id="HyperLink_reconfirm_or_retract" runat="server" target="_blank" NavigateUrl="$OSCAR/form-request-retraction.phtml">Reconfirm or Retract</asp:HyperLink></small>
    </td>
    <td valign="top">
      <small>previous submissions.</small>
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right" valign="top">
      <small><asp:HyperLink id="HyperLink_request" runat="server" target="_blank" NavigateUrl="$OSCAR/form-request-report-1.phtml">Request</asp:HyperLink></small>
    </td>
    <td valign="top">
      <small>a compiled availability report.</small>
    </td>
  </tr>
  <tr>
    <td colspan="5">
      <h3>
        <br/>
        Administrivia</h3>
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right" valign="top">
      <small><asp:HyperLink id="HyperLink_faq" runat="server" target="_blank" NavigateUrl="$OSCAR/faq.phtml">FAQ</asp:HyperLink></small>
    </td>
    <td valign="top">
      <small>Answers to frequently asked questions.</small>
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right" valign="top">
      <small><asp:HyperLink id="HyperLink_modify" runat="server" target="_blank" NavigateUrl="$OSCAR/modify.phtml">Modify</asp:HyperLink></small>
    </td>
    <td valign="top">
      <small>system settings (OSCAR Authorities only).</small>
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right" valign="top">
      <small><asp:HyperLink id="HyperLink_read" runat="server" target="_blank" NavigateUrl="$OSCAR/privacy.phtml">Read</asp:HyperLink></small>
    </td>
    <td valign="top">
      <small>the privacy policy.</small>
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right" valign="top">
      <small><asp:HyperLink id="HyperLink_contribute" runat="server" target="_blank" NavigateUrl="$OSCAR/develop.phtml">Contribute</asp:HyperLink></small>
    </td>
    <td valign="top">
      <small>to the <b>kveo-it-project</b> as a programmer or content developer.</small>
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right" valign="top">
      <small><asp:HyperLink ID="HyperLink_contact" runat="server" NavigateUrl="mailto:oscartrack@frompaper2web.com">Contact</asp:HyperLink></small>
    </td>
    <td valign="top">
      <small>the OSCAR System Administrator.</small>
    </td>
  </tr>
</table>
