<!DOCTYPE HTML>
<%@ Page language="c#" Debug="true" Codebehind="enrollment_detail.aspx.cs" AutoEventWireup="True" Inherits="enrollment_detail.TWebForm_enrollment_detail" %>
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
					  <td bgcolor="#f5f5f5"><strong>
						  <table cellspacing="0" cellpadding="5" width="100%" border="0">
							  <tr><td>
<strong>Membership status details for
									<ASP:Label id="Label_member_designator" runat="server"></ASP:Label></strong></td><td>	</td>
							  </tr>
						  </table></strong></td>
					</tr>
					<tr id="TableRow_none" runat="server">
					  <td><em>--&nbsp;NONE&nbsp;--</em></td>
					</tr>
					<tr>
					  <td>
                          <p><ASP:LinkButton id="LinkButton_add_new_enrollment_status" runat="server" onclick="LinkButton_add_new_enrollment_status_Click">[Add&nbsp;a&nbsp;new&nbsp;status]</ASP:LinkButton></p>
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
							<ASP:BoundColumn datafield="note" sortexpression="note%" readonly="True" headertext="Note" Visible="false">
							  <HeaderStyle horizontalalign="Left"></HeaderStyle>
							  <ItemStyle horizontalalign="Left"></ItemStyle>
							</ASP:BoundColumn>
						  </Columns></ASP:DataGrid></p></td>
					</tr>
				</table></td>
			</tr>
		</table>
	  <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
	</form>
  </body>
</html>
