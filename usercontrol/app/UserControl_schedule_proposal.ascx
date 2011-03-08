<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_schedule_proposal.ascx.cs"
  Inherits="UserControl_schedule_proposal.TWebUserControl_schedule_proposal" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table cellspacing="0" cellpadding="10" width="100%" border="0">
  <tr bgcolor="#f5f5f5">
    <td>
      <table cellspacing="0" cellpadding="0" border="1" bordercolor="#dcdcdc" width="100%">
        <tr>
          <td align="center">
            <table cellspacing="0" cellpadding="5" border="0" align="center" width="100%">
              <tr>
                <td align="right"><b><small>Filters:</small></b></td>
                <td align="center" nowrap="nowrap">
                  <small>Depth</small><br/>
                  <ASP:DropDownList id="DropDownList_depth" runat="server" autopostback="True" onselectedindexchanged="DropDownList_depth_SelectedIndexChanged">
                    <ASP:ListItem value="" selected="True">All</ASP:ListItem>
                    <ASP:ListItem value="1">Selected</ASP:ListItem>
                    <ASP:ListItem value="0">Not selected</ASP:ListItem>
                  </ASP:DropDownList>
   							</td>
              </tr>
            </table>
            <table cellspacing="0" cellpadding="5" width="100%" border="0" align="center">
              <tr>
                <td align="center" valign="middle"><small><b><asp:literal id="Literal_num_members" runat="server"></asp:literal></b><br/>members</small></td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td align="center" valign="middle"><small><b><ASP:literal id="Literal_num_crew_shifts" runat="server"></ASP:literal></b><br/>crew-shifts</small></td>
              </tr>
            </table>
            <small>
              <asp:DataList ID="DataList_key" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" ShowFooter="False" ShowHeader="False">
                <ItemTemplate>
                  <asp:Literal ID="Literal_watchbill_rendition" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"watchbill_rendition") %>'></asp:Literal>&nbsp;=&nbsp;<asp:Literal ID="Literal_description" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"description") %>'></asp:Literal>,&nbsp;
                </ItemTemplate>
              </asp:DataList>
              Ð&nbsp;=&nbsp;non-driver
            </small>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr id="TableRow_none" runat="server"><td><p></p><em>--&nbsp;NONE&nbsp;--</em></td></tr>
  <tr>
    <td>
      <asp:Panel ID="Panel_warning_to_save" runat="server">
        <table cellpadding="3" cellspacing="0">
          <tr>
            <td>
              <asp:Image ID="Image_warning" runat="server" AlternateText="Warning!" ImageUrl="~/protected/image/dialog-warning.png" />
            </td>
            <td>Changes made below will not be saved until you click a member&#39;s name <em>or</em> click this button:</td>
            <td>
              <asp:Button ID="Button_save" runat="server" Font-Bold="True" onclick="Button_save_Click" Text="SAVE" />
            </td>
          </tr>
        </table>
      </asp:Panel>
      <br />
      <asp:datagrid id="A" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="1" gridlines="None" bordercolor="Gainsboro" onitemdatabound="A_ItemDataBound" onitemcommand="A_ItemCommand">
        <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
        <Columns>
          <asp:BoundColumn DataField="nominal_day" ReadOnly="True">
            <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" />
            <ItemStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Right" />
          </asp:BoundColumn>
          <asp:BoundColumn DataField="display_seq_num" ReadOnly="True" Visible="False"></asp:BoundColumn>
          <asp:TemplateColumn><ItemTemplate>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</ItemTemplate></asp:TemplateColumn>
          <asp:BoundColumn DataField="d_num_units_from_agency" DataFormatString="{0:F1}" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:TemplateColumn>
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
            <ItemTemplate>/</ItemTemplate>
          </asp:TemplateColumn>
          <asp:BoundColumn DataField="d_num_units_citywide" DataFormatString="{0:F1}" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:TemplateColumn><ItemTemplate>&nbsp;&nbsp;&nbsp;</ItemTemplate></asp:TemplateColumn>
          <asp:BoundColumn DataField="d_assignment_id" ReadOnly="True" Visible="False"></asp:BoundColumn>
          <asp:BoundColumn DataField="d_post_id" ReadOnly="True" Visible="False"></asp:BoundColumn>
          <asp:BoundColumn DataField="d_agency_short_designator" Visible="False"></asp:BoundColumn>
          <asp:BoundColumn DataField="d_member_id" Visible="False"></asp:BoundColumn>
          <asp:TemplateColumn>
            <ItemTemplate><asp:DropDownList ID="DropDownList_d_post" runat="server" Enabled="False" onselectedindexchanged="DropDownList_d_post_SelectedIndexChanged" Visible="false"></asp:DropDownList><asp:Label ID="Label_d_post" runat="server"></asp:Label></ItemTemplate>
            <ItemStyle VerticalAlign="Bottom" />
          </asp:TemplateColumn>
          <asp:BoundColumn DataField="d_post_cardinality" ItemStyle-VerticalAlign="Bottom"></asp:BoundColumn>
          <asp:TemplateColumn Visible="false">
            <ItemTemplate><asp:DropDownList ID="DropDownList_d_post_cardinality" runat="server" Enabled="False" onselectedindexchanged="DropDownList_d_post_cardinality_SelectedIndexChanged"></asp:DropDownList></ItemTemplate>
            <ItemStyle VerticalAlign="Bottom" />
          </asp:TemplateColumn>
          <asp:BoundColumn DataField="d_medical_release_description" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" HorizontalAlign="Center" />
          </asp:BoundColumn>
          <asp:TemplateColumn>
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
            <ItemTemplate>:</ItemTemplate>
          </asp:TemplateColumn>
          <asp:ButtonColumn CommandName="SelectDayAvailMember" DataTextField="d_name" HeaderText="DAY" Visible="false">
            <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" />
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:ButtonColumn>
          <asp:BoundColumn DataField="d_name" HeaderText="DAY">
            <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:BoundColumn DataField="d_be_driver_qualified" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:BoundColumn DataField="d_member_agency_id">
            <ItemStyle HorizontalAlign="Right" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:BoundColumn DataField="d_be_selected" Visible="False"></asp:BoundColumn>
          <asp:BoundColumn DataField="d_comment">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:TemplateColumn><ItemTemplate>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</ItemTemplate></asp:TemplateColumn>
          <asp:BoundColumn DataField="n_num_units_from_agency" DataFormatString="{0:F1}" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:TemplateColumn>
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
            <ItemTemplate>/</ItemTemplate>
          </asp:TemplateColumn>
          <asp:BoundColumn DataField="n_num_units_citywide" DataFormatString="{0:F1}" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:TemplateColumn><ItemTemplate>&nbsp;&nbsp;&nbsp;</ItemTemplate></asp:TemplateColumn>
          <asp:BoundColumn DataField="n_assignment_id" ReadOnly="True" Visible="False"></asp:BoundColumn>
          <asp:BoundColumn DataField="n_post_id" ReadOnly="True" Visible="False"></asp:BoundColumn>
          <asp:BoundColumn DataField="n_agency_short_designator" Visible="False"></asp:BoundColumn>
          <asp:BoundColumn DataField="n_member_id" Visible="False"></asp:BoundColumn>
          <asp:TemplateColumn>
            <ItemTemplate><asp:DropDownList ID="DropDownList_n_post" runat="server" Enabled="False" onselectedindexchanged="DropDownList_n_post_SelectedIndexChanged" Visible="false"></asp:DropDownList><asp:Label ID="Label_n_post" runat="server"></asp:Label></ItemTemplate>
            <ItemStyle VerticalAlign="Bottom" />
          </asp:TemplateColumn>
          <asp:BoundColumn DataField="n_post_cardinality" ItemStyle-VerticalAlign="Bottom"></asp:BoundColumn>
          <asp:TemplateColumn Visible="false">
            <ItemTemplate><asp:DropDownList ID="DropDownList_n_post_cardinality" runat="server" Enabled="False" onselectedindexchanged="DropDownList_n_post_cardinality_SelectedIndexChanged"></asp:DropDownList></ItemTemplate>
            <ItemStyle VerticalAlign="Bottom" />
          </asp:TemplateColumn>
          <asp:BoundColumn DataField="n_medical_release_description" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" HorizontalAlign="Center" />
          </asp:BoundColumn>
          <asp:TemplateColumn>
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
            <ItemTemplate>:</ItemTemplate>
          </asp:TemplateColumn>
          <asp:ButtonColumn CommandName="SelectNightAvailMember" DataTextField="n_name" HeaderText="NIGHT" Visible="false">
            <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" />
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:ButtonColumn>
          <asp:BoundColumn DataField="n_name" HeaderText="NIGHT">
            <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:BoundColumn DataField="n_be_driver_qualified" ReadOnly="True">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:BoundColumn DataField="n_member_agency_id">
            <ItemStyle HorizontalAlign="Right"  VerticalAlign="Bottom" />
          </asp:BoundColumn>
          <asp:BoundColumn DataField="n_be_selected" Visible="False"></asp:BoundColumn>
          <asp:BoundColumn DataField="n_comment">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Bottom" />
          </asp:BoundColumn>
        </Columns>
      </asp:datagrid>
    </td>
  </tr>
</table>
