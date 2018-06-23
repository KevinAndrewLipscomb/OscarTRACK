<%@ Page language="c#" Debug="true" Codebehind="roles.aspx.cs" AutoEventWireup="True" Inherits="roles.TWebForm_roles" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<%@ Register TagPrefix="uc2" TagName="UserControl_role_help" Src="~/usercontrol/app/UserControl_role_help.ascx" %>
<!DOCTYPE html>
<html>
  <head runat="server">
    <title></title>
    <!-- $Id$ -->
    <link REL="StyleSheet" HREF="standard.css" TYPE="text/css" />
  </head>
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_common_header_bar id="UserControl_common_header_bar" runat="server"></uc1:UserControl_common_header_bar>
      <uc2:UserControl_role_help id="UserControl_role_help_control" runat="server"></uc2:UserControl_role_help>
    </form>
  </body>
</html>
