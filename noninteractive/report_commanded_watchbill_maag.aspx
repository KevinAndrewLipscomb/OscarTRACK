<!DOCTYPE html>
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->
<%@ Page language="c#" codebehind="report_commanded_watchbill_maag.aspx.cs" AutoEventWireup="True" Inherits="report_commanded_watchbill_maag.TWebForm_report_commanded_watchbill_maag" EnableViewState="false"%>
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
      <p>The month-at-a-glance rendition of your squad's Watchbill follows this section.&nbsp; It is designed to insert a page break just before the beginning of each calendar when printed.&nbsp; To get it to print as intended, you may have to adjust your
      browser and/or page or print settings.&nbsp; (In particular, you should set landscape mode and reduce print margins.)</p>
      <p>Because its rendition depends so heavily on settings controlled at your end, technical support for the month-at-a-glance rendition of the Watchbill is extremely limited.&nbsp; If you have trouble viewing or printing it, please log into
      <asp:Literal ID="Literal_application_name" runat="server"></asp:Literal> to view it in your browser.</p>
      <p><small>The transmission of this message was triggered by <asp:Literal ID="Literal_publisher" runat="server"></asp:Literal> at <asp:Literal ID="Literal_time_triggered" runat="server"></asp:Literal>.</small></p>
      <asp:Panel ID="Panel_page_break" runat="server"><div style="page-break-before:always;" /></asp:Panel>
      <p><asp:PlaceHolder ID="PlaceHolder_watchbill_maag" runat="server"></asp:PlaceHolder></p>
    </form>
  </body>
</html>