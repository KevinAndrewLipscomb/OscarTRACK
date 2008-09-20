<%@ Page language="c#" Debug="true" Codebehind="exception.pas" AutoEventWireup="false" Inherits="exception.TWebForm_exception" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
  <head>
	<title id="Title" runat="server"></title>
	  <!-- $Id$ -->
  </head>

  <body bgcolor="white">
	 <form runat="server"><uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent><table id="Table_db_down" runat="server" bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
		<tr>
		  <td>
			<table cellspacing="0" cellpadding="10" border="0">
			  <tr>
				<td bgcolor="#f5f5f5"><h1><em>Sorry...</em></h1></td>
			  </tr>
			  <tr>
				<td>
				  <h3>The application's database subsystem is unavailable.</h3>
				  <p>This is a temporary condition.&nbsp; Please try again later.</p>
				</td>
			  </tr>
			</table>
		  </td>
		</tr>
	  </table>
		<table id="Table_oops" runat="server" bordercolor="#e00000" cellspacing="0" cellpadding="0" border="1">
			<tr>
			  <td>
				<table cellspacing="0" cellpadding="10" border="0">
					<tr>
					  <td bgcolor="#f5f5f5"><h1><em><font color="#ff0000">Oops...</font></em></h1></td>
					</tr>
					<tr>
					  <td>
<h3>The application has encountered an unexpected problem and cannot continue normally.</h3>
<p>The Application Administrator has been notified by pager and email.</p>
	  <p>It would be a tremendous help if you could describe what you were doing when this problem occurred:</p>
	  <blockquote dir="ltr" style="MARGIN-RIGHT: 0px">
<p><textarea id="TextArea_user_comment" rows="5" cols="60" runat="server"></textarea></p>
<p><ASP:Button id="Button_submit" runat="server" text="Submit and return to Login page"></ASP:Button></p>
	  </blockquote>
					  </td>
					</tr>
				</table></td>
			</tr>
		</table><uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent></form>
  </body>
</html>
