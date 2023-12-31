<%@ Page language="c#" codebehind="change_member_email_address.aspx.cs" AutoEventWireup="True" Inherits="change_member_email_address.TWebForm_change_member_email_address" %>
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
                    <tr>
                      <td bgcolor="#f5f5f5"><strong>Change <ASP:Label id="Label_member_name_1" runat="server"></ASP:Label>'s email address</strong></td>
                    </tr>
                    <tr>
                      <td>
                        <p>Please check your entry carefully.&nbsp; OSCAR and other entities may use this email address for important&nbsp;communications with <ASP:Label id="Label_member_name_2" runat="server"></ASP:Label>.</p>
                        <p>
                          <table cellspacing="0" cellpadding="5" border="0">
                              <tr>
                                <td><ASP:Label id="Label_member_name_3" runat="server"></ASP:Label>'s email address:</td>
								<td>
                                  <asp:textbox id="TextBox_noop_ie_behavior_workaround" runat="server" style="DISPLAY: none; VISIBILITY: hidden" /><!-- To work around an IE bug that otherwise prevents Enter in a textbox from submitting a form. -->
								  <ASP:TextBox id="TextBox_member_email_address" runat="server" columns="40"></ASP:TextBox></td><td>
                                  <ASP:RegularExpressionValidator id="RegularExpressionValidator_member_email_address" runat="server" font-bold="True" errormessage="Please enter a valid email address." validationexpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                                  controltovalidate="TextBox_member_email_address">!ERR!</ASP:RegularExpressionValidator>
                        <ASP:CustomValidator id="CustomValidator_member_email_address" runat="server" errormessage="Please enter a valid domain name (the part after the @ sign)." controltovalidate="TextBox_member_email_address" font-bold="True" onservervalidate="CustomValidator_member_email_address_ServerValidate">!ERR!</ASP:CustomValidator></td>
                              </tr>
                              <tr>
                                <td></td>
                                <td><ASP:Button id="Button_submit" runat="server" text="Submit" onclick="Button_submit_Click"></ASP:Button>&nbsp;<ASP:Button id="Button_cancel" runat="server" text="Cancel" causesvalidation="False" onclick="Button_cancel_Click"></ASP:Button></td>
                                <td></td>
                              </tr>
                          </table>
                        </p>
                        <p></p></td>
                    </tr>
                </table></td>
            </tr>
        </table><uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent></form>
  </body>
</html>
