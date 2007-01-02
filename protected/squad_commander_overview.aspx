<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="squad_commander_overview.pas" AutoEventWireup="false" Inherits="squad_commander_overview.TWebForm_squad_commander_overview" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
	<title id="Title" runat="server"></title>
	<!-- $Id$ -->
  </head>

  <body>
	 <form runat="server">
	  <p>
	  <asp:placeholder id="PlaceHolder_precontent" runat="server">
	  </asp:placeholder></p>
	  <p><small>[
		  <ASP:LinkButton id="LinkButton_logout" runat="server" causesvalidation="False">Logout</ASP:LinkButton>&nbsp;] [ Change your
		<asp:LinkButton id="LinkButton_change_password" runat="server">password</asp:LinkButton>
		|
		<asp:LinkButton id="LinkButton_change_email_address" runat="server">email address</asp:LinkButton>&nbsp;]
	  </small></p>
<p>
		<ASP:Label id="Label_agency_name" runat="server" font-bold="True" font-size="Large"></ASP:Label></p>
<p>
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
            <tr>
              <td>
                <table cellspacing="0" cellpadding="10" width="100%" border="0">
                    <tr bgcolor="#f5f5f5">
					  <td>
					   <table cellspacing="0" cellpadding="5" width="100%" align="right" border="0">
						  <tr><td><strong>Roster</strong>
						  </td>
						</tr>
						<tr>
						  <td>
												<table cellspacing="0" cellpadding="5" border="0" align="right">
												  <tr>
													<td nowrap="true">Enrollment filter:
                                        <ASP:DropDownList id="DropDownList_filter" runat="server">
                                          <ASP:ListItem value="all">All</ASP:ListItem>
                                          <ASP:ListItem value="current" selected="True">- Current</ASP:ListItem>
                                          <ASP:ListItem value="operational">- - Operational</ASP:ListItem>
                                          <ASP:ListItem value="associate">- - - Associate</ASP:ListItem>
                                          <ASP:ListItem value="regular">- - - Regular</ASP:ListItem>
                                          <ASP:ListItem value="life">- - - Life</ASP:ListItem>
                                          <ASP:ListItem value="tenured">- - - Tenured</ASP:ListItem>
                                          <ASP:ListItem value="special">- - - Special</ASP:ListItem>
                                          <ASP:ListItem value="admin">- - Admin</ASP:ListItem>
                                          <ASP:ListItem value="past">- Past</ASP:ListItem>
                                          <ASP:ListItem value="lost_interest">- - Lost interest</ASP:ListItem>
                                          <ASP:ListItem value="resigned">- - Resigned</ASP:ListItem>
                                          <ASP:ListItem value="retired">- - Retired</ASP:ListItem>
                                          <ASP:ListItem value="disabled">- - Disabled</ASP:ListItem>
                                          <ASP:ListItem value="expelled">- - Expelled</ASP:ListItem>
                                          <ASP:ListItem value="deceased">- Deceased</ASP:ListItem>
                                        </ASP:DropDownList></td>
													<td nowrap="true">
													  <ASP:Label id="Label_leave_filter" runat="server" enabled="False">Leave filter:</ASP:Label>
													  <ASP:DropDownList id="DropDownList1" runat="server" enabled="False">
                                          <ASP:ListItem value="0" selected="True">--</ASP:ListItem>
                                          <ASP:ListItem value="both">Both</ASP:ListItem>
                                          <ASP:ListItem value="obligated">- Not on leave</ASP:ListItem>
                                          <ASP:ListItem value="on_leave">- On leave</ASP:ListItem>
													  </ASP:DropDownList></td>
												  </tr>
											  </table>
							</td>
						</tr>
					</table>
				  </td>
					</tr>
					<tr id="TableRow_none" runat="server">
					  <td><em>--&nbsp;NONE&nbsp;--</em></td>
					</tr>
					<tr>
					  <td>
						<ASP:DataGrid id="DataGrid_roster" runat="server" allowsorting="True" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="10" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px">
                          <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                          <Columns>
                            <ASP:BoundColumn datafield="last_name" sortexpression="last_name%, first_name asc, cad_num asc" readonly="True" headertext="Last name"></ASP:BoundColumn>
                            <ASP:BoundColumn datafield="first_name" sortexpression="first_name%, last_name asc, cad_num asc" readonly="True" headertext="First name"></ASP:BoundColumn>
                            <ASP:BoundColumn datafield="cad_num" sortexpression="cad_num" readonly="True" headertext="CAD#"></ASP:BoundColumn>
                            <ASP:BoundColumn datafield="medical_release_description" sortexpression="medical_release_code_description_map.pecking_order%, last_name asc, first_name asc, cad_num asc" readonly="True" headertext="Released med level"></ASP:BoundColumn>
                            <ASP:BoundColumn datafield="be_driver_qualified" sortexpression="be_driver_qualified%, last_name asc, first_name asc, cad_num asc" readonly="True" headertext="Released driver">
                              <ItemStyle horizontalalign="Center"></ItemStyle>
                            </ASP:BoundColumn>
                            <ASP:BoundColumn datafield="enrollment" sortexpression="obligation_code_description_map.pecking_order%, last_name asc, first_name asc, cad_num asc" readonly="True" headertext="Enrollment"></ASP:BoundColumn>
                            <ASP:TemplateColumn sortexpression="leave_status%, last_name asc, first_name asc, cad_num asc" headertext="Leave">
                              <ItemTemplate><table cellspacing="0" cellpadding="0" width="100%" border="0"><tr><td>
                <div align="center"><asp:Label id="Label_kind_of_leave" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.kind_of_leave") %>'></asp:Label>
                </div></td></tr><tr><td>
                <div align="center"><ASP:Label id="Label_months" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.time_of_leave") %>' font-italic="True"></ASP:Label>
                </div></td></tr></table>
                              </ItemTemplate>
                            </ASP:TemplateColumn>
                          </Columns>
						</ASP:DataGrid></td>
					</tr>
				</table></td>
			</tr>
		</table></p>
<p></p>
    <asp:placeholder id="PlaceHolder_postcontent" runat="server">
    </asp:placeholder>
     <sstchur:SmartScroller runat="server" /></form>
  </body>
</html>
