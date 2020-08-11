<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserControl_test_exceptions.ascx.cs" Inherits="UserControl_test_exceptions.TWebUserControl_test_exceptions" %>
<br />
<table border="1" cellpadding="10" cellspacing="0">
  <tr>
    <td>
      <asp:Button ID="Button_client_disconnected" runat="server" Text="Go" OnClick="Button_client_disconnected_Click" /></td>
    <td>The client disconnected.</td>
  </tr>
  <tr>
    <td>
      <asp:Button ID="Button_dangerous_request" runat="server" Text="Go" OnClick="Button_dangerous_request_Click" /></td>
    <td>A potentially dangerous Request.* value was detected from the client</td>
  </tr>
  <tr>
    <td>
      <asp:Button ID="Button_connection_to_mysql_server" runat="server" Text="Go" OnClick="Button_connection_to_mysql_server_Click" /></td>
    <td>Connection.*to MySQL server</td>
  </tr>
  <tr>
    <td>
      <asp:Button ID="Button_connection_open_failed_too_many_connections" runat="server" Text="Go" OnClick="Button_connection_open_failed_too_many_connections_Click" /></td>
    <td>Connection open failed. Too many connections</td>
  </tr>
  <tr>
    <td>
      <asp:Button ID="Button_deadlock" runat="server" Text="Go" OnClick="Button_deadlock_Click" /></td>
    <td>ERROR 1213 (40001): Deadlock found when trying to get lock; try restarting transaction</td>
  </tr>
  <tr>
    <td>
      <asp:Button ID="Button_other_mysql" runat="server" Text="Go" OnClick="Button_other_mysql_Click" /></td>
    <td>Other MySQL</td>
  </tr>
  <tr>
    <td>
      <asp:Button ID="Button_other" runat="server" Text="Go" OnClick="Button_other_Click" /></td>
    <td>Other</td>
  </tr>
</table>
