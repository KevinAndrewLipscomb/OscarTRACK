<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="member_detail.pas" AutoEventWireup="false" Inherits="member_detail.TWebForm_member_detail" %>
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
		<small>[
		  <ASP:LinkButton id="LinkButton_logout" runat="server" causesvalidation="False">Logout</ASP:LinkButton>&nbsp;]
			               [ Back to <ASP:LinkButton id="LinkButton_back" runat="server">previous</ASP:LinkButton>&nbsp;form ]&nbsp;
			               [ Change your <asp:LinkButton id="LinkButton_change_password" runat="server">password</asp:LinkButton>&nbsp;
			|
			<asp:LinkButton id="LinkButton_change_email_address" runat="server">email address</asp:LinkButton>&nbsp;]
		</small>  
	  </p>
	  <p><asp:label id="Label_account_descriptor" runat="server" font-bold="True" font-size="Large"></asp:label></p>
	  <p>
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
            <tr>
              <td>
                <table cellspacing="0" cellpadding="10" width="100%" border="0">
                    <tr>
                      <td bgcolor="#f5f5f5">
	  <p>Member detail record for <ASP:Label id="Label_member_designator" runat="server" font-bold="True"></ASP:Label></p></td>
                    </tr>
                    <tr>
                      <td>
                        <table cellspacing="0" cellpadding="10" width="100%" border="0">
							<tr>
							  <td>Email address:</td>
							  <td><ASP:Label id="Label_email_address" runat="server"></ASP:Label></td>
							  <td><ASP:LinkButton id="LinkButton_change_member_email_address" runat="server">Change</ASP:LinkButton></td>
							</tr>
							<tr>
							  <td>Leave:</td>
							  <td valign="middle">
                                <table cellspacing="0" cellpadding="3" border="0">
									  <tr>
										<td>This month:</td>
                                      <td>
                                        <ASP:Label id="Label_leave_this_month" runat="server" font-bold="True"></ASP:Label></td>
									  </tr>
									  <tr>
										<td>Next month:</td>
                                      <td>
                                        <ASP:Label id="Label_leave_next_month" runat="server" font-bold="True"></ASP:Label></td>
									  </tr>
                                </table>
                                </td>
							  <td><ASP:LinkButton id="LinkButton_leave_detail" runat="server">Detail</ASP:LinkButton></td>
							</tr>
							<tr>
							  <td>Officership:</td>
							  <td><ASP:Label id="Label_officership" runat="server"></ASP:Label></td>
							  <td><ASP:LinkButton id="LinkButton_officership_detail" runat="server">Detail</ASP:LinkButton></td>
							</tr>
							<tr>
							  <td>Medical release level:</td>
							  <td><ASP:Label id="Label_medical_release_level" runat="server"></ASP:Label></td>
							  <td><ASP:LinkButton id="LinkButton_change_medical_release_level" runat="server">Change</ASP:LinkButton></td>
							</tr>
							<tr>
							  <td>Enrollment:</td>
							  <td><ASP:Label id="Label_enrollment" runat="server"></ASP:Label></td>
							  <td><ASP:LinkButton id="LinkButton_enrollment_detail" runat="server">Detail</ASP:LinkButton></td>
							</tr>
							<tr>
							  <td>Driver qualified:</td>
							  <td><ASP:Label id="Label_be_driver_qualified" runat="server"></ASP:Label></td>
							  <td><ASP:LinkButton id="LinkButton_change_driver_qual" runat="server">Change</ASP:LinkButton></td>
							</tr>
						</table></td>
                    </tr>
                </table></td>
            </tr>
        </table></p>
	  <asp:placeholder id="PlaceHolder_postcontent" runat="server"></asp:placeholder>
     <sstchur:SmartScroller runat="server" /></form>
  </body>
</html>
