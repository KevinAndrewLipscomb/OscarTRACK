<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ Page language="c#" Debug="true" Codebehind="change_phone_num.aspx.cs" AutoEventWireup="True" Inherits="change_phone_num.TWebForm_change_phone_num" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<html>
  <head runat="server">
    <title id="Title"></title>
    <!-- $Id: change_phone_num.aspx 2586 2008-09-25 16:20:08Z kevinanlipscomb $ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
        <table cellspacing="0" cellpadding="0" width="%" border="1" bordercolor="#dcdcdc">
          <tr>
            <td>
              <table cellspacing="0" cellpadding="10" width="%" border="0">
                <tr><td bgcolor="#f5f5f5" colspan="3"><strong>Change phone number</strong></td></tr>
                <tr>
                  <td>
                    <p align="right">Enter <asp:Label id="Label_name" runat="server"></asp:Label>'s phone number (cellular preferred):</p>
                  </td>
                  <td><ASP:TextBox id="TextBox_phone_num" runat="server" maxlength="14" columns="14"></ASP:TextBox></td>
                  <td>
                    <ASP:RequiredFieldValidator id="RequiredFieldValidator_phone_num" runat="server" font-bold="True" errormessage="Please enter a phone number." controltovalidate="TextBox_phone_num">!ERR!</ASP:RequiredFieldValidator>
                    <ASP:CustomValidator id="CustomValidator_phone_num" runat="server" errormessage="Please enter a valid phone number.  Premium and reserved numbers are not allowed." controltovalidate="TextBox_phone_num" font-bold="True" onservervalidate="CustomValidator_phone_num_ServerValidate">!ERR!</ASP:CustomValidator>
                  </td>
                </tr>
                <tr>
                  <td></td>
                  <td>
                    <ASP:Button id="Button_submit" runat="server" text="Submit" onclick="Button_submit_Click"></ASP:Button>&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button id="Button_cancel" runat="server" text="Cancel" causesvalidation="False" onclick="Button_cancel_Click"></asp:Button>
                  </td>
                  <td></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
    </form>
  </body>
</html>
