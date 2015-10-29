<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_strength_chart.ascx.cs" Inherits="UserControl_strength_chart.TWebUserControl_strength_chart"%>
<%@ Register Src="~/usercontrol/app/UserControl_ambulance_staffing_timeline_chart.ascx" TagPrefix="uc1" TagName="UserControl_ambulance_staffing_timeline_chart" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" width="100%" border="1">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" width="100%" border="0">
        <tr bgcolor="#f5f5f5">
          <td><small>This control disregards the above Agency and Release level filters.</small></td>
        </tr>
        <tr>
          <td>
            <uc1:UserControl_ambulance_staffing_timeline_chart runat="server" ID="T" />
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
