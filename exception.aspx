<%@ Page Language="c#" Debug="true" CodeBehind="exception.aspx.cs" AutoEventWireup="True" Inherits="exception.TWebForm_exception" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head runat="server">
    <!-- $Id$ -->
    <title></title>
    <link href="css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_precontent ID="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
      <table id="Table_db_down" runat="server" bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" visible="false">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" border="0">
              <tr><td bgcolor="#f5f5f5"><h1><em>Sorry...</em></h1></td></tr>
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
      <table id="Table_deadlock" runat="server" bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" visible="false">
        <tr>
          <td valign="top">
            <table cellspacing="0" cellpadding="10" border="0">
              <tr><td bgcolor="#f5f5f5"><h1><em>Deadlock!</em></h1></td></tr>
              <tr>
                <td>
                  <h3>The application's database subsystem had to abort your operation to relieve a deadlock.</h3>
                  <p>You and another user (or process) tried to access the same server data at the same time in an incompatible way.</p>
                  <p>Please close and re-open your browser, log back in, and try again.</p>
                </td>
              </tr>
            </table>
          </td>
          <td>
            <asp:Image ID="Image_deadlock" runat="server" AlternateText="Gridlock (a kind of deadlock)" ImageAlign="Right" Height="236px" ImageUrl="~/image/deadlock.png" ToolTip="Gridlock (a kind of deadlock)" Width="286px" />
          </td>
        </tr>
      </table>
      <table id="Table_oops" runat="server" bordercolor="#e00000" cellspacing="0" cellpadding="0" border="2">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" border="0">
              <tr><td bgcolor="#f5f5f5"><h1><em><font color="#ff0000">Oops...</font></em></h1></td></tr>
              <tr>
                <td>
                  <h3>The application has encountered an unexpected problem and cannot continue normally.</h3>
                  <p>The Application Administrator has been notified by pager and email.</p>
                  <p>It would be a tremendous help if you could describe what you were doing when this problem occurred:</p>
                  <blockquote dir="ltr" style="margin-right: 0px">
                    <p><textarea id="TextArea_user_comment" rows="5" cols="60" runat="server"></textarea></p>
                    <p><asp:Button ID="Button_submit" runat="server" Text="Submit and return to Login page" OnClick="Button_submit_Click"></asp:Button></p>
                  </blockquote>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <uc1:UserControl_postcontent ID="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
    </form>
  </body>
</html>
