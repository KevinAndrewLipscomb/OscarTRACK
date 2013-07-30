<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_efficipay_docket.ascx.cs" Inherits="UserControl_efficipay_docket.TWebUserControl_efficipay_docket"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~kicrudhelped~item.ascx-template -->
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<%@ Register src="../ki/UserControl_attachment_explorer.ascx" tagname="UserControl_attachment_explorer" tagprefix="uc2" %>
<asp:ValidationSummary ID="ValidationSummary_check_num" runat="server" ValidationGroup="check_num"/>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
  <tr>
    <td colspan="2">
      <table cellpadding="0" cellspacing="0" border="1" bordercolor="Gainsboro" width="100%">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="5" width="100%" border="0">
              <tr><td bgcolor="WhiteSmoke"><font class=""><b>Check Number Of Record</b></font></td></tr>
              <tr>
                <td>
                  <blockquote>
                    <font class="">
                      <ASP:TextBox id="TextBox_num" runat="server"  cssclass="" enabled="False" ValidationGroup="check_num"></ASP:TextBox>
                    </font>
                    <asp:Button ID="Button_continue" runat="server" Enabled="False" Text="Continue..." Visible="False" onclick="Button_continue_Click" ValidationGroup="check_num" />
                    <p><small>This number will also be used to identify this entire EfficiPay docket.</small></p>
                  </blockquote>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td nowrap="nowrap" valign="top">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num" runat="server" errormessage="Please enter Num." font-bold="True" controltovalidate="TextBox_num" ValidationGroup="check_num">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num" runat="server" errormessage="Please enter a valid Num." font-bold="True" controltovalidate="TextBox_num" validationexpression="\d+" ValidationGroup="check_num">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr id="TableRow_attachment" runat="server" visible="false">
    <td colspan="2">
      <table cellpadding="0" cellspacing="0" border="1" bordercolor="Gainsboro" width="100%">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="5" width="100%" border="0">
              <tr><td bgcolor="WhiteSmoke"><font class=""><b>Content</b></font></td></tr>
              <tr>
                <td>
                  <blockquote>
                    <p><small>Should include an image of the unsigned check.&nbsp; May include other supporting documentation.</small></p>
                    <font class="">
                      <uc2:UserControl_attachment_explorer ID="UserControl_attachment_explorer_control" runat="server"/>
                    </font>
                  </blockquote>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td nowrap="nowrap" valign="top">
      <asp:CustomValidator ID="CustomValidator_content" runat="server" ErrorMessage="Please upload at least one item of content." Font-Bold="True" onservervalidate="CustomValidator_content_ServerValidate">!ERR!</asp:CustomValidator>
    </td>
  </tr>
  <tr id="TableRow_be_ready_for_review" runat="server">
    <td colspan="2">
      <table cellpadding="0" cellspacing="0" border="1" bordercolor="Gainsboro" width="100%">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="5" width="100%" border="0">
              <tr><td bgcolor="WhiteSmoke"><font class=""><b>Review readiness</b></font></td></tr>
              <tr>
                <td>
                  <blockquote>
                    <p><small>Should be checked when all content has been uploaded.&nbsp; <asp:Label ID="Label_application_name" runat="server"></asp:Label> will notify signers that this docket is ready to be reviewed and signed.</small></p>
                    <font class="">
                      <ASP:CheckBox id="CheckBox_be_ready_for_review" runat="server"  cssclass="" AutoPostBack="True" oncheckedchanged="CheckBox_be_ready_for_review_CheckedChanged" CausesValidation="True" Text="Ready for review by signers" Font-Bold="True"></ASP:CheckBox>
                    </font>
                  </blockquote>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr id="TableRow_signers" runat="server" visible="false">
    <td colspan="2">
      <table cellpadding="0" cellspacing="0" border="1" bordercolor="Gainsboro" width="100%">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="5" width="100%" border="0">
              <tr><td bgcolor="WhiteSmoke"><font class=""><b>Signers</b></font></td></tr>
              <tr>
                <td>
                  <blockquote>
                    <table cellpadding="5" cellspacing="0">
                      <tr>
                        <td>1:</td>
                        <td>
                          <font class="">
                            <ASP:Label id="Label_signer_1" runat="server" Font-Italic="True"></ASP:Label>
                          </font>
                        </td>
                      </tr>
                      <tr>
                        <td>2:</td>
                        <td>
                          <font class="">
                            <ASP:Label id="Label_signer_2" runat="server" Font-Italic="True"></ASP:Label>
                          </font>
                        </td>
                      </tr>
                    </table>
                  </blockquote>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td nowrap="nowrap"></td>
  </tr>
  <tr id="TableRow_signature_action" runat="server">
    <td colspan="2">
      <table cellpadding="0" cellspacing="0" border="1" bordercolor="Gainsboro" width="100%">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="5" width="100%" border="0">
              <tr><td bgcolor="WhiteSmoke"><font class=""><b>Signature action</b></font></td></tr>
              <tr>
                <td>
                  <blockquote>
                    <p><small>Your signature will indicate that you have thoroughly reviewed the content of this docket; that the docket includes an image of exactly one properly prepared unsigned check, numbered as indicated in the above Check Number Of Record 
                      field; that the check represents a transaction that you either know to be reasonable, appropriate, and authorized by a standing purchase order, or whose reasonableness, appropriateness, and actual properly completed purchase order are
                      legitimately demonstrated by supporting documentation; that the check's payee name and amount match the values in the supporting documentation, if any; that the delivery address shown on the invoice, if any, is the business address of the
                      agency under whose auspices you are signing the check; and that the invoice clearly states service(s) provided, if any.</small></p>
                    <p><small>If in doubt, raise your concern, ask, investigate, or demand that more supporting documentation be provided prior to signing.</small></p>
                    <font class="">
                      <asp:LinkButton ID="Button_apply_signature" runat="server" Text="Sign check" Visible="False" CausesValidation="False" onclick="Button_apply_signature_Click" Font-Bold="True" />
                    </font>
                  </blockquote>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr id="TableRow_final_imprint_action" runat="server">
    <td colspan="2">
      <table cellpadding="0" cellspacing="0" border="1" bordercolor="Gainsboro" width="100%">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="5" width="100%" border="0">
              <tr><td bgcolor="WhiteSmoke"><font class=""><b>Final imprint action</b></font></td></tr>
              <tr>
                <td>
                  <blockquote>
                    <font class="">
                      <asp:HyperLink ID="HyperLink_printable_overlay" runat="server" Font-Bold="True" ForeColor="Blue" Target="_blank">Print signature marks on check</asp:HyperLink>
                    </font>
                  </blockquote>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr id="TableRow_removal_action" runat="server">
    <td colspan="2">
      <table cellpadding="0" cellspacing="0" border="1" bordercolor="Gainsboro" width="100%">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="5" width="100%" border="0">
              <tr><td bgcolor="WhiteSmoke"><font class=""><b>Removal action</b></font></td></tr>
              <tr>
                <td>
                  <blockquote>
                    <font class="">
                      <ASP:LinkButton id="Button_delete" text="Delete docket" runat="server" visible="False" onclick="Button_delete_Click" CausesValidation="False" UseSubmitBehavior="False"/>
                    </font>
                  </blockquote>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
      </table>
    </td>
  </tr>
</table>