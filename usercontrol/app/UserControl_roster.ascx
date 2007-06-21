<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_roster.pas" Inherits="UserControl_roster.TWebUserControl_roster"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
<div id="Div_print_area">
  <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
	<tr>
	  <td>
		<table cellspacing="0" cellpadding="10" width="100%" border="0">
		  <tr bgcolor="#f5f5f5">
			<td>
			  <table cellspacing="0" cellpadding="5" width="100%" align="right" border="0">
				<tr>
				  <td>
					<table cellspacing="0" cellpadding="0" width="100%" border="0">
						<tr>
						  <td><strong>Roster</strong>&nbsp; <uc1:UserControl_print_div id="UserControl_print_div" runat="server"></uc1:UserControl_print_div></td>
						  <td align="right"><ASP:LinkButton id="LinkButton_add_member" runat="server" font-bold="True" causesvalidation="False">Add member(s)</ASP:LinkButton></td>
						</tr>
					</table>
				  </td>
				</tr>
				<tr>
				  <td align="right">
						  <table cellspacing="0" cellpadding="0" border="1" bordercolor="#dcdcdc" align="center">
							  <tr>
								<td>
						  <table cellspacing="0" cellpadding="5" border="0" align="center">
					  <tr>
						<td><b><small>Filters:</small></b></td>
						<td id="TableData_agency_filter" runat="server"><p align="center"><small>Agency</small><br><ASP:DropDownList id="DropDownList_agency_filter" runat="server" autopostback="True"></ASP:DropDownList></td>
						<td id="TableData_section_filter" runat="server" nowrap="true">
									  <p align="center"><small>Section</small><br>
										<ASP:DropDownList id="DropDownList_section_filter" runat="server" autopostback="True">
										</ASP:DropDownList>
									  </p>
						</td>
						<td nowrap="true">
									  <p align="center">
						  <small>Med release level</small><br><ASP:DropDownList id="DropDownList_med_release_filter" runat="server" autopostback="True">
									  <ASP:ListItem value="all" selected="True">All</ASP:ListItem>
									  <ASP:ListItem value="not_released">- Not released</ASP:ListItem>
									  <ASP:ListItem value="none">- - None</ASP:ListItem>
									  <ASP:ListItem value="in_class">- - EMT Intern</ASP:ListItem>
									  <ASP:ListItem value="trainee">- - Trainee</ASP:ListItem>
									  <ASP:ListItem value="released">- Released</ASP:ListItem>
									  <ASP:ListItem value="emt_b">- - EMT-B</ASP:ListItem>
									  <ASP:ListItem value="emt_st">- - EMT-ST</ASP:ListItem>
									  <ASP:ListItem value="emt_e">- - EMT-E</ASP:ListItem>
									  <ASP:ListItem value="emt_ct">- - EMT-CT</ASP:ListItem>
									  <ASP:ListItem value="emt_i">- - EMT-I</ASP:ListItem>
									  <ASP:ListItem value="emt_p">- - EMT-P</ASP:ListItem></ASP:DropDownList>
									  </p>							</td>
						<td>
									  <p align="center"><small>Enrollment</small><br>
						  <asp:dropdownlist id="DropDownList_enrollment_filter" runat="server" autopostback="True" width="114px">
									  <ASP:ListItem value="all">All</ASP:ListItem>
									  <ASP:ListItem value="current" selected="True">- Current</ASP:ListItem>
									  <ASP:ListItem value="operational">- - Operational</ASP:ListItem>
									  <ASP:ListItem value="standard_ops">- - - CORE OPS</ASP:ListItem>
									  <ASP:ListItem value="tenured">- - - - Tenured</ASP:ListItem>
									  <ASP:ListItem value="life">- - - - Life</ASP:ListItem>
									  <ASP:ListItem value="regular">- - - - Regular</ASP:ListItem>
									  <ASP:ListItem value="reduced">- - - - Reduced</ASP:ListItem>
									  <ASP:ListItem value="associate">- - - - Associate</ASP:ListItem>
									  <ASP:ListItem value="atypical">- - - - Atypical</ASP:ListItem>
									  <ASP:ListItem value="new_trainee">- - - - New trainee</ASP:ListItem>
									  <ASP:ListItem value="specops">- - - Special ops</ASP:ListItem>
									  <ASP:ListItem value="applicant">- - Applicant</ASP:ListItem>
									  <ASP:ListItem value="recruit">- - Recruit</ASP:ListItem>
									  <ASP:ListItem value="admin">- - Admin</ASP:ListItem>
									  <ASP:ListItem value="transferring">- - Transferring</ASP:ListItem>
									  <ASP:ListItem value="suspended">- - Suspended</ASP:ListItem>
									  <ASP:ListItem value="past">- Past</ASP:ListItem>
									  <ASP:ListItem value="disengaged">- - Disengaged</ASP:ListItem>
									  <ASP:ListItem value="resigned">- - Resigned</ASP:ListItem>
									  <ASP:ListItem value="retired">- - Retired</ASP:ListItem>
									  <ASP:ListItem value="disabled">- - Disabled</ASP:ListItem>
									  <ASP:ListItem value="dismissed">- - Dismissed</ASP:ListItem>
									  <ASP:ListItem value="deceased">- Deceased</ASP:ListItem>
						  </asp:dropdownlist>
									  </p>
						</td>
						<td>
									  <p align="center">
						  <asp:label id="Label_leave_filter" runat="server"><small>Leave</small></asp:label><br>
								  <asp:dropdownlist id="DropDownList_leave_filter" runat="server" autopostback="True">
									<asp:listitem value="both" selected="true">Both</asp:listitem>
									<asp:listitem value="obligated">- Not on leave</asp:listitem>
									<asp:listitem value="on_leave">- On leave</asp:listitem>
								  </asp:dropdownlist>
									  </p>
						</td>
						<td nowrap="true" align="center" colspan="2">
						  <asp:radiobuttonlist id="RadioButtonList_which_month" runat="server" font-size="Smaller" autopostback="True">
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
								<td align="center" valign="middle"><small><asp:label id="Label_core_ops_commitment_factor" runat="server" font-bold="True" tooltip="Regular, Life, Tenured"></asp:label><br><ASP:Label id="Label_core_ops_commitment_caption" runat="server" tooltip="Regular, Life, Tenured">standard enrollment</ASP:Label></small></td>
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
								  <small>25th:</small><ASP:Label id="Label_percentile_25_value" runat="server"></ASP:Label>&nbsp;&nbsp;
								  <small>50th:</small><ASP:Label id="Label_median_value" runat="server" font-bold="True"></ASP:Label>&nbsp;&nbsp;
								  <small>75th:</small><ASP:Label id="Label_percentile_75_value" runat="server"></ASP:Label>
								  <br>years of service percentiles
								</small>
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
						<tr><td><small><em>Press Ctrl-F to search by name</em></small></td>
						  <td align="right"><a id="Anchor_quick_message_shortcut" runat="server">QuickMessage</a></td>
						</tr>
					</table>
				  <p></p>
				<asp:datagrid id="DataGrid_roster" runat="server" allowsorting="True" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="10" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px" font-size="X-Small"><HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                      <Columns>
                        <ASP:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/open_document16_h.png&quot; alt=&quot;Detail&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Select"></ASP:ButtonColumn>
                        <ASP:BoundColumn visible="False" datafield="member_id" readonly="True"></ASP:BoundColumn>
                        <ASP:BoundColumn datafield="last_name" sortexpression="last_name%, first_name asc, cad_num asc" readonly="True" headertext="Last name"></ASP:BoundColumn>
                        <ASP:BoundColumn datafield="first_name" sortexpression="first_name%, last_name asc, cad_num asc" readonly="True" headertext="First name"></ASP:BoundColumn>
                        <ASP:BoundColumn visible="False" datafield="cad_num" sortexpression="cad_num" readonly="True" headertext="CAD#">
                          <ItemStyle horizontalalign="Center"></ItemStyle>
                        </ASP:BoundColumn>
                        <ASP:BoundColumn datafield="agency" sortexpression="agency%, last_name asc, first_name asc, cad_num asc" readonly="True" headertext="Agency">
                          <ItemStyle horizontalalign="Center"></ItemStyle>
                        </ASP:BoundColumn>
                        <ASP:BoundColumn datafield="section_num" sortexpression="section_num%, last_name asc, first_name asc, cad_num asc" readonly="True" headertext="Section">
                          <ItemStyle horizontalalign="Center"></ItemStyle>
                        </ASP:BoundColumn>
                        <ASP:BoundColumn visible="False" datafield="medical_release_peck_code" readonly="True"></ASP:BoundColumn>
                        <ASP:BoundColumn datafield="medical_release_description" sortexpression="medical_release_code_description_map.pecking_order%, last_name asc, first_name asc, cad_num asc" readonly="True" headertext="Released med level">
                          <ItemStyle horizontalalign="Center"></ItemStyle>
                        </ASP:BoundColumn>
                        <ASP:BoundColumn datafield="be_driver_qualified" sortexpression="be_driver_qualified%, last_name asc, first_name asc, cad_num asc" readonly="True" headertext="Released driver">
                          <ItemStyle horizontalalign="Center"></ItemStyle>
                        </ASP:BoundColumn>
                        <ASP:BoundColumn datafield="enrollment" sortexpression="enrollment_level.pecking_order%, last_name asc, first_name asc, cad_num asc" readonly="True" headertext="Enrollment">
                          <ItemStyle horizontalalign="Center"></ItemStyle>
                        </ASP:BoundColumn>
                        <ASP:BoundColumn datafield="length_of_service" sortexpression="length_of_service%,last_name asc,first_name asc" readonly="True" headertext="Years of service" dataformatstring="{0:0.00}">
                          <ItemStyle horizontalalign="Center"></ItemStyle>
                        </ASP:BoundColumn>
                        <ASP:BoundColumn visible="False" datafield="core_ops_commitment_level_code" readonly="True"></ASP:BoundColumn>
                        <ASP:BoundColumn visible="False" datafield="enrollment_obligation" readonly="True"></ASP:BoundColumn>
                        <ASP:BoundColumn datafield="kind_of_leave" sortexpression="kind_of_leave%, last_name, first_name, cad_num" readonly="True" headertext="Leave">
                          <ItemStyle horizontalalign="Center"></ItemStyle>
                        </ASP:BoundColumn>
                        <ASP:BoundColumn datafield="obliged_shifts" sortexpression="obliged_shifts" readonly="True" headertext="Obliged shifts">
                          <ItemStyle horizontalalign="Center"></ItemStyle>
                        </ASP:BoundColumn>
                        <ASP:BoundColumn visible="False" datafield="email_address" readonly="True"></ASP:BoundColumn>
                      </Columns>
				</asp:datagrid>
			  </td>
			</tr>
		</table>
	  </td>
	</tr>
  </table>
