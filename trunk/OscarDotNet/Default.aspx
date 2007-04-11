<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %>
<%@ Page language="c#" Debug="true" Codebehind="Default.pas" AutoEventWireup="false" Inherits="Default.TWebForm_Default" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
	<title id="Title" runat="server"></title>
      <!-- $Id$ -->
  </head>

  <body>
     <form runat="server">
      <asp:placeholder id="PlaceHolder_precontent" runat="server">
      </asp:placeholder>
<p>Welcome to 
        <ASP:Label id="Label_application_name" runat="server"></ASP:Label>!</p>
<p>Please <ASP:HyperLink
                       id="HyperLink_login" runat="server" font-bold="True" navigateurl="login.aspx">log in</ASP:HyperLink>.</p>
    <asp:placeholder id="PlaceHolder_postcontent" runat="server">
    </asp:placeholder>
     <p><sstchur:SmartScroller runat="server" /></p></form>
  </body>
</html>
