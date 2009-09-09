<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_ranked_commensuration.ascx.cs" Inherits="UserControl_ranked_commensuration.TWebUserControl_ranked_commensuration"%>
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" width="100%" border="0">
        <tr bgcolor="#f5f5f5">
          <td>
				<p><strong>Initial schedule completion</strong><br>
				  <em>(Citywide = </em><ASP:Label id="Label_overall" runat="server" font-italic="True"></ASP:Label><em>)</em></p>
				<p><small>This block shows the degree to which the agency produced a complete initial schedule.&nbsp; A schedule is deemed 100% complete when each member has been scheduled for the number of duties required according to the membership and leave statuses.</small></p>
          </td>
        </tr>
        <tr>
          <td><p><ASP:DataGrid id="DataGrid_detail" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="5" bordercolor="Gainsboro" borderwidth="1px" font-size="X-Small">
  <Columns>
    <ASP:BoundColumn datafield="rank" headertext="Rank">
      <ItemStyle font-italic="True" horizontalalign="Right"></ItemStyle>
    </ASP:BoundColumn>
    <ASP:BoundColumn datafield="agency" readonly="True" headertext="Agency"></ASP:BoundColumn>
    <ASP:BoundColumn datafield="value" readonly="True" headertext="%" dataformatstring="{0:0}">
      <ItemStyle font-bold="True" horizontalalign="Right"></ItemStyle>
    </ASP:BoundColumn>
  </Columns>
</ASP:DataGrid><ASP:Label id="Label_no_data" runat="server" font-bold="True" font-size="Larger">DATA NOT PROVIDED BY DEPARTMENT SCHEDULE AUDITOR</ASP:Label>
</p>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
