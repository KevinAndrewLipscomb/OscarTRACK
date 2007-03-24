<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="squad_commander_overview.pas" AutoEventWireup="false" Inherits="squad_commander_overview.TWebForm_squad_commander_overview" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title id="Title" runat="server"></title>
    <!-- $Id$ -->
  </head>
  <body>
	<form runat="server">
	  <asp:placeholder id="PlaceHolder_precontent" runat="server"></asp:placeholder>
	  <p>
		  <table cellspacing="0" cellpadding="0" width="100%" border="0">
			  <tr>
				<td><small>[
				  <ASP:LinkButton id="LinkButton_logout" runat="server" causesvalidation="False">Logout</ASP:LinkButton>&nbsp;]
															     [ Change your <asp:LinkButton id="LinkButton_change_password" runat="server">password</asp:LinkButton>&nbsp;
			|
			<asp:LinkButton id="LinkButton_change_email_address" runat="server">email address</asp:LinkButton>&nbsp;]</small></td>
				<td align="right"><uc1:UserControl_print_div id="UserControl_print_div" runat="server"></uc1:UserControl_print_div></td>
			  </tr>
		  </table>
	  </p>
	  <p>
	<div id="Div_print_area">
	  <asp:label id="Label_agency_name" runat="server" font-bold="True" font-size="Large"></asp:label>
          <p></p>
	  <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
		<tr>
		  <td>
			<table cellspacing="0" cellpadding="10" width="100%" border="0">
			  <tr bgcolor="#f5f5f5">
				<td>
				  <table cellspacing="0" cellpadding="5" width="100%" align="right" border="0">
					<tr>
					  <td>
						<strong>
								<table cellspacing="0" cellpadding="0" width="100%" border="0">
									<tr>
									  <td><strong>Roster</strong></td>
									  <td align="right"><ASP:LinkButton id="LinkButton_add_member" runat="server" font-bold="True">Add member(s)</ASP:LinkButton></td>
									</tr>
								</table></strong>
					  </td>
					</tr>
					<tr>
					  <td align="right">
							  <table cellspacing="0" cellpadding="5" border="0">
						  <tr>
									<td nowrap="true">Enrollment filter:
									  <asp:dropdownlist id="DropDownList_enrollment_filter" runat="server" autopostback="True">
										<asp:listitem value="all">All</asp:listitem>
										<asp:listitem value="current" selected="true">- Current</asp:listitem>
										<asp:listitem value="operational">- - Operational</asp:listitem>
										<asp:listitem value="tenured">- - - Tenured</asp:listitem>
										<asp:listitem value="life">- - - Life</asp:listitem>
										<asp:listitem value="regular">- - - Regular</asp:listitem>
										<asp:listitem value="reduced">- - - Reduced</asp:listitem>
										<asp:listitem value="associate">- - - Associate</asp:listitem>
										<asp:listitem value="special">- - - Special</asp:listitem>
										<asp:listitem value="recruit">- - Recruit</asp:listitem>
										<asp:listitem value="admin">- - Admin</asp:listitem>
										<asp:listitem value="past">- Past</asp:listitem>
										<asp:listitem value="lost_interest">- - Lost interest</asp:listitem>
										<asp:listitem value="resigned">- - Resigned</asp:listitem>
										<asp:listitem value="retired">- - Retired</asp:listitem>
										<asp:listitem value="disabled">- - Disabled</asp:listitem>
										<asp:listitem value="expelled">- - Expelled</asp:listitem>
										<asp:listitem value="deceased">- Deceased</asp:listitem>
									  </asp:dropdownlist></td>
							<td nowrap="true"><asp:label id="Label_leave_filter" runat="server">Leave filter:&nbsp;</asp:label>
									  <asp:dropdownlist id="DropDownList_leave_filter" runat="server" autopostback="True">
										<asp:listitem value="both" selected="true">Both</asp:listitem>
										<asp:listitem value="obligated">- Not on leave</asp:listitem>
										<asp:listitem value="on_leave">- On leave</asp:listitem>
									  </asp:dropdownlist>
							</td>
									<td nowrap="true" align="center" colspan="2">
									  <asp:radiobuttonlist id="RadioButtonList_which_month" runat="server" font-size="Smaller" autopostback="True">
										<ASP:ListItem value="0" selected="True">This&nbsp;month</ASP:ListItem>
										<ASP:ListItem value="1">Next&nbsp;month</ASP:ListItem>
									  </asp:radiobuttonlist></td>
						  </tr>
							  </table>
					  </td>
					</tr>
					<tr>
					  <td>
							  <table cellspacing="0" cellpadding="0" width="100%" border="0">
								  <tr>
									<td valign="middle"><asp:label id="Label_num_rows" runat="server" font-bold="True"></asp:label>&nbsp;members meet these criteria</td>
									<td>&nbsp;&nbsp;&nbsp;</td>
									<td align="center" valign="middle"><ASP:Label id="Label_utilization" runat="server" font-bold="True"></ASP:Label><ASP:Label id="Label_utilization_caption" runat="server"> utilization</ASP:Label></td>
									<td>&nbsp;&nbsp;&nbsp;</td>
									<td align="right" valign="middle"><ASP:Label id="Label_num_crew_shifts" runat="server" font-bold="True"></ASP:Label>&nbsp;crew-shifts</td>
								  </tr>
							  </table></td>
					</tr>
				  </table>
				</td>
			  </tr>
				<tr id="TableRow_none" runat="server">
				  <td>
					<p></p><em>--&nbsp;NONE&nbsp;--</em>
				  </td>
				</tr>
				<tr>
				  <td>
					<asp:datagrid id="DataGrid_roster" runat="server" allowsorting="True" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="10" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px">
                            <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                            <Columns>
                              <ASP:BoundColumn visible="False" datafield="member_id" readonly="True"></ASP:BoundColumn>
                              <ASP:BoundColumn datafield="last_name" sortexpression="last_name%, first_name asc, cad_num asc" readonly="True" headertext="Last name"></ASP:BoundColumn>
                              <ASP:BoundColumn datafield="first_name" sortexpression="first_name%, last_name asc, cad_num asc" readonly="True" headertext="First name"></ASP:BoundColumn>
                              <ASP:BoundColumn datafield="cad_num" sortexpression="cad_num" readonly="True" headertext="CAD#">
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
                              <ASP:BoundColumn visible="False" datafield="enrollment_obligation" readonly="True"></ASP:BoundColumn>
                              <ASP:BoundColumn datafield="kind_of_leave" sortexpression="kind_of_leave%, last_name, first_name, cad_num" readonly="True" headertext="Leave">
                                <ItemStyle horizontalalign="Center"></ItemStyle>
                              </ASP:BoundColumn>
                              <ASP:BoundColumn datafield="obliged_shifts" sortexpression="obliged_shifts" readonly="True" headertext="Obliged shifts">
                                <ItemStyle horizontalalign="Center"></ItemStyle>
                              </ASP:BoundColumn>
                              <ASP:ButtonColumn text="Detail"></ASP:ButtonColumn>
                            </Columns>
					</asp:datagrid>
				  </td>
				</tr>
			</table>
		  </td>
		</tr>
	  </table>
	  <asp:placeholder id="PlaceHolder_postcontent" runat="server"></asp:placeholder>
	  <sstchur:smartscroller runat="server"></sstchur:smartscroller>
          <p></p>
          <p></p></p>
	</form></div>
  </body>
</html>
