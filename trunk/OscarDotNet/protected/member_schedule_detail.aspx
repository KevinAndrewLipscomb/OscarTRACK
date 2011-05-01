<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->
<%@ Page language="c#" Debug="true" Codebehind="member_schedule_detail.aspx.cs" AutoEventWireup="True" Inherits="member_schedule_detail.TWebForm_member_schedule_detail" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_member_schedule_detail" Src="~/usercontrol/app/UserControl_member_schedule_detail.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_update_progress_blocker" Src="~/usercontrol/app/UserControl_update_progress_blocker.ascx" %>
<html>
  <head runat="server">
    <!-- $Id$ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
      <asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
        <ContentTemplate>
          <uc1:UserControl_member_schedule_detail id="UserControl_member_schedule_detail_control" runat="server"></uc1:UserControl_member_schedule_detail>
        </ContentTemplate>
      </asp:UpdatePanel>
      <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
      <uc1:UserControl_update_progress_blocker id="UserControl_update_progress_blocker_control" runat="server"></uc1:UserControl_update_progress_blocker>
    </form>
  </body>
</html>
