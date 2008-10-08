<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_user.pas" Inherits="UserControl_user.TWebUserControl_user"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<table cellspacing="0" cellpadding="5" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
  <tr>
    <td bgcolor="gainsboro" valign="top">Username:</td>
    <td valign="top">
              <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                  <td valign="middle">
                    <table cellspacing="0" cellpadding="0" border="0">
                      <tr>
                        <td>
      <ASP:TextBox id="TextBox_username" runat="server" maxlength="40" columns="40"></ASP:TextBox><ASP:Button id="Button_lookup" runat="server" causesvalidation="False" text="LOOKUP"></ASP:Button>
                        </td>
                        <td nowrap="True"><small><small><asp:Label id="Label_lookup_arrow" runat="server">&lt;--</asp:Label></small></small></td>
                        <td><small><small><em><asp:Label id="Label_lookup_hint" runat="server">Lookup by partial or full field value</asp:Label></em></small></small></td>
                      </tr>
                    </table>
                  </td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td valign="middle">
                    <small>
                      <ASP:LinkButton id="LinkButton_reset" runat="server" causesvalidation="False" enabled="False">New lookup</ASP:LinkButton>
                    </small>
                  </td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td valign="middle">
                    <small>
                      <ASP:LinkButton id="LinkButton_new_record" runat="server" causesvalidation="False" visible="False">Enter&nbsp;brand&nbsp;new&nbsp;record</ASP:LinkButton>
                    </small>
                  </td>
                </tr>
              </table>
      <ASP:DropDownList id="DropDownList_username" runat="server" visible="False" autopostback="True"></ASP:DropDownList><br></td>
    <td valign="top">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_username" runat="server" errormessage="Please enter Username." font-bold="True" controltovalidate="TextBox_username">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td>Encoded password:</td>
    <td>
      <ASP:TextBox id="TextBox_encoded_password" runat="server" enabled="False" maxlength="40" columns="40"></ASP:TextBox>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td>Be stale password:</td>
    <td>
      <ASP:CheckBox id="CheckBox_be_stale_password" runat="server" enabled="False"></ASP:CheckBox>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td>Password reset email address:</td>
    <td>
      <ASP:TextBox id="TextBox_password_reset_email_address" runat="server" maxlength="255" columns="60" enabled="False"></ASP:TextBox>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_password_reset_email_address" runat="server" errormessage="Please enter Password reset email address." font-bold="True" controltovalidate="TextBox_password_reset_email_address">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td>Be active:</td>
    <td>
      <ASP:CheckBox id="CheckBox_be_active" runat="server" enabled="False"></ASP:CheckBox>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td>Num unsuccessful login attempts:</td>
    <td>
      <ASP:TextBox id="TextBox_num_unsuccessful_login_attempts" runat="server" enabled="False"></ASP:TextBox>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td>Last login:</td>
    <td>
      <ASP:TextBox id="TextBox_last_login" runat="server" enabled="False"></ASP:TextBox>
    </td>
    <td>
    </td>
  </tr>
      </table>
    </td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server" enabled="False"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False"></ASP:Button>
