<!DOCTYPE html>
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->
<%@ Page language="c#" Debug="true" Codebehind="report_commanded_watchbill.aspx.cs" AutoEventWireup="True" Inherits="report_commanded_watchbill.TWebForm_report_commanded_watchbill" EnableViewState="false"%>
<%@ Register src="../usercontrol/app/UserControl_common_header_bar.ascx" tagname="UserControl_common_header_bar" tagprefix="uc1" %>
<html>
  <head runat="server">
    <title></title>
    <!-- $Id$ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>
  <body bgcolor="white">
    <form runat="server">
    <uc1:UserControl_common_header_bar ID="UserControl_common_header_bar_control" runat="server" />
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
            <tr><td align="center" colspan="2"><small><asp:HyperLink ID="HyperLink_web_site" runat="server" Font-Bold="True"></asp:HyperLink></small></td></tr>
          </table>
        </td>
      </tr>
    </table>
    <p><asp:PlaceHolder ID="PlaceHolder_schedule_proposal" runat="server"></asp:PlaceHolder></p>
    <hr size="1" />
    <small>The transmission of this message was triggered by <asp:Literal ID="Literal_publisher" runat="server"></asp:Literal>.</small>
    </form>
  </body>
</html>