<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="change_name.pas" AutoEventWireup="false" Inherits="change_name.TWebForm_change_name" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
	<title id="Title" runat="server"></title>
      <!-- $Id$ -->
    <script type="text/javascript" src="../js/gradient.js"></script>
  </head>

  <body bgcolor="white">
	 <form runat="server">
	   <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
            <tr>
              <td>
                <table cellspacing="0" cellpadding="10" width="100%" border="0">
                    <tr>
                      <td bgcolor="#f5f5f5"><strong>Change <ASP:Label id="Label_member_name" runat="server"></ASP:Label>'s name</strong></td>
                    </tr>
                    <tr>
                      <td>
                        <p>
                          <table cellspacing="0" cellpadding="5" border="0">
							  <tr>
								<td align="right">New first name:</td>
								<td>
								  <ASP:TextBox id="TextBox_first_name" runat="server" columns="20" maxlength="31"></ASP:TextBox></td><td><ASP:RequiredFieldValidator id="RequiredFieldValidator_name" runat="server" errormessage="Please enter a new first name." font-bold="True" controltovalidate="TextBox_first_name" display="Dynamic">!ERR!</ASP:RequiredFieldValidator></td>
							  </tr>
							  <tr>
								<td align="right">New last name:</td>
								<td>
								  <ASP:TextBox id="TextBox_last_name" runat="server" columns="20" maxlength="31"></ASP:TextBox></td><td><ASP:RequiredFieldValidator id="RequiredFieldValidator_last_name" runat="server" errormessage="Please enter a new last name." font-bold="True" controltovalidate="TextBox_last_name" display="Dynamic">!ERR!</ASP:RequiredFieldValidator></td>
							  </tr>
							  <tr>
								<td></td>
                                <td><ASP:Button id="Button_submit" runat="server" text="Submit"></ASP:Button>&nbsp;<ASP:Button id="Button_cancel" runat="server" text="Cancel" causesvalidation="False"></ASP:Button></td>
                                <td></td>
                              </tr>
                          </table>
                        </p></td>
                    </tr>
                </table></td>
            </tr>
		</table><uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent><p><sstchur:SmartScroller runat="server" /></p></form>
  </body>
</html>
