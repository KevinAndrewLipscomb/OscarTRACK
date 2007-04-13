<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="change_member_medical_release_level.pas" AutoEventWireup="false" Inherits="change_member_medical_release_level.TWebForm_change_member_medical_release_level" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
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
	  <p>
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
            <tr>
              <td>
                <table cellspacing="0" cellpadding="10" width="100%" border="0">
                    <tr><td bgcolor="#f5f5f5"><strong>Change 
                          <ASP:Label id="Label_member_name_1" runat="server"></ASP:Label>'s medical release level </strong></td>
                    </tr>
                    <tr>
                      <td>
						<p>Indicate the level at which <ASP:Label id="Label_member_name_2" runat="server"></ASP:Label>
						is approved <u>to function in Virginia Beach</u>.
                        </p>
                        <p><ASP:Label id="Label_member_name_3" runat="server"></ASP:Label>'s medical release level:&nbsp; <ASP:DropDownList id="DropDownList_medical_release_level" runat="server"></ASP:DropDownList>&nbsp;<ASP:Button id="Button_submit" runat="server" text="Submit"></ASP:Button>&nbsp;<ASP:Button id="Button_cancel" runat="server" text="Cancel" causesvalidation="False"></ASP:Button></p></td>
                    </tr>
                </table></td>
            </tr>
        </table></p><uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent><sstchur:SmartScroller runat="server" /></form>
  </body>
</html>
