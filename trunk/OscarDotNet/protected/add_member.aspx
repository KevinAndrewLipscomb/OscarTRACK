<!DOCTYPE html>
<%@ Page language="c#" codebehind="add_member.aspx.cs" AutoEventWireup="True" Inherits="add_member.TWebForm_add_member" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<html>
  <head runat="server">
    <title></title>
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
                <td bgcolor="#f5f5f5"><strong>Add member to roster</strong></td>
              </tr>
              <tr>
                <td>
                  <table cellspacing="0" cellpadding="5" border="0">
                    <tr>
                      <td>First name:</td>
                      <td><ASP:TextBox id="TextBox_first_name" runat="server" maxlength="31" columns="20"></ASP:TextBox></td>
                      <td nowrap="nowrap"><ASP:RequiredFieldValidator id="RequiredFieldValidator_first_name" runat="server" errormessage="Please enter a first name." font-bold="True" controltovalidate="TextBox_first_name">!ERR!</ASP:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                      <td>Last name:</td>
                      <td><ASP:TextBox id="TextBox_last_name" runat="server" maxlength="31" columns="20"></ASP:TextBox></td>
                      <td nowrap="nowrap"><ASP:RequiredFieldValidator id="RequiredFieldValidator_last_name" runat="server" errormessage="Please enter a last name." font-bold="True" controltovalidate="TextBox_last_name">!ERR!</ASP:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                      <td>Phone # (cellular preferred):</td>
                      <td><ASP:TextBox id="TextBox_phone_num" runat="server" maxlength="14" columns="14"></ASP:TextBox></td>
                      <td nowrap="nowrap"><ASP:CustomValidator id="CustomValidator_phone_num" runat="server" errormessage="Please enter a valid phone number.  Premium and reserved numbers are not allowed." font-bold="True" controltovalidate="TextBox_phone_num" onservervalidate="CustomValidator_phone_num_ServerValidate">!ERR!</ASP:CustomValidator></td>
                    </tr>
                    <tr>
                      <td><font class="">Cellular provider:</font></td>
                      <td><asp:DropDownList ID="DropDownList_phone_service" runat="server"></asp:DropDownList></td>
                      <td nowrap="nowrap">&nbsp;</td>
                    </tr>
                    <tr>
                      <td>Email address:</td>
                      <td><ASP:TextBox id="TextBox_email_address" runat="server" maxlength="255" columns="40"></ASP:TextBox></td>
                      <td nowrap="nowrap"><ASP:RegularExpressionValidator id="RegularExpressionValidator_email_address" runat="server" errormessage="Please enter a syntactically valid email address." font-bold="True" controltovalidate="TextBox_email_address" validationexpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">!ERR!</ASP:RegularExpressionValidator><ASP:CustomValidator id="CustomValidator_email_address" runat="server" errormessage="Please enter an email address with a valid domain name (the part after the @ sign)." font-bold="True" controltovalidate="TextBox_email_address" onservervalidate="CustomValidator_email_address_ServerValidate">!ERR!</ASP:CustomValidator></td>
                    </tr>
                    <tr>
                      <td>CAD#:</td>
                      <td><ASP:TextBox id="TextBox_cad_num" runat="server" maxlength="6" columns="6"></ASP:TextBox></td>
                      <td nowrap="nowrap"><ASP:RegularExpressionValidator id="RegularExpressionValidator_cad_num" runat="server" errormessage="Please enter a valid CAD#." controltovalidate="TextBox_cad_num" validationexpression="\d{6}" font-bold="True">!ERR!</ASP:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                      <td>Cert level at which member is released <u>to function in Virginia Beach</u>:</td>
                      <td><ASP:DropDownList id="DropDownList_medical_release_level" runat="server"></ASP:DropDownList></td>
                      <td nowrap="nowrap"><ASP:RequiredFieldValidator id="RequiredFieldValidator_medical_release_level" runat="server" errormessage="Please select a released cert level." font-bold="True" controltovalidate="DropDownList_medical_release_level">!ERR!</ASP:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                      <td>Qualified driver:</td>
                      <td>
                        <ASP:RadioButtonList id="RadioButtonList_driver_qualified_yes_no" runat="server" repeatdirection="Horizontal">
                          <ASP:ListItem value="Yes">Yes</ASP:ListItem>
                          <ASP:ListItem value="No">No</ASP:ListItem>
                        </ASP:RadioButtonList>
                      </td>
                      <td nowrap="nowrap"><ASP:RequiredFieldValidator id="RequiredFieldValidator_qualified_driver_yes_no" runat="server" errormessage="Please indicate whether or not the member is a qualified driver." font-bold="True" controltovalidate="RadioButtonList_driver_qualified_yes_no">!ERR!</ASP:RequiredFieldValidator></td>
                    </tr>
                    <tr id="TableRow_agency" runat="server">
                      <td>Agency:</td>
                      <td><ASP:DropDownList id="DropDownList_agency" runat="server"></ASP:DropDownList></td>
                      <td nowrap="nowrap"><ASP:RequiredFieldValidator id="RequiredFieldValidator_agency" runat="server" errormessage="Please select an agency." font-bold="True" controltovalidate="DropDownList_agency">!ERR!</ASP:RequiredFieldValidator></td>
                    </tr>
                    <tr id="TableRow_section" runat="server">
                      <td>Section:</td>
                      <td><ASP:DropDownList id="DropDownList_section" runat="server"></ASP:DropDownList></td>
                      <td nowrap="nowrap"></td>
                    </tr>
                    <tr>
                      <td valign="top">Entry date:</td>
                      <td nowrap="nowrap">
                        <uc1:drop_down_date runat="server" id="UserControl_enrollment_date"></uc1:drop_down_date>
                      </td>
                      <td nowrap="nowrap">
                        <ASP:Label id="Label_invalid_enrollment_date" runat="server" font-bold="True" forecolor="Red" visible="False">!ERR!</ASP:Label>
                      </td>
                    </tr>
                    <tr>
                      <td>Membership status:</td>
                      <td><ASP:DropDownList id="DropDownList_enrollment_level" runat="server"></ASP:DropDownList></td>
                      <td nowrap="nowrap"><ASP:RequiredFieldValidator id="RequiredFieldValidator_enrollment_level" runat="server" errormessage="Please select a membership status." font-bold="True" controltovalidate="DropDownList_enrollment_level">!ERR!</ASP:RequiredFieldValidator></td>
                    </tr>
                  </table>
                  <hr size="1"/>
                  <table cellspacing="0" cellpadding="5" border="0">
                    <tr>
                      <td colspan="4"><i>Adding a member is a 3-step process...</i></td>
                    </tr>
                    <tr>
                      <td>STEP&nbsp;1</td>
                      <td>&rarr;</td>
                      <td>Check for similar names already in the system:</td>
                      <td><ASP:Button id="Button_check_for_similarities" runat="server" text="Check" onclick="Button_check_for_similarities_Click"></ASP:Button></td>
                    </tr>
                    <tr>
                      <td valign="top">STEP&nbsp;2</td>
                      <td valign="top">&rarr;</td>
                      <td valign="top">Review these possible matches:</td>
                      <td valign="top"><ASP:Label id="Label_similars" runat="server"></ASP:Label></td>
                    </tr>
                    <tr>
                      <td>STEP&nbsp;3</td>
                      <td>&rarr;</td>
                      <td>
                        If
                        <ASP:Label id="Label_first_name" runat="server" font-bold="True">(the</ASP:Label>&nbsp;<ASP:Label id="Label_last_name" runat="server" font-bold="True">member)</ASP:Label>
                        is already in the system:
                      </td>
                      <td><ASP:Button id="Button_cancel" runat="server" text="Cancel" causesvalidation="False" onclick="Button_cancel_Click"></ASP:Button></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td></td>
                      <td align="right">Otherwise:</td>
                      <td>
                        <ASP:Button id="Button_add_and_stop" runat="server" text="Add and stop" enabled="False" onclick="Button_add_and_stop_Click"></ASP:Button>&nbsp;or&nbsp;<ASP:Button id="Button_add_and_repeat" runat="server" text="Add and repeat" enabled="False" onclick="Button_add_and_repeat_Click"></ASP:Button>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
    </form>
  </body>
</html>
