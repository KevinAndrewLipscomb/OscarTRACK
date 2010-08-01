<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_log_new_donation.ascx.cs" Inherits="UserControl_log_new_donation.TWebUserControl_log_new_donation"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table border="0" cellspacing="0" cellpadding="10">
  <tr>
    <td bgcolor="#f7f7f7" border="0" valign="top" width="25%">
      <p><b><u>Previous operation</u></b></p>
      <p></p>
      <asp:Panel id="Panel_previous_none" runat="server"><small>None</small></asp:Panel>
      <asp:Panel id="Panel_previous_data" runat="server" visible="False">
        <TABLE cellspacing="0" cellpadding="5" width="100%" border="0">
          <tr>
            <td>
              <asp:Label id="Label_succeeded" runat="server" font-bold="True" text="SUCCEEDED"></asp:Label></td>
            <td>
              <asp:Button id="Button_undo" runat="server" text="Undo" causesvalidation="False"></asp:Button></td>
          </tr>
        </TABLE>
        <SMALL>
          <dl>
            <dt>ROD#:</dt>
              <!-- Change the following label to a linkbutton -->
              <dd><asp:Label id="Label_previous_rod_num" runat="server"></asp:Label></dd>
            <dt>Lookup data:</dt>
              <!-- Change the following label to a linkbutton -->
              <dd><asp:Label id="Label_previous_lookup_data" runat="server"></asp:Label></dd>
            <asp:Panel id="Panel_previous_priors" runat="server" visible="False">
              <hr>
              <asp:Label id="Label_previous_priors_data" runat="server"></asp:Label> prior donation(s) on record
            </asp:Panel>
            <dt>Amount:</dt><dd>$<asp:Label id="Label_previous_amount" runat="server"></asp:Label></dd>
            <dt>Prospectivity:</dt><dd><asp:Label id="Label_previous_prospectivity" runat="server"></asp:Label></dd>
            <dt>Method:</dt><dd><asp:Label id="Label_previous_method" runat="server"></asp:Label></dd>
            <dt>In memory of:</dt><dd><asp:Label id="Label_previous_in_memory_of" runat="server"></asp:Label></dd>
            <dt>Note:</dt><dd><asp:Label id="Label_previous_note" runat="server"></asp:Label></dd>
          </dl>
        </SMALL>
      </asp:Panel>
    </td>
    <td valign="top">
      <p><b><u>Current operation</u></b></p>
      <table border="0" cellspacing="0" cellpadding="5">
        <tr>
          <td align="right">ROD#:</td>
          <td><asp:TextBox id="TextBox_rod_num" runat="server" columns="5" maxlength="5"></asp:TextBox></td>
          <td>
            <asp:RequiredFieldValidator id="RequiredFieldValidator_rod_num" runat="server" errormessage="Please enter a ROD#." font-bold="True" controltovalidate="TextBox_rod_num" display="Dynamic">!ERR!</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator id="RegularExpressionValidator_rod_num" runat="server" errormessage="Please enter a valid ROD#." font-bold="True" controltovalidate="TextBox_rod_num" display="Dynamic" validationexpression="\d{1,5}">!ERR!</asp:RegularExpressionValidator>
            <asp:CustomValidator id="CustomValidator_rod_num" runat="server" errormessage="No such resident found by that ROD#." font-bold="True" display="Dynamic" onservervalidate="CustomValidator_rod_num_ServerValidate">!ERR!</asp:CustomValidator>
          </td>
        </tr>
        <tr>
          <td align="right">Amount: $</td>
          <td><asp:TextBox id="TextBox_amount" runat="server" columns="6" maxlength="10"></asp:TextBox></td>
          <td>
            <asp:RequiredFieldValidator id="RequiredFieldValidator_amount" runat="server" errormessage="Please enter an Amount." font-bold="True" controltovalidate="TextBox_amount" setfocusonerror="True">!ERR!</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator id="RegularExpressionValidator_amount" runat="server" errormessage="Please enter a valid Amount." font-bold="True" controltovalidate="TextBox_amount" display="Dynamic" validationexpression="[$0\.]*[1-9][0-9,\.]*">!ERR!</asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr>
          <td align="right">Wants info on:</td>
          <td><asp:DropDownList id="DropDownList_prospectivity" runat="server"></asp:DropDownList></td>
          <td></td>
        </tr>
        <tr>
          <td align="right">Received via:</td>
          <td><asp:DropDownList id="DropDownList_method" runat="server"></asp:DropDownList></td>
          <td></td>
        </tr>
        <tr>
          <td align="right">In memory of:</td>
          <td><asp:TextBox id="TextBox_in_memory_of" runat="server" columns="60" maxlength="60"></asp:TextBox></td>
          <td></td>
        </tr>
        <tr>
          <td align="right" valign="top">Note:</td>
          <td>
            <asp:TextBox id="TextBox_note" runat="server" columns="40" rows="4" textmode="MultiLine"></asp:TextBox></td>
          <td valign="top">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator_note" runat="server" ErrorMessage="Please restrict the Note entry to 16,777,215 characters." ControlToValidate="TextBox_note" Display="Dynamic" Font-Bold="True" ValidationExpression="^[\s\S]{0,16777215}$">!ERR!</asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr>
          <td align="right">&nbsp;</td>
          <td>
            <asp:Button id="Button_submit" runat="server" text="Submit" onclick="Button_submit_Click"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button id="Button_reset" runat="server" text="Reset" onclick="Button_reset_Click"></asp:Button>
          </td>
          <td></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
