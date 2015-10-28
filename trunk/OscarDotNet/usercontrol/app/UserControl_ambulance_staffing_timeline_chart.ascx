<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_ambulance_staffing_timeline_chart.ascx.cs" Inherits="UserControl_ambulance_staffing_timeline_chart.TWebUserControl_ambulance_staffing_timeline_chart"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" border="0">
        <tr>
          <td bgcolor="#dcdcdc">This control disregards the above Agency and Release level filters.</td>
        </tr>
        <tr>
          <td>
            <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="2" autogeneratecolumns="False" Font-Size="Small">
              <Columns>
                <asp:ButtonColumn CommandName="Select" DataTextField="nominal_day">
                  <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Medium"/>
                  <ItemStyle HorizontalAlign="Right" />
                </asp:ButtonColumn>
                <asp:TemplateColumn><HeaderStyle Width="5px" /></asp:TemplateColumn>
                <asp:BoundColumn datafield="d0000" HeaderText="0&lt;br/&gt;6&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center" Font-Bold="true"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d0030" HeaderText="0&lt;br/&gt;6&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d0100" HeaderText="0&lt;br/&gt;7&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d0130" HeaderText="0&lt;br/&gt;7&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d0200" HeaderText="0&lt;br/&gt;8&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d0230" HeaderText="0&lt;br/&gt;8&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d0300" HeaderText="0&lt;br/&gt;9&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d0330" HeaderText="0&lt;br/&gt;9&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d0400" HeaderText="1&lt;br/&gt;0&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d0430" HeaderText="1&lt;br/&gt;0&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d0500" HeaderText="1&lt;br/&gt;1&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d0530" HeaderText="1&lt;br/&gt;1&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d0600" HeaderText="N&lt;br/&gt;O&lt;br/&gt;O&lt;br/&gt;N"><HeaderStyle HorizontalAlign="Center" Font-Bold="true"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d0630" HeaderText="1&lt;br/&gt;2&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d0700" HeaderText="1&lt;br/&gt;3&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d0730" HeaderText="1&lt;br/&gt;3&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d0800" HeaderText="1&lt;br/&gt;4&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d0830" HeaderText="1&lt;br/&gt;4&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d0900" HeaderText="1&lt;br/&gt;5&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d0930" HeaderText="1&lt;br/&gt;5&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d1000" HeaderText="1&lt;br/&gt;6&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d1030" HeaderText="1&lt;br/&gt;6&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d1100" HeaderText="1&lt;br/&gt;7&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="d1130" HeaderText="1&lt;br/&gt;7&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center" Font-Bold="true"/></asp:BoundColumn>
                <asp:TemplateColumn><HeaderStyle Width="5px"/></asp:TemplateColumn>
                <asp:BoundColumn datafield="n0000" HeaderText="1&lt;br/&gt;8&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center" Font-Bold="true"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n0030" HeaderText="1&lt;br/&gt;8&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n0100" HeaderText="1&lt;br/&gt;9&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n0130" HeaderText="1&lt;br/&gt;9&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n0200" HeaderText="2&lt;br/&gt;0&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n0230" HeaderText="2&lt;br/&gt;0&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n0300" HeaderText="2&lt;br/&gt;1&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n0330" HeaderText="2&lt;br/&gt;1&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n0400" HeaderText="2&lt;br/&gt;2&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n0430" HeaderText="2&lt;br/&gt;2&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n0500" HeaderText="2&lt;br/&gt;3&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n0530" HeaderText="2&lt;br/&gt;3&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n0600" HeaderText="M&lt;br/&gt;D&lt;br/&gt;N&lt;br/&gt;T"><HeaderStyle HorizontalAlign="Center" Font-Bold="true"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n0630" HeaderText="0&lt;br/&gt;0&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n0700" HeaderText="0&lt;br/&gt;1&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n0730" HeaderText="0&lt;br/&gt;1&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n0800" HeaderText="0&lt;br/&gt;2&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n0830" HeaderText="0&lt;br/&gt;2&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n0900" HeaderText="0&lt;br/&gt;3&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n0930" HeaderText="0&lt;br/&gt;3&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n1000" HeaderText="0&lt;br/&gt;4&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n1030" HeaderText="0&lt;br/&gt;4&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n1100" HeaderText="0&lt;br/&gt;5&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
                <asp:BoundColumn datafield="n1130" HeaderText="0&lt;br/&gt;5&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center" Font-Bold="true"/></asp:BoundColumn>
              </Columns>
              <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
            </asp:DataGrid>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
