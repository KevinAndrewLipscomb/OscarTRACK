<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_roster.ascx.cs" Inherits="UserControl_roster.TWebUserControl_roster"%>
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" width="100%" border="0">
        <tr bgcolor="#f5f5f5">
          <td>
            <table cellspacing="0" cellpadding="5" width="100%" align="right" border="0">
              <tr>
                <td align="right"><ASP:LinkButton id="LinkButton_add_member" runat="server" font-bold="True" causesvalidation="False" onclick="LinkButton_add_member_Click">Add member(s)</ASP:LinkButton></td>
              </tr>
              <tr>
                <td>
                        <table cellspacing="0" cellpadding="0" border="1" bordercolor="#dcdcdc">
                            <tr>
                              <td align="left">
                        <table cellspacing="0" cellpadding="5" border="0" align="center">
                    <tr>
                      <td><b><small>Filters:</small></b></td>
                      <td id="TableData_agency_filter" runat="server"><p align="center"><small>Agency</small><br><ASP:DropDownList id="DropDownList_agency_filter" runat="server" autopostback="True" onselectedindexchanged="DropDownList_agency_filter_SelectedIndexChanged"></ASP:DropDownList></td>
                      <td id="TableData_section_filter" runat="server" nowrap="true">
                                    <p align="center"><small>Section</small><br>
                                      <ASP:DropDownList id="DropDownList_section_filter" runat="server" autopostback="True" onselectedindexchanged="DropDownList_section_filter_SelectedIndexChanged">
                                      </ASP:DropDownList>
                                    </p>
                      </td>
                      <td nowrap="true">
                                    <p align="center">
                        <small>Released cert level</small><br><ASP:DropDownList id="DropDownList_med_release_filter" runat="server" autopostback="True" onselectedindexchanged="DropDownList_med_release_filter_SelectedIndexChanged">
                                    <ASP:ListItem value="all" selected="True">All</ASP:ListItem>
                                    <ASP:ListItem value="not_released"  >- Not released</ASP:ListItem>
                                    <ASP:ListItem value="none"          >- - None</ASP:ListItem>
                                    <ASP:ListItem value="in_class"      >- - Student</ASP:ListItem>
                                    <ASP:ListItem value="test_candidate">- - Test Candidate</ASP:ListItem>
                                    <ASP:ListItem value="trainee"       >- - BLS Intern</ASP:ListItem>
                                    <ASP:ListItem value="released"      >- Released</ASP:ListItem>
                                    <ASP:ListItem value="released_bls"  >- - Released BLS</ASP:ListItem>
                                    <ASP:ListItem value="emt_b"         >- - - EMT-B</ASP:ListItem>
                                    <ASP:ListItem value="emt_st"        >- - - EMT-ST</ASP:ListItem>
                                    <ASP:ListItem value="emt_e"         >- - - EMT-E</ASP:ListItem>
                                    <ASP:ListItem value="aemt"          >- - - AEMT</ASP:ListItem>
                                    <ASP:ListItem value="released_als"  >- - Released ALS</ASP:ListItem>
                                    <ASP:ListItem value="emt_ct"        >- - - EMT-CT</ASP:ListItem>
                                    <ASP:ListItem value="emt_i"         >- - - EMT-I</ASP:ListItem>
                                    <ASP:ListItem value="emt_p_any"     >- - - EMT-P (inclusive)</ASP:ListItem>
                                    <ASP:ListItem value="emt_p"         >- - - - EMT-P (non-RSI)</ASP:ListItem>
                                    <ASP:ListItem value="emt_p_rsi"     >- - - - EMT-P-RSI</ASP:ListItem>
                                    <ASP:ListItem value="physician"     >- - - Physician</ASP:ListItem></ASP:DropDownList>
                                    </p>
                      </td>
                      <td>
                                    <p align="center"><small>Membership status</small><br>
                        <asp:dropdownlist id="DropDownList_enrollment_filter" runat="server" autopostback="True" width="114px" onselectedindexchanged="DropDownList_enrollment_filter_SelectedIndexChanged">
                                    <ASP:ListItem value="all">All</ASP:ListItem>
                                    <ASP:ListItem value="current" selected="True">- Current</ASP:ListItem>
                                    <ASP:ListItem value="operational"            >- - Operational</ASP:ListItem>
                                    <ASP:ListItem value="core_ops"               >- - - CORE OPS</ASP:ListItem>
                                    <ASP:ListItem value="standard"               >- - - - Standard</ASP:ListItem>
                                    <ASP:ListItem value="tenured_als"            >- - - - - Tenured ALS</ASP:ListItem>
                                    <ASP:ListItem value="tenured_bls"            >- - - - - Tenured BLS</ASP:ListItem>
                                    <ASP:ListItem value="senior"                 >- - - - - Senior</ASP:ListItem>
                                    <ASP:ListItem value="life"                   >- - - - - Life</ASP:ListItem>
                                    <ASP:ListItem value="regular"                >- - - - - Regular</ASP:ListItem>
                                    <ASP:ListItem value="edp"                    >- - - - - EDP</ASP:ListItem>
                                    <ASP:ListItem value="liberal"                >- - - - Liberal</ASP:ListItem>
                                    <ASP:ListItem value="reduced"                >- - - - - Reduced</ASP:ListItem>
                                    <ASP:ListItem value="associate"              >- - - - - Associate</ASP:ListItem>
                                    <ASP:ListItem value="staff"                  >- - - - - Staff</ASP:ListItem>
                                    <ASP:ListItem value="als_intern"             >- - - - - ALS Intern</ASP:ListItem>
                                    <ASP:ListItem value="college"                >- - - - - College</ASP:ListItem>
                                    <ASP:ListItem value="atypical"               >- - - - - Atypical</ASP:ListItem>
                                    <ASP:ListItem value="specops"                >- - - Special ops</ASP:ListItem>
                                    <ASP:ListItem value="applicant"              >- - Applicant</ASP:ListItem>
                                    <ASP:ListItem value="recruit"                >- - Recruit</ASP:ListItem>
                                    <ASP:ListItem value="admin"                  >- - Admin</ASP:ListItem>
                                    <ASP:ListItem value="transferring"           >- - Transferring</ASP:ListItem>
                                    <ASP:ListItem value="suspended"              >- - Suspended</ASP:ListItem>
                                    <ASP:ListItem value="past"                   >- Past</ASP:ListItem>
                                    <ASP:ListItem value="withdrew_application"   >- - Withdrew application</ASP:ListItem>
                                    <ASP:ListItem value="unknown"                >- - Unknown</ASP:ListItem>
                                    <ASP:ListItem value="resigned"               >- - Resigned</ASP:ListItem>
                                    <ASP:ListItem value="retired"                >- - Retired</ASP:ListItem>
                                    <ASP:ListItem value="disabled"               >- - Disabled</ASP:ListItem>
                                    <ASP:ListItem value="dismissed"              >- - Dismissed</ASP:ListItem>
                                    <ASP:ListItem value="deceased"               >- - Deceased</ASP:ListItem>
                        </asp:dropdownlist>
                                    </p>
                      </td>
                      <td>
                                    <p align="center">
                        <asp:label id="Label_leave_filter" runat="server"><small>Leave/reduction</small></asp:label><br/>
                                <asp:dropdownlist id="DropDownList_leave_filter" runat="server" autopostback="True" onselectedindexchanged="DropDownList_leave_filter_SelectedIndexChanged">
                                  <asp:listitem value="both" selected="true">Both</asp:listitem>
                                  <asp:listitem value="obligated">- Not on leave/reduction</asp:listitem>
                                  <asp:listitem value="on_leave">- On leave/reduction</asp:listitem>
                                </asp:dropdownlist>
                                    </p>
                      </td>
                      <td>
                        <asp:CheckBox id="CheckBox_running_only" runat="server" autopostback="True" oncheckedchanged="CheckBox_running_only_CheckedChanged" Text="Hide 0 duties" font-size="Smaller"></asp:CheckBox>
                        <br />
                        <asp:CheckBox id="CheckBox_hide_staff" runat="server" autopostback="True" oncheckedchanged="CheckBox_hide_staff_CheckedChanged" Text="Hide Staff" font-size="Smaller"></asp:CheckBox>
                      </td>
                      <td nowrap="true" align="left" colspan="2">
                        <asp:radiobuttonlist id="RadioButtonList_which_month" runat="server" font-size="Smaller" autopostback="True" onselectedindexchanged="RadioButtonList_which_month_SelectedIndexChanged">
                          <ASP:ListItem value="0" selected="True">This&nbsp;month</ASP:ListItem>
                          <ASP:ListItem value="1">Next&nbsp;month</ASP:ListItem>
                        </asp:radiobuttonlist>
                      </td>
                    </tr>
                        </table>
                        <table cellspacing="0" cellpadding="5" width="100%" border="0" align="center">
                            <tr>
                              <td align="center" valign="middle"><small><asp:label id="Label_num_rows" runat="server" font-bold="True"></asp:label><br>members</small></td>
                              <td>&nbsp;&nbsp;&nbsp;</td>
                              <td align="center" valign="middle"><small><asp:label id="Label_core_ops_commitment_factor" runat="server" font-bold="True" tooltip="Regular, Life, Senior, Tenured BLS, Tenured ALS, EDP"></asp:label><br><ASP:Label id="Label_core_ops_commitment_caption" runat="server" tooltip="Regular, Life, Senior">standard enrollment</ASP:Label></small></td>
                              <td>&nbsp;&nbsp;&nbsp;</td>
                              <td align="center" valign="middle"><small><ASP:Label id="Label_utilization" runat="server" font-bold="True"></ASP:Label><br><ASP:Label id="Label_utilization_caption" runat="server"> utilization</ASP:Label></small></td>
                              <td>&nbsp;&nbsp;&nbsp;</td>
                              <td align="center" valign="middle"><small><ASP:Label id="Label_num_crew_shifts" runat="server" font-bold="True"></ASP:Label><br>crew-shifts</small></td>
                            </tr>
                        </table>
                        <table cellspacing="0" cellpadding="5" align="center" border="0" id="Table_years_of_service_percentiles" runat="Server">
                          <tr>
                            <td align="center">
                              <small>
                                <small>25th:</small><ASP:Label id="Label_percentile_25_value" runat="server"></ASP:Label>&nbsp;&nbsp; <small>50th:</small><ASP:Label id="Label_median_value" runat="server" font-bold="True"></ASP:Label>&nbsp;&nbsp; <small>75th:</small><ASP:Label id="Label_percentile_75_value" runat="server"></ASP:Label>
                                <br>years of service percentiles </small>
                            </td>
                          </tr>
                        </table>
                        </td>
                            </tr>
                        </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
          <tr id="TableRow_none" runat="server">
            <td>
              <p></p><em>--&nbsp;NONE&nbsp;--</em>
            </td>
          </tr>
          <tr id="TableRow_data" runat="server">
            <td>
              <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                <tr>
                  <td><small><em>Press Ctrl-F to search by name</em></small></td>
                  <td><asp:CheckBox id="CheckBox_phone_list" runat="server" autopostback="True" text="&lt;small&gt;Phone list&lt;/small&gt;" oncheckedchanged="CheckBox_phone_list_CheckedChanged"></asp:CheckBox></td>
                  <td align="right"><small><a id="Anchor_quick_message_shortcut" runat="server">QuickMessage</a></small></td>
                </tr>
              </table>
                <p></p>
              <asp:datagrid id="R" runat="server" allowsorting="True" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="10" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px" font-size="Small">
                  <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                  <Columns>
                    <ASP:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/open_document16_h.png&quot; alt=&quot;Detail&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Select"></ASP:ButtonColumn>
                    <ASP:BoundColumn visible="False" datafield="member_id" readonly="True"></ASP:BoundColumn>
                    <ASP:BoundColumn datafield="last_name" sortexpression="last_name%,first_name,cad_num" readonly="True" headertext="Last name"></ASP:BoundColumn>
                    <ASP:BoundColumn datafield="first_name" sortexpression="first_name%,last_name,cad_num" readonly="True" headertext="First name"></ASP:BoundColumn>
                    <ASP:BoundColumn visible="False" datafield="cad_num" sortexpression="cad_num" readonly="True" headertext="CAD#">
                      <ItemStyle horizontalalign="Center"></ItemStyle>
                    </ASP:BoundColumn>
                    <ASP:BoundColumn datafield="agency" sortexpression="agency%,last_name,first_name,cad_num" readonly="True" headertext="Agency">
                      <ItemStyle horizontalalign="Center"></ItemStyle>
                    </ASP:BoundColumn>
                    <ASP:BoundColumn datafield="section_num" sortexpression="section_num%,last_name,first_name,cad_num" readonly="True" headertext="Section">
                      <ItemStyle horizontalalign="Center"></ItemStyle>
                    </ASP:BoundColumn>
                    <ASP:BoundColumn visible="False" datafield="medical_release_peck_code" readonly="True"></ASP:BoundColumn>
                    <ASP:BoundColumn datafield="medical_release_description" sortexpression="medical_release_code_description_map.pecking_order%,last_name,first_name,cad_num" readonly="True" headertext="Released cert level">
                      <ItemStyle horizontalalign="Center"></ItemStyle>
                    </ASP:BoundColumn>
                    <ASP:BoundColumn datafield="be_driver_qualified" sortexpression="be_driver_qualified%,last_name,first_name,cad_num" readonly="True" headertext="Released driver">
                      <ItemStyle horizontalalign="Center"></ItemStyle>
                    </ASP:BoundColumn>
                    <ASP:BoundColumn datafield="enrollment" sortexpression="enrollment_level.pecking_order%,last_name,first_name,cad_num" readonly="True" headertext="Membership status">
                      <ItemStyle horizontalalign="Center"></ItemStyle>
                    </ASP:BoundColumn>
                    <ASP:BoundColumn datafield="length_of_service" sortexpression="length_of_service%,last_name,first_name,cad_num" readonly="True" headertext="Years of service" dataformatstring="{0:0.00}">
                      <ItemStyle horizontalalign="Center"></ItemStyle>
                    </ASP:BoundColumn>
                    <ASP:BoundColumn visible="False" datafield="core_ops_commitment_level_code" readonly="True"></ASP:BoundColumn>
                    <ASP:BoundColumn visible="False" datafield="enrollment_obligation" readonly="True"></ASP:BoundColumn>
                    <ASP:BoundColumn datafield="kind_of_leave" sortexpression="kind_of_leave%,last_name,first_name,cad_num" readonly="True" headertext="Leave/reduction">
                      <ItemStyle horizontalalign="Center"></ItemStyle>
                    </ASP:BoundColumn>
                    <ASP:BoundColumn datafield="obliged_shifts" sortexpression="obliged_shifts%,last_name,first_name,cad_num" readonly="True" headertext="Duties required">
                      <ItemStyle horizontalalign="Center"></ItemStyle>
                    </ASP:BoundColumn>
                    <ASP:BoundColumn visible="False" datafield="email_address" readonly="True"></ASP:BoundColumn>
                    <ASP:BoundColumn datafield="phone_num" sortexpression="phone_num%,last_name,first_name,cad_num" readonly="True" headertext="Phone #">
                      <ItemStyle horizontalalign="Left"></ItemStyle>
                    </ASP:BoundColumn>
                    <asp:BoundColumn visible="false" datafield="sms_target" readonly="true"></asp:BoundColumn>
                  </Columns>
              </asp:datagrid>
            </td>
          </tr>
      </table>
    </td>
  </tr></table>
