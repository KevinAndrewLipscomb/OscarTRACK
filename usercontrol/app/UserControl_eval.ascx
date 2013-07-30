<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_eval.ascx.cs" Inherits="UserControl_eval.TWebUserControl_eval"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~kicrudhelped~item.ascx-template -->
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<%@ Register src="../ki/UserControl_drop_down_time_of_day.ascx" tagname="UserControl_drop_down_time_of_day" tagprefix="uc2" %>
<asp:UpdatePanel ID="UpdatePanel_control" runat="server">
  <ContentTemplate>
<asp:ValidationSummary ID="ValidationSummary_add_patient_encounter" runat="server" ValidationGroup="add_patient_encounter"/>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <asp:Panel ID="Panel_basic_items" runat="server">
        <table cellspacing="0" cellpadding="5" border="0" width="100%">
          <tr bgcolor="Gainsboro"><td><b>Basic information</b></td></tr>
          <tr>
            <td>
        <table cellspacing="0" cellpadding="5" border="0">
  <tr runat="server" id="TableRow_record_navigation_controls" visible="false">
    <td bgcolor="gainsboro" valign="top" align="right"><font class="">id:</font></td>
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
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_id" runat="server" errormessage="Please enter id." font-bold="True" controltovalidate="TextBox_id">&lt;ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td align="right"><font class="">Evaluatee:</font></td>
    <td>
      <asp:DropDownList ID="DropDownList_evaluatee" runat="server" onselectedindexchanged="DropDownList_evaluatee_SelectedIndexChanged">
      </asp:DropDownList>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_third_member_id" runat="server" errormessage="Please select an Evaluatee." font-bold="True" controltovalidate="DropDownList_evaluatee">&lt;ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td align="right"><font class="">Nominal&nbsp;day:</font></td>
    <td>
      <table>
        <tr>
    <td>
      <font class="">
        <uc1:UserControl_drop_down_date id="UserControl_drop_down_date_nominal_day" runat="server"></uc1:UserControl_drop_down_date>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
    <td><font class="">Shift:</font></td>
    <td>
      <asp:DropDownList ID="DropDownList_shift" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList_shift_SelectedIndexChanged">
      </asp:DropDownList>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_shift_id" runat="server" errormessage="Please enter Shift&nbsp;id." font-bold="True" controltovalidate="DropDownList_shift">&lt;ERR!</ASP:RequiredFieldValidator>
    </td>
        </tr>
      </table>
    </td>
    <td></td>
  </tr>
  <tr>
    <td align="right"><font class="">Time&nbsp;in:</font></td>
    <td>
      <table>
        <tr>
    <td>
      <uc2:UserControl_drop_down_time_of_day ID="UserControl_drop_down_time_of_day_in" runat="server" />
    </td>
    <td nowrap="nowrap">
      <asp:CustomValidator ID="CustomValidator_time_in" runat="server" ErrorMessage="Please specify Time in" Font-Bold="True">&lt;ERR!</asp:CustomValidator>
    </td>
    <td><font class="">Time&nbsp;out:</font></td>
    <td>
      <uc2:UserControl_drop_down_time_of_day ID="UserControl_drop_down_time_of_day_out" runat="server" />
    </td>
    <td nowrap="nowrap">
      <asp:CustomValidator ID="CustomValidator_time_out" runat="server" ErrorMessage="Please specify Time out" Font-Bold="True">&lt;ERR!</asp:CustomValidator>
    </td>
          </tr>
      </table>
    </td>
    <td></td>
  </tr>
  <tr>
    <td align="right">Post<font class="">:</font></td>
    <td>
      <table>
        <tr>
    <td>
      <asp:DropDownList ID="DropDownList_post" runat="server">
      </asp:DropDownList>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_post_id" runat="server" errormessage="Please select a Post." font-bold="True" controltovalidate="DropDownList_post">&lt;ERR!</ASP:RequiredFieldValidator>
    </td>
    <td><font class="">Crew:</font></td>
    <td>
      <asp:DropDownList ID="DropDownList_post_cardinality" runat="server">
      </asp:DropDownList>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_post_cardinality" runat="server" errormessage="Please enter Post&nbsp;cardinality." font-bold="True" controltovalidate="DropDownList_post_cardinality">&lt;ERR!</ASP:RequiredFieldValidator>
    </td>
          </tr>
      </table>
    </td>
    <td></td>
  </tr>
  <tr>
    <td align="right"><font class="">Unit:</font></td>
    <td>
      <asp:DropDownList ID="DropDownList_vehicle" runat="server">
      </asp:DropDownList>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_vehicle_id" runat="server" errormessage="Please select a Unit." font-bold="True" controltovalidate="DropDownList_vehicle">&lt;ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td align="right"><font class="">Status:</font></td>
    <td>
      <asp:DropDownList ID="DropDownList_status" runat="server" Enabled="false">
      </asp:DropDownList>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td></td>
    <td><ASP:Button id="Button_basic_info_save" text="SAVE" runat="server" enabled="False" onclick="Button_save_Click" Font-Bold="True"></ASP:Button></td>
    <td></td>
  </tr>
        </table>
            </td>
          </tr>
        </table>
      </asp:Panel>
      <asp:Panel ID="Panel_patient_encounters" runat="server" visible="false">
        <table cellspacing="0" cellpadding="5" border="0" width="100%">
          <tr bgcolor="Gainsboro"><td><b>Patient encounters</b></td></tr>
          <tr>
            <td>
              <table cellspacing="0" cellpadding="5" border="0">
                <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
                <tr>
                  <td><asp:LinkButton ID="LinkButton_add_a_patient_encounter" runat="server" Text="Add&nbsp;a&nbsp;patient&nbsp;encounter" Enabled="False" Font-Bold="True" onclick="LinkButton_add_a_patient_encounter_Click" ValidationGroup="AddPatientEncounter"/></td>
                </tr>
                <tr>
                  <td>
                    <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False" onitemcommand="DataGrid_control_ItemCommand" onitemdatabound="DataGrid_control_ItemDataBound">
                      <Columns>
                        <asp:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/open_document16_h.png&quot; alt=&quot;Detail&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Open">
                          <ItemStyle VerticalAlign="Top" />
                        </asp:ButtonColumn>
                        <asp:BoundColumn datafield="id" HeaderText="#">
                          <HeaderStyle HorizontalAlign="Center" />
                          <ItemStyle VerticalAlign="Top" />
                        </asp:BoundColumn>
                        <asp:BoundColumn datafield="chief_complaint" headertext="Chief complaint">
                          <ItemStyle VerticalAlign="Top" />
                        </asp:BoundColumn>
                        <asp:BoundColumn datafield="patient_age_spec" HeaderText="Age">
                          <HeaderStyle HorizontalAlign="Center" />
                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                        </asp:BoundColumn>
                        <asp:BoundColumn datafield="patient_encounter_level" headertext="Level">
                          <HeaderStyle HorizontalAlign="Center" />
                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="skill_performance" HeaderText="Skill performance" ReadOnly="True">
                          <ItemStyle VerticalAlign="Top" />
                        </asp:BoundColumn>
                      </Columns>
                      <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                    </asp:DataGrid>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </asp:Panel>
      <asp:Panel ID="Panel_interaction_items" runat="server">
        <table  cellspacing="0" cellpadding="5" border="0" width="100%">
          <tr bgcolor="Gainsboro"><td><b>Interaction information</b></td></tr>
          <tr>
            <td>
        <table cellspacing="0" cellpadding="5" border="0">
  <tr>
    <td align="right">AIC<font class=""> evaluator:</font></td>
    <td>
      <asp:DropDownList ID="DropDownList_aic" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList_aic_SelectedIndexChanged">
      </asp:DropDownList>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_aic_member_id" runat="server" errormessage="Please enter Aic&nbsp;member&nbsp;id." font-bold="True" controltovalidate="DropDownList_aic">&lt;ERR!</ASP:RequiredFieldValidator>
      <asp:CompareValidator ID="CompareValidator_aic" runat="server" ControlToCompare="DropDownList_evaluatee" ControlToValidate="DropDownList_aic" Display="Dynamic" ErrorMessage="Evaluator and evaluatee cannot be the same member." Font-Bold="True" Operator="NotEqual">&lt;ERR!</asp:CompareValidator>
    </td>
  </tr>
  <tr>
    <td align="right"><font class=""><asp:Label ID="Label_alt_aic_reason" runat="server" Text="Reason for changing AIC:" Enabled="false"></asp:Label></font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_alt_aic_reason" runat="server" columns="72" maxlength="255" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <asp:RequiredFieldValidator ID="RequiredFieldValidator_alt_aic_reason" runat="server" ControlToValidate="TextBox_alt_aic_reason" Display="Dynamic" Enabled="False" ErrorMessage="Please enter a Reason for changing AIC." Font-Bold="True">&lt;ERR!</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td valign="top" align="right"><font class="">Discussions:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_discussions" runat="server" columns="72" textmode="MultiLine" rows="4" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_discussions" runat="server" errormessage="Please restrict the Discussions entry to 65535 characters." font-bold="True" controltovalidate="TextBox_discussions" validationexpression="^[\s\S]{0,65535}$">&lt;ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td></td>
    <td><ASP:Button id="Button_interaction_info_save" text="SAVE" runat="server" enabled="False" onclick="Button_save_Click" Font-Bold="True"></ASP:Button></td>
    <td></td>
  </tr>
        </table>
            </td>
          </tr>
        </table>
      </asp:Panel>
      <asp:Panel ID="Panel_patient_care_summary" runat="server" visible="false">
        <table cellspacing="0" cellpadding="5" border="0" width="100%">
          <tr bgcolor="Gainsboro"><td><b>Patient care summary</b></td></tr>
          <tr>
            <td>
        <table cellspacing="0" cellpadding="5" border="0">
  <tr>
    <td align="right"><font class="">EVALUATOR&nbsp;feels&nbsp;that&nbsp;evaluatee&nbsp;is&nbsp;making&nbsp;adequate&nbsp;progress:</font></td>
    <td>
      <asp:RadioButtonList ID="RadioButtonList_be_aic_ok_with_third_progress" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem>No</asp:ListItem>
        <asp:ListItem>Yes</asp:ListItem>
      </asp:RadioButtonList>
    </td>
    <td nowrap="nowrap">
      <asp:RequiredFieldValidator ID="RequiredFieldValidator_be_aic_ok_with_third_progress" runat="server" ControlToValidate="RadioButtonList_be_aic_ok_with_third_progress" Display="Dynamic" ErrorMessage="Please select whether you feel the evaluatee is making adequate progress." Font-Bold="True">&lt;ERR!</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td align="right"><font class="">EVALUATOR&nbsp;feels&nbsp;that&nbsp;evaluatee&nbsp;should&nbsp;be&nbsp;released:</font></td>
    <td>
      <asp:RadioButtonList ID="RadioButtonList_be_aic_ok_with_third_release" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem>No</asp:ListItem>
        <asp:ListItem>Yes</asp:ListItem>
      </asp:RadioButtonList>
    </td>
    <td nowrap="nowrap">
      <asp:RequiredFieldValidator ID="RequiredFieldValidator_be_aic_ok_with_third_release" runat="server" ControlToValidate="RadioButtonList_be_aic_ok_with_third_release" Display="Dynamic" ErrorMessage="Please select whether you feel the evaluatee is ready for release." Font-Bold="True">&lt;ERR!</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td align="right"><font class="">EVALUATEE&nbsp;feels&nbsp;that&nbsp;evaluatee&nbsp;is&nbsp;making&nbsp;adequate&nbsp;progress:</font></td>
    <td>
      <asp:RadioButtonList ID="RadioButtonList_be_third_ok_with_progress" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem>No</asp:ListItem>
        <asp:ListItem>Yes</asp:ListItem>
      </asp:RadioButtonList>
    </td>
    <td nowrap="nowrap">
      <asp:RequiredFieldValidator ID="RequiredFieldValidator_be_third_ok_with_progress" runat="server" ControlToValidate="RadioButtonList_be_third_ok_with_progress" Display="Dynamic" ErrorMessage="Please select whether you feel you are making adequate progress." Font-Bold="True">&lt;ERR!</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td align="right"><font class="">EVALUATEE&nbsp;feels&nbsp;that&nbsp;evaluatee&nbsp;should&nbsp;be&nbsp;released:</font></td>
    <td>
      <asp:RadioButtonList ID="RadioButtonList_be_third_ok_with_release" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem>No</asp:ListItem>
        <asp:ListItem>Yes</asp:ListItem>
      </asp:RadioButtonList>
    </td>
    <td nowrap="nowrap">
      <asp:RequiredFieldValidator ID="RequiredFieldValidator_be_third_ok_with_release" runat="server" ControlToValidate="RadioButtonList_be_third_ok_with_release" Display="Dynamic" ErrorMessage="Please select whether you feel you are ready for release." Font-Bold="True">&lt;ERR!</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td></td>
    <td><ASP:Button id="Button_patient_care_summary_save" text="SAVE" runat="server" enabled="False" onclick="Button_save_Click" Font-Bold="True"></ASP:Button></td>
    <td></td>
  </tr>
        </table>
            </td>
          </tr>
        </table>
      </asp:Panel>
      <asp:Panel ID="Panel_driving_summary" runat="server" visible="false">
        <table cellspacing="0" cellpadding="5" border="0" width="100%">
          <tr bgcolor="Gainsboro"><td><b>Driving summary</b></td></tr>
          <tr>
            <td>
        <table cellspacing="0" cellpadding="5" border="0">
  <tr id="TableRow_driver_skills" runat="server">
    <td valign="top"><font class="">
      <br />
      Adjust as appropriate:</font></td>
    <td>
      <font class="">
        <asp:DataGrid id="DataGrid_driver_skill" runat="server" AutoGenerateColumns="False" gridlines="Horizontal" cellpadding="3" ShowHeader="False" onitemdatabound="DataGrid_driver_skill_ItemDataBound">
          <Columns>
            <asp:BoundColumn DataField="driver_skill_id" ReadOnly="True" Visible="false"></asp:BoundColumn>
            <asp:BoundColumn DataField="driver_skill_description" HeaderText="Skill" ReadOnly="True">
              <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundColumn>
            <asp:BoundColumn DataField="performed_needs_rating" ReadOnly="True" Visible="false">
              <ItemStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
            </asp:BoundColumn>
            <asp:BoundColumn DataField="driver_skill_rating_id" ReadOnly="True" Visible="false"></asp:BoundColumn>
            <asp:BoundColumn DataField="driver_skill_rating_skill_rating_id" ReadOnly="True" Visible="false"></asp:BoundColumn>
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
      <asp:CustomValidator ID="CustomValidator_driver_skills" runat="server" ErrorMessage="Please evaluate all driver skills that the evaluatee said they performed (those marked with '?')." Display="Dynamic" Font-Bold="True" onservervalidate="CustomValidator_driver_skills_ServerValidate">&lt;ERR!</asp:CustomValidator>
    </td>
  </tr>
  <tr>
    <td valign="top" align="right"><font class="">Comments&nbsp;on&nbsp;driving:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_comments_on_driving" runat="server" columns="72" textmode="MultiLine" rows="2" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_comments_on_driving" runat="server" errormessage="Please restrict the Comments&nbsp;on&nbsp;driving entry to 65535 characters." font-bold="True" controltovalidate="TextBox_comments_on_driving" validationexpression="^[\s\S]{0,65535}$">&lt;ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td align="right"><font class="">Miles&nbsp;driven&nbsp;routine:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_miles_driven_routine" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_miles_driven_routine" runat="server" errormessage="Please enter a valid Miles&nbsp;driven&nbsp;routine." font-bold="True" controltovalidate="TextBox_miles_driven_routine" validationexpression="\d*">&lt;ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td align="right"><font class="">Miles&nbsp;driven&nbsp;emergency:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_miles_driven_emergency" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_miles_driven_emergency" runat="server" errormessage="Please enter a valid Miles&nbsp;driven&nbsp;emergency." font-bold="True" controltovalidate="TextBox_miles_driven_emergency" validationexpression="\d*">&lt;ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td align="right"><font class="">Road&nbsp;conditions:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_road_conditions" runat="server" columns="72" maxlength="255" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td align="right"><font class="">EVALUATOR&nbsp;feels&nbsp;that&nbsp;evaluatee&nbsp;should&nbsp;be&nbsp;released&nbsp;to&nbsp;drive:</font></td>
    <td>
      <asp:RadioButtonList ID="RadioButtonList_be_aic_ok_with_third_being_driver" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem>No</asp:ListItem>
        <asp:ListItem>Yes</asp:ListItem>
      </asp:RadioButtonList>
    </td>
    <td nowrap="nowrap">
      <asp:RequiredFieldValidator ID="RequiredFieldValidator_be_aic_ok_with_third_being_driver" runat="server" ControlToValidate="RadioButtonList_be_aic_ok_with_third_being_driver" Display="Dynamic" ErrorMessage="Please select whether you feel the evaluatee should be released as a driver." Font-Bold="True">&lt;ERR!</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td align="right"><font class="">EVALUATEE&nbsp;feels&nbsp;that&nbsp;evaluatee&nbsp;should&nbsp;be&nbsp;released&nbsp;to&nbsp;drive:</font></td>
    <td>
      <asp:RadioButtonList ID="RadioButtonList_be_third_ok_with_being_driver" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem>No</asp:ListItem>
        <asp:ListItem>Yes</asp:ListItem>
      </asp:RadioButtonList>
    </td>
    <td nowrap="nowrap">
      <asp:RequiredFieldValidator ID="RequiredFieldValidator_be_third_ok_with_being_driver" runat="server" ControlToValidate="RadioButtonList_be_third_ok_with_being_driver" Display="Dynamic" ErrorMessage="Please select whether you feel you should be released as a driver." Font-Bold="True">&lt;ERR!</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td></td>
    <td><ASP:Button id="Button_driving_summary_save" text="SAVE" runat="server" enabled="False" onclick="Button_save_Click" Font-Bold="True"></ASP:Button></td>
    <td></td>
  </tr>
        </table>
            </td>
          </tr>
        </table>
      </asp:Panel>
      <asp:Panel ID="Panel_third_rebuttal" runat="server" Visible="false">
        <table  cellspacing="0" cellpadding="5" border="0" width="100%">
          <tr bgcolor="Gainsboro"><td><b>Acknowledgement by third</b></td></tr>
          <tr>
            <td>
        <table cellspacing="0" cellpadding="5" border="0">
  <tr>
    <td valign="top" align="right"><font class="">Final comments:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_third_rebuttal" runat="server" columns="72" textmode="MultiLine" rows="4" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_third_rebuttal" runat="server" errormessage="Please restrict the Final comments entry to 65535 characters." font-bold="True" controltovalidate="TextBox_third_rebuttal" validationexpression="^[\s\S]{0,65535}$">&lt;ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr id="TableRow_defaults_to_concur" runat="server" visible="false">
    <td></td>
    <td><small>If you leave this field empty, <asp:Literal ID="Literal_aplication_name" runat="server"></asp:Literal> will enter "Concur" on your behalf.</small></td>
    <td></td>
  </tr>
        </table>
            </td>
          </tr>
        </table>
      </asp:Panel>
    </td>
  </tr>
</table>
    <asp:Button ID="Button_lock_and_submit" runat="server" Text="LOCK AND SUBMIT" Font-Bold="True" Font-Italic="True" onclick="Button_lock_and_submit_Click" />
  </ContentTemplate>
</asp:UpdatePanel>
