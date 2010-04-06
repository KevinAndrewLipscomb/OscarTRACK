<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_serial_indicator_fleet_tracking_participation.ascx.cs" Inherits="UserControl_serial_indicator_fleet_tracking_participation.TWebUserControl_serial_indicator_fleet_tracking_participation"%>
<p>These control charts show the degree to which agency personnel took each of a month's crew-shifts as an opportunity to make a qualifying status update to a vehicle.</p>
<p>
<ASP:DataGrid id="DataGrid_control_charts" runat="server" showheader="False" autogeneratecolumns="False" cellpadding="20" bordercolor="Silver" borderwidth="1px">
  <Columns>
	<ASP:TemplateColumn>
	  <ItemTemplate>
		<p><b><%# DataBinder.Eval(Container.DataItem, "designator") %></b></p>
		<p><img width="781" height="417" src='../serial_indicator_control_chart.aspx?indicator=fleet_tracking_participation&agency=<%# DataBinder.Eval(Container.DataItem, "id") %>&be_agency_applicable=<%# DataBinder.Eval(Container.DataItem, "be_agency_id_applicable") %>' /></p>
	  </ItemTemplate>
	</ASP:TemplateColumn>
  </Columns>
</ASP:DataGrid>
</p>
