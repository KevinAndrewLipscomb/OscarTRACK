<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_uniform_catalog.ascx.cs" Inherits="UserControl_uniform_catalog.TWebUserControl_uniform_catalog"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~kicrudhelped~item.ascx-template -->
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
  <tr>
    <td bgcolor="gainsboro" valign="top"><font class="">id:</font></td>
    <td valign="top"><font class="">
      <table cellspacing="0" cellpadding="0" border="0">
         <tr>
           <td valign="middle">
             <table cellspacing="0" cellpadding="0" border="0">
               <tr>
                 <td>
      <ASP:TextBox id="TextBox_id" runat="server"  cssclass=""></ASP:TextBox><ASP:Button id="Button_lookup" runat="server" causesvalidation="False" text="LOOKUP" onclick="Button_lookup_Click"></ASP:Button>
                </td>
                <td nowrap="nowrap"><small><small><asp:Label id="Label_lookup_arrow" runat="server">&lt;--</asp:Label></small></small></td>
                <td><small><small><em><asp:Label id="Label_lookup_hint" runat="server">Lookup by partial or full field value</asp:Label></em></small></small></td>
              </tr>
            </table>
          </td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <td valign="middle">
            <small>
              <ASP:LinkButton id="LinkButton_reset" runat="server" causesvalidation="False" enabled="False" onclick="LinkButton_reset_Click">New lookup</ASP:LinkButton>
            </small>
          </td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <td valign="middle">
            <small>
              <ASP:LinkButton id="LinkButton_new_record" runat="server" causesvalidation="False" visible="False" onclick="LinkButton_new_record_Click">Enter&nbsp;brand&nbsp;new&nbsp;record</ASP:LinkButton>
            </small>
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td><asp:Panel ID="Panel_match_numbers" runat="server" Visible="False"><small>(<asp:Literal ID="Literal_match_index" runat="server"></asp:Literal>/<asp:Literal ID="Literal_num_matches" runat="server"></asp:Literal>)</small></asp:Panel></td>
          <td>
            <asp:LinkButton id="LinkButton_go_to_match_first" runat="server" text="<IMG src=&quot;~/protected/image/first_track_blue16_h.png&quot; alt=&quot;First match&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; />" causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_first_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_prior" runat="server" text="<IMG src=&quot;~/protected/image/play_blue16_h-flipped.png&quot; alt=&quot;Prior match&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; />" causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_prior_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_next" runat="server" text="<IMG src=&quot;~/protected/image/play_blue16_h.png&quot; alt=&quot;Next match&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; />" causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_next_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_last" runat="server" text="<IMG src=&quot;~/protected/image/last_track_blue16_h.png&quot; alt=&quot;Last match&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; />" causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_last_Click"></asp:LinkButton>
          </td>
          <td>
            <div style="width:0px;white-space:nowrap;"><ASP:DropDownList id="DropDownList_id" runat="server" visible="False" autopostback="True" onselectedindexchanged="DropDownList_id_SelectedIndexChanged"></ASP:DropDownList></div>
          </td>
        </tr>
      </table>
    </font>
    </td>
    <td nowrap="nowrap" valign="top">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_id" runat="server" errormessage="Please enter id." font-bold="True" controltovalidate="TextBox_id">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Piece:</font></td>
    <td>
      <asp:DropDownList ID="DropDownList_piece" runat="server"></asp:DropDownList>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_piece" runat="server" errormessage="Please select a Piece." font-bold="True" controltovalidate="DropDownList_piece">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Be&nbsp;branded:</font></td>
    <td>
      <font class="">
        <ASP:CheckBox id="CheckBox_be_branded" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Be&nbsp;size&nbsp;dependent:</font></td>
    <td>
      <font class="">
        <ASP:CheckBox id="CheckBox_be_size_dependent" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Be&nbsp;specific&nbsp;rank&nbsp;dependent:</font></td>
    <td>
      <font class="">
        <ASP:CheckBox id="CheckBox_be_specific_rank_dependent" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Be&nbsp;extra&nbsp;individualized:</font></td>
    <td>
      <font class="">
        <ASP:CheckBox id="CheckBox_be_extra_individualized" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Rank&nbsp;group:</font></td>
    <td>
      <asp:DropDownList ID="DropDownList_rank_group" runat="server">
      </asp:DropDownList>
    </td>
    <td nowrap="nowrap">
      &nbsp;</td>
  </tr>
  <tr>
    <td><font class="">Medical&nbsp;release&nbsp;level:</font></td>
    <td>
      <asp:DropDownList ID="DropDownList_medical_release_level" runat="server">
      </asp:DropDownList>
    </td>
    <td nowrap="nowrap">
      &nbsp;</td>
  </tr>
  <tr>
    <td><font class="">Option&nbsp;category:</font></td>
    <td>
      <asp:DropDownList ID="DropDownList_option_category" runat="server">
      </asp:DropDownList>
    </td>
    <td nowrap="nowrap">
      &nbsp;</td>
  </tr>
  <tr>
    <td><font class="">Gender:</font></td>
    <td>
      <asp:DropDownList ID="DropDownList_gender" runat="server">
        <asp:ListItem>-- gender --</asp:ListItem>
        <asp:ListItem Value="NULL">Unisex or N/A</asp:ListItem>
        <asp:ListItem Value="TRUE">Male</asp:ListItem>
        <asp:ListItem Value="FALSE">Female</asp:ListItem>
      </asp:DropDownList>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Vendor:</font></td>
    <td>
      <asp:DropDownList ID="DropDownList_vendor" runat="server">
      </asp:DropDownList>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_vendor" runat="server" errormessage="Please select a Vendor." font-bold="True" controltovalidate="DropDownList_vendor">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Make/model:</font></td>
    <td>
      <asp:DropDownList ID="DropDownList_make_model" runat="server">
      </asp:DropDownList>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_make_model" runat="server" errormessage="Please select a Model." font-bold="True" controltovalidate="DropDownList_make_model">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Base&nbsp;color:</font></td>
    <td>
      <asp:DropDownList ID="DropDownList_base_color" runat="server">
      </asp:DropDownList>
    </td>
    <td nowrap="nowrap">
      &nbsp;</td>
  </tr>
  <tr>
    <td><font class="">Trim&nbsp;color:</font></td>
    <td>
      <asp:DropDownList ID="DropDownList_trim_color" runat="server">
      </asp:DropDownList>
    </td>
    <td nowrap="nowrap">
      &nbsp;</td>
  </tr>
  <tr>
    <td><font class="">Metal&nbsp;color:</font></td>
    <td>
      <asp:DropDownList ID="DropDownList_metal_color" runat="server">
      </asp:DropDownList>
    </td>
    <td nowrap="nowrap">
      &nbsp;</td>
  </tr>
  <tr>
    <td><font class="">Instruction&nbsp;to&nbsp;vendor:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_instruction_to_vendor" runat="server" columns="72" maxlength="2046" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Elaboration:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_elaboration" runat="server" columns="72" maxlength="1022" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Unit&nbsp;cost:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_unit_cost" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_unit_cost" runat="server" errormessage="Please enter Unit&nbsp;cost." font-bold="True" controltovalidate="TextBox_unit_cost">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_unit_cost" runat="server" errormessage="Please enter a valid Unit&nbsp;cost." font-bold="True" controltovalidate="TextBox_unit_cost" validationexpression="\d*\.?\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
      </table>
    </td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server" enabled="False" onclick="Button_submit_Click"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False" onclick="Button_delete_Click"></ASP:Button>

