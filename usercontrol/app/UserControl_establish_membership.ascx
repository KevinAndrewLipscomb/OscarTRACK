<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_establish_membership.ascx.cs" Inherits="UserControl_establish_membership.TWebUserControl_establish_membership" %>
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" width="100%" border="0">
        <tr bgcolor="#f5f5f5">
          <td>
            <strong>Establish membership</strong>
          </td>
        </tr>
        <tr>
          <td>
            <p>Your <asp:Label ID="Label_application_name_1" runat="server"></asp:Label>&nbsp;username is not currently linked to a&nbsp;<asp:Label ID="Label_sponsor_1" runat="server"></asp:Label>&nbsp;membership record.</p>
            <p>Are you already a <asp:Label ID="Label_sponsor_2" runat="server"></asp:Label>&nbsp;member?</p>
            <p>
              <table cellspacing="0" cellpadding="10" border="0">
                <tr>
                  <td valign="top"><p align="center"><strong>NO</strong></p></td>
                  <td valign="top" nowrap="nowrap"><p>-&gt;</p></td>
                  <td valign="top">
                    <p>Visit <a href="http://www.vabeachems.com/">www.VaBeachEms.com</a>&nbsp;and click "EMS Provider Application Process".</p>
                    <p>&nbsp;</p>
                  </td>
                </tr>
                <tr>
                  <td valign="top"><p align="center"><strong>YES</strong></p></td>
                  <td valign="top" nowrap="nowrap"><p>-&gt;</p></td>
                  <td valign="top">
                    <p>Match yourself to a <asp:Label ID="Label_sponsor_3" runat="server"></asp:Label>&nbsp;membership record by entering <asp:Label ID="Label_shared_secret_description" runat="server"></asp:Label>&nbsp;here:</p>
                    <blockquote>
                      <asp:TextBox ID="TextBox_nominal_shared_secret" runat="server" Columns="6" MaxLength="6"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator_nominal_shared_secret" runat="server" ErrorMessage="Please enter a nominal Officer Code (CAD number)" Font-Bold="True" ControlToValidate="TextBox_nominal_shared_secret" Display="Dynamic">!ERR!</asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator_nominal_shared_secret" runat="server" ErrorMessage="Please enter only numbers." Font-Bold="True" ControlToValidate="TextBox_nominal_shared_secret" ValidationExpression="\d{6}" Display="Dynamic">!ERR!</asp:RegularExpressionValidator>
                      <asp:CustomValidator ID="CustomValidator_shared_secret" runat="server" Display="Dynamic" ErrorMessage="Sorry, because of privileges attached to the specified membership record, Application Administrator intervention is required to complete this match.  The Application Administrator has been notified and will be in touch with you." Font-Bold="True" OnServerValidate="CustomValidator_shared_secret_ServerValidate">!ERR!</asp:CustomValidator>
                    </blockquote>
                    <p>Re-enter <asp:Label ID="Label_shared_secret_description_2" runat="server"></asp:Label>&nbsp;to avoid typographical errors:</p>
                    <blockquote>
                      <asp:TextBox ID="TextBox_confirmation_shared_secret" runat="server" Columns="6" MaxLength="6"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator_confirmation_shared_secret" runat="server" ErrorMessage="Please enter a confirmation Officer Code (CAD number)" Font-Bold="True" ControlToValidate="TextBox_confirmation_shared_secret" Display="Dynamic">!ERR!</asp:RequiredFieldValidator>
                      <asp:CompareValidator ID="CompareValidator_confirmation_shared_secret" runat="server" ErrorMessage="Nominal and confirmation Officer Codes (CAD numbers) must match.  Please try again." Font-Bold="True" ControlToValidate="TextBox_confirmation_shared_secret" ControlToCompare="TextBox_nominal_shared_secret">!ERR!</asp:CompareValidator>
                    </blockquote>
                    <asp:Button ID="Button_submit" runat="server" Text="Submit" Font-Bold="True" OnClick="Button_submit_Click"></asp:Button>
                    <p>&nbsp;</p>
                    <p>If you have trouble with this feature, <asp:LinkButton ID="LinkButton_trouble_handler" runat="server" CausesValidation="False" OnClick="LinkButton_trouble_handler_Click">click here</asp:LinkButton>.</p>
                    <p>&nbsp;</p>
                    <p>
                      <table id="Table_proceed" runat="server" visible="False" bordercolor="#0000ff" cellspacing="0" cellpadding="10" border="3">
                        <tr>
                          <td>
                            <asp:LinkButton ID="LinkButton_proceed" runat="server" Font-Bold="True" OnClick="LinkButton_proceed_Click">CLICK HERE TO CONTINUE</asp:LinkButton>
                          </td>
                        </tr>
                      </table>
                    </p>
                  </td>
                </tr>
              </table>
            </p>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