</div>
<p></p>
<table id="Table_quick_message" runat="server" bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" width="100%" border="1">
  <tr>
	<td>
	  <table cellspacing="0" cellpadding="10" width="100%" border="0">
		  <tr><td bgcolor="#f5f5f5"><a id="QuickMessage"><strong>QuickMessage</strong></a></td>
		  </tr>
		  <tr>
			<td>
			  <table cellspacing="0" cellpadding="10" width="100%" border="0">
				  <tr>
					<td>To:</td>
					<td>The parties shown in the above filtered table (see below for resolution)</td>
					<td></td>
				  </tr>
				  <tr>
					<td>Bcc:</td>
					<td>
                        <ASP:Label id="Label_author_email_address" runat="server"></ASP:Label></td>
					<td></td>
				  </tr>
				  <tr>
					<td>Subject:</td>
					<td><ASP:TextBox id="TextBox_quick_message_subject" runat="server" maxlength="255" columns="72"></ASP:TextBox></td>
					<td></td>
				  </tr>
				  <tr>
					<td valign="top">Body:</td>
					<td><ASP:TextBox id="TextBox_quick_message_body" runat="server" columns="72" rows="18" textmode="MultiLine"></ASP:TextBox></td>
					<td nowrap="true" valign="top"><ASP:RequiredFieldValidator id="RequiredFieldValidator_quick_message_body" runat="server" errormessage="Please enter a message body." font-bold="True" controltovalidate="TextBox_quick_message_body">!ERR!</ASP:RequiredFieldValidator></td>
				  </tr>
				  <tr>
					<td></td>
					<td><ASP:Button id="Button_send" runat="server" text="Send"></ASP:Button></td>
					<td></td>
				  </tr>
				  <tr><td valign="top"><small><font color="#c0c0c0">Resolves to:</small></font></td><td valign="top"><small><ASP:Label id="Label_distribution_list" runat="server" forecolor="Silver"></ASP:Label></small></td>
					<td></td>
				  </tr>
			  </table></td>
		  </tr>
	  </table></td>
  </tr>
</table>
