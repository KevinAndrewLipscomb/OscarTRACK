<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="add_new_enrollment_status.pas" AutoEventWireup="false" Inherits="add_new_enrollment_status.TWebForm_add_new_enrollment_status" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
	<title id="Title" runat="server"></title>
      <!-- $Id$ -->
  </head>

  <body>
     <form runat="server"><uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent><p>
		<small>[
		  <ASP:LinkButton id="LinkButton_logout" runat="server" causesvalidation="False">Logout</ASP:LinkButton>&nbsp;]
			                              [ Back to <ASP:LinkButton id="LinkButton_back" runat="server" causesvalidation="False">previous</ASP:LinkButton>&nbsp;form ]&nbsp;
			                              [ Change your <asp:LinkButton id="LinkButton_change_password" runat="server" causesvalidation="False">password</asp:LinkButton>&nbsp;
			|
			<asp:LinkButton id="LinkButton_change_email_address" runat="server" causesvalidation="False">email address</asp:LinkButton>&nbsp;]
		</small>
	  </p>
	  <p><asp:label id="Label_account_descriptor" runat="server" font-bold="True" font-size="Large"></asp:label></p>
	  <p></p>
		<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
			<tr>
			  <td>
				<table cellspacing="0" cellpadding="10" width="100%" border="0">
					<tr><td bgcolor="#f5f5f5"><strong>Add new membership status for
						  <ASP:Label id="Label_member_designator" runat="server"></ASP:Label></strong></td>
					</tr>
					<tr>
					  <td>
						<table cellspacing="0" cellpadding="10" border="0">
							<tr>
							  <td valign="top">What should <ASP:Label id="Label_member_first_name" runat="server"></ASP:Label>'s 
new status be?&nbsp; Please consider carefully. 

								<p></p>
								<blockquote dir="ltr" style="MARGIN-RIGHT: 0px">
								  <p><ASP:RadioButtonList id="RadioButtonList_disposition" runat="server"></ASP:RadioButtonList></p>
								  <small><ASP:Label id="Label_no_transitions_available" runat="server" visible="False" font-italic="True">No transitions are available in this situation.</ASP:Label></small>
								</blockquote>
							  <td valign="top">
								<p>When&nbsp;does the change take effect?</p>
								<blockquote dir="ltr" style="MARGIN-RIGHT: 0px">
								  <p><uc1:UserControl_drop_down_date id="UserControl_effective_date" runat="server"></uc1:UserControl_drop_down_date></p>
								  <p><small>SYSTEM RESTRICTIONS:<br>You must select a date on or after the date that the member's current membership status began. A membership status may not be repeated on the same day.</small></p>
								</blockquote>
								<p>Note (optional):</p>
								<blockquote><ASP:TextBox id="TextBox_note" runat="server" maxlength="127" columns="40" textmode="MultiLine"></ASP:TextBox>
								  </blockquote>
								<p><ASP:RequiredFieldValidator id="RequiredFieldValidator_new_status" runat="server" errormessage="Please select a new membership status." font-bold="True" controltovalidate="RadioButtonList_disposition">!ERR!</ASP:RequiredFieldValidator></p>
								<p><ASP:Button id="Button_submit" runat="server" text="Submit"></ASP:Button>&nbsp;<ASP:Button id="Button_cancel" runat="server" text="Cancel" causesvalidation="False"></ASP:Button></p>
								<p>&nbsp;</p>
								<p><ASP:LinkButton id="LinkButton_grant_leave" runat="server" causesvalidation="False" font-size="Small">Grant leave instead</ASP:LinkButton></p>
								<p>&nbsp;</p>
								<p>OSCAR may notify EMS Admin about membership status changes.</p>
								</td><uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent><sstchur:SmartScroller runat="server" />
							</tr>
						</table>
					  </td>
					</tr>
				</table>
			  </td>
			</tr>
	   </table>
	</form>
  </body>
</html>
