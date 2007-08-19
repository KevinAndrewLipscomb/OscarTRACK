<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_serial_indicator_standard_enrollment.pas" Inherits="UserControl_serial_indicator_standard_enrollment.TWebUserControl_serial_indicator_standard_enrollment"%>
<p>These control charts show the percentage of released core operations personnel who the agency enrolled at one of the standard levels (Regular, Life, Tenured).&nbsp; The lower the data point, the more personnel the agency enrolled at liberal levels (Associate, Reduced, Atypical).&nbsp; Standard enrollees commit more duty shifts per month than liberal enrollees.</p>
<p>
<ASP:DataGrid id="DataGrid_control_charts" runat="server" showheader="False" autogeneratecolumns="False" cellpadding="20" bordercolor="Silver" borderwidth="1px">
  <Columns>
	<ASP:TemplateColumn>
	  <ItemTemplate>
		<p><b><%# DataBinder.Eval(Container.DataItem, "designator") %></b></p>
		<p><img width="781" height="417" src='image/dynamic/serial_indicator_control_chart.aspx?indicator=standard_enrollment&agency=<%# DataBinder.Eval(Container.DataItem, "id") %>&be_agency_applicable=<%# DataBinder.Eval(Container.DataItem, "be_agency_id_applicable") %>' /></p>
	  </ItemTemplate>
	</ASP:TemplateColumn>
  </Columns>
</ASP:DataGrid>
</p>
