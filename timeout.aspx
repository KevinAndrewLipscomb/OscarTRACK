<%@ Page language="c#" Debug="true" Codebehind="timeout.pas" AutoEventWireup="false" Inherits="timeout.TWebForm_timeout" %>
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
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
            <tr>
              <td>
                <table cellspacing="0" cellpadding="10" border="0">
                    <tr>
					  <td bgcolor="#f5f5f5"><h1>Your session has expired.</h1></td>
                    </tr>
                    <tr>
					  <td>
                        <p>As a security precaution, OSCAR has logged you out.
					    </p>
                        <p>Please <ASP:HyperLink id="HyperLink_login" runat="server" font-bold="True" navigateurl="login.aspx">log in</ASP:HyperLink> again to continue using the application.
					  </p></td>
                    </tr>
                </table></td>
            </tr>
        </table>
      </p>

	<asp:placeholder id="PlaceHolder_postcontent" runat="server">
    </asp:placeholder>
     </form>
  </body>
</html>
