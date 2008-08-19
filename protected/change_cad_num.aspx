<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="change_cad_num.pas" AutoEventWireup="false" Inherits="change_cad_num.TWebForm_change_cad_num" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<html>
  <head runat="server">
	<title id="Title" runat="server"></title>
      <!-- $Id$ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>

  <body bgcolor="white">
	 <form runat="server">

	   <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
            <tr>
              <td>
                <table cellspacing="0" cellpadding="10" width="100%" border="0">
                    <tr>
                      <td bgcolor="#f5f5f5"><strong>Change <ASP:Label id="Label_member_name_1" runat="server"></ASP:Label>'s CAD # (officer code)</strong></td>
                    </tr>
                    <tr>
                      <td>
                        <p>
                          <table cellspacing="0" cellpadding="5" border="0">
                              <tr>
								<td align="right"><ASP:Label id="Label_member_name_2" runat="server"></ASP:Label>'s CAD # (officer code) was:</td>
								<td><ASP:Label id="Label_old_cad_num" runat="server"></ASP:Label></td>
							  </tr>
							  <tr>
								<td align="right">Change it to:</td>
								<td>
								  <asp:textbox id="TextBox_noop_ie_behavior_workaround" runat="server" style="DISPLAY: none; VISIBILITY: hidden" /><!-- To work around an IE bug that otherwise prevents Enter in a textbox from submitting a form. -->
								  <ASP:TextBox id="TextBox_cad_num" runat="server" columns="6" maxlength="6"></ASP:TextBox></td><td><ASP:RequiredFieldValidator id="RequiredFieldValidator_cad_num" runat="server" errormessage="Please enter a CAD # (officer code)." font-bold="True" controltovalidate="TextBox_cad_num" display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
								  <ASP:RegularExpressionValidator id="RegularExpressionValidator_cad_num" runat="server" font-bold="True" errormessage="Please enter a valid CAD # (officer code)." validationexpression="\d{6}" controltovalidate="TextBox_cad_num" display="Dynamic">!ERR!</ASP:RegularExpressionValidator></td>
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
