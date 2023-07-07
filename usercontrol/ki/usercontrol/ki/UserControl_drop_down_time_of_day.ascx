<%@ Control language="c#" autoeventwireup="True" codebehind="UserControl_drop_down_time_of_day.ascx.cs" inherits="UserControl_drop_down_time_of_day.TWebUserControl_drop_down_time_of_day"%>
<ASP:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table cellspacing="0" cellpadding="0" border="0">
      <tr>
        <td nowrap="nowrap">
          <ASP:DropDownList id="DropDownList_hour" runat="server"></ASP:DropDownList>:<ASP:DropDownList id="DropDownList_minute" runat="server"></ASP:DropDownList>
          <ASP:Button id="Button_now" runat="server" text="Now" causesvalidation="False" onclick="Button_now_Click"></ASP:Button>
          <asp:Button ID="Button_clear" runat="server" Text="Clear" causesvalidation="False" OnClick="Button_clear_Click" Visible="False"></asp:Button>
        </td>
      </tr>
    </table>
  </ContentTemplate>
</ASP:UpdatePanel>
