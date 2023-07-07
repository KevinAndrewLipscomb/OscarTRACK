<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_drop_down_datetime.ascx.cs" Inherits="UserControl_drop_down_datetime.TWebUserControl_drop_down_datetime"%>
<%@ Register src="UserControl_drop_down_date.ascx" tagname="UserControl_drop_down_date" tagprefix="uc1" %>
<%@ Register src="UserControl_drop_down_time_of_day.ascx" tagname="UserControl_drop_down_time_of_day" tagprefix="uc2" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table cellspacing="0" cellpadding="3" border="0">
  <tr>
    <td><uc1:UserControl_drop_down_date ID="UserControl_drop_down_date_control" runat="server" /></td>
    <td><uc2:UserControl_drop_down_time_of_day ID="UserControl_drop_down_time_of_day_control" runat="server" /></td>
  </tr>
</table>
