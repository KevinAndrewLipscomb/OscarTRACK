<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->
<%@ Page language="c#" Debug="true" Codebehind="report_commanded_member_schedule_detail.aspx.cs" AutoEventWireup="True" Inherits="report_commanded_member_schedule_detail.TWebForm_report_commanded_member_schedule_detail" %>
<%@ Register src="../usercontrol/app/UserControl_common_header_bar.ascx" tagname="UserControl_common_header_bar" tagprefix="uc1" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_member_schedule_detail" Src="~/usercontrol/app/UserControl_member_schedule_detail.ascx" %>
<html>
  <head runat="server">
    <!-- $Id$ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_common_header_bar ID="UserControl_common_header_bar_control" runat="server" />
      <br />
      <p><asp:Literal ID="Literal_member_name" runat="server"></asp:Literal>'s assignments for <b><asp:Literal ID="Literal_which_month" runat="server"></asp:Literal></b> month are shown below.</p>
      <br />
      <uc1:UserControl_member_schedule_detail id="UserControl_member_schedule_detail_control" runat="server"></uc1:UserControl_member_schedule_detail>
      <hr size="1" />
      <small>The transmission of this message was triggered by <asp:Literal ID="Literal_publisher" runat="server"></asp:Literal>.</small>
    </form>
  </body>
</html>
