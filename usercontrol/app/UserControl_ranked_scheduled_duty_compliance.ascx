<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_ranked_scheduled_duty_compliance.ascx.cs" Inherits="UserControl_ranked_scheduled_duty_compliance.TWebUserControl_ranked_scheduled_duty_compliance"%>
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" width="100%" border="0">
        <tr bgcolor="#f5f5f5">
          <td>
            <p><strong>Scheduled duty compliance</strong><br>
            <em>(Citywide = </em><ASP:Label id="Label_overall" runat="server" font-italic="True"></ASP:Label><em>)</em></p>
            <p>
              <small>
                This block shows the approximate degree to which members ran their duties as scheduled during the prior calendar month, without qualifying as "tapouts".&nbsp; This metric is affected by the way schedule changes are recorded, and by the
                agency's associated crew-shifts forecast as recorded at the beginning of the same month.
              </small>
            </p>
          </td>
        </tr>
        <tr>
          <td>
            <p>
              <ASP:DataGrid id="DataGrid_detail" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="5" bordercolor="Gainsboro" borderwidth="1px" font-size="X-Small">
              <Columns>
                <ASP:BoundColumn datafield="rank" headertext="Rank">
                  <ItemStyle font-italic="True" horizontalalign="Right"></ItemStyle>
                </ASP:BoundColumn>
                <ASP:BoundColumn datafield="agency" readonly="True" headertext="Agency"></ASP:BoundColumn>
                <ASP:BoundColumn datafield="value" readonly="True" headertext="%" dataformatstring="{0:0}">
                  <ItemStyle font-bold="True" horizontalalign="Right"></ItemStyle>
                </ASP:BoundColumn>
              </Columns>
              </ASP:DataGrid>
              <ASP:Label id="Label_no_data" runat="server" font-bold="True">DATA NOT AVAILABLE</ASP:Label>
            </p>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
