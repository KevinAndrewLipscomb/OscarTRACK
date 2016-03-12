<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->
<%@ Page language="c#" Debug="true" Codebehind="report_commanded_gripe_sheet.aspx.cs" AutoEventWireup="True" Inherits="report_commanded_gripe_sheet.TWebForm_report_commanded_gripe_sheet" EnableViewState="false"%>
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
    <p><asp:PlaceHolder ID="PlaceHolder_gripe_sheet" runat="server"></asp:PlaceHolder></p>
    </form>
  </body>
</html>