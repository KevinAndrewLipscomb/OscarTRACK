<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_serial_indicator_third_slot_saturation.ascx.cs" Inherits="UserControl_serial_indicator_third_slot_saturation.TWebUserControl_serial_indicator_third_slot_saturation"%>
<p>These control charts show the degree to which the agency's ambulance crew-shifts were expected to be occupied by a Trainee or EMT Intern.</p>
<p>
<ASP:DataGrid id="DataGrid_control_charts" runat="server" showheader="False" autogeneratecolumns="False" cellpadding="20" bordercolor="Silver" borderwidth="1px">
  <Columns>
	<ASP:TemplateColumn>
	  <ItemTemplate>
		<p><b><%# DataBinder.Eval(Container.DataItem, "designator") %></b></p>
		<p><img width="781" height="417" src='../serial_indicator_control_chart.aspx?indicator=third_slot_saturation&agency=<%# DataBinder.Eval(Container.DataItem, "id") %>&be_agency_applicable=<%# DataBinder.Eval(Container.DataItem, "be_agency_id_applicable") %>' /></p>
	  </ItemTemplate>
	</ASP:TemplateColumn>
  </Columns>
</ASP:DataGrid>
</p>
