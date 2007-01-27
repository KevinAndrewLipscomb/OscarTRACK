<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="add_new_enrollment_status.pas" AutoEventWireup="false" Inherits="add_new_enrollment_status.TWebForm_add_new_enrollment_status" %>
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
                    <tr><td bgcolor="#f5f5f5"><strong>Add new enrollment level for 
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
                                </blockquote>
                              <td valign="top">
                                <p>When&nbsp;does the change take effect?</p>
                                <blockquote dir="ltr" style="MARGIN-RIGHT: 0px">
                                <p><small>You must select a date on or after the date that the member's current enrollment status began.</small></p>
                                  <p><ASP:Calendar id="Calendar_effective_date" runat="server" backcolor="White" width="200px" forecolor="Black" height="180px" font-size="8pt" font-names="Verdana" bordercolor="#999999" cellpadding="4" daynameformat="FirstLetter">
                                      <TodayDayStyle forecolor="Black" backcolor="#CCCCCC"></TodayDayStyle>
                                      <SelectorStyle backcolor="#CCCCCC"></SelectorStyle>
                                      <NextPrevStyle verticalalign="Bottom"></NextPrevStyle>
                                      <DayHeaderStyle font-size="7pt" font-bold="True" backcolor="#CCCCCC"></DayHeaderStyle>
                                      <SelectedDayStyle font-bold="True" forecolor="White" backcolor="#666666"></SelectedDayStyle>
                                      <TitleStyle font-bold="True" bordercolor="Black" backcolor="#999999"></TitleStyle>
                                      <WeekendDayStyle backcolor="#FFFFCC"></WeekendDayStyle>
                                      <OtherMonthDayStyle forecolor="#808080"></OtherMonthDayStyle></ASP:Calendar></p>
                                  <p>
								<ASP:RequiredFieldValidator id="RequiredFieldValidator_new_status" runat="server" errormessage="Please select a new enrollment level." font-bold="True" controltovalidate="RadioButtonList_disposition">!ERR!</ASP:RequiredFieldValidator></p>
                                  <p><ASP:Button id="Button_submit" runat="server" text="Submit"></ASP:Button>&nbsp;<ASP:Button id="Button_cancel" runat="server" text="Cancel"></ASP:Button></p>
                                  <p>&nbsp;</p>
                                  <p><ASP:LinkButton id="LinkButton_grant_leave" runat="server" causesvalidation="False" font-size="Small">Grant leave instead</ASP:LinkButton></p>
								  <p>&nbsp;</p>
								  <p>OSCAR may notify EMS Admin about enrollment level changes.</p>
                                </blockquote></td>
                            <p></p>
	  <asp:placeholder id="PlaceHolder_postcontent" runat="server"></asp:placeholder>
     <sstchur:SmartScroller runat="server" />
                              <p></p>
                              <p></p>
                              <p></p>
                              <p></p></p></form></tr></tbody></table></td></tr></tbody></table></td></tr></tbody>
    <p></p>
    <p></p>
    <p></p>
    <p></p></p>
  </body>
</html>
