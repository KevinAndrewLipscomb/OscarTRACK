<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_serial_indicator_avail_submission_compliance.ascx.cs" Inherits="UserControl_serial_indicator_avail_submission_compliance.TWebUserControl_serial_indicator_avail_submission_compliance"%>
<p>These control charts show the degree to which agency personnel submitted availability sheets by the most recent deadline.</p>
<p>
<ASP:DataGrid id="DataGrid_control_charts" runat="server" showheader="False" autogeneratecolumns="False" cellpadding="20" bordercolor="Silver" borderwidth="1px">
  <Columns>
	<ASP:TemplateColumn>
	  <ItemTemplate>
		<p><b><%# DataBinder.Eval(Container.DataItem, "designator") %></b></p>
		<p><img width="781" height="417" src='../serial_indicator_control_chart.aspx?indicator=avail_submission_compliance&agency=<%# DataBinder.Eval(Container.DataItem, "id") %>&be_agency_applicable=<%# DataBinder.Eval(Container.DataItem, "be_agency_id_applicable") %>' alt="avail_submission_compliance" /></p>
	  </ItemTemplate>
	</ASP:TemplateColumn>
  </Columns>
</ASP:DataGrid>
</p>
