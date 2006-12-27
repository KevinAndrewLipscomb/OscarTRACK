<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="member_overview.pas" AutoEventWireup="false" Inherits="member_overview.TWebForm_member_overview"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
	<title id="Title" runat="server"></title>
	<!-- $Id$ -->
  </head>
  <body>
	<form runat="server">
	  <p><asp:placeholder id="PlaceHolder_precontent" runat="server"></asp:placeholder></p>
	  <p><small>[ 
		  <ASP:LinkButton id="LinkButton_logout" runat="server" causesvalidation="False">Logout</ASP:LinkButton>&nbsp;] [ 
		  Change your OSCAR
		<ASP:LinkButton id="LinkButton_change_password" runat="server">password</ASP:LinkButton>&nbsp;| <ASP:LinkButton id="LinkButton_change_email_address" runat="server">email address</ASP:LinkButton>&nbsp;]
	  </small></p>
	  <h1><ASP:Label id="Label_member_name" runat="server" font-bold="True"></ASP:Label></h1>
	  <h3>Account overview</h3>
	  <h3>
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
            <tr>
              <td>
                <table cellspacing="0" cellpadding="10" width="100%" border="0">
                    <tr>
                      <td bgcolor="#f5f5f5"><strong>Your member's OSCAR profile is:</strong></td>
                      <td><ASP:Label id="Label_profile_status" runat="server"></ASP:Label></td>
                      <td><ASP:LinkButton id="LinkButton_profile_action" runat="server" font-size="X-Small"></ASP:LinkButton></td>
                    </tr>
                </table></td>
            </tr>
        </table></h3>
	  <asp:placeholder id="PlaceHolder_postcontent" runat="server"></asp:placeholder>
    <sstchur:SmartScroller runat="server" /></form>
  </body>
</html>
