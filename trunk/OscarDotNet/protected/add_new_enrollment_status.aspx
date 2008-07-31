<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ Page language="c#" Debug="true" Codebehind="add_new_enrollment_status.pas" AutoEventWireup="false" Inherits="add_new_enrollment_status.TWebForm_add_new_enrollment_status" %>
<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<html>
  <head>
	<title id="Title" runat="server"></title>
      <!-- $Id$ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>

  <body bgcolor="white">
	 <form runat="server">

	   <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
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
								</td>
							</tr>
						</table>
					  </td>
					</tr>
				</table>
			  </td>
			</tr>
	   </table><uc1:UserControl_postcontent id="UserControl_post_content" runat="server"></uc1:UserControl_postcontent>
      <p><sstchur:SmartScroller runat="server" /></p>
	</form>
  </body>
</html>
