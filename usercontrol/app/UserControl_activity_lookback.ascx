<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_activity_lookback.ascx.cs" Inherits="UserControl_activity_lookback.TWebUserControl_activity_lookback"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
      <tr>
        <td>
          <table cellspacing="0" cellpadding="10" border="0">
            <tr>
              <td>
                <small>
                  <p>Best practices</p>
                  <ul>
                    <li><p>This data is provided solely to support Virginia Beach City Council's Tax Levy on Personal Property, Section 16.</p></li>
                    <li><p>Duty hour and obligation values are based on business rules that only apply to this specific tax relief program.</p></li>
                  </ul>
                </small>
              </td>
            </tr>
            <tr>
              <td bgcolor="#dcdcdc">
                <table cellspacing="0" cellpadding="0" border="0">
                  <tr>
                    <td>
                      <strong>Extent:</strong>&nbsp;
                      <asp:DropDownList id="DropDownList_extent" runat="server" autopostback="True" OnSelectedIndexChanged="DropDownList_extent_SelectedIndexChanged">
                        <asp:ListItem Selected="True">12</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                      </asp:DropDownList>
                      months
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                      <strong><asp:Literal ID="Literal_num_members" runat="server"></asp:Literal>&nbsp;members</strong>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td align="center">
                      <small><small>Recommended for PPT relief as follows:</small></small>
                      <br />
                      <span style="background-color:palegreen">&nbsp;<asp:Literal ID="Literal_num_full" runat="server"></asp:Literal>&nbsp;FULL&nbsp;</span>
                      <span style="background-color:yellow">&nbsp;<asp:Literal ID="Literal_num_prorated" runat="server"></asp:Literal>&nbsp;PRORATED&nbsp;</span>
                      <span style="background-color:white">&nbsp;<asp:Literal ID="Literal_num_none" runat="server"></asp:Literal>&nbsp;none&nbsp;</span>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                      <asp:Button ID="Button_export" runat="server" Text="Export to spreadsheet" OnClick="Button_export_Click" style="padding:5px"/></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
            <tr>
              <td>
                <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="2" autogeneratecolumns="False" AllowSorting="true" Font-Size="XX-Small">
                  <Columns>
                    <asp:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/open_document16_h.png&quot; alt=&quot;Detail&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Select"></asp:ButtonColumn>
                    <asp:BoundColumn datafield="member_id" visible="false"></asp:BoundColumn>
                    <asp:BoundColumn datafield="cad_num" headertext="CAD&amp;nbsp;#" sortexpression="cad_num%"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="last_name" headertext="Last name" sortexpression="last_name%,first_name,cad_num"><HeaderStyle VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="first_name" headertext="First name" sortexpression="first_name%,last_name,cad_num"><HeaderStyle VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="combined_duty_hours" headertext="COMBINED duty hours" sortexpression="CAST(combined_duty_hours as DECIMAL)%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Font-Bold="true"/><ItemStyle Font-Bold="true" HorizontalAlign="Center" /></asp:BoundColumn>
                    <asp:BoundColumn datafield="combined_base_obligation" headertext="COMBINED base obligation" sortexpression="CAST(combined_base_obligation as DECIMAL)%,CAST(combined_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Font-Bold="true"/><ItemStyle Font-Bold="true" HorizontalAlign="Center" /></asp:BoundColumn>
                    <asp:BoundColumn datafield="combined_pct_of_base" headertext="% COMBINED base obligation" sortexpression="CAST(combined_pct_of_base as DECIMAL)%,CAST(combined_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Font-Bold="true"/><ItemStyle Font-Bold="true" HorizontalAlign="Center" /></asp:BoundColumn>
                    <asp:TemplateColumn HeaderText="Recommended PPT relief" SortExpression="tax_relief_level%,last_name,first_name,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Font-Bold="true"/><ItemStyle Font-Bold="true" HorizontalAlign="Center" /><ItemTemplate></ItemTemplate></asp:TemplateColumn>
                    <asp:BoundColumn datafield="month_12_ago_duty_hours" headertext="MMM duty hours" sortexpression="CAST(month_12_ago_duty_hours as DECIMAL)%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Center" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_12_ago_enrollment" headertext="MMM enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Right" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_12_ago_base_obligation" headertext="MMM base obligation" sortexpression="CAST(month_12_ago_base_obligation as DECIMAL)%,CAST(month_12_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Center" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_12_ago_pct_of_base" headertext="% MMM base obligation" sortexpression="CAST(month_12_ago_pct_of_base as DECIMAL)%,CAST(month_12_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Center" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_11_ago_duty_hours" headertext="MMM duty hours" sortexpression="CAST(month_11_ago_duty_hours as DECIMAL)%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Center" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_11_ago_enrollment" headertext="MMM enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Right" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_11_ago_base_obligation" headertext="MMM base obligation" sortexpression="CAST(month_11_ago_base_obligation as DECIMAL)%,CAST(month_11_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Center" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_11_ago_pct_of_base" headertext="% MMM base obligation" sortexpression="CAST(month_11_ago_pct_of_base as DECIMAL)%,CAST(month_11_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Center" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_10_ago_duty_hours" headertext="MMM duty hours" sortexpression="CAST(month_10_ago_duty_hours as DECIMAL)%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Center" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_10_ago_enrollment" headertext="MMM enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Right" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_10_ago_base_obligation" headertext="MMM base obligation" sortexpression="CAST(month_10_ago_base_obligation as DECIMAL)%,CAST(month_10_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Center" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_10_ago_pct_of_base" headertext="% MMM base obligation" sortexpression="CAST(month_10_ago_pct_of_base as DECIMAL)%,CAST(month_10_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Center" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_9_ago_duty_hours" headertext="MMM duty hours" sortexpression="CAST(month_9_ago_duty_hours as DECIMAL)%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Center" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_9_ago_enrollment" headertext="MMM enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Right" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_9_ago_base_obligation" headertext="MMM base obligation" sortexpression="CAST(month_9_ago_base_obligation as DECIMAL)%,CAST(month_9_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Center" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_9_ago_pct_of_base" headertext="% MMM base obligation" sortexpression="CAST(month_9_ago_pct_of_base as DECIMAL)%,CAST(month_9_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Center" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_8_ago_duty_hours" headertext="MMM duty hours" sortexpression="CAST(month_8_ago_duty_hours as DECIMAL)%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Center" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_8_ago_enrollment" headertext="MMM enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Right" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_8_ago_base_obligation" headertext="MMM base obligation" sortexpression="CAST(month_8_ago_base_obligation as DECIMAL)%,CAST(month_8_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Center" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_8_ago_pct_of_base" headertext="% MMM base obligation" sortexpression="CAST(month_8_ago_pct_of_base as DECIMAL)%,CAST(month_8_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Center" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_7_ago_duty_hours" headertext="MMM duty hours" sortexpression="CAST(month_7_ago_duty_hours as DECIMAL)%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Center" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_7_ago_enrollment" headertext="MMM enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Right" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_7_ago_base_obligation" headertext="MMM base obligation" sortexpression="CAST(month_7_ago_base_obligation as DECIMAL)%,CAST(month_7_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Center" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_7_ago_pct_of_base" headertext="% MMM base obligation" sortexpression="CAST(month_7_ago_pct_of_base as DECIMAL)%,CAST(month_7_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Center" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_6_ago_duty_hours" headertext="MMM duty hours" sortexpression="CAST(month_6_ago_duty_hours as DECIMAL)%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Center" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_6_ago_enrollment" headertext="MMM enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Right" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_6_ago_base_obligation" headertext="MMM base obligation" sortexpression="CAST(month_6_ago_base_obligation as DECIMAL)%,CAST(month_6_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Center" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_6_ago_pct_of_base" headertext="% MMM base obligation" sortexpression="CAST(month_6_ago_pct_of_base as DECIMAL)%,CAST(month_6_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Center" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_5_ago_duty_hours" headertext="MMM duty hours" sortexpression="CAST(month_5_ago_duty_hours as DECIMAL)%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Center" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_5_ago_enrollment" headertext="MMM enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Right" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_5_ago_base_obligation" headertext="MMM base obligation" sortexpression="CAST(month_5_ago_base_obligation as DECIMAL)%,CAST(month_5_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Center" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_5_ago_pct_of_base" headertext="% MMM base obligation" sortexpression="CAST(month_5_ago_pct_of_base as DECIMAL)%,CAST(month_5_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Center" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_4_ago_duty_hours" headertext="MMM duty hours" sortexpression="CAST(month_4_ago_duty_hours as DECIMAL)%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Center" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_4_ago_enrollment" headertext="MMM enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Right" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_4_ago_base_obligation" headertext="MMM base obligation" sortexpression="CAST(month_4_ago_base_obligation as DECIMAL)%,CAST(month_4_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Center" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_4_ago_pct_of_base" headertext="% MMM base obligation" sortexpression="CAST(month_4_ago_pct_of_base as DECIMAL)%,CAST(month_4_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Center" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_3_ago_duty_hours" headertext="MMM duty hours" sortexpression="CAST(month_3_ago_duty_hours as DECIMAL)%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Center" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_3_ago_enrollment" headertext="MMM enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Right" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_3_ago_base_obligation" headertext="MMM base obligation" sortexpression="CAST(month_3_ago_base_obligation as DECIMAL)%,CAST(month_3_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Center" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_3_ago_pct_of_base" headertext="% MMM base obligation" sortexpression="CAST(month_3_ago_pct_of_base as DECIMAL)%,CAST(month_3_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Center" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_2_ago_duty_hours" headertext="MMM duty hours" sortexpression="CAST(month_2_ago_duty_hours as DECIMAL)%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Center" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_2_ago_enrollment" headertext="MMM enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Right" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_2_ago_base_obligation" headertext="MMM base obligation" sortexpression="CAST(month_2_ago_base_obligation as DECIMAL)%,CAST(month_2_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Center" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_2_ago_pct_of_base" headertext="% MMM base obligation" sortexpression="CAST(month_2_ago_pct_of_base as DECIMAL)%,CAST(month_2_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="wheat"/><ItemStyle HorizontalAlign="Center" BackColor="wheat"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_1_ago_duty_hours" headertext="MMM duty hours" sortexpression="CAST(month_1_ago_duty_hours as DECIMAL)%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Center" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_1_ago_enrollment" headertext="MMM enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Right" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_1_ago_base_obligation" headertext="MMM base obligation" sortexpression="CAST(month_1_ago_base_obligation as DECIMAL)%,CAST(month_1_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Center" BackColor="lightsteelblue"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="month_1_ago_pct_of_base" headertext="% MMM base obligation" sortexpression="CAST(month_1_ago_pct_of_base as DECIMAL)%,CAST(month_1_ago_duty_hours as DECIMAL),cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" BackColor="lightsteelblue"/><ItemStyle HorizontalAlign="Center" BackColor="lightsteelblue"/></asp:BoundColumn>
                  </Columns>
                  <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                </asp:DataGrid>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>
