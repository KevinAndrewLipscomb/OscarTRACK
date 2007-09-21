<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="enrollment_detail.pas" AutoEventWireup="false" Inherits="enrollment_detail.TWebForm_enrollment_detail" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
	<title id="Title" runat="server"></title>
      <!-- $Id$ -->
  </head>

  <body>
	 <form runat="server">
	 <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
<div id="Div_print_area">
		<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
			<tr>
			  <td>
				<table cellspacing="0" cellpadding="10" border="0">
					<tr>
					  <td bgcolor="#f5f5f5"><strong>
						  <table cellspacing="0" cellpadding="5" width="100%" border="0">
							  <tr><td>
<strong>Membership status details for
									<ASP:Label id="Label_member_designator" runat="server"></ASP:Label></strong></td><td>	 <uc1:UserControl_print_div id="UserControl_print_div" runat="server"></uc1:UserControl_print_div></td>
							  </tr>
						  </table></strong></td>
					</tr>
					<tr id="TableRow_none" runat="server">
					  <td><em>--&nbsp;NONE&nbsp;--</em></td>
					</tr>
					<tr>
					  <td>
                          <p><ASP:LinkButton id="LinkButton_add_new_enrollment_status" runat="server">[Add&nbsp;a&nbsp;new&nbsp;status]</ASP:LinkButton></p>
                          <p>
						<ASP:DataGrid id="DataGrid_member_history" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="10" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px">
						  <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
						  <Columns>
							<ASP:BoundColumn visible="False" datafield="id" readonly="True"></ASP:BoundColumn>
							<ASP:BoundColumn datafield="start_date" sortexpression="start_date" readonly="True" headertext="Date (yyyy-mm-dd)">
							  <ItemStyle horizontalalign="Center"></ItemStyle>
							</ASP:BoundColumn>
							<ASP:BoundColumn datafield="description" sortexpression="description" readonly="True" headertext="Level">
							  <ItemStyle horizontalalign="Center"></ItemStyle>
							</ASP:BoundColumn>
							<ASP:BoundColumn datafield="note" sortexpression="note%" readonly="True" headertext="Note">
							  <HeaderStyle horizontalalign="Left"></HeaderStyle>
							  <ItemStyle horizontalalign="Left"></ItemStyle>
							</ASP:BoundColumn>
						  </Columns></ASP:DataGrid></p></td>
					</tr>
				</table></td>
			</tr>
		</table>
	  <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent></div>
	 <p><sstchur:SmartScroller runat="server" /></p></form>
  </body>
</html>
