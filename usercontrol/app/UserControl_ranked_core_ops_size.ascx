<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_ranked_core_ops_size.ascx.cs" Inherits="UserControl_ranked_core_ops_size.TWebUserControl_ranked_core_ops_size"%>
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" width="100%" border="0">
        <tr bgcolor="#f5f5f5">
          <td>
                <p><strong>Number of CORE OPS members</strong><br>
				  <em>(Citywide =&nbsp;</em><ASP:Label id="Label_total" runat="server" font-italic="True"></ASP:Label><em>)</em></p><p><small>This block shows the number of released members who are scheduled to staff ambulances.</small></p>
          </td>
        </tr>
        <tr>
          <td><p><ASP:DataGrid id="DataGrid_detail" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="5" bordercolor="Gainsboro" borderwidth="1px" font-size="X-Small">
                    <Columns>
                      <ASP:BoundColumn datafield="rank" headertext="Rank">
                        <ItemStyle font-italic="True" horizontalalign="Right"></ItemStyle>
                      </ASP:BoundColumn>
                      <ASP:BoundColumn datafield="agency" readonly="True" headertext="Agency"></ASP:BoundColumn>
                      <ASP:BoundColumn datafield="count" readonly="True" headertext="#">
                        <ItemStyle font-bold="True" horizontalalign="Right"></ItemStyle>
                      </ASP:BoundColumn>
                    </Columns>
</ASP:DataGrid>
</p>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
