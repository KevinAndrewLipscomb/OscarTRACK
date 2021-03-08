<%@ Page language="c#" codebehind="change_member_bls_academy_proctor_qualification.aspx.cs" AutoEventWireup="True" Inherits="change_member_bls_academy_proctor_qualification.TWebForm_change_member_bls_academy_proctor_qualification" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<!DOCTYPE html>

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
				<table cellspacing="0" cellpadding="10" width="100%" border="0">
					<tr><td bgcolor="#f5f5f5"><strong>Change <ASP:Label id="Label_member_name_1" runat="server"></ASP:Label>'s BLS Academy Proctor qualification status </strong></td>
					</tr>
					<tr>
					  <td>
						<p>Is <ASP:Label id="Label_member_name_2" runat="server"></ASP:Label>&nbsp;active on the BLS Academy Proctor team?</p>
						<blockquote dir="ltr" style="MARGIN-RIGHT: 0px">
						  <p>
							<ASP:RadioButtonList id="RadioButtonList_bls_academy_proctor_qualified_yes_no" runat="server" repeatdirection="Horizontal">
							  <ASP:ListItem value="Yes">Yes</ASP:ListItem>
							  <ASP:ListItem value="No">No</ASP:ListItem>
							</ASP:RadioButtonList>
						  </p>
						  <p><ASP:Button id="Button_submit" runat="server" text="Submit" onclick="Button_submit_Click"></ASP:Button>&nbsp;<ASP:Button id="Button_cancel" runat="server" text="Cancel" causesvalidation="False" onclick="Button_cancel_Click"></ASP:Button>
						  </p>
						</blockquote></td>
					</tr>
				</table></td>
			</tr>
        </table><uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent></form>
  </body>
</html>