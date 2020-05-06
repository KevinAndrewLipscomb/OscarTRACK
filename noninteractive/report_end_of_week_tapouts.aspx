<!DOCTYPE html>
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->
<%@ Page language="c#" codebehind="report_end_of_week_tapouts.aspx.cs" AutoEventWireup="True" Inherits="report_end_of_week_tapouts.TWebForm_report_end_of_week_tapouts" EnableViewState="false"%>
<%@ Register src="../usercontrol/app/UserControl_common_header_bar.ascx" tagname="UserControl_common_header_bar" tagprefix="uc1" %>
<html>
  <head runat="server">
    <title></title>
    <!-- $Id$ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";
                        .auto-style1 {
                          font-size: large;
                        }
                      </style><![endif]-->
  </head>
  <body bgcolor="white">
    <form runat="server">
    <uc1:UserControl_common_header_bar ID="UserControl_common_header_bar_control" runat="server" />
    <br />
    <table cellpadding="0" cellspacing="0" border="1" width="100%">
      <tr>
        <td>
          <table cellpadding="10" cellspacing="0" width="100%">
            <tr><td align="center"><div class="auto-style1">THIS WEEK&#39;S</div><div style="font-size: xx-large;">TAPOUT REPORT</div></td></tr>
            <tr><td align="center" style="font-size: x-large;" width="50%"><b><asp:Literal ID="Literal_scope" runat="server"></asp:Literal></b></td></tr>
            <tr><td align="center" colspan="2"><small><asp:HyperLink ID="HyperLink_web_site" runat="server" Font-Bold="True"></asp:HyperLink></small></td></tr>
          </table>
        </td>
      </tr>
    </table>
    <p><asp:PlaceHolder ID="PlaceHolder_tapouts" runat="server"></asp:PlaceHolder></p>
    </form>
  </body>
</html>