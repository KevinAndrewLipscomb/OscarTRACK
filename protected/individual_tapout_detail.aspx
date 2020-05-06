<!DOCTYPE html>
<%@ Page language="c#" codebehind="individual_tapout_detail.aspx.cs" AutoEventWireup="True" Inherits="individual_tapout_detail.TWebForm_individual_tapout_detail" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<html>
  <head runat="server">
    <title></title>
    <!-- $Id$ -->
  </head>
  <body bgcolor="white">
	 <form runat="server">
	 <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
		<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
			<tr>
			  <td>
				<table cellspacing="0" cellpadding="10" border="0">
					<tr>
					  <td bgcolor="#f5f5f5">
						  <table cellspacing="0" cellpadding="5" width="100%" border="0">
							  <tr>
                  <td><strong>Individual tapout details for <ASP:Label id="Label_member_designator" runat="server"></ASP:Label></strong></td>
                  <td>&nbsp;</td>
							  </tr>
						  </table>
					  </td>
					</tr>
					<tr id="TableRow_none" runat="server">
					  <td><em>--&nbsp;NONE&nbsp;--</em></td>
					</tr>
					<tr>
					  <td>
						  <ASP:DataGrid id="DataGrid_control" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="10" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px" AllowSorting="True" OnSortCommand="DataGrid_control_SortCommand">
						    <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
						    <Columns>
							    <ASP:BoundColumn datafield="id" visible="False"></ASP:BoundColumn>
							    <ASP:BoundColumn datafield="expected_start" headertext="Expected logon time" sortexpression="expected_start%">
							      <ItemStyle horizontalalign="Center"></ItemStyle>
							    </ASP:BoundColumn>
							    <ASP:BoundColumn datafield="comment" headertext="Comment" />
							    <ASP:BoundColumn datafield="hours_warning" headertext="Hours of warning" sortexpression="tapout.hours_warning%, expected_start">
							      <ItemStyle horizontalalign="Center"></ItemStyle>
							    </ASP:BoundColumn>
							    <ASP:BoundColumn datafield="actor" headertext="Documented by" sortexpression="actor%, expected_start" />
						    </Columns>
						  </ASP:DataGrid>
					  </td>
					</tr>
				</table></td>
			</tr>
		</table>
	  <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
	</form>
  </body>
</html>
