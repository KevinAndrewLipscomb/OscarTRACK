<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_uniform_mart.ascx.cs" Inherits="UserControl_uniform_mart.TWebUserControl_uniform_mart"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
      <tr>
        <td>
          <table cellspacing="0" cellpadding="10" border="0">
            <tr>
              <td bgcolor="#dcdcdc">
                <table cellspacing="0" cellpadding="5" border="0" width="100%">
                  <tr>
                    <td><strong>Filters:</strong></td>
                    <td>
                      Rank&group<asp:DropDownList id="DropDownList_filter" runat="server" autopostback="True"></asp:DropDownList>
                    </td>
                    <td align="right"><asp:Literal ID="Literal_num_items" runat="server"></asp:Literal> items</td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
            <tr>
              <td>
                <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False" allowsorting="True">
                  <Columns>
                    <asp:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/open_document16_h.png&quot; alt=&quot;Detail&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Select"></asp:ButtonColumn>
                    <asp:BoundColumn datafield="id" Visible="false"></asp:BoundColumn>
                    <asp:BoundColumn datafield="priority" HeaderText="P&lt;br/&gt;r&lt;br/&gt;i" SortExpression="priority%, layer, class desc, name, rank_group.pecking_order, medical_release_code_description_map.pecking_order">
                      <HeaderStyle HorizontalAlign="Center" />
                      <ItemStyle VerticalAlign="Top" BackColor="Gainsboro" Font-Bold="True"/>
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="layer" headertext="L&lt;br/&gt;a&lt;br/&gt;y&lt;br/&gt;e&lt;br/&gt;r" sortexpression="layer%, priority, class desc, name, rank_group.pecking_order, medical_release_code_description_map.pecking_order">
                      <HeaderStyle HorizontalAlign="Center" />
                      <ItemStyle VerticalAlign="Top" BackColor="Gainsboro" Font-Bold="True"/>
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="class" headertext="C&lt;br/&gt;l&lt;br/&gt;a&lt;br/&gt;s&lt;br/&gt;s" sortexpression="class%, priority, layer, name, rank_group.pecking_order, medical_release_code_description_map.pecking_order">
                      <HeaderStyle HorizontalAlign="Center" />
                      <ItemStyle VerticalAlign="Top" BackColor="Gainsboro" Font-Bold="True"/>
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="name" headertext="Name" sortexpression="name%, priority, layer, class desc, rank_group.pecking_order, medical_release_code_description_map.pecking_order">
                      <ItemStyle VerticalAlign="Top" BackColor="Gainsboro" Font-Bold="True"/>
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="rank_group" headertext="Rank group" sortexpression="rank_group.pecking_order%, priority, layer, class desc, name, medical_release_code_description_map.pecking_order">
                      <HeaderStyle HorizontalAlign="Center" />
                      <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="cert_level" headertext="Cert level" sortexpression="cert_level%, priority, layer, class desc, name, rank_group.pecking_order">
                      <HeaderStyle HorizontalAlign="Center" />
                      <ItemStyle HorizontalAlign="Center" Wrap="False" VerticalAlign="Top" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="option_category" headertext="Option category" sortexpression="option_category%, priority, layer, class desc, name, rank_group.pecking_order, medical_release_code_description_map.pecking_order">
                      <HeaderStyle HorizontalAlign="Center" />
                      <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="gender" headertext="S&lt;br/&gt;e&lt;br/&gt;x" sortexpression="gender%, priority, layer, class desc, name, rank_group.pecking_order, medical_release_code_description_map.pecking_order">
                      <HeaderStyle HorizontalAlign="Center" />
                      <ItemStyle VerticalAlign="Top" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="vendor" headertext="Vendor" sortexpression="vendor%, priority, layer, class desc, name, rank_group.pecking_order, medical_release_code_description_map.pecking_order">
                      <ItemStyle VerticalAlign="Top" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="make" headertext="Make" sortexpression="make%, priority, layer, class desc, name, rank_group.pecking_order, medical_release_code_description_map.pecking_order">
                      <ItemStyle VerticalAlign="Top" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="model" headertext="Model" sortexpression="model%, priority, layer, class desc, name, rank_group.pecking_order, medical_release_code_description_map.pecking_order">
                      <ItemStyle VerticalAlign="Top" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="base_color" headertext="Base color" sortexpression="base_color%, priority, layer, class desc, name, rank_group.pecking_order, medical_release_code_description_map.pecking_order">
                      <HeaderStyle HorizontalAlign="Center" />
                      <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="trim_color" headertext="Trim color" sortexpression="trim_color%, priority, layer, class desc, name, rank_group.pecking_order, medical_release_code_description_map.pecking_order">
                      <HeaderStyle HorizontalAlign="Center" />
                      <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="metal_color" headertext="Metal color" sortexpression="metal_color%, priority, layer, class desc, name, rank_group.pecking_order, medical_release_code_description_map.pecking_order">
                      <HeaderStyle HorizontalAlign="Center" />
                      <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="elaboration" headertext="Elaboration">
                      <ItemStyle VerticalAlign="Top" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="cost" headertext="Cost" sortexpression="cost%, priority, layer, class desc, name">
                      <HeaderStyle HorizontalAlign="Center" />
                      <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="be_branded" headertext="B&lt;br/&gt;r&lt;br/&gt;a&lt;br/&gt;n&lt;br/&gt;d&lt;br/&gt;e&lt;br/&gt;d" sortexpression="be_branded%, priority, layer, class desc, name, rank_group.pecking_order, medical_release_code_description_map.pecking_order">
                      <HeaderStyle HorizontalAlign="Center" />
                      <ItemStyle VerticalAlign="Top" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="be_size_dependent" headertext="S&lt;br/&gt;i&lt;br/&gt;z&lt;br/&gt;e&lt;br/&gt;d" sortexpression="be_size_dependent%, priority, layer, class desc, name, rank_group.pecking_order, medical_release_code_description_map.pecking_order">
                      <HeaderStyle HorizontalAlign="Center" />
                      <ItemStyle VerticalAlign="Top" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="be_specific_rank_dependent" headertext="R&lt;br/&gt;a&lt;br/&gt;n&lt;br/&gt;k&lt;br/&gt;e&lt;br/&gt;d" sortexpression="be_specific_rank_dependent%, priority, layer, class desc, name, rank_group.pecking_order, medical_release_code_description_map.pecking_order">
                      <HeaderStyle HorizontalAlign="Center" />
                      <ItemStyle VerticalAlign="Top" />
                    </asp:BoundColumn>
                    <asp:BoundColumn datafield="be_extra_individualized" headertext="N&lt;br/&gt;e&lt;br/&gt;e&lt;br/&gt;d&lt;br/&gt;s&lt;br/&gt; &lt;br/&gt;n&lt;br/&gt;a&lt;br/&gt;m&lt;br/&gt;e" sortexpression="be_extra_individualized%, priority, layer, class desc, name, rank_group.pecking_order, medical_release_code_description_map.pecking_order">
                      <HeaderStyle HorizontalAlign="Center" />
                      <ItemStyle VerticalAlign="Top" />
                    </asp:BoundColumn>
                  </Columns>
                  <HeaderStyle backcolor="WhiteSmoke" VerticalAlign="Bottom"></HeaderStyle>
                </asp:DataGrid>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>
