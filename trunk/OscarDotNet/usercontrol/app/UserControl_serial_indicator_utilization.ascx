<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_serial_indicator_utilization.pas" Inherits="UserControl_serial_indicator_utilization.TWebUserControl_serial_indicator_utilization"%>
<p>These control charts show the degree to which released core operations personnel were meeting their baseline duty requirements.&nbsp; The lower the data point, the more personnel were granted partial or full leaves-of-absence.</p>
<p>
<ASP:DataGrid id="DataGrid_control_charts" runat="server" showheader="False" autogeneratecolumns="False" cellpadding="20" bordercolor="Silver" borderwidth="1px">
  <Columns>
	<ASP:TemplateColumn>
	  <ItemTemplate>
		<p><b><%# DataBinder.Eval(Container.DataItem, "designator") %></b></p>
		<p><img width="781" height="417" src='../serial_indicator_control_chart.aspx?indicator=utilization&agency=<%# DataBinder.Eval(Container.DataItem, "id") %>&be_agency_applicable=<%# DataBinder.Eval(Container.DataItem, "be_agency_id_applicable") %>' /></p>
	  </ItemTemplate>
	</ASP:TemplateColumn>
  </Columns>
</ASP:DataGrid>
</p>
