<!DOCTYPE html>
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->
<%@ Page language="c#" codebehind="confirm_paypal_donation.aspx.cs" AutoEventWireup="True" Inherits="confirm_paypal_donation.TWebForm_confirm_paypal_donation" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="uc3" TagName="UserControl_update_progress_blocker" Src="~/usercontrol/app/UserControl_update_progress_blocker.ascx" %>
<html>
  <head runat="server">
    <!-- $Id$ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
      <table cellpadding="0" cellspacing="0" border="1" bordercolor="gainsboro">
        <tr>
          <td>
            <table cellpadding="10" cellspacing="0">
              <tr>
                <td bgcolor="WhiteSmoke"><strong>PayPal assistant step 3 of 3</strong></td>
              </tr>
              <tr>
                <td>
                  <p>A donation of:</p>
                  <blockquote><strong>$<asp:Literal ID="Literal_amount_donated" runat="server"></asp:Literal></strong></blockquote>
                  <p>made on:</p>
                  <blockquote><strong>
                    <asp:Literal ID="Literal_donation_date" runat="server"></asp:Literal></strong></blockquote>
                  <p>should be logged to the following donor:</p>
                  <blockquote>
                    <strong>
                      <asp:Literal ID="Literal_donor_name" runat="server"></asp:Literal>
                      <asp:Panel ID="Panel_selected" runat="server" Visible="false">
                        <br />
                        <asp:Literal ID="Literal_resident_name" runat="server"></asp:Literal><br />
                        <asp:Literal ID="Literal_house_num_and_street" runat="server"></asp:Literal><br />
                        <asp:Literal ID="Literal_city" runat="server"></asp:Literal>&nbsp;<asp:Literal ID="Literal_state" runat="server"></asp:Literal><br />
                        <br />
                        (<asp:Literal ID="Literal_num_priors" runat="server"></asp:Literal> prior donations averaging <asp:Literal ID="Literal_avg_amount" runat="server"></asp:Literal>)
                      </asp:Panel>
                    </strong>
                    <asp:Panel ID="Panel_unknown" runat="server" Visible="false">
                      <br />
                      (otherwise unknown)
                    </asp:Panel>
                    <asp:Panel ID="Panel_out_of_area" runat="server" Visible="false">
                      <br />
                      (out of area)
                    </asp:Panel>
                  </blockquote>
                  <p>and an acknowledgment message should be sent to:</p>
                  <blockquote><strong><i><asp:Literal ID="Literal_donor_email_address" runat="server"></asp:Literal></i></strong></blockquote>
                  <p>Is this correct?</p>
                  <blockquote>
                    <asp:Button ID="Button_yes" runat="server" Font-Bold="true" Text="YES" OnClick="Button_yes_Click"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button_cancel" runat="server" Font-Bold="true" Text="Cancel" OnClick="Button_cancel_Click"/>
                  </blockquote>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
      <uc3:UserControl_update_progress_blocker id="UserControl_update_progress_blocker_control" runat="server"></uc3:UserControl_update_progress_blocker>
    </form>
  </body>
</html>
