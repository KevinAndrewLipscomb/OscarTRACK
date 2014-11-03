<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_paypal_assistant.ascx.cs" Inherits="UserControl_paypal_assistant.TWebUserControl_paypal_assistant"%>
<%@ Register src="../ki/UserControl_drop_down_date.ascx" tagname="UserControl_drop_down_date" tagprefix="uc1" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table cellpadding="0" cellspacing="0" border="1" bordercolor="gainsboro">
  <tr>
    <td>
      <table cellpadding="10" cellspacing="0">
        <tr>
          <td bgcolor="WhiteSmoke"><strong>PayPal assistant step 1 of 3</strong></td>
        </tr>
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" border="0">
              <tr>
                <td align="right">*Amount donated:</td>
                <td>
                  $<asp:TextBox ID="TextBox_amount_donated" runat="server"></asp:TextBox>
                  </td>
                <td>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator_amount_donated" runat="server" ControlToValidate="TextBox_amount_donated" Display="Dynamic" ErrorMessage="Please enter the Amount donated" Font-Bold="True">!ERR!</asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator_amount_donated" runat="server" ControlToValidate="TextBox_amount_donated" Display="Dynamic" ErrorMessage="Please enter a valid Amount donated" Font-Bold="True" 
                    ValidationExpression="[$0\.]*[1-9][0-9,\.]*">!ERR!</asp:RegularExpressionValidator>
                </td>
              </tr>
              <tr>
                <td align="right">*Donor's email address:</td>
                <td><asp:TextBox ID="TextBox_donor_email_address" runat="server" Columns="40" MaxLength="127"></asp:TextBox></td>
                <td>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator_donor_email_address" runat="server" ControlToValidate="TextBox_donor_email_address" Display="Dynamic" ErrorMessage="Please enter the Donor's email address" Font-Bold="True">!ERR!</asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator_donor_email_address" runat="server" ControlToValidate="TextBox_donor_email_address" Display="Dynamic" ErrorMessage="Please enter a valid Donor email address" Font-Bold="True" 
                    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">!ERR!</asp:RegularExpressionValidator>
                  <asp:CustomValidator ID="CustomValidator_donor_email_address" runat="server" ControlToValidate="TextBox_donor_email_address" Display="Dynamic" 
                    ErrorMessage="Please enter a Donor email address with a valid domain name (the part after the &quot;@&quot; sign)" Font-Bold="True" onservervalidate="CustomValidator_donor_email_address_ServerValidate">!ERR!</asp:CustomValidator>
                </td>
              </tr>
              <tr>
                <td align="right">*Donor's name:</td>
                <td><asp:TextBox ID="TextBox_donor_name" runat="server" Columns="50"></asp:TextBox></td>
                <td>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator_donor_name" runat="server" ControlToValidate="TextBox_donor_name" ErrorMessage="Please enter the Donor's name" Font-Bold="True">!ERR!</asp:RequiredFieldValidator>
                </td>
              </tr>
              <tr>
                <td align="right">*Date of donation:</td>
                <td><uc1:UserControl_drop_down_date ID="UserControl_drop_down_date_donation_date" runat="server" /></td>
                <td></td>
              </tr>
              <tr>
                <td align="right" valign="top">Address data:</td>
                <td><asp:TextBox ID="TextBox_address_data" runat="server" Enabled="false" Columns="60" Rows="4" TextMode="MultiLine"></asp:TextBox></td>
                <td></td>
              </tr>
              <tr>
                <td align="right" valign="top">Memo:</td>
                <td><asp:TextBox ID="TextBox_memo" runat="server" Enabled="false" Columns="60" Rows="4" TextMode="MultiLine"></asp:TextBox></td>
                <td></td>
              </tr>
              <tr>
                <td align="right">Donor's house #:</td>
                <td><asp:TextBox ID="TextBox_donor_house_num" runat="server" Columns="15"></asp:TextBox></td>
                <td>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator_donor_house_num" runat="server" ControlToValidate="TextBox_donor_house_num" Display="Dynamic" 
                    ErrorMessage="Please enter a valid Donor house #, using numbers, hyphens, forward slashes, and letters only" Font-Bold="True" ValidationExpression="[0-9a-zA-Z\-/]+">!ERR!</asp:RegularExpressionValidator>
                </td>
              </tr>
              <tr>
                <td align="right">Donor's street:</td>
                <td><asp:DropDownList ID="DropDownList_donor_street" runat="server"></asp:DropDownList></td>
                <td></td>
              </tr>
              <tr>
                <td></td>
                <td><asp:Button ID="Button_submit" runat="server" onclick="Button_submit_Click" Text="Submit" /></td>
                <td></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
