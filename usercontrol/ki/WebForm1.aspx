<!DOCTYPE html>
<%@ Page language="c#" codebehind="WebForm1.aspx.cs" AutoEventWireup="True" Inherits="WebForm1.TWebForm1" %>
<%@ Register src="usercontrol/ki/UserControl_about_by.ascx" tagname="UserControl_about_by" tagprefix="uc1" %>
<html>
  <head runat="server">
    <title></title>
    <link href="css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>
  <body bgcolor="white">
    <form runat="server">
    <p>
      The current time is:
      <asp:Label ID="Label_my_great_label" runat="server"></asp:Label>
      .</p>
    <p>
      &nbsp;</p>
    <uc1:UserControl_about_by ID="UserControl_about_by1" runat="server" />
    </form>
  </body>
</html>
