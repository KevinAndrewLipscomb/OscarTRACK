<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->
<%@ Page language="c#" Debug="true" Codebehind="watchbill.aspx.cs" AutoEventWireup="True" Inherits="watchbill.TWebForm_watchbill" EnableViewState="false"%>
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
            <tr>
              <td colspan="2" align="center" style="font-size: xx-large;"><strong>WATCHBILL</strong></td>
            </tr>
            <tr>
              <td align="center" style="font-size: x-large;" width="50%"><b><asp:Literal ID="Literal_agency" runat="server"></asp:Literal></b></td>
              <td align="center" width="50%"><small>This report shows <asp:Literal ID="Literal_release_filter" runat="server"></asp:Literal>.</small></td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <br />
    <p><asp:PlaceHolder ID="PlaceHolder_schedule_proposal" runat="server"></asp:PlaceHolder></p>
    </form>
    <script type="text/javascript">window.print();</script>
  </body>
</html>