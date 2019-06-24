<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_tapouts.ascx.cs" Inherits="UserControl_tapouts.TWebUserControl_tapouts"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" border="0">
        <tr>
          <td bgcolor="#dcdcdc">
            <table cellspacing="0" cellpadding="0" border="0" width="100%">
              <tr>
                <td>
                  <strong>Filter:&nbsp;<asp:DropDownList id="DropDownList_filter" runat="server" autopostback="True"></asp:DropDownList></strong>
                </td>
                <td align="right">
                  <asp:Literal ID="Literal_num_tapouts" runat="server"></asp:Literal> tapouts
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
        <tr>
          <td>
            <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False" allowsorting="True">
              <Columns>
                <asp:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/open_document16_h.png&quot; alt=&quot;Detail&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Select" visible="false"></asp:ButtonColumn>
                <asp:BoundColumn datafield="id" visible="false"/>
                <asp:BoundColumn datafield="agency" headertext="Agency" sortexpression="provider.agency_id%, provider.cad_num, expected_start" visible="false">
                  <ItemStyle horizontalalign="Center"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn datafield="provider_id" visible="false"/>
                <asp:BoundColumn datafield="provider" headertext="Provider" sortexpression="provider.cad_num%, expected_start" >
                  <ItemStyle Font-Bold="True" />
                </asp:BoundColumn>
                <asp:BoundColumn datafield="expected_start" headertext="Expected logon time" sortexpression="expected_start%, provider.cad_num">
                  <ItemStyle horizontalalign="Center"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn datafield="comment" headertext="Comment" />
                <asp:BoundColumn datafield="hours_warning" headertext="Hours of warning" sortexpression="hours_warning%, provider.cad_num, expected_start">
                  <ItemStyle horizontalalign="Center"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn datafield="actor_id" visible="false"/>
                <asp:BoundColumn datafield="actor" headertext="Documented by" sortexpression="actor.last_name%, actor.first_name, sal_last.id" />
                <asp:BoundColumn datafield="actor_timestamp" visible="false"/>
              </Columns>
              <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
            </asp:DataGrid>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
