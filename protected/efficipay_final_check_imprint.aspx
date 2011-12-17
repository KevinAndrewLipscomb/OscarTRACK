<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->
<%@ Page language="c#" Debug="true" Codebehind="efficipay_final_check_imprint.aspx.cs" AutoEventWireup="True" Inherits="efficipay_final_check_imprint.TWebForm_efficipay_final_check_imprint" EnableViewState="false"%>
<%@ Register src="../usercontrol/app/UserControl_common_header_bar.ascx" tagname="UserControl_common_header_bar" tagprefix="uc2" %>
<html>
  <head runat="server">
    <title></title>
    <!-- $Id$ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
    <style type="text/css">
      #inner_line
        {
        FONT-FAMILY: Courier New, Courier, monospace;
        }
      .check_right_cell_table_payload_row
        {
        height: 1.3125in;
        }
      .check_right_cell_table_spacer_row
        {
        height: 1.3125in;
        }
      .check_segment
        {
        /* Assumes top margin of 0.75in */
        height: 2.625in;
        }
      .inner_line_outer_element
        {
        font-size: smaller;
        }
      .outer_line
        {
        font-family: Arial, Helvetica, sans-serif;
        font-size: smaller;
        }
      .right_cell_table
        {
        height: 100%;
        width: 100%;
        }
      .stub_right_cell_table_payload_row
        {
        height: 34%;
        }
      .stub_right_cell_table_spacer_row
        {
        height: 33%;
        }
      .stub_segment
        {
        height: 2.46875in;
        /* Assumes bottom margin setting of 0.75in */
        }
      .voucher_segment
        {
        height: 3.5in;
        }
    </style>
  </head>
  <body bgcolor="white">
    <form runat="server">
      <table width="100%" cellpadding="0" cellspacing="0">
        <tr class="check_segment">
          <td width="60%">&nbsp;</td>
          <td width="40%">
            <table class="right_cell_table" cellpadding="0" cellspacing="0">
              <tr class="check_right_cell_table_spacer_row"><td>&nbsp;</td></tr>
              <tr class="check_right_cell_table_payload_row">
                <td valign="top">
                  <small>
                    <span class="outer_line">Authorized electronically by</span><br />
                      <div class="inner_line">
                        &nbsp;&nbsp;<asp:Label ID="Label_check_num_1" runat="server" CssClass="inner_line_outer_element"/>&nbsp;<asp:Label ID="Label_first_signer_1" runat="server" Font-Italic="True"/>&nbsp;<asp:Label ID="Label_first_hash_1" runat="server" CssClass="inner_line_outer_element"/><br />
                        &nbsp;&nbsp;<asp:Label ID="Label_check_num_2" runat="server" CssClass="inner_line_outer_element"/>&nbsp;<asp:Label ID="Label_second_signer_1" runat="server" Font-Italic="True"/>&nbsp;<asp:Label ID="Label_second_hash_1" runat="server" CssClass="inner_line_outer_element"/><br />
                      </div>
                    <span class="outer_line">via FromPaper2Web.com/OscarTRACK EfficiPay</span>
                  </small>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr class="voucher_segment">
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr class="stub_segment">
          <td>&nbsp;</td>
          <td valign="bottom">
            <small>
              <span class="outer_line">Authorized electronically by</span><br />
                <div class="inner_line">
                  &nbsp;&nbsp;<asp:Label ID="Label_check_num_3" runat="server" CssClass="inner_line_outer_element"/>&nbsp;<asp:Label ID="Label_first_signer_2" runat="server" Font-Italic="True"/>&nbsp;<asp:Label ID="Label_first_hash_2" runat="server" CssClass="inner_line_outer_element"/><br />
                  &nbsp;&nbsp;<asp:Label ID="Label_check_num_4" runat="server" CssClass="inner_line_outer_element"/>&nbsp;<asp:Label ID="Label_second_signer_2" runat="server" Font-Italic="True"/>&nbsp;<asp:Label ID="Label_second_hash_2" runat="server" CssClass="inner_line_outer_element"/><br />
                </div>
              <span class="outer_line">via FromPaper2Web.com/OscarTRACK EfficiPay</span>
            </small>
          </td>
        </tr>
      </table>
    </form>
    <script type="text/javascript">window.print();</script>
  </body>
</html>