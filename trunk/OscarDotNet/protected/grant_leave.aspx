<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %>
<%@ Page language="c#" Debug="true" Codebehind="grant_leave.pas" AutoEventWireup="false" Inherits="grant_leave.TWebForm_grant_leave"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <title id="Title" runat="server"></title><!-- $Id$ -->
  </head>
  <body>
    <form runat="server"><uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent><p>
        <p>
		  <table cellspacing="0" cellpadding="1" width="100%" bgcolor="#d3d3d3" border="0">
			  <tr>
				<td>
				  <small>
					<asp:label id="Label_account_descriptor" runat="server"></asp:label>:&nbsp;
					    [&nbsp;<ASP:LinkButton id="LinkButton_logout" runat="server" causesvalidation="False">Logout</ASP:LinkButton>&nbsp;]
					    [&nbsp;<ASP:LinkButton id="LinkButton_back" runat="server" causesvalidation="False">Go&nbsp;back</ASP:LinkButton>&nbsp;]
					    [&nbsp;Change&nbsp;<asp:LinkButton id="LinkButton_change_password" runat="server" causesvalidation="False">password</asp:LinkButton>&nbsp;|&nbsp;<asp:LinkButton id="LinkButton_change_email_address" runat="server" causesvalidation="False">email address</asp:LinkButton>&nbsp;]
				  </small>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td align="right"><uc1:UserControl_print_div id="UserControl_print_div" runat="server"></uc1:UserControl_print_div></td>
			  </tr>
		  </table>
		</p>
<div id="Div_print_area">
	  <table cellspacing="0" cellpadding="0" width="100%" border="1" bordercolor="#dcdcdc"><tr><td>
		<table cellspacing="0" cellpadding="10" border="0">
		<tr>
		  <td bgcolor="#f5f5f5"><strong>Grant new leave for
			  <ASP:Label id="Label_member_designator" runat="server"></ASP:Label>
			</strong></td>
		</tr>
		<tr>
		  <td>
			<table cellspacing="0" cellpadding="10" border="0">
			  <tr>
				<td>Starting:</td>
				<td>
				  <ASP:DropDownList id="DropDownList_start_month" runat="server"></ASP:DropDownList></td>
				<td nowrap="true">
				  <ASP:RequiredFieldValidator id="RequiredFieldValidator_start_month" runat="server" errormessage="Please select a starting month." font-bold="True" controltovalidate="DropDownList_start_month">!ERR!</ASP:RequiredFieldValidator></td>
			  </tr>
			  <tr>
				<td>Ending:</td>
				<td>
				  <ASP:DropDownList id="DropDownList_end_month" runat="server"></ASP:DropDownList></td>
				<td nowrap="true">
				  <ASP:RequiredFieldValidator id="RequiredFieldValidator_end_month" runat="server" errormessage="Please select an ending month." font-bold="True" controltovalidate="DropDownList_end_month">!ERR!</ASP:RequiredFieldValidator>
				  <ASP:CustomValidator id="CustomValidator_end_month" runat="server" errormessage="End month must be after start month" font-bold="True" controltovalidate="DropDownList_end_month">!ERR!</ASP:CustomValidator></td>
			  </tr>
			  <tr>
				<td>Kind:</td>
				<td>
				  <ASP:DropDownList id="DropDownList_kind_of_leave" runat="server"></ASP:DropDownList></td>
				<td nowrap="true">
				  <ASP:RequiredFieldValidator id="RequiredFieldValidator_kind_of_leave" runat="server" errormessage="Please select a kind of leave." font-bold="True" controltovalidate="DropDownList_kind_of_leave">!ERR!</ASP:RequiredFieldValidator></td>
			  </tr>
			  <tr>
				<td valign="top">Num duties required:</td>
				<td>
				  <table cellspacing="0" cellpadding="0" border="0">
					<tr>
					  <td valign="top">
						<ASP:DropDownList id="DropDownList_num_obligated_shifts" runat="server"></ASP:DropDownList></td>
					  <td>
						<table cellspacing="0" cellpadding="5" border="0">
						  <tr>
							<td valign="top">•</td>
							<td>
							  <small>For long-term purposes, consider changing
								<ASP:Label id="Label_member_first_name" runat="server"></ASP:Label>
							  's <ASP:LinkButton id="LinkButton1" runat="server">membership status</ASP:LinkButton>
							  &nbsp;instead.
							  </small></td>
						  </tr>
						  <tr>
							<td valign="top">•</td>
							<td>
							  <small>To&nbsp;grant leave for less than a full month, specify a one-month leave, and specify the number of shifts they have run or should run in that month.</small></td>
						  </tr>
						</table></td>
					</tr>
				  </table></td>
				<td valign="top" nowrap="true">
				  <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_obligated_shifts" runat="server" errormessage="Please select the number of obligated shifts." font-bold="True" controltovalidate="DropDownList_num_obligated_shifts">!ERR!</ASP:RequiredFieldValidator></td>
			  </tr>
			  <tr>
				<td>Note:</td>
				<td>
				  <ASP:TextBox id="TextBox_note" runat="server" columns="50" maxlength="127"></ASP:TextBox></td>
				<td></td>
			  </tr>
			  <tr>
				<td align="right"><ASP:CustomValidator id="CustomValidator_overlap" runat="server" errormessage="Please specify a leave that will not overlap an existing leave for this member." font-bold="True">!ERR!</ASP:CustomValidator></td>
				<td>
				  <ASP:Button id="Button_submit" runat="server" text="Submit"></ASP:Button>
				&nbsp;
				  <ASP:Button id="Button_cancel" runat="server" text="Cancel" causesvalidation="False"></ASP:Button></td>
				<td></td>
			  </tr>
			</table>
		</tr>
		</table>
		</td></tr>
	  </table>
</div>
	  <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
	  <p><sstchur:SmartScroller runat="server" /></p>
	</form>
  </body>
</html>
