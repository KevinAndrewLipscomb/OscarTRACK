<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_serial_indicator_length_of_service.ascx.cs" Inherits="UserControl_serial_indicator_length_of_service.TWebUserControl_serial_indicator_length_of_service"%>
<p>These control charts show the median length of service of released core operations personnel, in years.&nbsp; For each data point, half of such members have given fewer years of service than indicated, half more.</p>
<table>
  <tr>
    <td nowrap="nowrap">
      <b>Width in months:</b>
      <asp:TextBox ID="TextBox_width_in_months" runat="server" Columns="3" Text="27"></asp:TextBox>
      <asp:Button ID="Button_go" runat="server" Text="Go" OnClick="Button_go_Click"/>
      <asp:Button ID="Button_max" runat="server" CausesValidation="False" OnClick="Button_max_Click" Text="Max" UseSubmitBehavior="False" />
      <asp:Button ID="Button_default" runat="server" CausesValidation="False" OnClick="Button_default_Click" Text="Default" UseSubmitBehavior="False" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator_width_in_months" runat="server" ControlToValidate="TextBox_width_in_months" ErrorMessage="Please specify a Width in months." Font-Bold="True">&lt;ERR!</asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator_width_in_months" runat="server" ControlToValidate="TextBox_width_in_months" ErrorMessage="Please enter numeric values only for Width in months." Font-Bold="True" ValidationExpression="\d+">&lt;ERR!</asp:RegularExpressionValidator>
      <asp:RangeValidator ID="RangeValidator_width_in_months" runat="server" ControlToValidate="TextBox_width_in_months" ErrorMessage="The Width in months must currently be between 2 and #." Font-Bold="True" MinimumValue="2" MaximumValue="27" Type="Integer">&lt;ERR!</asp:RangeValidator>
    </td>
  </tr>
</table>
<p>
<ASP:DataGrid id="DataGrid_control_charts" runat="server" showheader="False" autogeneratecolumns="False" cellpadding="20" bordercolor="Silver" borderwidth="1px" OnItemDataBound="DataGrid_control_charts_ItemDataBound">
  <Columns>
	<ASP:TemplateColumn>
	  <ItemTemplate>
		<p><b><%# DataBinder.Eval(Container.DataItem, "designator") %></b></p>
		<p><asp:Image id="Image_control" runat="server" width="781" height="417" ImageUrl=<%# string.Format("~/serial_indicator_control_chart.aspx?indicator=median_length_of_service&agency={0}&be_agency_applicable={1}",DataBinder.Eval(Container.DataItem, "id"),DataBinder.Eval(Container.DataItem, "be_agency_id_applicable")) %> AlternateText="median_length_of_service"/></p>
	  </ItemTemplate>
	</ASP:TemplateColumn>
  </Columns>
</ASP:DataGrid>
</p>
