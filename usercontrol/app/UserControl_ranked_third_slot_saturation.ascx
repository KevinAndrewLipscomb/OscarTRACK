<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_ranked_third_slot_saturation.ascx.cs" Inherits="UserControl_ranked_third_slot_saturation.TWebUserControl_ranked_third_slot_saturation"%>
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" width="100%" border="0">
        <tr bgcolor="#f5f5f5">
          <td>
                <p><strong>&quot;Third slot&quot; saturation factor</strong><br>
				  <em>(Citywide =&nbsp;</em><ASP:Label id="Label_total" runat="server" font-italic="True"></ASP:Label><em>)</em></p><p><small>This block shows the degree to which ambulance crews are expected include a Trainee or EMT Intern.</small></p>
          </td>
        </tr>
        <tr>
          <td><p><ASP:DataGrid id="DataGrid_detail" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="5" bordercolor="Gainsboro" borderwidth="1px" font-size="X-Small">
                    <Columns>
                      <ASP:BoundColumn datafield="rank" headertext="Rank">
                        <ItemStyle font-italic="True" horizontalalign="Right"></ItemStyle>
                      </ASP:BoundColumn>
                      <ASP:BoundColumn datafield="agency" readonly="True" headertext="Agency"></ASP:BoundColumn>
                      <ASP:BoundColumn visible="False" datafield="num_third_shifts" readonly="True"></ASP:BoundColumn>
                      <ASP:BoundColumn visible="False" datafield="num_crew_shifts" readonly="True"></ASP:BoundColumn>
                      <ASP:BoundColumn datafield="third_saturation_factor" readonly="True" headertext="%" dataformatstring="{0:0%}">
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
