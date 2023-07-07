<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_efficipay_tutorial.ascx.cs" Inherits="UserControl_efficipay_tutorial.TWebUserControl_efficipay_tutorial"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<br />
<table cellspacing="0" cellpadding="20" width="100%" style="border-bottom:5px solid lightgreen; background:url(https://frompaper2web.com/EfficiPay/image/098-4.jpg); background-size:cover; background-position:bottom;">
  <tr>
    <td align="center">
      <span style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size:1.618em; text-shadow: 1px 1px 5px white, -1px -1px 5px white, 1px -1px 5px white, -1px 1px 5px white;">
        <span style="font-size:1.618em;"><b>TUTORIAL:&nbsp; The EfficiPay process</b></span>
      </span>
    </td>
    <td width="1%">
      <asp:Image ID="Image_quill" runat="server" ImageUrl="~/UserControl/ki/image/Quill-1.jpg" AlternateText="Quill" style="opacity:0.85"/>
      <ajaxToolkit:DropShadowExtender ID="Image_quill_DropShadowExtender" runat="server" BehaviorID="Image_quill_DropShadowExtender" TargetControlID="Image_quill" />
    </td>
  </tr>
</table>
<table>
  <tr>
    <td>
      <table align="center" cellpadding="5" cellspacing="30" width="100%">
        <tr><td colspan="4" bgcolor="#dcdcdc"><span style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size:1.618em;"><b>Phase 1 of 3: Initial handling</b></span></td></tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="3" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size:1.618em;"><b>This phase is performed by the company treasurer or bookkeeper.</b></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_invoices" runat="server" ImageUrl="~/UserControl/ki/image/invoices-1.jpg" AlternateText="Invoices" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif">
            <u>Gather</u> all the documents related to a particular payment, as you normally would.&nbsp; These might be in paper or electronic format.&nbsp; Include any associated purchase orders, statements, bills, invoices or
            receipts.&nbsp; Also include any authorizing or explanatory emails or memos.&nbsp; You're already doing all this in your current process.
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;">
            <asp:Image ID="Image_voucher_check_on_top" runat="server" ImageUrl="~/UserControl/ki/image/laser-voucher-check-on-top-1.jpg" AlternateText="Voucher check-on-top check" />
            <ajaxToolkit:DropShadowExtender ID="Image_voucher_check_on_top_DropShadowExtender" runat="server" BehaviorID="Image_voucher_check_on_top_DropShadowExtender" TargetControlID="Image_voucher_check_on_top" />
            <br />
            <small>Voucher check-on-top checks</small>
          </td>
          <td style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">
            <p><b>Note that with EfficiPay, you must use "voucher check-on-top" checks, as shown on the left.</b></p>
            <p>These are widely available and offer extra value for both you and your payees.&nbsp; Make sure you've set up your bookkeeping program to print this kind of check.</p>
            <p>From your bookkeeping program, <u>print</u> the check as you normally would.</p>
          </td>
          <td align="center" style="border-left:1px solid #dcdcdc;">
            <asp:Image ID="Image_print_check" runat="server" ImageUrl="~/UserControl/ki/image/print-check.jpg"  AlternateText="Print check" />
            <br />
            <small>First imprint -- unsigned</small>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;">
            <asp:Image ID="Image_scan" runat="server" ImageUrl="~/UserControl/ki/image/scan.jpg" AlternateText="Scan" /><br />
            <asp:Image ID="Image_scan_control_panel" runat="server" ImageUrl="~/UserControl/ki/image/scan-control-panel.jpg" AlternateText="Scan control panel" />
          </td>
          <td style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">
            <p><u>Scan</u> the printed, unsigned check, and its associated supporting documents, in your document scanner.&nbsp; We recommend using monochrome settings to reduce file size.</p>
            <p><b>Yeah, you need a document scanner.&nbsp; We like flatbed models, and those with automatic sheet feeders are wonderful.&nbsp; An all-in-one is perfect for this process.</b></p>
            <p>
              Save the scan to your hard drive.&nbsp; You can scan the check and the documents into one file, or multiple ones.&nbsp; EfficiPay will support you either way, but it does have
              a limit of 4 gigabytes per upload.
            </p>
            <p>We recommend naming the scan that includes the unsigned check according to the check number.&nbsp; For instance, if this is for check #3409, the scan that includes that check should be named '3409.pdf', or similar.</p>
          </td>
          <td align="center" style="border-left:1px solid #dcdcdc;"><asp:Image ID="Image_save_files_to_hard_drive" runat="server" AlternateText="Save files to hard drive" ImageUrl="~/UserControl/ki/image/save-files-to-hard-drive.jpg" /></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_manage_dockets" runat="server" AlternateText="Manage dockets" ImageUrl="~/UserControl/ki/image/manage-dockets.png" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">Log into EfficiPay and click the MANAGE DOCKETS link.</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_add_docket" runat="server" AlternateText="Add docket" ImageUrl="~/UserControl/ki/image/add-docket.png" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">Click <i>Add docket</i>.</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_check_number_entry" runat="server" AlternateText="Check number entry" ImageUrl="~/UserControl/ki/image/check-number-entry.png" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">Enter the check number and click the <i>Continue...</i> button.</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_browse" runat="server" AlternateText="Browse" ImageUrl="~/UserControl/ki/image/browse.png" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">
            <p>Click the <i>Browse...</i> or <i>Choose file</i> button.&nbsp;</p>
            <p>(This button's label depends on which browser you're using, but it will be near a <i>paperclip</i> icon.)</p>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_select_check_file" runat="server" AlternateText="Select check file" ImageUrl="~/UserControl/ki/image/select-check-file.png" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">Select the file containing the scanned image of the unsigned check, and complete the dialog box.</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_upload" runat="server" AlternateText="Upload" ImageUrl="~/UserControl/ki/image/upload.png" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">Click the <i><==Upload</i> button.</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_other_uploads" runat="server" AlternateText="Other uploads" ImageUrl="~/UserControl/ki/image/other-uploads.png" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">Repeat the previous two steps if you have other files to include in this docket as supporting documentation.</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">
            You've just created an EfficiPay <u>docket</u> -- an electronic collection that includes an unsigned check and any supporting documentation that the check signers should review.
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_mark_ready" runat="server" AlternateText="Mark ready" ImageUrl="~/UserControl/ki/image/mark-ready.png" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">
            <p>Review your work.</p>
            <p>If satisfied, check the <i>Ready for review by signers</i> box.</p>
            <p><b>You've completed the initial handling phase!</b></p>
          </td>
        </tr>
        <tr><td colspan="4" bgcolor="#dcdcdc"><span style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size:1.618em;"><b>Phase 2 of 3: Signing phase</b></span></td></tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="3" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif">
            <p><span style="font-size:1.618em;"><b>This phase is performed by the company check signers.</b></span></p>
            <p>EfficiPay will notify the check signers by email that a check is ready to be reviewed and signed.</p>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_manage_dockets_2" runat="server" AlternateText="Manage dockets" ImageUrl="~/UserControl/ki/image/manage-dockets.png" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">Log into EfficiPay and click the MANAGE DOCKETS link.</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_open_docket" runat="server" AlternateText="Open docket" ImageUrl="~/UserControl/ki/image/open-docket.png" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">Click the yellow <i>open folder</i> icon to open a docket.</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_docket_content" runat="server" AlternateText="Docket content" ImageUrl="~/UserControl/ki/image/docket-content.png" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">
            <p>Click each of the docket content attachments and review them carefully, the same as you would if you were preparing to sign a check by hand.</p>
            <p>Make sure the check number on the scanned check image matches the Check Number Of Record displayed on the efficipay_docket_detail page.</p>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_sign" runat="server" AlternateText="Sign" ImageUrl="~/UserControl/ki/image/sign.png" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">
            <p>If you are satisfied, click the <i>Sign check</i> button.</p>
            <p><b>When two check signers have done this, the signing phase is complete!</b></p>
          </td>
        </tr>
        <tr><td colspan="4" bgcolor="#dcdcdc"><span style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size:1.618em;"><b>Phase 3 of 3: Final imprint</b></span></td></tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="3" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif">
            <p><span style="font-size:1.618em;"><b>This phase is performed by the company treasurer or bookkeeper.</b></span></p>
            <p>EfficiPay will notify the treasurer and/or bookkeeper(s) by email when a check has been signed by two signers.</p>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_manage_dockets_3" runat="server" AlternateText="Manage dockets" ImageUrl="~/UserControl/ki/image/manage-dockets.png" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">Log into EfficiPay and click the MANAGE DOCKETS link.</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_open_docket_2" runat="server" AlternateText="Open docket" ImageUrl="~/UserControl/ki/image/open-docket.png" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">Click the yellow <i>open folder</i> icon to open a docket.</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">
            <p>Grab the paper unsigned check.</p>
            <p><b>Make sure the paper check's number corresponds to the Check Number Of Record currently displayed by EfficiPay.</b></p>
            <p>Load it into the printer in the same orientation as you did when you first printed it.</p>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_print_final" runat="server" AlternateText="Print final" ImageUrl="~/UserControl/ki/image/print-final.png" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">Click <i>Print signature marks on check</i>.</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_popup_and_dialog" runat="server" AlternateText="Popup and dialog" ImageUrl="~/UserControl/ki/image/popup-and-dialog.png" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">
            In a new browser tab, EfficiPay will prepare the final imprint containing the electronic signatures.&nbsp Your browser's print dialog will also open.&nbsp; Make sure you've selected the right printer, then click the
            <i>Print</i> button.
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_print_check_2" runat="server" AlternateText="Print check (final)" ImageUrl="~/UserControl/ki/image/print-check.jpg" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;"><b>The check that comes out of the printer will now have the required two signatures!</b></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_sample_final_imprint" runat="server" AlternateText="Sample final imprint" ImageUrl="~/UserControl/ki/image/sample-final-imprint.png" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">
            <p>
              Here's a sample of the signature block that EfficiPay applies to the check.&nbsp; It includes a check series number ("002" in this example), the check number ("3409" in this example), the signers&#39; EfficiPay
              ID numbers, the signers&#39; names, and verification hex codes.&nbsp; The hex codes provide assurance that the signature is only valid for the indicated check series, check number, and signer.
            </p>
            <p>The signature block appears once on the check itself, and again on the bottom voucher.</p>
            <p>Separately, EfficiPay provides a way for you, your vendors, or any auditors to verify the authenticity and applicability of these electronic signatures.</p>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_delete_docket" runat="server" AlternateText="Delete docket" ImageUrl="~/UserControl/ki/image/delete-docket.png" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">
            <p>Close the browser tab that's displaying the final imprint.</p>
            <p>If all went according to plan, you may now click <i>Delete docket</i>.</p>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_invoices_2" runat="server" AlternateText="Archive the paperwork" ImageUrl="~/UserControl/ki/image/invoices-1.jpg" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">
            <p>EfficiPay does <u>not</u> archive the electronic docket.</p>
            <p>File the paper check's bottom voucher and its supporting paper documentation in your physical archives.</p>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" style="border-right:1px solid #dcdcdc;"><asp:Image ID="Image_mail_check" runat="server" AlternateText="Mail the check" ImageUrl="~/UserControl/ki/image/mail_check.jpg" /></td>
          <td colspan="2" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">
            <p>Send the check to the payee.</p>
            <p><b>You've completed the entire process!</b></p>
          </td>
        </tr>
        <tr id="TableRow_ready_get_started_1" runat="server"><td colspan="4" bgcolor="#dcdcdc"><span style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size:1.618em;"><b>Ready?</b></span></td></tr>
        <tr id="TableRow_ready_get_started_2" runat="server"><td align="center" colspan="4"><asp:Button ID="Button_get_started" runat="server" Text="Get started!" height="1.618em" width="61.8%" CausesValidation="False"  ForeColor="Blue" Font-Bold="True" Font-Size="1.618em" OnClick="Button_get_started_Click" /></td></tr>
      </table>
    </td>
  </tr>
</table>
