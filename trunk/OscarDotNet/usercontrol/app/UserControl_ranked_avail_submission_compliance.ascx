<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_ranked_avail_submission_compliance.ascx.cs" Inherits="UserControl_ranked_avail_submission_compliance.TWebUserControl_ranked_avail_submission_compliance" %>
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" width="100%" border="0">
        <tr bgcolor="#f5f5f5">
          <td>
            <p>
              <strong>Availability submission compliance</strong><br/>
              <em>(Citywide = </em><asp:Label ID="Label_overall" runat="server" Font-Italic="True"></asp:Label>&nbsp;%<em>)</em>
            </p>
            <p><small>This block shows the degree to which agency personnel submitted availability sheets by the most recent deadline.</small></p>
          </td>
        </tr>
        <tr>
          <td>
            <p>
              <asp:DataGrid ID="DataGrid_detail" runat="server" AutoGenerateColumns="False" UseAccessibleHeader="True" CellPadding="5" BorderColor="Gainsboro" BorderWidth="1px" Font-Size="X-Small">
                <Columns>
                  <asp:BoundColumn DataField="rank" HeaderText="Rank">
                    <ItemStyle Font-Italic="True" HorizontalAlign="Right"></ItemStyle>
                  </asp:BoundColumn>
                  <asp:BoundColumn DataField="agency" ReadOnly="True" HeaderText="Agency"></asp:BoundColumn>
                  <asp:BoundColumn DataField="value" ReadOnly="True" HeaderText="%" DataFormatString="{0:0}">
                    <ItemStyle Font-Bold="True" HorizontalAlign="Right"></ItemStyle>
                  </asp:BoundColumn>
                </Columns>
              </asp:DataGrid>
            </p>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
