<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_patient_encounter.ascx.cs" Inherits="UserControl_patient_encounter.TWebUserControl_patient_encounter"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~kicrudhelped~item.ascx-template -->
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
  <tr runat="server" id="TableRow_record_navigation_controls" visible="false">
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
    <td><font class="">Eval:</font></td>
    <td>
      <font class="">
        <ASP:Literal id="Literal_eval_spec" runat="server" />
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Chief&nbsp;complaint:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_chief_complaint" runat="server" columns="72" maxlength="255" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_chief_complaint" runat="server" errormessage="Please enter Chief&nbsp;complaint." font-bold="True" controltovalidate="TextBox_chief_complaint">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Patient&nbsp;age:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_patient_age" runat="server"  cssclass="" enabled="False" Columns="3" MaxLength="3"></ASP:TextBox>
      </font>
      <asp:DropDownList ID="DropDownList_patient_age_unit" runat="server">
      </asp:DropDownList>
    </td>
    <td nowrap="nowrap">
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_patient_age" runat="server" errormessage="Please enter a valid Patient&nbsp;age." font-bold="True" controltovalidate="TextBox_patient_age" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_patient_age_unit_id" runat="server" errormessage="Please select a valid Patient&nbsp;age&nbsp;unit." font-bold="True" controltovalidate="DropDownList_patient_age_unit" validationexpression="-?\d+">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Patient&nbsp;encounter&nbsp;level:</font></td>
    <td>
      <asp:DropDownList ID="DropDownList_patient_encounter_level" runat="server">
      </asp:DropDownList>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_patient_encounter_level_id" runat="server" errormessage="Please select Patient&nbsp;encounter&nbsp;level." font-bold="True" controltovalidate="DropDownList_patient_encounter_level">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td></td>
    <td><ASP:Button id="Button_basic_info_save" text="SAVE" runat="server" onclick="Button_save_Click" Font-Bold="True"></ASP:Button></td>
    <td></td>
  </tr>
  <tr id="TableRow_care_skills" runat="server" visible="false">
    <td valign="top"><font class="">
      <br />
      Adjust as appropriate:</font></td>
    <td>
      <font class="">
        <asp:DataGrid id="DataGrid_control" runat="server" AutoGenerateColumns="False" gridlines="Horizontal" cellpadding="3" ShowHeader="False" onitemdatabound="DataGrid_control_ItemDataBound">
          <Columns>
            <asp:BoundColumn DataField="care_skill_id" ReadOnly="True" Visible="false"></asp:BoundColumn>
            <asp:BoundColumn DataField="care_skill_description" HeaderText="Skill" ReadOnly="True">
              <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundColumn>
            <asp:BoundColumn DataField="performed_needs_rating" ReadOnly="True" Visible="false">
              <ItemStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
            </asp:BoundColumn>
            <asp:BoundColumn DataField="care_skill_rating_id" ReadOnly="True" Visible="false"></asp:BoundColumn>
            <asp:BoundColumn DataField="care_skill_rating_skill_rating_id" ReadOnly="True" Visible="false"></asp:BoundColumn>
            <asp:TemplateColumn>
              <ItemTemplate><asp:DropDownList ID="DropDownList_control" runat="server"></asp:DropDownList></ItemTemplate>
            </asp:TemplateColumn>
          </Columns>
          <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
        </asp:DataGrid>  
      </font>
    </td>
    <td nowrap="nowrap" valign="top">
      <br />
      <asp:CustomValidator ID="CustomValidator_care_skills" runat="server" ErrorMessage="Please evaluate all care skills that the evaluatee said they performed (those marked with '?')." Display="Dynamic" Font-Bold="True" onservervalidate="CustomValidator_care_skills_ServerValidate">!ERR!</asp:CustomValidator>
    </td>
  </tr>
      </table>
    </td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server" enabled="False" onclick="Button_submit_Click"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False" onclick="Button_delete_Click"></ASP:Button>

