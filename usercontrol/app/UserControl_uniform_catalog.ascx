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
    <td><font class="">Piece&nbsp;id:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_piece_id" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_piece_id" runat="server" errormessage="Please enter Piece&nbsp;id." font-bold="True" controltovalidate="TextBox_piece_id">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_piece_id" runat="server" errormessage="Please enter a valid Piece&nbsp;id." font-bold="True" controltovalidate="TextBox_piece_id" validationexpression="-?\d+">!ERR!</ASP:RegularExpressionValidator>
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
    <td><font class="">Rank&nbsp;group&nbsp;id:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_rank_group_id" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_rank_group_id" runat="server" errormessage="Please enter a valid Rank&nbsp;group&nbsp;id." font-bold="True" controltovalidate="TextBox_rank_group_id" validationexpression="-?\d+">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Medical&nbsp;release&nbsp;code:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_medical_release_code" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_medical_release_code" runat="server" errormessage="Please enter a valid Medical&nbsp;release&nbsp;code." font-bold="True" controltovalidate="TextBox_medical_release_code" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Option&nbsp;category&nbsp;id:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_option_category_id" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_option_category_id" runat="server" errormessage="Please enter a valid Option&nbsp;category&nbsp;id." font-bold="True" controltovalidate="TextBox_option_category_id" validationexpression="-?\d+">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Be&nbsp;male:</font></td>
    <td>
      <font class="">
        <ASP:CheckBox id="CheckBox_be_male" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Vendor&nbsp;id:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_vendor_id" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_vendor_id" runat="server" errormessage="Please enter Vendor&nbsp;id." font-bold="True" controltovalidate="TextBox_vendor_id">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_vendor_id" runat="server" errormessage="Please enter a valid Vendor&nbsp;id." font-bold="True" controltovalidate="TextBox_vendor_id" validationexpression="-?\d+">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Model&nbsp;id:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_model_id" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_model_id" runat="server" errormessage="Please enter Model&nbsp;id." font-bold="True" controltovalidate="TextBox_model_id">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_model_id" runat="server" errormessage="Please enter a valid Model&nbsp;id." font-bold="True" controltovalidate="TextBox_model_id" validationexpression="-?\d+">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Base&nbsp;color&nbsp;id:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_base_color_id" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_base_color_id" runat="server" errormessage="Please enter a valid Base&nbsp;color&nbsp;id." font-bold="True" controltovalidate="TextBox_base_color_id" validationexpression="-?\d+">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Trim&nbsp;color&nbsp;id:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_trim_color_id" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_trim_color_id" runat="server" errormessage="Please enter a valid Trim&nbsp;color&nbsp;id." font-bold="True" controltovalidate="TextBox_trim_color_id" validationexpression="-?\d+">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Metal&nbsp;color&nbsp;id:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_metal_color_id" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_metal_color_id" runat="server" errormessage="Please enter a valid Metal&nbsp;color&nbsp;id." font-bold="True" controltovalidate="TextBox_metal_color_id" validationexpression="-?\d+">!ERR!</ASP:RegularExpressionValidator>
    </td>
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

