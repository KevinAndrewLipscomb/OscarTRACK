<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_serial_indicator_vehicles_up_and_current.ascx.cs" Inherits="UserControl_serial_indicator_vehicles_up_and_current.TWebUserControl_serial_indicator_vehicles_up_and_current"%>
<p>These control charts show the median length of service of released core operations personnel, in years.&nbsp; For each data point, half of such members have given fewer years of service than indicated, half more.</p>
<p>
<ASP:DataGrid id="DataGrid_control_charts" runat="server" showheader="False" autogeneratecolumns="False" cellpadding="20" bordercolor="Silver" borderwidth="1px">
  <Columns>
	<ASP:TemplateColumn>
	  <ItemTemplate>
		<p><b><%# DataBinder.Eval(Container.DataItem, "designator") %></b></p>
		<p><img width="781" height="417" src='../serial_indicator_control_chart.aspx?indicator=monthly_vehicles_up_and_current&agency=<%# DataBinder.Eval(Container.DataItem, "id") %>&be_agency_applicable=<%# DataBinder.Eval(Container.DataItem, "be_agency_id_applicable") %>' /></p>
	  </ItemTemplate>
	</ASP:TemplateColumn>
  </Columns>
</ASP:DataGrid>
</p>
