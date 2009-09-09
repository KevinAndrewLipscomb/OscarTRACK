<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_behind_the_scenes_activity.ascx.cs" Inherits="UserControl_behind_the_scenes_activity.TWebUserControl_behind_the_scenes_activity"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<p><strong>In this reporting period, <asp:Label id="Label_application_name" runat="server"></asp:Label>&nbsp;processed...
</strong></p>
<blockquote>
  <asp:DataGrid id="DataGrid_for_cycle" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False" showfooter="True">
    <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
    <FooterStyle  backcolor="WhiteSmoke"></FooterStyle>
    <Columns>
      <asp:BoundColumn datafield="name" visible="False"></asp:BoundColumn>
      <asp:BoundColumn datafield="tally_of_events_for_cycle" headertext="Event">
        <ItemStyle horizontalalign="Right"></ItemStyle>
        <FooterStyle horizontalalign="Right" font-bold="True"></FooterStyle>
      </asp:BoundColumn>
      <asp:BoundColumn datafield="activity_description" footertext="TOTAL">
        <HeaderStyle horizontalalign="Left"></HeaderStyle>
        <FooterStyle font-bold="True"></FooterStyle>
      </asp:BoundColumn>
      <asp:BoundColumn headertext="       "></asp:BoundColumn>
      <asp:BoundColumn datafield="tally_of_messages_for_cycle" headertext="Notifications delivered to stakeholders">
        <ItemStyle horizontalalign="Left"></ItemStyle>
        <FooterStyle font-bold="True"></FooterStyle>
      </asp:BoundColumn>
    </Columns>
  </asp:DataGrid>
</blockquote>
<p><strong>Since the inception of Behind-The-Scenes Activity reporting (16 March 2009), <asp:Label id="Label_application_name_2" runat="server"></asp:Label>&nbsp;has processed...
</strong></p>
<blockquote>
  <asp:DataGrid id="DataGrid_for_lifetime" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False" showfooter="True">
    <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
    <FooterStyle  backcolor="WhiteSmoke"></FooterStyle>
    <Columns>
      <asp:BoundColumn datafield="name" visible="False"></asp:BoundColumn>
      <asp:BoundColumn datafield="tally_of_events_for_lifetime" headertext="Event">
        <ItemStyle horizontalalign="Right"></ItemStyle>
        <FooterStyle horizontalalign="Right" font-bold="True"></FooterStyle>
      </asp:BoundColumn>
      <asp:BoundColumn datafield="activity_description" footertext="TOTAL">
        <HeaderStyle horizontalalign="Left"></HeaderStyle>
        <FooterStyle font-bold="True"></FooterStyle>
      </asp:BoundColumn>
      <asp:BoundColumn headertext="       "></asp:BoundColumn>
      <asp:BoundColumn datafield="tally_of_messages_for_lifetime" headertext="Notifications delivered to stakeholders">
        <ItemStyle horizontalalign="Left"></ItemStyle>
        <FooterStyle font-bold="True"></FooterStyle>
      </asp:BoundColumn>
    </Columns>
  </asp:DataGrid>
</blockquote>
