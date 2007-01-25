<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="grant_leave.pas" AutoEventWireup="false" Inherits="grant_leave.TWebForm_grant_leave" %>
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
                    <tr><td bgcolor="#f5f5f5"><strong>Grant new leave for <ASP:Label id="Label_member_designator" runat="server"></ASP:Label></strong></td>
                    </tr>
                    <tr>
                      <td>
                        <table cellspacing="0" cellpadding="10" border="0">
                            <tr>
                              <td>Starting:</td>
                              <td>
                                <ASP:DropDownList id="DropDownList_start_month" runat="server"></ASP:DropDownList></td>
                              <td><ASP:RequiredFieldValidator id="RequiredFieldValidator_start_month" runat="server" errormessage="Please select a starting month." font-bold="True" controltovalidate="DropDownList_start_month">!ERR!</ASP:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                              <td>Ending:</td>
                              <td>
                                <ASP:DropDownList id="DropDownList_end_month" runat="server"></ASP:DropDownList></td>
                              <td><ASP:RequiredFieldValidator id="RequiredFieldValidator_end_month" runat="server" errormessage="Please select an ending month." font-bold="True" controltovalidate="DropDownList_end_month">!ERR!</ASP:RequiredFieldValidator><ASP:CustomValidator id="CustomValidator_end_month" runat="server" errormessage="End month must be after start month" font-bold="True" controltovalidate="DropDownList_end_month">!ERR!</ASP:CustomValidator></td>
                            </tr>
                            <tr>
                              <td>Kind:</td>
                              <td><ASP:DropDownList id="DropDownList_kind_of_leave" runat="server"></ASP:DropDownList></td>
                              <td><ASP:RequiredFieldValidator id="RequiredFieldValidator_kind_of_leave" runat="server" errormessage="Please select a kind of leave." font-bold="True" controltovalidate="DropDownList_kind_of_leave">!ERR!</ASP:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                              <td valign="top">Num obligated shifts:</td>
                              <td>
                                <table cellspacing="0" cellpadding="5" border="0">
                                    <tr>
                                      <td valign="top"><ASP:DropDownList id="DropDownList_num_obligated_shifts" runat="server"></ASP:DropDownList></td>
                                      <td>
											<table cellspacing="0" cellpadding="5" border="0">
												<tr><td valign="top">•</td>
												  <td><small>For long-term purposes, consider changing
  
  <ASP:Label id="Label_member_first_name" runat="server"></ASP:Label>'s <ASP:LinkButton id="LinkButton1" runat="server">enrollment level</ASP:LinkButton>&nbsp;instead.</small></td>
                                                </tr>
                                                <tr><td valign="top">•</td>
                                                  <td><small>To&nbsp;grant leave for less than a full month, specify a one-month leave, and specify the number of shifts they have run or should run in that month.</small></td>
                                                </tr>
                                            </table>
                              <td valign="top"><ASP:RequiredFieldValidator id="RequiredFieldValidator_num_obligated_shifts" runat="server" errormessage="Please select the number of obligated shifts." font-bold="True" controltovalidate="DropDownList_num_obligated_shifts">!ERR!</ASP:RequiredFieldValidator></td>
                            <tr>
                              <td valign="top">Note:</td>
                              <td><ASP:TextBox id="TextBox_note" runat="server" columns="50" maxlength="127"></ASP:TextBox></td>
                              <td></td>
                            </tr>
                            <tr>
                              <td></td>
                              <td>
                                <p><ASP:Button id="Button_submit" runat="server" text="Submit"></ASP:Button>&nbsp; <ASP:Button id="Button_cancel" runat="server" text="Cancel"></ASP:Button></p></td>
                              <td></td>
                            </tr></p>
          <ASP:LinkButton id="LinkButton_drill_down" runat="server">There is important waypoint-management code behind this drill-down LinkButton.</ASP:LinkButton>
	  <asp:placeholder id="PlaceHolder_postcontent" runat="server"></asp:placeholder>
     <sstchur:SmartScroller runat="server" /></form>
  </body>
</html>
