<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_serial_indicator_commensuration.pas" Inherits="UserControl_serial_indicator_commensuration.TWebUserControl_serial_indicator_commensuration"%>
<p>These control charts show the degree to which the agency produced a complete initial schedule.&nbsp; A schedule is deemed 100% complete when each member has been scheduled for the number of duties required according to the membership and leave statuses.</p>
<p>
<ASP:DataGrid id="DataGrid_control_charts" runat="server" showheader="False" autogeneratecolumns="False" cellpadding="20" bordercolor="Silver" borderwidth="1px">
  <Columns>
	<ASP:TemplateColumn>
	  <ItemTemplate>
		<p><b><%# DataBinder.Eval(Container.DataItem, "designator") %></b></p>
		<p><img width="781" height="417" src='image/dynamic/serial_indicator_control_chart.aspx?indicator=commensuration&agency=<%# DataBinder.Eval(Container.DataItem, "id") %>&be_agency_applicable=<%# DataBinder.Eval(Container.DataItem, "be_agency_id_applicable") %>' /></p>
	  </ItemTemplate>
	</ASP:TemplateColumn>
  </Columns>
</ASP:DataGrid>
</p>
