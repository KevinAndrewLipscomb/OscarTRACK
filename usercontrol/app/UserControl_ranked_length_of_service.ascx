<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_ranked_length_of_service.pas" Inherits="UserControl_ranked_length_of_service.TWebUserControl_ranked_length_of_service"%>
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" width="100%" border="0">
        <tr bgcolor="#f5f5f5">
          <td>
				<p><strong>Median&nbsp;years of service</strong><br>
				  <em>(Citywide = </em><ASP:Label id="Label_overall" runat="server" font-italic="True"></ASP:Label><em>)</em></p>
				<p><small>This block shows the median length of service of released core operations personnel, in years.&nbsp; Half of such members have given fewer years of service than indicated, half more.</small></p>
          </td>
        </tr>
        <tr>
          <td><p><ASP:DataGrid id="DataGrid_detail" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="5" bordercolor="Gainsboro" borderwidth="1px" font-size="X-Small">
                    <Columns>
                      <ASP:BoundColumn datafield="rank" headertext="Rank">
                        <ItemStyle font-italic="True" horizontalalign="Right"></ItemStyle>
                      </ASP:BoundColumn>
                      <ASP:BoundColumn datafield="agency" readonly="True" headertext="Agency"></ASP:BoundColumn>
                      <ASP:BoundColumn datafield="m" readonly="True" dataformatstring="{0:0.00}">
                        <HeaderStyle font-italic="True"></HeaderStyle>
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
				<asp:datagrid id="DataGrid_special" runat="server" autogeneratecolumns="False" cellpadding="0" gridlines="None" showheader="False" visible="False">
  <Columns>
    <ASP:BoundColumn datafield="agency" readonly="True"></ASP:BoundColumn>
    <ASP:BoundColumn datafield="length_of_service" readonly="True"></ASP:BoundColumn>
  </Columns>
				</asp:datagrid>
