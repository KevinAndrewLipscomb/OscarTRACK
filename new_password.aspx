<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="new_password.pas" AutoEventWireup="false" Inherits="new_password.TWebForm_new_password" %>
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
      <p>
        <ASP:Label id="Label_user_name" runat="server" font-bold="True" font-size="Large"></ASP:Label></p>
      <p>
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
            <tr>
              <td>
                <table cellspacing="0" cellpadding="5" border="0">
                    <tr>
                      <td bgcolor="#f5f5f5"><strong>New password</strong></td>
                    </tr>
                    <tr>
                      <td>A temporary <ASP:Label id="Label_application_name" runat="server"></ASP:Label>&nbsp;password has been sent to 
                <ASP:Label id="Label_email_address" runat="server" font-bold="True"></ASP:Label>.&nbsp; Please&nbsp;<ASP:HyperLink id="HyperLink_login" runat="server" navigateurl="login.aspx" font-bold="True">log in</ASP:HyperLink> again after you receive it.&nbsp; You will receive further instructions at that time.</td>
                    </tr>
                </table></td>
            </tr>
        </table></p>
      <p>
    <asp:placeholder id="PlaceHolder_postcontent" runat="server">
    </asp:placeholder></p>
     <sstchur:SmartScroller runat="server" /></form>
  </body>
</html>