<p></p>
<table id="Table_quick_message" runat="server" bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" width="100%" border="1">
  <tr>
	<td>
	  <table cellspacing="0" cellpadding="10" width="100%" border="0">
      <tr>
        <td bgcolor="#f5f5f5">
          <table width="100%">
            <tr>
              <td><a id="QuickMessage"><strong>QuickMessage</strong></a></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
              <td align="right">
                <asp:RadioButtonList ID="RadioButtonList_quick_message_mode" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" onselectedindexchanged="RadioButtonList_quick_message_mode_SelectedIndexChanged">
                  <asp:ListItem Selected="True" Value="email">Email</asp:ListItem>
                  <asp:ListItem Value="sms">SMS</asp:ListItem>
                </asp:RadioButtonList>
              </td>
              <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_quick_message_mode" runat="server" ErrorMessage="Please select a QuickMessage mode (Email or SMS)." Text="!ERR!" Font-Bold="True" ControlToValidate="RadioButtonList_quick_message_mode"></asp:RequiredFieldValidator>
              </td>
            </tr>
          </table>
        </td>
      </tr>
		  <tr>
			<td>
			  <table cellspacing="0" cellpadding="10" width="100%" border="0">
				  <tr>
          <td>Send <asp:Literal ID="Literal_quick_message_kind_email" runat="server">email</asp:Literal><asp:Literal ID="Literal_quick_message_kind_sms" runat="server" Visible="false">SMS</asp:Literal> to:</td>
					<td>The parties shown in the above filtered table (see below for resolution)</td>
					<td></td>
				  </tr>
				  <tr>
					<td>Bcc:</td>
          <td><ASP:Literal id="Literal_author_target" runat="server"></ASP:Literal></td>
					<td></td>
				  </tr>
          <tr id="TableRow_reply_to" runat="server">
            <td>Reply-to:</td>
            <td>
              <asp:RadioButtonList ID="RadioButtonList_reply_to" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True" Value="email">My email</asp:ListItem>
                <asp:ListItem Value="phone">My phone</asp:ListItem>
                <asp:ListItem Value="bouncer">BOUNCER</asp:ListItem>
              </asp:RadioButtonList>
            </td>
            <td>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator_reply_to" runat="server" ControlToValidate="RadioButtonList_reply_to" Display="Dynamic" ErrorMessage="Please specify a Reply-to target." Font-Bold="True">!ERR!</asp:RequiredFieldValidator>
            </td>
          </tr>
				  <tr id="TableRow_subject" runat="server">
					<td>Subject:</td>
					<td><ASP:TextBox id="TextBox_quick_message_subject" runat="server" maxlength="255" columns="72"></ASP:TextBox></td>
					<td></td>
				  </tr>
				  <tr>
					<td valign="top">Message:</td>
					<td><ASP:TextBox id="TextBox_quick_message_body" runat="server" columns="72" rows="18" textmode="MultiLine"></ASP:TextBox></td>
					<td nowrap="true" valign="top"><ASP:RequiredFieldValidator id="RequiredFieldValidator_quick_message_body" runat="server" errormessage="Please enter a message body." font-bold="True" controltovalidate="TextBox_quick_message_body">!ERR!</ASP:RequiredFieldValidator></td>
				  </tr>
				  <tr>
					<td></td>
					<td><ASP:Button id="Button_send" runat="server" text="Send" onclick="Button_send_Click"></ASP:Button></td>
					<td></td>
				  </tr>
				  <tr>
            <td valign="top"><small><font color="#c0c0c0">Resolves to:</font></small></td>
            <td valign="top"><small><ASP:Label id="Label_distribution_list" runat="server" forecolor="Silver" EnableViewState="false"></ASP:Label></small>
            </td>
					  <td></td>
				  </tr>
          <tr>
            <td></td>
            <td><asp:Button ID="Button_download_distribution_list" runat="server" Text="Download above email addresses" CausesValidation="False" OnClick="Button_download_distribution_list_Click" UseSubmitBehavior="False" /></td>
            <td></td>
          </tr>
			  </table>
            </td>
		  </tr>
	  </table>
    </td>
  </tr>
</table>
