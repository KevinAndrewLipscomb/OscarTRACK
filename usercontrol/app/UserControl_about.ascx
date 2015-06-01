<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_about.ascx.cs" Inherits="UserControl_about.TWebUserControl_about"%>
<%@ Register TagPrefix="uc2" TagName="UserControl_about_by" Src="~/usercontrol/ki/UserControl_about_by.ascx" %>
<%@ Register TagPrefix="uc3" TagName="UserControl_about_tools" Src="~/usercontrol/ki/UserControl_about_tools.ascx" %>
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" width="100%" border="1">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" width="100%" border="0">
        <tr bgcolor="#f5f5f5">
          <td>
            <strong>About <ASP:Label id="Label_application_name" runat="server"></ASP:Label>
            </strong>
          </td>
        </tr>
        <tr>
          <td>
            <uc2:UserControl_about_by id="UserControl_about_by_control" runat="server"></uc2:UserControl_about_by>
            <p>Prepared for the volunteer component of the City of Virginia Beach's Emergency Medical Services System, including:</p>
            <ul>
              <li>Virginia Beach Department of EMS </li>
              <li>Council of Virginia Beach Volunteer Rescue Squads, Inc. </li>
              <li>All the squads, teams, and staff that make up the strongest volunteer-centric 911 agency in the world!</li>
            </ul>
            <uc3:UserControl_about_tools id="UserControl_about_tools_control" runat="server"></uc3:UserControl_about_tools>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
