<%@ Page language="c#" codebehind="Default.aspx.cs" AutoEventWireup="True" Inherits="Default.TWebForm_Default" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<!DOCTYPE html>

<html>
  <head runat="server">
	<title></title>
      <!-- $Id$ -->
  </head>

  <body bgcolor="white">
     <form runat="server"><uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent><p>Welcome to 
        <ASP:Label id="Label_application_name" runat="server"></ASP:Label>!</p>
<p>Please <ASP:HyperLink
                       id="HyperLink_login" runat="server" font-bold="True" navigateurl="login.aspx">log in</ASP:HyperLink>.</p><uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent></form>
  </body>
</html>
