<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ Page language="c#" Debug="true" Codebehind="grant_leave.aspx.cs" AutoEventWireup="True" Inherits="grant_leave.TWebForm_grant_leave"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<html>
  <head runat="server">
    <title></title>
    <!-- $Id$ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>
  <body bgcolor="white">
	<form runat="server">
	  <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
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
				<td nowrap="nowrap">
				  <ASP:RequiredFieldValidator id="RequiredFieldValidator_start_month" runat="server" errormessage="Please select a starting month." font-bold="True" controltovalidate="DropDownList_start_month">!ERR!</ASP:RequiredFieldValidator></td>
			  </tr>
			  <tr>
				<td>Ending:</td>
				<td>
				  <ASP:DropDownList id="DropDownList_end_month" runat="server"></ASP:DropDownList></td>
				<td nowrap="nowrap">
				  <ASP:RequiredFieldValidator id="RequiredFieldValidator_end_month" runat="server" errormessage="Please select an ending month." font-bold="True" controltovalidate="DropDownList_end_month">!ERR!</ASP:RequiredFieldValidator>
				  <ASP:CustomValidator id="CustomValidator_end_month" runat="server" errormessage="End month must be after start month" font-bold="True" controltovalidate="DropDownList_end_month" onservervalidate="CustomValidator_end_month_ServerValidate">!ERR!</ASP:CustomValidator></td>
			  </tr>
			  <tr>
				<td>Kind:</td>
				<td>
				  <table cellspacing="0" cellpadding="0" border="0">
            <tr>
              <td valign="top"><ASP:DropDownList id="DropDownList_kind_of_leave" runat="server"></ASP:DropDownList></td>
					    <td>
						    <table cellspacing="0" cellpadding="5" border="0">
						      <tr>
                    <td valign="top">•</td>
							      <td><small>Note that once you grant a <em>Medical</em> leave involving the current month, only EMS Admin can edit or delete it.</small></td>
						      </tr>
						    </table>
              </td>
					  </tr>
				  </table>
        </td>
        <td nowrap="nowrap">
				  <ASP:RequiredFieldValidator id="RequiredFieldValidator_kind_of_leave" runat="server" errormessage="Please select a kind of leave." font-bold="True" controltovalidate="DropDownList_kind_of_leave">!ERR!</ASP:RequiredFieldValidator></td>
			  </tr>
			  <tr>
				<td valign="top">Num duties required:</td>
				<td>
				  <table cellspacing="0" cellpadding="0" border="0">
					<tr>
					  <td valign="top">
						<ASP:DropDownList id="DropDownList_num_obligated_shifts" runat="server" Enabled="False"></ASP:DropDownList></td>
					  <td>
						<table cellspacing="0" cellpadding="5" border="0">
						  <tr>
                <td valign="top">•</td>
							  <td>
                  <small>
                    <em>Partial</em> leaves are no longer available.&nbsp; You can accomplish the same thing, however, by giving <ASP:Label id="Label_member_first_name" runat="server"></ASP:Label> a Membership Status of
                    <em>Reduced</em>.
                  </small>
                </td>
						  </tr>
						</table></td>
					</tr>
				  </table></td>
				<td valign="top" nowrap="nowrap">
				  <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_obligated_shifts" runat="server" errormessage="Please select the number of obligated shifts." font-bold="True" controltovalidate="DropDownList_num_obligated_shifts">!ERR!</ASP:RequiredFieldValidator></td>
			  </tr>
			  <tr>
				<td>Note:</td>
				<td>
				  <ASP:TextBox id="TextBox_note" runat="server" columns="50" maxlength="127"></ASP:TextBox></td>
				<td></td>
			  </tr>
			  <tr>
				<td align="right">
          <asp:CustomValidator ID="CustomValidator_duty_selection_conflict" runat="server" ErrorMessage="Sorry, the member is selected for duty during the future parts of the leave period. Please deselect them from such duties first." Font-Bold="True" onservervalidate="CustomValidator_duty_selection_conflict_ServerValidate">!ERR!</asp:CustomValidator>
          <ASP:CustomValidator id="CustomValidator_overlap" runat="server" errormessage="Please specify a leave that will not overlap an existing leave for this member." font-bold="True" onservervalidate="CustomValidator_overlap_ServerValidate">!ERR!</ASP:CustomValidator></td>
				<td>
				  <ASP:Button id="Button_submit" runat="server" text="Submit" onclick="Button_submit_Click"></ASP:Button>
				&nbsp;
				  <ASP:Button id="Button_cancel" runat="server" text="Cancel" causesvalidation="False" onclick="Button_cancel_Click"></ASP:Button></td>
				<td></td>
			  </tr>
			</table>
      </td>
		</tr>
		</table>
		</td></tr>
	  </table>
	  <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
	</form>
  </body>
</html>
