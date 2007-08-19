<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_serial_indicator_num_core_ops_members.pas" Inherits="UserControl_serial_indicator_num_core_ops_members.TWebUserControl_serial_indicator_num_core_ops_members"%>
<p>These control charts show the number of released members scheduled to staff ambulances.</p>
<p>
<ASP:DataGrid id="DataGrid_control_charts" runat="server" showheader="False" autogeneratecolumns="False" cellpadding="20" bordercolor="Silver" borderwidth="1px">
  <Columns>
	<ASP:TemplateColumn>
	  <ItemTemplate>
		<p><b><%# DataBinder.Eval(Container.DataItem, "designator") %></b></p>
		<p><img width="781" height="417" src='image/dynamic/serial_indicator_control_chart.aspx?indicator=core_ops_size&agency=<%# DataBinder.Eval(Container.DataItem, "id") %>&be_agency_applicable=<%# DataBinder.Eval(Container.DataItem, "be_agency_id_applicable") %>' /></p>
	  </ItemTemplate>
	</ASP:TemplateColumn>
  </Columns>
</ASP:DataGrid>
</p>
