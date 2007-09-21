<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_serial_indicator_length_of_service.pas" Inherits="UserControl_serial_indicator_length_of_service.TWebUserControl_serial_indicator_length_of_service"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
<div id="Div_print_area">
<uc1:UserControl_print_div id="UserControl_print_div" runat="server"></uc1:UserControl_print_div>
<p>These control charts show the median length of service of released core operations personnel, in years.&nbsp; For each data point, half of such members have given fewer years of service than indicated, half more.</p>
<p>
<ASP:DataGrid id="DataGrid_control_charts" runat="server" showheader="False" autogeneratecolumns="False" cellpadding="20" bordercolor="Silver" borderwidth="1px">
  <Columns>
	<ASP:TemplateColumn>
	  <ItemTemplate>
		<p><b><%# DataBinder.Eval(Container.DataItem, "designator") %></b></p>
		<p><img width="781" height="417" src='image/dynamic/serial_indicator_control_chart.aspx?indicator=median_length_of_service&agency=<%# DataBinder.Eval(Container.DataItem, "id") %>&be_agency_applicable=<%# DataBinder.Eval(Container.DataItem, "be_agency_id_applicable") %>' /></p>
	  </ItemTemplate>
	</ASP:TemplateColumn>
  </Columns>
</ASP:DataGrid>
</p>
</div>
