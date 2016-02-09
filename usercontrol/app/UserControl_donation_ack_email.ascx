<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_donation_ack_email.ascx.cs" Inherits="UserControl_donation_ack_email.TWebUserControl_donation_ack_email"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table>
  <tr>
    <td width="5%">&nbsp;</td>
    <td width="90%">
      <table width="100%">
        <tr>
          <td>
            <asp:Literal ID="Literal_donor_name" runat="server"></asp:Literal>,<br />
            <p>
              Thank you for the <asp:Label ID="Label_amount" runat="server" Font-Bold="True"></asp:Label> donation you made on <asp:Label ID="Label_donation_date" runat="server" Font-Bold="True"></asp:Label>.&nbsp; Please keep this written
              acknowledgment for your tax records.&nbsp; We hereby confirm that no goods or services as defined by the United States Internal Revenue Service have been exchanged in consideration of this contribution.
            </p>
            <p>
              We know you share a wish to support the general welfare of our area and our city.&nbsp; And you know that when volunteers help their neighbors, the entire community benefits.&nbsp; Your contribution enables our
              volunteer-based system to provide quality care and emergency transportation to the seriously ill and injured every day.&nbsp; You've helped pay for the ambulances, the medical gear -- even the uniforms our volunteers
              wear.
            </p>
            <p>Thanks again for your compassionate commitment to partnering with us for the benefit of our community.&nbsp; With your help, we'll be there when seconds count!</p>
          </td>
        </tr>
        <tr>
          <td>
            <br />
            Sincerely,<br />
            <asp:Literal ID="Literal_member_name" runat="server"></asp:Literal><br />
            <asp:Literal ID="Literal_member_agency_long_designator" runat="server"></asp:Literal> Volunteer Rescue Squad<br />
            Virginia Beach, VA
          </td>
        </tr>
      </table>
    </td>
    <td width="5%">&nbsp;</td>
  </tr>
</table>
