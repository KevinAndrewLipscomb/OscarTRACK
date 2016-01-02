<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_role_help.ascx.cs" Inherits="UserControl_role_help.TWebUserControl_role_help"%>
<p>
  <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
    <tr>
      <td>
        <table cellspacing="0" cellpadding="10" border="0">
          <tr>
            <td bgcolor="#f5f5f5"><strong>Important Information About Roles</strong></td>
          </tr>
          <tr>
            <td>
              <p><asp:Label id="Label_application_name" runat="server"></asp:Label>&nbsp;has evolved from primarily being a scheduling adjunct.&nbsp; With this in mind, it fully recognizes some roles (like Squad Scheduler); it disregards some roles; and to consolidate other roles, it uses <strong>special terminology</strong> as follows:</p>              
              <p>
                <table cellspacing="0" cellpadding="5" border="0">
                  <tr><td colspan="3"><p><h3>Section-level</h3></p></td></tr>
                  <tr>
                    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                    <th valign="top" bgcolor="whitesmoke">Title</th>
                    <th valign="top" bgcolor="whitesmoke">Description</th>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td align="center" valign="top"><strong>Section Sergeant</strong></td>
                    <td valign="top">Someone who manages a subset of the members ("section") of a squad.&nbsp; Establishing sections and a tier of Section Sergeants may result in a better ratio of supervisors to subordinates, allowing for a more manageable <i>span of control</i> arrangement.</td>
                  </tr>
                  <tr><td colspan="3"><p><h3>Squad-level</h3></p></td></tr>
                  <tr>
                    <th>&nbsp;</th>
                    <th valign="top" bgcolor="whitesmoke">Title</th>
                    <th valign="top" bgcolor="whitesmoke">Description</th>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td align="center" valign="top"><strong>Squad Manager (possibly paid)</strong></td>
                    <td valign="top"><p>Someone who is (or might as well be) hired by a squad to execute many or most of the Squad Commander's responsibilities.&nbsp; <asp:Label id="Label_application_name_2" runat="server"></asp:Label>&nbsp;copies Squad Managers on all notifications and reports sent to Squad Commanders.&nbsp; Squad Managers have all the <asp:Label id="Label_application_name_3" runat="server"></asp:Label> privileges that a Squad Commander has <i>except</i> for the privilege of assigning roles.</p></td>
                  </tr>
                  <tr><td>&nbsp;</td><td colspan="2"><hr color="whitesmoke"></td></tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td align="center" valign="top"><strong>Squad Assistant Manager (possibly paid)</strong></td>
                    <td valign="top"><p>Someone who is (or might as well be) hired by a squad to execute secretarial work, possibly including making updates to the schedule, to member contact information, and collecting field performance evaluations.</p></td>
                  </tr>
                  <tr><td>&nbsp;</td><td colspan="2"><hr color="whitesmoke"></td></tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td align="center" valign="top"><strong>Squad Analyst</strong></td>
                    <td valign="top">Someone who examines (but does not change) squad data, and who is allowed to use the QuickMessage feature to send email broadcasts to filtered groups of members.&nbsp; May include Quality Coordinators, junior officers, etc.</td>
                  </tr>
                  <tr><td>&nbsp;</td><td colspan="2"><hr color="whitesmoke"></td></tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td align="center" valign="top"><strong>Squad Fleet Coordinator</strong></td>
                    <td valign="top">An officer who is responsible for the overall readiness of the squad's fleet of vehicles.&nbsp; A squad's internal title for this officer might be Maintenance Officer, Logistics Officer, or Engineer.</td>
                  </tr>
                  <tr><td>&nbsp;</td><td colspan="2"><hr color="whitesmoke"></td></tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td align="center" valign="top"><strong>Squad Fleet Assistant</strong></td>
                    <td valign="top">Someone who answers to the Squad Fleet Coordinator and is typically responsible for the overall readiness of <u>one</u> of the squad's vehicles.&nbsp; A squad's internal title for this officer might be Crew Chief.</td>
                  </tr>
                  <tr><td>&nbsp;</td><td colspan="2"><hr color="whitesmoke"></td></tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td align="center" valign="top"><strong>Squad Equipment Officer</strong></td>
                    <td valign="top">An officer who is responsible for the overall readiness of the durable field equipment carried within the squad's vehicles, such as monitor/defibrillators, stair chairs, splints, lifting & carrying devices, etc.</td>
                  </tr>
                  <tr><td>&nbsp;</td><td colspan="2"><hr color="whitesmoke"></td></tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td align="center" valign="top"><strong>Squad Supply Officer</strong></td>
                    <td valign="top">An officer who is responsible for the squad's stock of expendible items, such as dressings, bandages, oxygen masks, etc.</td>
                  </tr>
                  <tr><td>&nbsp;</td><td colspan="2"><hr color="whitesmoke"></td></tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td align="center" valign="top"><strong>Squad Oxygen Coordinator</strong></td>
                    <td valign="top">Someone who is responsible for the squad's supply of oxygen, its stock of oxygen tanks and regulators, its oxygen tank filling system, etc.</td>
                  </tr>
                  <tr><td>&nbsp;</td><td colspan="2"><hr color="whitesmoke"></td></tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td align="center" valign="top"><strong>Squad Board Director</strong></td>
                    <td valign="top">This role should be assigned to each member of the squad's Board Of Directors, even if he or she is on the board by virtue of holding another office, like President, VP, etc.</td>
                  </tr>
                  <tr><td>&nbsp;</td><td colspan="2"><hr color="whitesmoke"></td></tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td align="center" valign="top"><strong>Squad Bookkeeper</strong></td>
                    <td valign="top">Someone who is hired (or might as well be) to maintain the squad's financial books.&nbsp; This person reports to (and may actually be) the Squad Treasurer.</td>
                  </tr>
                  <tr><td>&nbsp;</td><td colspan="2"><hr color="whitesmoke"></td></tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td align="center" valign="top"><strong>Squad Check Signer</strong></td>
                    <td valign="top">Someone who needs the ability to "sign" checks using the <i>EfficiPay</i> module.</td>
                  </tr>
                  <tr><td>&nbsp;</td><td colspan="2"><hr color="whitesmoke"></td></tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td align="center" valign="top"><strong>Squad Fund Drive Clerk</strong></td>
                    <td valign="top">Someone who needs the ability to enter donations and run reports using the <i>KEYclick</i> module.</td>
                  </tr>
                  <tr><td colspan="3"><p><h3>Department-level</h3></p></td></tr>
                  <tr>
                    <th>&nbsp;</th>
                    <th valign="top" bgcolor="whitesmoke">Title</th>
                    <th valign="top" bgcolor="whitesmoke">Description</th>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td align="center" valign="top"><strong>Department Authority</strong></td>
                    <td valign="top">Someone with unrestricted use of almost all&nbsp;<asp:Label id="Label_application_name_4" runat="server"></asp:Label> features.&nbsp; Created for Chief, Deputy Chief, and Operational Medical Director.</td>
                  </tr>
                  <tr><td>&nbsp;</td><td colspan="2"><hr color="whitesmoke"></td></tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td align="center" valign="top"><strong>All-Squad NGO Leader</strong></td>
                    <td valign="top">A leader of a Non-Governmental Organization who receives monthly citywide serial indicator charts.&nbsp; Created for presidents and executive directors of Rescue Council and the Foundation.</td>
                  </tr>
                  <tr><td>&nbsp;</td><td colspan="2"><hr color="whitesmoke"></td></tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td align="center" valign="top"><strong>Department Analyst</strong></td>
                    <td valign="top">Someone who examines (but does not change) data, and who is allowed to use the QuickMessage feature to send email broadcasts to filtered groups of members.&nbsp; May include Infection Control Officers, Quality Coordinators, etc.</td>
                  </tr>
                  <tr><td>&nbsp;</td><td colspan="2"><hr color="whitesmoke"></td></tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td align="center" valign="top"><strong>Department New Membership Clerk</strong></td>
                    <td valign="top">Someone tasked with adding new members into the <asp:Label id="Label_application_name_5" runat="server"></asp:Label> system on the basis of information received from a Department Human Resources Officer.</td>
                  </tr>
                </table>
              </p>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</p>
