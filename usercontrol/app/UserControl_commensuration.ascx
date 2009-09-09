<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_commensuration.ascx.cs" Inherits="UserControl_commensuration.TWebUserControl_commensuration"%>
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table cellspacing="0" cellpadding="5" border="0">
        <tr>
          <td valign="top">•</td>
          <td valign="top">This form will only be enabled from the 10th day through the last day of each month.</td>
        </tr>
        <tr>
          <td valign="top">•</td>
          <td valign="top">For each agency listed, enter the number of crew-shifts shown on the initial monthly schedule.</td>
        </tr>
        <tr>
          <td valign="top">•</td>
          <td valign="top">For complete crew-shifts, enter a whole number (ie, 60).</td>
        </tr>
        <tr>
          <td valign="top">•</td>
          <td valign="top">For partial crew-shifts, enter a real number (ie, 59.5).</td>
        </tr>
        <tr>
          <td valign="top">•</td>
          <td valign="top">The Monthly Core Ops Dashboard Report will indicate whether or not the Department Schedule Auditor has submitted this form.</td>
        </tr>
    </table>
    <h2>For <ASP:Label id="Label_month" runat="server" font-italic="True">month</ASP:Label>... 
    </h2>
    <p></p>
    <p>
      <ASP:DataGrid id="DataGrid_commensuration" runat="server" gridlines="None" cellpadding="5" autogeneratecolumns="False">
        <Columns>
          <asp:BoundColumn datafield="agency_id" readonly="True" headertext="ID" visible="False"></asp:BoundColumn>
          <asp:BoundColumn datafield="designator" readonly="True" headertext="Agency"></asp:BoundColumn>
          <asp:BoundColumn datafield="num_crew_shifts" readonly="True" headertext="Forecast">
            <ItemStyle horizontalalign="Right"></ItemStyle>
          </asp:BoundColumn>
          <asp:TemplateColumn headertext="Actual">
            <ItemTemplate>
              <ASP:TextBox id="TextBox_quantity" runat="server"></ASP:TextBox>
            </ItemTemplate>
          </asp:TemplateColumn>
          <asp:TemplateColumn>
            <ItemTemplate>
              <ASP:RequiredFieldValidator id="RequiredFieldValidator_quantity" runat="server" errormessage="Please enter a quantity." font-bold="True" display="Dynamic" controltovalidate="TextBox_quantity">!ERR!</ASP:RequiredFieldValidator>
              <ASP:RegularExpressionValidator id="RegularExpressionValidator_quantity" runat="server" errormessage="Please enter a valid quantity." font-bold="True" display="Dynamic" controltovalidate="TextBox_quantity" validationexpression="\d+(\.\d+)?">!ERR!</ASP:RegularExpressionValidator>
            </ItemTemplate>
          </asp:TemplateColumn>
        </Columns>
        <HeaderStyle horizontalalign="Center" font-bold="True"></HeaderStyle>
      </ASP:DataGrid>
    </p>
    <p>
      <ASP:Button id="Button_submit" runat="server" text="Submit" onclick="Button_submit_Click"></ASP:Button>&nbsp;&nbsp;&nbsp;&nbsp; 
    </p>
  </ContentTemplate>
</asp:UpdatePanel>
