<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_ambulance_staffing_timeline_chart.ascx.cs" Inherits="UserControl_ambulance_staffing_timeline_chart.TWebUserControl_ambulance_staffing_timeline_chart"%>
<%@ Register Src="~/usercontrol/app/UserControl_strength_balancing_opportunities.ascx" TagPrefix="uc1" TagName="UserControl_strength_balancing_opportunities" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="2" autogeneratecolumns="False" Font-Size="Small">
  <Columns>
    <asp:ButtonColumn CommandName="Select" DataTextField="nominal_day">
      <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Medium"/>
      <ItemStyle HorizontalAlign="Right" />
    </asp:ButtonColumn>
    <asp:TemplateColumn><HeaderStyle Width="5px" /></asp:TemplateColumn>
    <asp:BoundColumn datafield="d0000" HeaderText="&lt;br/&gt;0&lt;br/&gt;6&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center" Font-Bold="true"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d0030" HeaderText="G&lt;br/&gt;0&lt;br/&gt;6&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d0100" HeaderText="E&lt;br/&gt;0&lt;br/&gt;7&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d0130" HeaderText="O&lt;br/&gt;0&lt;br/&gt;7&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d0200" HeaderText="&lt;br/&gt;0&lt;br/&gt;8&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d0230" HeaderText="&lt;br/&gt;0&lt;br/&gt;8&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d0300" HeaderText="&lt;br/&gt;0&lt;br/&gt;9&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d0330" HeaderText="&lt;br/&gt;0&lt;br/&gt;9&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d0400" HeaderText="&lt;br/&gt;1&lt;br/&gt;0&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d0430" HeaderText="&lt;br/&gt;1&lt;br/&gt;0&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d0500" HeaderText="&lt;br/&gt;1&lt;br/&gt;1&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d0530" HeaderText="&lt;br/&gt;1&lt;br/&gt;1&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d0600" HeaderText="&lt;br/&gt;N&lt;br/&gt;O&lt;br/&gt;O&lt;br/&gt;N"><HeaderStyle HorizontalAlign="Center" Font-Bold="true"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d0630" HeaderText="&lt;br/&gt;1&lt;br/&gt;2&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d0700" HeaderText="&lt;br/&gt;1&lt;br/&gt;3&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d0730" HeaderText="&lt;br/&gt;1&lt;br/&gt;3&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d0800" HeaderText="P&lt;br/&gt;1&lt;br/&gt;4&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d0830" HeaderText="E&lt;br/&gt;1&lt;br/&gt;4&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d0900" HeaderText="A&lt;br/&gt;1&lt;br/&gt;5&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d0930" HeaderText="K&lt;br/&gt;1&lt;br/&gt;5&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d1000" HeaderText="&lt;br/&gt;1&lt;br/&gt;6&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d1030" HeaderText="&lt;br/&gt;1&lt;br/&gt;6&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d1100" HeaderText="&lt;br/&gt;1&lt;br/&gt;7&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="d1130" HeaderText="&lt;br/&gt;1&lt;br/&gt;7&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center" Font-Bold="true"/></asp:BoundColumn>
    <asp:TemplateColumn Visible="false">
      <ItemStyle BackColor="PaleGreen"/>
      <ItemTemplate>
        <asp:RadioButton ID="RadioButton_d_heavily_staffed" runat="server" AutoPostBack="True" OnCheckedChanged="RadioButton_heavily_staffed_CheckedChanged" nominal_day='<%# Eval("nominal_day","{0:yyyy-MM-dd}") %>' shift_name="DAY"/>
      </ItemTemplate>
    </asp:TemplateColumn>
    <asp:TemplateColumn Visible="false">
      <ItemStyle BackColor="LightSalmon"/>
      <ItemTemplate>
        <asp:RadioButton ID="RadioButton_d_short_staffed" runat="server" AutoPostBack="True" OnCheckedChanged="RadioButton_short_staffed_CheckedChanged" nominal_day='<%# Eval("nominal_day","{0:yyyy-MM-dd}") %>' shift_name="DAY"/>
      </ItemTemplate>
    </asp:TemplateColumn>
    <asp:TemplateColumn><HeaderStyle Width="5px"/></asp:TemplateColumn>
    <asp:TemplateColumn Visible="false">
      <ItemStyle BackColor="LightSalmon"/>
      <ItemTemplate>
        <asp:RadioButton ID="RadioButton_n_short_staffed" runat="server" AutoPostBack="True" OnCheckedChanged="RadioButton_short_staffed_CheckedChanged" nominal_day='<%# Eval("nominal_day","{0:yyyy-MM-dd}") %>' shift_name="NIGHT"/>
      </ItemTemplate>
    </asp:TemplateColumn>
    <asp:TemplateColumn Visible="false">
      <ItemStyle BackColor="PaleGreen"/>
      <ItemTemplate>
        <asp:RadioButton ID="RadioButton_n_heavily_staffed" runat="server" AutoPostBack="True" OnCheckedChanged="RadioButton_heavily_staffed_CheckedChanged" nominal_day='<%# Eval("nominal_day","{0:yyyy-MM-dd}") %>' shift_name="NIGHT"/>
      </ItemTemplate>
    </asp:TemplateColumn>
    <asp:BoundColumn datafield="n0000" HeaderText="&lt;br/&gt;1&lt;br/&gt;8&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center" Font-Bold="true"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n0030" HeaderText="&lt;br/&gt;1&lt;br/&gt;8&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n0100" HeaderText="&lt;br/&gt;1&lt;br/&gt;9&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n0130" HeaderText="&lt;br/&gt;1&lt;br/&gt;9&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n0200" HeaderText="&lt;br/&gt;2&lt;br/&gt;0&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n0230" HeaderText="&lt;br/&gt;2&lt;br/&gt;0&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n0300" HeaderText="&lt;br/&gt;2&lt;br/&gt;1&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n0330" HeaderText="&lt;br/&gt;2&lt;br/&gt;1&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n0400" HeaderText="&lt;br/&gt;2&lt;br/&gt;2&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n0430" HeaderText="O&lt;br/&gt;2&lt;br/&gt;2&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n0500" HeaderText="F&lt;br/&gt;2&lt;br/&gt;3&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n0530" HeaderText="F&lt;br/&gt;2&lt;br/&gt;3&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n0600" HeaderText="&lt;br/&gt;M&lt;br/&gt;D&lt;br/&gt;N&lt;br/&gt;T"><HeaderStyle HorizontalAlign="Center" Font-Bold="true"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n0630" HeaderText="P&lt;br/&gt;0&lt;br/&gt;0&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n0700" HeaderText="E&lt;br/&gt;0&lt;br/&gt;1&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n0730" HeaderText="A&lt;br/&gt;0&lt;br/&gt;1&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n0800" HeaderText="K&lt;br/&gt;0&lt;br/&gt;2&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n0830" HeaderText="&lt;br/&gt;0&lt;br/&gt;2&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n0900" HeaderText="&lt;br/&gt;0&lt;br/&gt;3&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n0930" HeaderText="&lt;br/&gt;0&lt;br/&gt;3&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n1000" HeaderText="G&lt;br/&gt;0&lt;br/&gt;4&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n1030" HeaderText="E&lt;br/&gt;0&lt;br/&gt;4&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n1100" HeaderText="O&lt;br/&gt;0&lt;br/&gt;5&lt;br/&gt;0&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center"/></asp:BoundColumn>
    <asp:BoundColumn datafield="n1130" HeaderText="&lt;br/&gt;0&lt;br/&gt;5&lt;br/&gt;3&lt;br/&gt;0"><HeaderStyle HorizontalAlign="Center" Font-Bold="true"/></asp:BoundColumn>
  </Columns>
  <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
</asp:DataGrid>
<br/>
<asp:Panel ID="Panel_balance_opportunities" runat="server" visible="false">
  <center><uc1:UserControl_strength_balancing_opportunities runat="server" id="UserControl_strength_balancing_opportunities_control" /></center>
</asp:Panel>
