<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="add_member.pas" AutoEventWireup="false" Inherits="add_member.TWebForm_add_member" %>
<%@ Register TagPrefix="uc1" TagName="drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
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
			                                               [ Back to <ASP:LinkButton id="LinkButton_back" runat="server" causesvalidation="False">previous</ASP:LinkButton>&nbsp;form ]&nbsp;
			                                               [ Change your <asp:LinkButton id="LinkButton_change_password" runat="server" causesvalidation="False">password</asp:LinkButton>&nbsp;
			|
			<asp:LinkButton id="LinkButton_change_email_address" runat="server" causesvalidation="False">email address</asp:LinkButton>&nbsp;]
		</small>
	  </p>
	  <p><asp:label id="Label_account_descriptor" runat="server" font-bold="True" font-size="Large"></asp:label></p>
	  <p>
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
            <tr>
              <td>
                <table cellspacing="0" cellpadding="10" width="100%" border="0">
                    <tr>
                      <td bgcolor="#f5f5f5"><strong>Add member to roster</strong></td>
                    </tr>
                    <tr>
                      <td>
                        <table cellspacing="0" cellpadding="5" border="0">
                            <tr>
                              <td>First name:</td>
                              <td><ASP:TextBox id="TextBox_first_name" runat="server" maxlength="31" columns="20"></ASP:TextBox></td>
							  <td nowrap="true"><ASP:RequiredFieldValidator id="RequiredFieldValidator_first_name" runat="server" errormessage="Please enter a first name." font-bold="True" controltovalidate="TextBox_first_name">!ERR!</ASP:RequiredFieldValidator></td>
							</tr>
							<tr>
							  <td>Last name:</td>
							  <td>
								<ASP:TextBox id="TextBox_last_name" runat="server" maxlength="31" columns="20"></ASP:TextBox></td>
							  <td nowrap="true"><ASP:RequiredFieldValidator id="RequiredFieldValidator_last_name" runat="server" errormessage="Please enter a last name." font-bold="True" controltovalidate="TextBox_last_name">!ERR!</ASP:RequiredFieldValidator></td>
							</tr>
							<tr>
							  <td>CAD#:</td>
							  <td>
								<ASP:TextBox id="TextBox_cad_num" runat="server" maxlength="6" columns="6"></ASP:TextBox></td>
							  <td nowrap="true"><ASP:RegularExpressionValidator id="RegularExpressionValidator_cad_num" runat="server" errormessage="Please enter a valid CAD#." controltovalidate="TextBox_cad_num" validationexpression="\d{6}" font-bold="True">!ERR!</ASP:RegularExpressionValidator></td>
							</tr>
							<tr>
							  <td>Medical level at which member is approved <u>to function in Virginia Beach</u>:</td>
							  <td><ASP:DropDownList id="DropDownList_medical_release_level" runat="server"></ASP:DropDownList></td>
							  <td nowrap="true"><ASP:RequiredFieldValidator id="RequiredFieldValidator_medical_release_level" runat="server" errormessage="Please select a medical release level." font-bold="True" controltovalidate="DropDownList_medical_release_level">!ERR!</ASP:RequiredFieldValidator></td>
							</tr>
							<tr>
							  <td>Qualified driver:</td>
							  <td><ASP:RadioButtonList id="RadioButtonList_be_driver_qualified" runat="server" repeatdirection="Horizontal">
								  <ASP:ListItem value="TRUE">Yes</ASP:ListItem>
								  <ASP:ListItem value="FALSE">No</ASP:ListItem></ASP:RadioButtonList></td>
							  <td nowrap="true"><ASP:RequiredFieldValidator id="RequiredFieldValidator_be_qualified_driver" runat="server" errormessage="Please indicate whether or not the member is a qualified driver." font-bold="True" controltovalidate="RadioButtonList_be_driver_qualified">!ERR!</ASP:RequiredFieldValidator></td>
							</tr>
							<tr id="TableRow_agency" runat="server">
							  <td>Agency:</td>
							  <td><ASP:DropDownList id="DropDownList_agency" runat="server"></ASP:DropDownList></td>
							  <td nowrap="true"><ASP:RequiredFieldValidator id="RequiredFieldValidator_agency" runat="server" errormessage="Please select an agency." font-bold="True" controltovalidate="DropDownList_agency">!ERR!</ASP:RequiredFieldValidator></td>
							</tr>
							<tr>
							  <td>Email address:</td>
							  <td><ASP:TextBox id="TextBox_email_address" runat="server" maxlength="255" columns="40"></ASP:TextBox></td>
							  <td nowrap="true"><ASP:RequiredFieldValidator id="RequiredFieldValidator_email_address" runat="server" errormessage="Please enter an email address." font-bold="True" controltovalidate="TextBox_email_address">!ERR!</ASP:RequiredFieldValidator><ASP:RegularExpressionValidator id="RegularExpressionValidator_email_address" runat="server" errormessage="Please enter a syntactically valid email address." font-bold="True" controltovalidate="TextBox_email_address" validationexpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">!ERR!</ASP:RegularExpressionValidator><ASP:CustomValidator id="CustomValidator_email_address" runat="server" errormessage="Please enter an email address with a valid domain name (the part after the @ sign)." font-bold="True" controltovalidate="TextBox_email_address">!ERR!</ASP:CustomValidator></td>
							</tr>
							<tr>
							  <td valign="top">Enrollment date:</td>
							  <td nowrap="true">
								<uc1:drop_down_date runat="server" id="UserControl_enrollment_date"></uc1:drop_down_date></td>
							  <td nowrap="true"><ASP:Label id="Label_invalid_enrollment_date" runat="server" font-bold="True" forecolor="Red" visible="False">!ERR!</ASP:Label></td>
							</tr>
							<tr>
							  <td><p>Enrollment level:<br><small><em>Once database is deemed clean, this setting will disappear from this form and all new members will be enrolled as Recruits.</em></small></p></td>
							  <td><ASP:DropDownList id="DropDownList_enrollment_level" runat="server"></ASP:DropDownList></td>
							  <td nowrap="true"><ASP:RequiredFieldValidator id="RequiredFieldValidator_enrollment_level" runat="server" errormessage="Please select an enrollment level." font-bold="True" controltovalidate="DropDownList_enrollment_level">!ERR!</ASP:RequiredFieldValidator></td>
							</tr>
							<tr>
							  <td>
								<div align="right"><ASP:Label id="Label_duplicate" runat="server" font-bold="True" forecolor="Red" font-italic="True" visible="False">!Name and/or CAD# already in system!</ASP:Label>
								</div></td>
							  <td nowrap="true"><ASP:Button id="Button_add_and_stop" runat="server" text="Add and stop"></ASP:Button>&nbsp; <ASP:Button id="Button_add_and_repeat" runat="server" text="Add and repeat"></ASP:Button>&nbsp; <ASP:Button id="Button_cancel" runat="server" text="Cancel" causesvalidation="False"></ASP:Button></td>
							  <td></td>
							</tr></table></td></tr></table></td></tr></table></p>
	  <asp:placeholder id="PlaceHolder_postcontent" runat="server"></asp:placeholder>
     <sstchur:SmartScroller runat="server" /></form></body></html>
