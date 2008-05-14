<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_serial_indicator_num_core_ops_members.pas" Inherits="UserControl_serial_indicator_num_core_ops_members.TWebUserControl_serial_indicator_num_core_ops_members"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
<div id="Div_print_area">
<uc1:UserControl_print_div id="UserControl_print_div" runat="server"></uc1:UserControl_print_div><p>These control charts show the number of released members scheduled to staff ambulances.</p>
<p>
<ASP:DataGrid id="DataGrid_control_charts" runat="server" showheader="False" autogeneratecolumns="False" cellpadding="20" bordercolor="Silver" borderwidth="1px">
  <Columns>
	<ASP:TemplateColumn>
	  <ItemTemplate>
		<p><b><%# DataBinder.Eval(Container.DataItem, "designator") %></b></p>
		<p><img width="781" height="417" src='../serial_indicator_control_chart.aspx?indicator=core_ops_size&agency=<%# DataBinder.Eval(Container.DataItem, "id") %>&be_agency_applicable=<%# DataBinder.Eval(Container.DataItem, "be_agency_id_applicable") %>' /></p>
	  </ItemTemplate>
	</ASP:TemplateColumn>
  </Columns>
</ASP:DataGrid>
</p>
</div>
