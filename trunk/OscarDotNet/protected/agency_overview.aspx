<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="agency_overview.pas" AutoEventWireup="false" Inherits="agency_overview.TWebForm_agency_overview" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
	<title id="Title" runat="server"></title>
	<!-- $Id$ -->
  </head>

  <body>
     <form runat="server">
      <p>
      <asp:placeholder id="PlaceHolder_precontent" runat="server">
      </asp:placeholder></p>
      <p><small>[ 
		  <ASP:LinkButton id="LinkButton_logout" runat="server" causesvalidation="False">Logout</ASP:LinkButton>&nbsp;] [ Change your
		<asp:LinkButton id="LinkButton_change_password" runat="server">password</asp:LinkButton>
		|
		<asp:LinkButton id="LinkButton_change_email_address" runat="server">email address</asp:LinkButton>&nbsp;]
	  </small></p>
<p>
		<ASP:Label id="Label_agency_name" runat="server" font-bold="True" font-size="Large"></ASP:Label>&nbsp;<ASP:Label id="Label_literal_agency" runat="server" font-bold="True" font-size="Large">Agency</ASP:Label></p>
<p></p>
    <asp:placeholder id="PlaceHolder_postcontent" runat="server">
    </asp:placeholder>
     <sstchur:SmartScroller runat="server" /></form>
  </body>
</html>
