<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_ranked_crew_shifts_forecast.pas" Inherits="UserControl_ranked_crew_shifts_forecast.TWebUserControl_ranked_crew_shifts_forecast"%>
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" width="100%" border="0">
        <tr bgcolor="#f5f5f5">
          <td>
                <p><strong>Number of crew-shifts forecast:&nbsp; <ASP:Label id="Label_total" runat="server" font-bold="True"></ASP:Label></strong></p><p><small>This block shows the number of ambulance crew-shifts that it should be possible to supply.</small></p>
          </td>
        </tr>
        <tr>
          <td><p><ASP:DataGrid id="DataGrid_detail" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="5" bordercolor="Gainsboro" borderwidth="1px" font-size="X-Small">
                    <Columns>
                      <ASP:BoundColumn datafield="rank" headertext="Rank">
                        <ItemStyle font-italic="True" horizontalalign="Right"></ItemStyle>
                      </ASP:BoundColumn>
                      <ASP:BoundColumn datafield="agency" readonly="True" headertext="Agency"></ASP:BoundColumn>
                      <ASP:BoundColumn datafield="num_crew_shifts" readonly="True" headertext="#" dataformatstring="{0:0.0}">
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
