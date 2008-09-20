<%@ Page language="c#" Debug="true" Codebehind="roles.pas" AutoEventWireup="false" Inherits="roles.TWebForm_roles" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="uc2" TagName="UserControl_role_help" Src="~/usercontrol/app/UserControl_role_help.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <title id="Title" runat="server"></title>
    <!-- $Id$ -->
    <link REL="StyleSheet" HREF="standard.css" TYPE="text/css" />
  </head>
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
      <uc2:UserControl_role_help id="UserControl_role_help1" runat="server"></uc2:UserControl_role_help>
      <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
    </form>
  </body>
</html>
