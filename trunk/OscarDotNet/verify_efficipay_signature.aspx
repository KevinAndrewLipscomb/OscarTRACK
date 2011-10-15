<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ Page Language="c#" Debug="true" CodeBehind="verify_efficipay_signature.aspx.cs" AutoEventWireup="True" Inherits="verify_efficipay_signature.TWebForm_verify_efficipay_signature" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<html>
  <head runat="server">
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
    <!-- $Id$ -->
    <style type="text/css">
      .bordered_cell
        {
        border: 1px solid gainsboro;
        }
    </style>
  </head>
  <body bgcolor="white">
    <form runat="server">
    <uc1:UserControl_precontent ID="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
    <p>
      <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" border="0">
              <tr>
                <td bgcolor="#f5f5f5">
                  <strong>EfficiPay signature verification</strong>
                </td>
              </tr>
              <tr>
                <td>
                  <table cellpadding="5" cellspacing="1">
                    <tr>
                      <td colspan="6">Each EfficiPay signature has the following structure:</td>
                    </tr>
                    <tr>
                      <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td align="center" bgcolor="whitesmoke" class="bordered_cell" colspan="3"><small>--&nbsp;Signer&nbsp;--</small></td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td align="center" bgcolor="whitesmoke" class="bordered_cell" valign="bottom"><small>Check #</small></td>
                      <td align="center" bgcolor="whitesmoke" class="bordered_cell" valign="bottom"><small>ID #</small></td>
                      <td align="center" bgcolor="whitesmoke" class="bordered_cell" valign="bottom"><small>First name</small></td>
                      <td align="center" bgcolor="whitesmoke" class="bordered_cell" valign="bottom"><small>Last name</small></td>
                      <td align="center" bgcolor="whitesmoke" class="bordered_cell" valign="bottom"><small>Hex code</small></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td><small>Example:</small></td>
                      <td align="center" class="bordered_cell"><b>8888</b></td>
                      <td align="center" class="bordered_cell"><i><b><big><big>800000</big></big></b></i></td>
                      <td align="center" class="bordered_cell"><i><b><big><big>John</big></big></b></i></td>
                      <td align="center" class="bordered_cell"><i><b><big><big>Doe</big></big></b></i></td>
                      <td align="center" class="bordered_cell"><b>A1B2C3D4</b></td>
                    </tr>
                    <tr>
                      <td colspan="6"><br />To verify an actual EfficiPay signature, enter its parts exactly as imprinted on the check:</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td align="center" bgcolor="whitesmoke" class="bordered_cell" colspan="3"><small>--&nbsp;Signer&nbsp;--</small></td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td align="center" bgcolor="whitesmoke" class="bordered_cell" valign="bottom"><small>Check #</small></td>
                      <td align="center" bgcolor="whitesmoke" class="bordered_cell" valign="bottom"><small>ID #</small></td>
                      <td align="center" bgcolor="whitesmoke" class="bordered_cell" valign="bottom"><small>First name</small></td>
                      <td align="center" bgcolor="whitesmoke" class="bordered_cell" valign="bottom"><small>Last name</small></td>
                      <td align="center" bgcolor="whitesmoke" class="bordered_cell" valign="bottom"><small>Hex code</small></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td align="right">&nbsp;</td>
                      <td align="center" class="bordered_cell">
                        <asp:TextBox ID="TextBox_check_num" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_check_num" runat="server" ControlToValidate="TextBox_check_num" Display="Dynamic" ErrorMessage="Please enter a Check #." Font-Bold="True">!ERR!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox_check_num" Display="Dynamic" ErrorMessage="Please enter a valid Check # using only numerals." Font-Bold="True" 
                          ValidationExpression="\d+">!ERR!</asp:RegularExpressionValidator>
                      </td>
                      <td align="center" class="bordered_cell">
                        <asp:TextBox ID="TextBox_signer_member_id" runat="server" Columns="6" MaxLength="6"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_signer_member_id" runat="server" ControlToValidate="TextBox_signer_member_id" Display="Dynamic" ErrorMessage="Please enter a Signer ID #." Font-Bold="True">!ERR!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator_signer_member_id" runat="server" ControlToValidate="TextBox_signer_member_id" Display="Dynamic" 
                          ErrorMessage="Please enter a valid Signer ID #, 6 digits long, using only numerals." Font-Bold="True" ValidationExpression="\d{6}">!ERR!</asp:RegularExpressionValidator>
                      </td>
                      <td align="center" class="bordered_cell">
                        <asp:TextBox ID="TextBox_signer_first_name" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_signer_first_name" runat="server" ControlToValidate="TextBox_signer_first_name" Display="Dynamic" ErrorMessage="Please enter a Signer first name." Font-Bold="True">!ERR!</asp:RequiredFieldValidator>
                      </td>
                      <td align="center" class="bordered_cell">
                        <asp:TextBox ID="TextBox_signer_last_name" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_signer_last_name" runat="server" ControlToValidate="TextBox_signer_last_name" Display="Dynamic" ErrorMessage="Please enter a Signer last name." Font-Bold="True">!ERR!</asp:RequiredFieldValidator>
                      </td>
                      <td align="center" class="bordered_cell">
                        <asp:TextBox ID="TextBox_hex_code" runat="server" Columns="8" MaxLength="8"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_hex_code" runat="server" ControlToValidate="TextBox_hex_code" Display="Dynamic" ErrorMessage="Please enter a Hex code." Font-Bold="True">!ERR!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator_hex_code" runat="server" ControlToValidate="TextBox_hex_code" Display="Dynamic" 
                          ErrorMessage="Please enter a valid Hex code, 8 characters long, using only numerals and the letters A-F." Font-Bold="True" ValidationExpression="[0-9a-fA-F]{8}">!ERR!</asp:RegularExpressionValidator>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2">&nbsp;</td>
                      <td><asp:Button ID="Button_reset" runat="server" Text="Reset" /></td>
                      <td colspan="3">&nbsp;</td>
                      <td><asp:Button ID="Button_verify" runat="server" Text="Verify" Font-Bold="True" Font-Size="Large" /></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </p>
    <uc1:UserControl_postcontent ID="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
    </form>
  </body>
</html>
