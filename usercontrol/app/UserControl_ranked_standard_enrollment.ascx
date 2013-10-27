<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_ranked_standard_enrollment.ascx.cs" Inherits="UserControl_ranked_standard_enrollment.TWebUserControl_ranked_standard_enrollment"%>
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" width="100%" border="0">
        <tr bgcolor="#f5f5f5">
          <td>
                <p><strong>Core operations commitment factor</strong><br>
				  <em>(Citywide =&nbsp;</em><ASP:Label id="Label_total" runat="server" font-italic="True"></ASP:Label><em>)</em></p><p><small>This block shows the percentage of released core operations personnel who the agency has enrolled at one of the standard levels (Regular, Life, Tenured).&nbsp; The lower this factor, the more personnel the agency has enrolled at liberal levels (Associate, Reduced, Staff, ALS Intern, College, Atypical).&nbsp; Standard enrollees commit more duty shifts per month than liberal enrollees.</small></p>
          </td>
        </tr>
        <tr>
          <td><p><ASP:DataGrid id="DataGrid_detail" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="5" bordercolor="Gainsboro" borderwidth="1px" font-size="X-Small">
                    <Columns>
                      <ASP:BoundColumn datafield="rank" headertext="Rank">
                        <ItemStyle font-italic="True" horizontalalign="Right"></ItemStyle>
                      </ASP:BoundColumn>
                      <ASP:BoundColumn datafield="agency" readonly="True" headertext="Agency"></ASP:BoundColumn>
                      <ASP:BoundColumn visible="False" datafield="num_standard_enrollments" readonly="True"></ASP:BoundColumn>
                      <ASP:BoundColumn visible="False" datafield="num_core_ops_members" readonly="True"></ASP:BoundColumn>
                      <ASP:BoundColumn datafield="factor" readonly="True" headertext="%" dataformatstring="{0:0%}">
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
