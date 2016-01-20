<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_donation_ack_letter.ascx.cs" Inherits="UserControl_donation_ack_letter.TWebUserControl_donation_ack_letter"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table>
  <tr>
    <td width="5%">&nbsp;</td>
    <td width="90%">
      <table width="100%">
        <tr><td style="height:1.25in">&nbsp;</td></tr>
        <tr>
          <td>
            <table width="100%">
              <tr>
                <td width="50%">&nbsp;</td>
                <td width="50%"><asp:Literal ID="Literal_ack_date" runat="server"></asp:Literal><br />&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Literal ID="Literal_donor_name" runat="server"></asp:Literal><br />
            <asp:Literal ID="Literal_address" runat="server"></asp:Literal><br />
            <asp:Literal ID="Literal_city" runat="server"></asp:Literal> <asp:Literal ID="Literal_state" runat="server"></asp:Literal><br />
            <br />
            <p>
              Thank you for the <asp:Label ID="Label_amount" runat="server" Font-Bold="True"></asp:Label> donation you made on <asp:Label ID="Label_donation_date" runat="server" Font-Bold="True"></asp:Label>.&nbsp; Please keep this written
              acknowledgment for your tax records.&nbsp; We hereby confirm that no goods or services as defined by the United States Internal Revenue Service have been exchanged in consideration of this contribution.
            </p>
            <p>
              We know you share a wish to support the general welfare of our area and our city.&nbsp; And you know we can do this by maintaining an institutional platform of the highest caliber for volunteer activism in the mitigation
              of emergencies, for leadership development, and for community self-sufficiency.&nbsp; Your contribution enables our volunteer-based system to provide quality care and emergency transportation to the seriously ill and
              injured every day.&nbsp; You've helped pay for the ambulances, the medical gear -- even the uniforms our volunteers wear.
            </p>
            <p>Thanks again for your compassionate committment to partnering with us for the benefit of our community.&nbsp; With your help, we'll be there when seconds count!</p>
            <br />
          </td>
        </tr>
        <tr>
          <td>
            <table width="100%">
              <tr>
                <td width="50%">&nbsp;</td>
                <td width="50%">
                  Sincerely,<br />
                  <br />
                  <br />
                  <br />
                  <br />
                  <asp:Literal ID="Literal_member_name" runat="server"></asp:Literal><br />
                  <asp:Literal ID="Literal_member_title" runat="server"></asp:Literal>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td width="5%">&nbsp;</td>
  </tr>
</table>
