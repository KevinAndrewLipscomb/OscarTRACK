<!DOCTYPE html>
<%@ Page language="c#" codebehind="donation_ack_email.aspx.cs" AutoEventWireup="True" Inherits="donation_ack_email.TWebForm_donation_ack_email" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Register Src="~/usercontrol/app/UserControl_donation_ack_email.ascx" TagPrefix="uc1" TagName="UserControl_donation_ack_email" %>

<html>
  <head runat="server">
    <!-- $Id$ -->
    <title></title>
    <link rel="StyleSheet" href="../css/standard.css" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_donation_ack_email runat="server" id="UserControl_donation_ack_email_control" />
    </form>
  </body>
</html>
