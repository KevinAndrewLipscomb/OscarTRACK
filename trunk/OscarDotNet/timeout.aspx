<%@ Page language="c#" Debug="true" Codebehind="timeout.pas" AutoEventWireup="false" Inherits="timeout.TWebForm_timeout" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
	<title id="Title" runat="server"></title>
      <!-- $Id$ -->
    <script type="text/javascript" src="js/gradient.js"></script>
  </head>

  <body>
     <form runat="server">
      <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
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
						<p>As a security precaution, you have been logged out.
					    </p>
                        <p>Please <ASP:HyperLink id="HyperLink_login" runat="server" font-bold="True" navigateurl="login.aspx">log in</ASP:HyperLink> again to continue using the application.
					  </p></td>
                    </tr>
                </table></td>
            </tr>
        </table>
      </p><uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent></form>
  </body>
</html>
