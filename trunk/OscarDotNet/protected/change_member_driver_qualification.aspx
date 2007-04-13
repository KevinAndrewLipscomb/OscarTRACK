<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="change_member_driver_qualification.pas" AutoEventWireup="false" Inherits="change_member_driver_qualification.TWebForm_change_member_driver_qualification" %>
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
                    <tr><td bgcolor="#f5f5f5"><strong>Change 
                          <ASP:Label id="Label_member_name_1" runat="server"></ASP:Label>'s driver qualification status </strong></td>
                    </tr>
                    <tr>
                      <td>
                        <p><ASP:Label id="Label_member_name_2" runat="server"></ASP:Label>&nbsp;is fully qualified to drive ambulances in Virginia Beach.</p>
                        <blockquote dir="ltr" style="MARGIN-RIGHT: 0px">
                          <p>
							<ASP:RadioButtonList id="RadioButtonList_be_driver_qualified" runat="server" repeatdirection="Horizontal">
							  <ASP:ListItem value="TRUE">True</ASP:ListItem>
                              <ASP:ListItem value="false">False</ASP:ListItem>
                            </ASP:RadioButtonList>
                          </p>
                          <p><ASP:Button id="Button_submit" runat="server" text="Submit"></ASP:Button>&nbsp;<ASP:Button id="Button_cancel" runat="server" text="Cancel" causesvalidation="False"></ASP:Button>
                          </p>
                        </blockquote></td>
                    </tr>
                </table></td>
            </tr>
        </table></p><uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent><sstchur:SmartScroller runat="server" /></form>
  </body>
</html>
