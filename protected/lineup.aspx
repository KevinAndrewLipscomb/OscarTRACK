<!DOCTYPE html>
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->
<%@ Page language="c#" codebehind="lineup.aspx.cs" AutoEventWireup="True" Inherits="lineup.TWebForm_lineup" EnableViewState="false"%>
<%@ Register src="../usercontrol/app/UserControl_schedule_proposal.ascx" tagname="UserControl_schedule_proposal" tagprefix="uc1" %>
<%@ Register src="../usercontrol/app/UserControl_common_header_bar.ascx" tagname="UserControl_common_header_bar" tagprefix="uc2" %>
<html>
  <head runat="server">
    <title></title>
    <!-- $Id$ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>
  <body bgcolor="white">
    <form runat="server">
    <uc2:UserControl_common_header_bar ID="UserControl_common_header_bar_control" runat="server" />
    <br />
    <table cellpadding="0" cellspacing="0" border="1" width="100%">
      <tr>
        <td>
          <table cellpadding="10" cellspacing="0" width="100%">
            <tr><td colspan="2" align="center" style="font-size: xx-large;"><strong>LINEUP</strong></td></tr>
            <tr><td align="center"><small>This report automatically switches to the upcoming shift at NOON &amp; MIDNIGHT.</small></td></tr>
          </table>
        </td>
      </tr>
    </table>
    <br />
    <p><asp:PlaceHolder ID="PlaceHolder_schedule_proposal" runat="server"></asp:PlaceHolder></p>
    <h3>Travel gaps at MUSTER</h3>
    <blockquote><asp:PlaceHolder ID="PlaceHolder_schedule_assignment_assistant_alert_travel_gap_muster" runat="server"></asp:PlaceHolder></blockquote>
    <h3>Travel gaps at DISMISSAL</h3>
    <blockquote><asp:PlaceHolder ID="PlaceHolder_schedule_assignment_assistant_alert_travel_gap_dismissal" runat="server"></asp:PlaceHolder></blockquote>
    </form>
    <script type="text/javascript">window.print();</script>
  </body>
</html>