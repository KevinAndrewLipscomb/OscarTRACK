<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_session_interrupted.ascx.cs" Inherits="UserControl_session_interrupted.TWebUserControl_session_interrupted"%>
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" border="0">
        <tr>
          <td bgcolor="#f5f5f5"><h1>Your session was interrupted.</h1></td>
        </tr>
        <tr>
          <td>
            <p>This can be caused by:</p>
              <ul>
                <li><p>Using your browser's <em>Back</em> button (<u>please only use controls provided by the web server</u>);</p></li>
                <li><p>Configuration changes on the host server;</p></li>
                <li><p>Inactivity;</p></li>
              </ul>
            <p>As a security and integrity precaution, you have been logged out.</p>
          </td>
        </tr>
        <tr>
          <td align="center">
            <p>Please</p>
            <p><ASP:HyperLink id="HyperLink_login" runat="server" font-bold="True" navigateurl="~/login.aspx" BackColor="Silver" Font-Size="XX-Large" Width="66%" style="padding:20px">LOG&nbsp;IN</ASP:HyperLink></p>
            <p>again to continue using the application</p>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
