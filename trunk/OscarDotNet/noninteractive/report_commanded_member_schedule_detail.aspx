<!DOCTYPE html>
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->
<%@ Page language="c#" codebehind="report_commanded_member_schedule_detail.aspx.cs" AutoEventWireup="True" Inherits="report_commanded_member_schedule_detail.TWebForm_report_commanded_member_schedule_detail" %>
<%@ Register src="../usercontrol/app/UserControl_common_header_bar.ascx" tagname="UserControl_common_header_bar" tagprefix="uc1" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_member_schedule_detail" Src="~/usercontrol/app/UserControl_member_schedule_detail.ascx" %>
<%@ Register Src="~/usercontrol/app/UserControl_member_icalendar.ascx" TagPrefix="uc1" TagName="UserControl_member_icalendar" %>

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
      <p>
        <asp:Literal ID="Literal_member_name" runat="server"></asp:Literal>'s assignments for <b><asp:Literal ID="Literal_which_month" runat="server"></asp:Literal></b> month are shown below.&nbsp; If this message does not display neatly, log into
        <asp:HyperLink ID="HyperLink_web_site" runat="server" Font-Bold="True"/> and click the "My assignments" tab.
      </p>
      <table id="Table_consider_auto_calendaring" runat="server" cellpadding="5" cellspacing="0" bgcolor="khaki" border="1" bordercolor="gainsboro">
        <tr><td>Tired of manually entering your assignments into your online calendaring system?&nbsp; Log in, open the "My assignments" tab, scroll down, and read about <b>Auto-calendaring</b>!</td></tr>
      </table>
      <br />
      <uc1:UserControl_member_schedule_detail id="UserControl_member_schedule_detail_control" runat="server"></uc1:UserControl_member_schedule_detail>
      <p><small>The transmission of this message was triggered by <asp:Literal ID="Literal_publisher" runat="server"></asp:Literal> at <asp:Literal ID="Literal_time_triggered" runat="server"></asp:Literal>.</small></p>
      <uc1:UserControl_member_icalendar runat="server" ID="UserControl_member_icalendar_control" />
    </form>
  </body>
</html>
