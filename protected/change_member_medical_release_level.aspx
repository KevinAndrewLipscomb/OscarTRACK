<%@ Page language="c#" Debug="true" Codebehind="change_member_medical_release_level.aspx.cs" AutoEventWireup="True" Inherits="change_member_medical_release_level.TWebForm_change_member_medical_release_level" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head runat="server">
    <title id="Title"></title>
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
                <td bgcolor="#f5f5f5"><strong>Change <ASP:Label id="Label_member_name_1" runat="server"></ASP:Label>'s released cert level</strong></td>
              </tr>
              <tr>
                <td>
                  <p>Indicate the level at which <ASP:Label id="Label_member_name_2" runat="server"></ASP:Label>&nbsp;is approved <u>to function in Virginia Beach</u>.</p>
                  <table  id="HtmlTable_proper_release_reminder" runat="server" bordercolor="#ffff00" cellspacing="0" cellpadding="5" bgcolor="#ffff00" border="1">
                    <tr>
                      <td>
                      <p>Make changes only <strong>after</strong>&nbsp;the member has received the appropriate ID card from the department.&nbsp; Do <strong>not</strong>&nbsp;set a member to EMT-B unless you are <strong>positive</strong>&nbsp;that the training center has issued the member a White ID Card <strong>with no red stripe</strong>.</p>
                    </td>
                    </tr>
                  </table>
                  <br>
                  <table cellspacing="0" cellpadding="10" border="0">
                    <tr>
                      <td>
                        <ASP:Label id="Label_member_name_3" runat="server"></ASP:Label>'s current released cert level is:
                      </td>
                      <td><asp:Label id="Label_current_medical_release_level" runat="server"></asp:Label></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td align="right">Change it to:</td>
                      <td><ASP:DropDownList id="DropDownList_medical_release_level" runat="server"></ASP:DropDownList></td>
                      <td>
                        <asp:RequiredFieldValidator id="RequiredFieldValidator_medical_release_level" runat="server" errormessage="Please select a new released certification level." font-bold="True" controltovalidate="DropDownList_medical_release_level" display="Dynamic">!ERR!</asp:RequiredFieldValidator>
                        <asp:CustomValidator id="CustomValidator_control" runat="server" display="Dynamic" font-bold="True" onservervalidate="CustomValidator_control_ServerValidate">!ERR!</asp:CustomValidator>
                      </td>
                    </tr>
                    <tr>
                      <td></td>
                      <td><ASP:Button id="Button_submit" runat="server" text="Submit" onclick="Button_submit_Click"></ASP:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <ASP:Button id="Button_cancel" runat="server" text="Cancel" causesvalidation="False" onclick="Button_cancel_Click"></ASP:Button></td>
                      <td></td>
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
