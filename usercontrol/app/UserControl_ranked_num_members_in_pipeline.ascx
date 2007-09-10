<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_ranked_num_members_in_pipeline.pas" Inherits="UserControl_ranked_num_members_in_pipeline.TWebUserControl_ranked_num_members_in_pipeline"%>
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" width="100%" border="0">
        <tr bgcolor="#f5f5f5">
          <td>
                <p><strong>Number of MEMBERS IN PIPELINE</strong><br>
		<em>(Citywide =&nbsp;</em><ASP:Label id="Label_total" runat="server" font-italic="True"></ASP:Label><em>)</em></p><p><small>This block shows the number of recruits and trainees.</small></p>
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
