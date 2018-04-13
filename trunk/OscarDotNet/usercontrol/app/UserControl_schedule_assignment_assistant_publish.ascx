<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_schedule_assignment_assistant_publish.ascx.cs"
  Inherits="UserControl_schedule_assignment_assistant_publish.TWebUserControl_schedule_assignment_assistant_publish" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table cellpadding="5" cellspacing="0">
  <tr>
    <td>
      <asp:CheckBox ID="CheckBox_full" runat="server" Enabled="False" Font-Bold="True" Text="FULL SCHEDULE" />
      <blockquote>
        <asp:RadioButton ID="RadioButton_scalable" runat="server" Checked="True" GroupName="format" Text="Scalable format" Enabled="False" />
        <blockquote>
          <small>
            All days are listed vertically, with adjacent columns for each shift.&nbsp; Light staffing is rendered efficiently.&nbsp; Heavy staffing is rendered on multiple pages, but no data is cropped.&nbsp; This is the format used in the Watchbill control.
          </small>
        </blockquote>
        <asp:RadioButton ID="RadioButton_month_at_a_glance" runat="server" GroupName="format" Text="Month-at-a-glance format" Enabled="False" />
        <blockquote>
          <small>
            A commonly-recognized format that may give good results in certain situations.&nbsp; Heavy staffing requires tiny font size, or some data may be cropped.
          </small>
        </blockquote>
      </blockquote>
    </td>
    <td nowrap="nowrap" valign="top">
      <asp:CustomValidator ID="CustomValidator_full_schedule_format" runat="server" ErrorMessage="Please select a format for the full schedule." Font-Bold="True" onservervalidate="CustomValidator_full_schedule_format_ServerValidate">!ERR!</asp:CustomValidator>
    </td>
  </tr>
  <tr>
    <td>
      <asp:CheckBox ID="CheckBox_incremental" runat="server" Checked="True" Enabled="False" Font-Bold="True" Text="PERSONALIZED DUTY ASSIGNMENTS" />
      <blockquote>
        <small>
          For any given month, these go to members in your Area Of Responsibility (AOR), which includes:
          <ul>
            <li>Core operations members of your agency;</li>
            <li>Any members of the system assigned to duties at your station or your satellite stations;</li>
            <li>Any members of the system affected by changes you've made.</li>
          </ul>
          Also note that:
          <ul>
            <li>The first time you publish, these go to your entire AOR.&nbsp; <strong>This may take about half a second per member.</strong></li>
            <li>All other times you publish, these only go to the subset of your AOR affected by changes.</li>
            <li>This control <i>disregards</i> the above Agency and Release level filters.</li>
          </ul>
        </small>
      </blockquote>
    </td>
    <td></td>
  </tr>
</table>
<asp:Button ID="Button_publish" runat="server" Font-Bold="True" onclick="Button_publish_Click" Text="PUBLISH" Enabled="False"/>&nbsp;&nbsp;<small><asp:Label ID="Label_check_agency_filter" runat="server" Text="Note that the <i><b>Agency=All</b></i> filter publishes to all agencies; <i><b>Agency=EMS</b></i> does not include rescue squads or special teams." ForeColor="#FF9900" Visible="False"></asp:Label></small>