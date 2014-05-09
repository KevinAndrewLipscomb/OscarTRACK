<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_member_profile.ascx.cs" Inherits="UserControl_member_profile.TWebUserControl_member_profile"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~kicrudhelped~item.ascx-template -->
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
  <tr id="TableRow_member_id" runat="server" visible="false">
    <td bgcolor="gainsboro" valign="top"><font class="">member_id:</font></td>
    <td valign="top"><font class="">
      <table cellspacing="0" cellpadding="0" border="0">
         <tr>
           <td valign="middle">
             <table cellspacing="0" cellpadding="0" border="0">
               <tr>
                 <td>
      <ASP:TextBox id="TextBox_member_id" runat="server"  cssclass=""></ASP:TextBox><ASP:Button id="Button_lookup" runat="server" causesvalidation="False" text="LOOKUP" onclick="Button_lookup_Click"></ASP:Button>
                </td>
                <td nowrap="nowrap"><small><small><asp:Label id="Label_lookup_arrow" runat="server">&lt;--</asp:Label></small></small></td>
                <td><small><small><em><asp:Label id="Label_lookup_hint" runat="server">Lookup by partial or full field value</asp:Label></em></small></small></td>
              </tr>
            </table>
          </td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <td valign="middle">
            <small>
              <ASP:LinkButton id="LinkButton_reset" runat="server" causesvalidation="False" enabled="False" onclick="LinkButton_reset_Click">New lookup</ASP:LinkButton>
            </small>
          </td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <td valign="middle">
            <small>
              <ASP:LinkButton id="LinkButton_new_record" runat="server" causesvalidation="False" visible="False" onclick="LinkButton_new_record_Click">Enter&nbsp;brand&nbsp;new&nbsp;record</ASP:LinkButton>
            </small>
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td><asp:Panel ID="Panel_match_numbers" runat="server" Visible="False"><small>(<asp:Literal ID="Literal_match_index" runat="server"></asp:Literal>/<asp:Literal ID="Literal_num_matches" runat="server"></asp:Literal>)</small></asp:Panel></td>
          <td>
            <asp:LinkButton id="LinkButton_go_to_match_first" runat="server" text="<IMG src=&quot;~/protected/image/first_track_blue16_h.png&quot; alt=&quot;First match&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; />" causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_first_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_prior" runat="server" text="<IMG src=&quot;~/protected/image/play_blue16_h-flipped.png&quot; alt=&quot;Prior match&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; />" causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_prior_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_next" runat="server" text="<IMG src=&quot;~/protected/image/play_blue16_h.png&quot; alt=&quot;Next match&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; />" causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_next_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_last" runat="server" text="<IMG src=&quot;~/protected/image/last_track_blue16_h.png&quot; alt=&quot;Last match&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; />" causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_last_Click"></asp:LinkButton>
          </td>
          <td>
            <div style="width:0px;white-space:nowrap;"><ASP:DropDownList id="DropDownList_member_id" runat="server" visible="False" autopostback="True" onselectedindexchanged="DropDownList_member_id_SelectedIndexChanged"></ASP:DropDownList></div>
          </td>
        </tr>
      </table>
    </font>
    </td>
    <td nowrap="nowrap" valign="top">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_member_id" runat="server" errormessage="Please enter member_id." font-bold="True" controltovalidate="TextBox_member_id">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td colspan="3" style="border-top: thin solid Gainsboro; border-right: thin solid Gainsboro; border-left: thin solid Gainsboro" bgcolor="WhiteSmoke">
      <p><strong>Security</strong></p>
      <small>If you logged in using a temporary password, you must change your password to something that you prefer before proceeding.</small>
    </td>
  </tr>
  <tr>
    <td align="right" style="border-left: thin solid Gainsboro">Password:</td>
    <td><ASP:TextBox id="TextBox_nominal_password" runat="server" textmode="Password"></ASP:TextBox></td>
    <td nowrap="nowrap" style="border-right: thin solid Gainsboro">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_nominal_password" runat="server" font-bold="True" errormessage="Please enter a nominal password." controltovalidate="TextBox_nominal_password">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td align="right" style="border-left: thin solid Gainsboro">Confirm password:</td>
    <td><ASP:TextBox id="TextBox_confirmation_password" runat="server" textmode="Password"></ASP:TextBox></td>
    <td nowrap="nowrap" style="border-right: thin solid Gainsboro">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_confirmation_password" runat="server" font-bold="True" errormessage="Please enter a confirmation password." controltovalidate="TextBox_confirmation_password">!ERR!</ASP:RequiredFieldValidator>
      <ASP:CustomValidator id="CustomValidator_confirmation_password" runat="server" errormessage="Nominal and confirmation passwords must match.  Please try again." font-bold="True" onservervalidate="CustomValidator_confirmation_password_ServerValidate">!ERR!</ASP:CustomValidator>
    </td>
  </tr>
  <tr>
    <td style="border-left: thin solid Gainsboro; border-bottom: thin solid Gainsboro">&nbsp;</td>
    <td style="border-bottom: thin solid Gainsboro"><ASP:Button id="Button_save_password" runat="server" text="Save password" onclick="Button_save_password_Click"></ASP:Button></td>
    <td style="border-right: thin solid Gainsboro; border-bottom: thin solid Gainsboro">&nbsp;</td>
  </tr>
  <tr><td colspan="3">&nbsp;</td></tr>
  <tr>
    <td colspan="3" style="border-top: thin solid Gainsboro; border-right: thin solid Gainsboro; border-left: thin solid Gainsboro" bgcolor="WhiteSmoke">
      <p><strong>Email information</strong></p>
      <small>Each member must keep their email address up to date in this system to receive temporary passwords, status reports, schedule assignment details, etc.</small>
    </td>
  </tr>
  <tr>
    <td align="right" style="border-left: thin solid Gainsboro"><font class="">Email address:</font></td>
    <td><font class=""><ASP:TextBox id="TextBox_nominal_email_address" runat="server" columns="31" maxlength="31" cssclass="" enabled="False"></ASP:TextBox></font></td>
    <td nowrap="nowrap" style="border-right: thin solid Gainsboro">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_nominal_email_address" runat="server" font-bold="True" errormessage="Please enter a nominal email address." controltovalidate="TextBox_nominal_email_address">!ERR!</ASP:RequiredFieldValidator><ASP:RegularExpressionValidator id="RegularExpressionValidator_nominal_email_address" runat="server" errormessage="Please enter a valid email address." font-bold="True" controltovalidate="TextBox_nominal_email_address" validationexpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">!ERR!</ASP:RegularExpressionValidator>
      <ASP:CustomValidator id="CustomValidator_nominal_email_address" runat="server" errormessage="Please enter a valid domain name (the part after the @ sign)." controltovalidate="TextBox_nominal_email_address" font-bold="True" onservervalidate="CustomValidator_nominal_email_address_ServerValidate">!ERR!</ASP:CustomValidator><ASP:CustomValidator id="CustomValidator_email_address_novelty" runat="server" errormessage="Sorry, that email address already belongs to a system member." font-bold="True" controltovalidate="TextBox_nominal_email_address" onservervalidate="CustomValidator_email_address_novelty_ServerValidate">!ERR!</ASP:CustomValidator>
    </td>
  </tr>
  <tr>
    <td align="right" style="border-left: thin solid Gainsboro"><font class="">Confirm email address:</font></td>
    <td><ASP:TextBox id="TextBox_confirmation_email_address" runat="server" columns="31" maxlength="31" cssclass="" enabled="False"></ASP:TextBox></td>
    <td nowrap="nowrap" style="border-right: thin solid Gainsboro">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_confirmation_email_address" runat="server" font-bold="True" errormessage="Please enter a confirmation email address." controltovalidate="TextBox_confirmation_email_address">!ERR!</ASP:RequiredFieldValidator>
      <ASP:CustomValidator id="CustomValidator_confirmation_email_address" runat="server" errormessage="Nominal and confirmation email addresss must match.  Please try again." font-bold="True" onservervalidate="CustomValidator_confirmation_email_address_ServerValidate">!ERR!</ASP:CustomValidator>
    </td>
  </tr>
  <tr>
    <td style="border-left: thin solid Gainsboro; border-bottom: thin solid Gainsboro">&nbsp;</td>
    <td style="border-bottom: thin solid Gainsboro"><ASP:Button id="Button_save_email_address" runat="server" text="Save email address" onclick="Button_save_email_address_Click"></ASP:Button></td>
    <td style="border-right: thin solid Gainsboro; border-bottom: thin solid Gainsboro">&nbsp;</td>
  </tr>
  <tr><td colspan="3">&nbsp;</td></tr>
  <tr>
    <td colspan="3" style="border-top: thin solid Gainsboro; border-right: thin solid Gainsboro; border-left: thin solid Gainsboro" bgcolor="WhiteSmoke">
      <p><strong>Phone information</strong></p>
      <small>
        Each member should provide a phone number at which other members can reach them.&nbsp; EMS-5 will use this number to contact a member who has stopped answering the radio.&nbsp; A cellphone number is preferred, and is
        required if the member wants to receive OSCALERTs.
      </small>
    </td>
  </tr>
  <tr>
    <td align="right" style="border-left: thin solid Gainsboro" nowrap="nowrap"><font class="">Phone number (cellular preferred):</font></td>
    <td>
      <ASP:TextBox id="TextBox_phone_num" runat="server" maxlength="14" columns="14"></ASP:TextBox>
      <ASP:Button id="Button_save_phone_num" runat="server" text="Save phone number" onclick="Button_save_phone_num_Click"></ASP:Button>
    </td>
    <td nowrap="nowrap" style="border-right: thin solid Gainsboro">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_phone_num" runat="server" font-bold="True" errormessage="Please enter a phone number." controltovalidate="TextBox_phone_num">!ERR!</ASP:RequiredFieldValidator>
      <ASP:CustomValidator id="CustomValidator_phone_num" runat="server" errormessage="Please enter a valid phone number.  Premium and reserved numbers are not allowed." controltovalidate="TextBox_phone_num" font-bold="True" onservervalidate="CustomValidator_phone_num_ServerValidate">!ERR!</ASP:CustomValidator>
    </td>
  </tr>
  <tr>
    <td colspan="3" style="border-left: thin solid Gainsboro; border-bottom: thin solid Gainsboro; border-right: thin solid Gainsboro">
      <table cellpadding="20" cellspacing="0" width="100%">
        <tr>
          <td>
            <asp:Panel ID="Panel_oscalert_settings" runat="server" Enabled="false">
              <table cellpadding="5" cellspacing="0" width="100%">
                <tr>
                  <td colspan="5" style="border-top: thin solid Gainsboro; border-right: thin solid Gainsboro; border-left: thin solid Gainsboro" bgcolor="WhiteSmoke">
                    <p><strong>OSCALERTs</strong></p>
                    <small>
                      OSCALERTs are automatic near-realtime notifications to your cellphone about certain situations in the field, as detailed below.&nbsp; OSCALERTs are individually configurable.&nbsp; To receive OSCALERTs,
                      a member must set their cellphone number (above), plus their cellphone service provider (below).
                    </small>
                  </td>
                </tr>
                <tr><td colspan="5">&nbsp;</td></tr>
                <tr>
                  <td nowrap="nowrap"><font class="">Cellular provider:</font></td>
                  <td colspan="3"><asp:DropDownList ID="DropDownList_phone_service" runat="server"></asp:DropDownList></td>
                  <td nowrap="nowrap">&nbsp;</td>
                </tr>
                <tr><td colspan="5">&nbsp;</td></tr>
                <tr>
                  <td nowrap="nowrap" rowspan="12" valign="top"><font class="">General alerting threshold:</font></td>
                  <td bgcolor="#FF5580" valign="middle"><asp:RadioButton ID="RadioButton_mci_huge" runat="server" GroupName="GeneralThreshold"/></td>
                  <td align="center" valign="middle"><b>MciHuge</b></td>
                  <td align="center" valign="middle"><small>When a huge MCI case is active</small></td>
                  <td align="center" nowrap="nowrap" rowspan="12" valign="top">&nbsp;</td>
                </tr>
                <tr>
                  <td bgcolor="#FF6680" valign="middle"><asp:RadioButton ID="RadioButton_mci_large" runat="server" GroupName="GeneralThreshold"/></td>
                  <td align="center" valign="middle"><b>MciLarge</b></td>
                  <td align="center" valign="middle"><small><small>All the above plus</small><br />When a large MCI case is active</small></td>
                </tr>
                <tr>
                  <td bgcolor="#FF7780" valign="middle"><asp:RadioButton ID="RadioButton_mci_medium" runat="server" GroupName="GeneralThreshold"/></td>
                  <td align="center" valign="middle"><b>MciMedium</b></td>
                  <td align="center" valign="middle"><small><small>All the above plus</small><br />When a medium MCI case is active</small></td>
                </tr>
                <tr>
                  <td bgcolor="#FF8880" valign="middle"><asp:RadioButton ID="RadioButton_mci_small" runat="server" GroupName="GeneralThreshold"/></td>
                  <td align="center" valign="middle"><b>MciSmall</b></td>
                  <td align="center" valign="middle"><small><small>All the above plus</small><br />When a small MCI case is active</small></td>
                </tr>
                <tr>
                  <td bgcolor="#FF9980" valign="middle"><asp:RadioButton ID="RadioButton_ems_surge" runat="server" GroupName="GeneralThreshold"/></td>
                  <td align="center" valign="middle"><b>EmsSurge</b></td>
                  <td align="center" valign="middle"><small><small>All the above plus</small><br />When multiple calls are holding for ambulances</small></td>
                </tr>
                <tr>
                  <td bgcolor="#FFAA80" valign="middle"><asp:RadioButton ID="RadioButton_multi_alarm_fire" runat="server" GroupName="GeneralThreshold"/></td>
                  <td align="center" valign="middle"><b>MultiAlarmFire</b></td>
                  <td align="center" valign="middle"><small><small>All the above plus</small><br />When EMS first response capacity is reduced due to a multiple-alarm fire</small></td>
                </tr>
                <tr>
                  <td bgcolor="#FFBB80" valign="middle"><asp:RadioButton ID="RadioButton_major_fire_incident" runat="server" GroupName="GeneralThreshold"/></td>
                  <td align="center" valign="middle"><b>MajorFireIncident</b></td>
                  <td align="center" valign="middle"><small><small>All the above plus</small><br />When EMS first response capacity is reduced due to a major fire incident</small></td>
                </tr>
                <tr>
                  <td bgcolor="#FFCC80" valign="middle"><asp:RadioButton ID="RadioButton_two_alarm_fire" runat="server" GroupName="GeneralThreshold"/></td>
                  <td align="center" valign="middle"><b>TwoAlarmFire</b></td>
                  <td align="center" valign="middle"><small><small>All the above plus</small><br />When EMS first response capacity is reduced due to a 2-alarm fire</small></td>
                </tr>
                <tr>
                  <td bgcolor="#FFDD80" valign="middle"><asp:RadioButton ID="RadioButton_fire_surge" runat="server" GroupName="GeneralThreshold" Checked="true" Text="&lt;small&gt;&lt;small&gt;RECOMMENDED&lt;/small&gt;&lt;/small&gt;"/></td>
                  <td align="center" valign="middle"><b>FireSurge</b></td>
                  <td align="center" valign="middle"><small><small>All the above plus</small><br />When EMS first response capacity is reduced due to multiple working fires</small></td>
                </tr>
                <tr>
                  <td bgcolor="#FFEE80" valign="middle"><asp:RadioButton ID="RadioButton_cardiac_arrest_amb_needed" runat="server" GroupName="GeneralThreshold"/></td>
                  <td align="center" valign="middle"><b>CardiacArrestAmbNeeded</b></td>
                  <td align="center" valign="middle"><small><small>All the above plus</small><br />When a Cardiac Arrest is holding for an ambulance</small></td>
                </tr>
                <tr>
                  <td bgcolor="#FFFF80" valign="middle"><asp:RadioButton ID="RadioButton_amb_needed" runat="server" GroupName="GeneralThreshold"/></td>
                  <td align="center" valign="middle"><b>AmbNeeded</b></td>
                  <td align="center" valign="middle"><small><small>All the above plus</small><br />When any call is holding for an ambulance</small></td>
                </tr>
                <tr>
                  <td valign="middle" bgcolor="#000000"><asp:RadioButton ID="RadioButtonno_gen" runat="server" GroupName="GeneralThreshold" ForeColor="White"/></td>
                  <td align="center" valign="middle" colspan="2"><i>None - Not interested in general alerts</i></td>
                </tr>
                <tr><td colspan="5">&nbsp;</td></tr>
                <tr>
                  <td nowrap="nowrap" rowspan="4" valign="top"><font class="">ALS alerting threshold:</font></td>
                  <td valign="middle" bgcolor="#8088FF"><asp:RadioButton ID="RadioButton_als_surge" runat="server" GroupName="AlsThreshold" Checked="true" Text="&lt;small&gt;&lt;small&gt;RECOMMENDED&nbsp;FOR&nbsp;ALS&lt;/small&gt;&lt;/small&gt;"/></td>
                  <td align="center" valign="middle"><b>AlsSurge</b></td>
                  <td align="center" valign="middle"><small>When multiple calls are holding for ALS</small></td>
                  <td nowrap="nowrap" rowspan="4" valign="top">&nbsp;</td>
                </tr>
                <tr>
                  <td valign="middle" bgcolor="#80AAFF"><asp:RadioButton ID="RadioButton_cardiac_arrest_als_needed" runat="server" GroupName="AlsThreshold"/></td>
                  <td align="center" valign="middle"><b>CardiacArrestAlsNeeded</b></td>
                  <td align="center" valign="middle"><small><small>All the above plus</small><br />When a Cardiac Arrest is holding for ALS</small></td>
                </tr>
                <tr>
                  <td valign="middle" bgcolor="#80CCFF"><asp:RadioButton ID="RadioButton_als_needed" runat="server" GroupName="AlsThreshold"/></td>
                  <td align="center" valign="middle"><b>AlsNeeded</b></td>
                  <td align="center" valign="middle"><small><small>All the above plus</small><br />When any call is holding for ALS</small></td>
                </tr>
                <tr>
                  <td valign="middle" bgcolor="#000000"><asp:RadioButton ID="RadioButton_no_als" runat="server" GroupName="AlsThreshold" Checked="true" Text="&lt;small&gt;&lt;small&gt;RECOMMENDED&nbsp;FOR&nbsp;BLS&lt;/small&gt;&lt;/small&gt;" ForeColor="White"/></td>
                  <td align="center" valign="middle" colspan="2"><i>None - Not interested in ALS-related alerts</i></td>
                </tr>
                <tr><td colspan="5">&nbsp;</td></tr>
                <tr>
                  <td nowrap="nowrap" rowspan="3" valign="top"><font class="">Specific subscriptions:</font></td>
                  <td valign="middle"><asp:CheckBox ID="CheckBox_trap" runat="server"/></td>
                  <td align="center" valign="middle"><b>Trap</b></td>
                  <td align="center" valign="middle"><small>When the Squad Truck Team is called out</small></td>
                  <td nowrap="nowrap" rowspan="3" valign="top">&nbsp;</td>
                </tr>
                <tr>
                  <td valign="middle"><asp:CheckBox ID="CheckBox_airport_alert" runat="server" /></td>
                  <td align="center" valign="middle"><b>AirportAlert</b></td>
                  <td align="center" valign="middle"><small>When an airport field alert has been declared</small></td>
                </tr>
                <tr>
                  <td valign="middle"><asp:CheckBox ID="CheckBox_mrt_call" runat="server" /></td>
                  <td align="center" valign="middle"><b>MrtCall</b></td>
                  <td align="center" valign="middle"><small>When the Marine Rescue Team is called out</small></td>
                </tr>
              </table>
            </asp:Panel>
          </td>
        </tr>
      </table>
    </td>
  </tr>
      </table>
    </td>
  </tr>
</table>
