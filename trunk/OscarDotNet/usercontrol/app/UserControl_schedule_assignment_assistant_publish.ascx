<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_schedule_assignment_assistant_publish.ascx.cs"
  Inherits="UserControl_schedule_assignment_assistant_publish.TWebUserControl_schedule_assignment_assistant_publish" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table cellpadding="5" cellspacing="0">
  <tr>
    <td>
      <asp:CheckBox ID="CheckBox_full" runat="server" Enabled="False" Font-Bold="True" Text="FULL SCHEDULE" />
      <blockquote>
        <table cellpadding="2" cellspacing="0">
          <tr>
            <td nowrap="nowrap" width="1%"><asp:RadioButton ID="RadioButton_scalable" runat="server" Checked="True" GroupName="format" Text="Scalable format" Enabled="False" /></td>
            <td>
              &nbsp;
              <asp:HyperLink ID="HyperLink_preview_print_scalable" runat="server" Text="&lt;IMG src=&quot;~/protected/image/print16_h.png&quot; alt=&quot;(preview/print)&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" Target="_blank" ToolTip="Preview/print"></asp:HyperLink>
            </td>
          </tr>
          <tr>
            <td colspan="2">
            <blockquote>
                <small>
                  All days are listed vertically, with adjacent columns for each shift.&nbsp; Light staffing is rendered efficiently.&nbsp; Heavy staffing is rendered on multiple pages, but no data is cropped.&nbsp; This is the format used in the Proposal 
                  control.
                </small>
            </blockquote>
            </td>
          </tr>
          <tr>
            <td nowrap="nowrap" width="1%"><asp:RadioButton ID="RadioButton_month_at_a_glance" runat="server" GroupName="format" Text="Month-at-a-glance format" Enabled="False" /></td>
            <td>
              &nbsp;
              <asp:HyperLink ID="HyperLink_preview_print_month_at_a_glance" runat="server" Text="&lt;IMG src=&quot;~/protected/image/print16_h.png&quot; alt=&quot;(preview/print)&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" Target="_blank" ToolTip="Preview/print" Enabled="false"></asp:HyperLink>
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <blockquote>
                <small>
                  A commonly-recognized format that may give good results in certain situations.&nbsp; Heavy staffing requires tiny font size, or some data may be cropped.
                </small>
              </blockquote>
            </td>
          </tr>
        </table>
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
          For any given month...
          <ul>
            <li><p>The first time you publish, these go to all of your current core operations members.</p></li>
            <li><p>All other times you publish, these only go to your members who have been affected by changes.</p></li>
          </ul>
        </small>
      </blockquote>
    </td>
    <td></td>
  </tr>
</table>
<asp:Button ID="Button_publish" runat="server" Font-Bold="True" onclick="Button_publish_Click" Text="PUBLISH"/>