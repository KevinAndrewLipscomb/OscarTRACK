<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_member_profile.ascx.cs" Inherits="UserControl_member_profile.TWebUserControl_member_profile"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~kicrudhelped~item.ascx-template -->
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<asp:ValidationSummary ID="ValidationSummary_password" runat="server" ValidationGroup="password"/>
<asp:ValidationSummary ID="ValidationSummary_email_address" runat="server" ValidationGroup="email_address"/>
<asp:ValidationSummary ID="ValidationSummary_phone_number" runat="server" ValidationGroup="phone_number"/>
<asp:ValidationSummary ID="ValidationSummary_oscalert_settings" runat="server" ValidationGroup="oscalert_settings"/>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
  <tr>
    <td colspan="3" style="border-top: thin solid Gainsboro; border-right: thin solid Gainsboro; border-left: thin solid Gainsboro" bgcolor="WhiteSmoke">
      <p><strong>Security</strong></p>
      <small>If you logged in using a temporary password, you must change your password to something that you prefer before proceeding.</small>
    </td>
  </tr>
  <tr>
    <td align="right" style="border-left: thin solid Gainsboro">Password:</td>
    <td><ASP:TextBox id="TextBox_nominal_password" runat="server" textmode="Password" ValidationGroup="password"></ASP:TextBox></td>
    <td nowrap="nowrap" style="border-right: thin solid Gainsboro">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_nominal_password" runat="server" font-bold="True" errormessage="Please enter a nominal password." controltovalidate="TextBox_nominal_password" ValidationGroup="password" Display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td align="right" style="border-left: thin solid Gainsboro">Confirm password:</td>
    <td><ASP:TextBox id="TextBox_confirmation_password" runat="server" textmode="Password" ValidationGroup="password"></ASP:TextBox></td>
    <td nowrap="nowrap" style="border-right: thin solid Gainsboro">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_confirmation_password" runat="server" font-bold="True" errormessage="Please enter a confirmation password." controltovalidate="TextBox_confirmation_password" ValidationGroup="password" Display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
      <ASP:CustomValidator id="CustomValidator_confirmation_password" runat="server" errormessage="Nominal and confirmation passwords must match.  Please try again." font-bold="True" onservervalidate="CustomValidator_confirmation_password_ServerValidate" ValidationGroup="password" Display="Dynamic">!ERR!</ASP:CustomValidator>
    </td>
  </tr>
  <tr>
    <td style="border-left: thin solid Gainsboro; border-bottom: thin solid Gainsboro">&nbsp;</td>
    <td style="border-bottom: thin solid Gainsboro"><ASP:Button id="Button_save_password" runat="server" text="Save password" onclick="Button_save_password_Click" ValidationGroup="password" UseSubmitBehavior="False"></ASP:Button></td>
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
    <td><font class=""><ASP:TextBox id="TextBox_nominal_email_address" runat="server" columns="40" cssclass="" ValidationGroup="email_address"></ASP:TextBox></font></td>
    <td nowrap="nowrap" style="border-right: thin solid Gainsboro">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_nominal_email_address" runat="server" font-bold="True" errormessage="Please enter a nominal email address." controltovalidate="TextBox_nominal_email_address" ValidationGroup="email_address" Display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_nominal_email_address" runat="server" errormessage="Please enter a valid email address." font-bold="True" controltovalidate="TextBox_nominal_email_address" validationexpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="email_address" Display="Dynamic">!ERR!</ASP:RegularExpressionValidator>
      <ASP:CustomValidator id="CustomValidator_nominal_email_address" runat="server" errormessage="Please enter a valid domain name (the part after the @ sign)." controltovalidate="TextBox_nominal_email_address" font-bold="True" onservervalidate="CustomValidator_nominal_email_address_ServerValidate" ValidationGroup="email_address" Display="Dynamic">!ERR!</ASP:CustomValidator>
      <ASP:CustomValidator id="CustomValidator_email_address_novelty" runat="server" errormessage="Sorry, that email address already belongs to a system member." font-bold="True" controltovalidate="TextBox_nominal_email_address" onservervalidate="CustomValidator_email_address_novelty_ServerValidate" ValidationGroup="email_address" Display="Dynamic">!ERR!</ASP:CustomValidator>
    </td>
  </tr>
  <tr>
    <td align="right" style="border-left: thin solid Gainsboro"><font class="">Confirm email address:</font></td>
    <td><ASP:TextBox id="TextBox_confirmation_email_address" runat="server" columns="40" cssclass="" ValidationGroup="email_address"></ASP:TextBox></td>
    <td nowrap="nowrap" style="border-right: thin solid Gainsboro">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_confirmation_email_address" runat="server" font-bold="True" errormessage="Please enter a confirmation email address." controltovalidate="TextBox_confirmation_email_address" ValidationGroup="email_address" Display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
      <ASP:CustomValidator id="CustomValidator_confirmation_email_address" runat="server" errormessage="Nominal and confirmation email addresss must match.  Please try again." font-bold="True" onservervalidate="CustomValidator_confirmation_email_address_ServerValidate" ValidationGroup="email_address" Display="Dynamic">!ERR!</ASP:CustomValidator>
    </td>
  </tr>
  <tr>
    <td style="border-left: thin solid Gainsboro; border-bottom: thin solid Gainsboro">&nbsp;</td>
    <td style="border-bottom: thin solid Gainsboro">
      <ASP:Button id="Button_save_email_address" runat="server" text="Save email address" onclick="Button_save_email_address_Click" ValidationGroup="email_address" UseSubmitBehavior="False"></ASP:Button>
    </td>
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
    <td><ASP:TextBox id="TextBox_phone_num" runat="server" maxlength="14" columns="14" ValidationGroup="phone_number"></ASP:TextBox></td>
    <td nowrap="nowrap" style="border-right: thin solid Gainsboro">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_phone_num" runat="server" font-bold="True" errormessage="Please enter a phone number." controltovalidate="TextBox_phone_num" ValidationGroup="phone_number" Display="Dynamic">!ERR!</ASP:RequiredFieldValidator>
      <ASP:CustomValidator id="CustomValidator_phone_num" runat="server" errormessage="Please enter a valid phone number.  Premium and reserved numbers are not allowed." controltovalidate="TextBox_phone_num" font-bold="True" onservervalidate="CustomValidator_phone_num_ServerValidate" ValidationGroup="phone_number" Display="Dynamic">!ERR!</ASP:CustomValidator>
    </td>
  </tr>
  <tr>
    <td style="border-left: thin solid Gainsboro">&nbsp;</td>
    <td><ASP:Button id="Button_save_phone_num" runat="server" text="Save phone number" onclick="Button_save_phone_num_Click" ValidationGroup="phone_number" UseSubmitBehavior="False"></ASP:Button></td>
    <td style="border-right: thin solid Gainsboro">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3" style="border-left: thin solid Gainsboro; border-bottom: thin solid Gainsboro; border-right: thin solid Gainsboro">
      <table cellpadding="20" cellspacing="0">
        <tr>
          <td>
            <asp:UpdatePanel ID="UpdatePanel_oscalert_settings" runat="server" UpdateMode="Conditional">
              <ContentTemplate>
                <asp:Panel ID="Panel_oscalert_settings" runat="server" Enabled="false">
                  <table cellpadding="5" cellspacing="0">
                    <tr>
                      <td colspan="5" style="border-top: thin solid Gainsboro; border-right: thin solid Gainsboro; border-left: thin solid Gainsboro" bgcolor="WhiteSmoke">
                        <p><strong>OSCALERTs</strong></p>
                        <small>
                          OSCALERTs are automatic near-realtime notifications to your cellphone about certain situations in the field, as detailed below.&nbsp; To receive OSCALERTs, a member must set their cellphone number
                          (above), plus their cellphone service provider (below).&nbsp; A member may also configure OSCALERTs according to their preference.
                        </small>
                      </td>
                    </tr>
                    <tr><td colspan="5" style="border-left: thin solid Gainsboro; border-right: thin solid Gainsboro">&nbsp;</td></tr>
                    <tr>
                      <td nowrap="nowrap" style="border-left: thin solid Gainsboro" width="1%" align="right"><font class="">Cellular provider:</font></td>
                      <td colspan="3"><asp:DropDownList ID="DropDownList_phone_service" runat="server" ValidationGroup="oscalert_settings" AutoPostBack="True" onselectedindexchanged="DropDownList_phone_service_SelectedIndexChanged"></asp:DropDownList></td>
                      <td nowrap="nowrap" style="border-right: thin solid Gainsboro">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_phone_service" runat="server" font-bold="True" ErrorMessage="Please specify a Cellular provider." ControlToValidate="DropDownList_phone_service" ValidationGroup="oscalert_settings" Display="Dynamic">!ERR!</asp:RequiredFieldValidator>
                      </td>
                    </tr>
                    <tr><td colspan="5" style="border-left: thin solid Gainsboro; border-right: thin solid Gainsboro">&nbsp;</td></tr>
                    <tr>
                      <td nowrap="nowrap" style="border-left: thin solid Gainsboro"><font class="">&nbsp;</font></td>
                      <td colspan="3">
                        <table cellpadding="0" cellspacing="0">
                          <tr>
                            <td valign="middle"><asp:Button ID="Button_save_oscalert_settings" runat="server" Text="Save OSCALERT settings" ValidationGroup="oscalert_settings" onclick="Button_save_oscalert_settings_Click" UseSubmitBehavior="False"/></td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td valign="middle"><small><asp:Button ID="Button_test" runat="server" Enabled="False" onclick="Button_test_Click" ValidationGroup="oscalert_settings" Text="Send a test page to your cellphone"></asp:Button></small></td>
                          </tr>
                        </table>
                      </td>
                      <td nowrap="nowrap" style="border-right: thin solid Gainsboro">&nbsp;</td>
                    </tr>
                    <tr><td colspan="5" style="border-left: thin solid Gainsboro; border-right: thin solid Gainsboro">&nbsp;</td></tr>
                    <tr>
                      <td nowrap="nowrap" rowspan="12" style="border-left: thin solid Gainsboro" valign="top" align="right"><font class="">General alerting threshold:</font></td>
                      <td align="right" bgcolor="#FF5580" valign="middle" width="1%"><asp:RadioButton ID="RadioButton_MciHuge" runat="server" GroupName="GeneralThreshold" TextAlign="Left" oncheckedchanged="RadioButton_oscalert_threshold_general_CheckedChanged" AutoPostBack="True" /></td>
                      <td align="center" valign="middle" width="1%"><b>MciHuge</b></td>
                      <td align="center" nowrap="nowrap" valign="middle" width="1%"><small>When a huge MCI case is active</small></td>
                      <td align="center" nowrap="nowrap" rowspan="12" style="border-right: thin solid Gainsboro" valign="top">&nbsp;</td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#FF6680" valign="middle"><asp:RadioButton ID="RadioButton_MciLarge" runat="server" GroupName="GeneralThreshold" TextAlign="Left" oncheckedchanged="RadioButton_oscalert_threshold_general_CheckedChanged" AutoPostBack="True" /></td>
                      <td align="center" valign="middle"><b>MciLarge</b></td>
                      <td align="center" nowrap="nowrap" valign="middle"><small><small>All the above plus</small><br />When a large MCI case is active</small></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#FF7780" valign="middle"><asp:RadioButton ID="RadioButton_MciMedium" runat="server" GroupName="GeneralThreshold" TextAlign="Left" oncheckedchanged="RadioButton_oscalert_threshold_general_CheckedChanged" AutoPostBack="True" /></td>
                      <td align="center" valign="middle"><b>MciMedium</b></td>
                      <td align="center" nowrap="nowrap" valign="middle"><small><small>All the above plus</small><br />When a medium MCI case is active</small></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#FF8880" valign="middle"><asp:RadioButton ID="RadioButton_MciSmall" runat="server" GroupName="GeneralThreshold" TextAlign="Left" oncheckedchanged="RadioButton_oscalert_threshold_general_CheckedChanged" AutoPostBack="True" /></td>
                      <td align="center" valign="middle"><b>MciSmall</b></td>
                      <td align="center" nowrap="nowrap" valign="middle"><small><small>All the above plus</small><br />When a small MCI case is active</small></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#FF9980" valign="middle"><asp:RadioButton ID="RadioButton_MultiAlarmFire" runat="server" GroupName="GeneralThreshold" TextAlign="Left" oncheckedchanged="RadioButton_oscalert_threshold_general_CheckedChanged" AutoPostBack="True" /></td>
                      <td align="center" valign="middle"><b>MultiAlarmFire</b></td>
                      <td align="center" nowrap="nowrap" valign="middle"><small><small>All the above plus</small><br />When EMS first response capacity is reduced due to a 3-alarm fire or greater</small></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#FFAA80" valign="middle"><asp:RadioButton ID="RadioButton_TwoAlarmFire" runat="server" GroupName="GeneralThreshold" TextAlign="Left" oncheckedchanged="RadioButton_oscalert_threshold_general_CheckedChanged" AutoPostBack="True" /></td>
                      <td align="center" valign="middle"><b>TwoAlarmFire</b></td>
                      <td align="center" nowrap="nowrap" valign="middle"><small><small>All the above plus</small><br />When EMS first response capacity is reduced due to a 2-alarm fire</small></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#FFBB80" valign="middle" nowrap="nowrap"><asp:RadioButton ID="RadioButton_FireSurge" runat="server" GroupName="GeneralThreshold" TextAlign="Left" oncheckedchanged="RadioButton_oscalert_threshold_general_CheckedChanged" AutoPostBack="True" /></td>
                      <td align="center" valign="middle"><b>FireSurge</b></td>
                      <td align="center" nowrap="nowrap" valign="middle"><small><small>All the above plus</small><br />When EMS first response capacity is reduced due to multiple working fires</small></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#FFCC80" valign="middle"><asp:RadioButton ID="RadioButton_MultAmbHolds" runat="server" GroupName="GeneralThreshold" TextAlign="Left" Text="&lt;small&gt;&lt;small&gt;RECOMMENDED&lt;/small&gt;&lt;/small&gt;" oncheckedchanged="RadioButton_oscalert_threshold_general_CheckedChanged" AutoPostBack="True" /></td>
                      <td align="center" valign="middle"><b>MultAmbHolds</b></td>
                      <td align="center" nowrap="nowrap" valign="middle"><small><small>All the above plus</small><br />When multiple calls are holding for ambulances</small></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#FFDD80" valign="middle"><asp:RadioButton ID="RadioButton_CardiacArrestAmbNeeded" runat="server" GroupName="GeneralThreshold" TextAlign="Left" oncheckedchanged="RadioButton_oscalert_threshold_general_CheckedChanged" AutoPostBack="True" /></td>
                      <td align="center" valign="middle"><b>CardiacArrestAmbNeeded</b></td>
                      <td align="center" nowrap="nowrap" valign="middle"><small><small>All the above plus</small><br />When a Cardiac Arrest is holding for an ambulance</small></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#FFEE80" valign="middle"><asp:RadioButton ID="RadioButton_AmbNeeded" runat="server" GroupName="GeneralThreshold" TextAlign="Left" oncheckedchanged="RadioButton_oscalert_threshold_general_CheckedChanged" AutoPostBack="True" /></td>
                      <td align="center" valign="middle"><b>AmbNeeded</b></td>
                      <td align="center" nowrap="nowrap" valign="middle"><small><small>All the above plus</small><br />When any call is holding for an ambulance</small></td>
                    </tr>
                    <tr>
                      <td align="right" valign="middle" bgcolor="#000000"><asp:RadioButton ID="RadioButton_no_general" runat="server" GroupName="GeneralThreshold" TextAlign="Left" ForeColor="White" oncheckedchanged="RadioButton_oscalert_threshold_general_CheckedChanged" AutoPostBack="True" /></td>
                      <td align="center" valign="middle" colspan="2" bgcolor="Silver"><i>-- None - Not interested in general alerts --</i></td>
                    </tr>
                    <tr><td colspan="5" style="border-left: thin solid Gainsboro; border-right: thin solid Gainsboro">&nbsp;</td></tr>
                    <tr>
                      <td nowrap="nowrap" rowspan="4" style="border-left: thin solid Gainsboro" valign="top" align="right"><font class="">ALS alerting threshold:</font></td>
                      <td align="right" valign="middle" bgcolor="#8088FF" nowrap="nowrap"><asp:RadioButton ID="RadioButton_MultAlsHolds" runat="server" GroupName="AlsThreshold" TextAlign="Left" Text="&lt;small&gt;&lt;small&gt;RECOMMENDED&nbsp;FOR&nbsp;ALS&lt;/small&gt;&lt;/small&gt;" oncheckedchanged="RadioButton_oscalert_threshold_als_CheckedChanged" AutoPostBack="True" /></td>
                      <td align="center" valign="middle"><b>MultAlsHolds</b></td>
                      <td align="center" nowrap="nowrap" valign="middle"><small>When multiple calls are holding for ALS</small></td>
                      <td nowrap="nowrap" rowspan="4" style="border-right: thin solid Gainsboro" valign="top">&nbsp;</td>
                    </tr>
                    <tr>
                      <td align="right" valign="middle" bgcolor="#80AAFF"><asp:RadioButton ID="RadioButton_CardiacArrestAlsNeeded" runat="server" GroupName="AlsThreshold" TextAlign="Left" oncheckedchanged="RadioButton_oscalert_threshold_als_CheckedChanged" AutoPostBack="True" /></td>
                      <td align="center" valign="middle"><b>CardiacArrestAlsNeeded</b></td>
                      <td align="center" nowrap="nowrap" valign="middle"><small><small>All the above plus</small><br />When a Cardiac Arrest is holding for ALS</small></td>
                    </tr>
                    <tr>
                      <td align="right" valign="middle" bgcolor="#80CCFF"><asp:RadioButton ID="RadioButton_AlsNeeded" runat="server" GroupName="AlsThreshold" TextAlign="Left" oncheckedchanged="RadioButton_oscalert_threshold_als_CheckedChanged" AutoPostBack="True" /></td>
                      <td align="center" valign="middle"><b>AlsNeeded</b></td>
                      <td align="center" nowrap="nowrap" valign="middle"><small><small>All the above plus</small><br />When any call is holding for ALS</small></td>
                    </tr>
                    <tr>
                      <td align="right" valign="middle" bgcolor="#000000" nowrap="nowrap"><asp:RadioButton ID="RadioButton_no_als" runat="server" GroupName="AlsThreshold" TextAlign="Left" Text="&lt;small&gt;&lt;small&gt;RECOMMENDED&nbsp;FOR&nbsp;BLS&lt;/small&gt;&lt;/small&gt;" ForeColor="White" oncheckedchanged="RadioButton_oscalert_threshold_als_CheckedChanged" AutoPostBack="True" /></td>
                      <td align="center" valign="middle" colspan="2" bgcolor="Silver"><i>-- None - Not interested in ALS-related alerts --</i></td>
                    </tr>
                    <tr><td colspan="5" style="border-left: thin solid Gainsboro; border-right: thin solid Gainsboro">&nbsp;</td></tr>
                    <tr>
                      <td nowrap="nowrap" rowspan="4" style="border-left: thin solid Gainsboro" valign="top" align="right"><font class="">Specific subscriptions:</font></td>
                      <td align="right" valign="middle"><asp:CheckBox ID="CheckBox_trap" runat="server" TextAlign="Left"/></td>
                      <td align="center" valign="middle"><b>Trap</b></td>
                      <td align="center" nowrap="nowrap" valign="middle"><small>When the Squad Truck Team is called out</small></td>
                      <td nowrap="nowrap" rowspan="4" style="border-right: thin solid Gainsboro" valign="top">&nbsp;</td>
                    </tr>
                    <tr>
                      <td align="right" valign="middle"><asp:CheckBox ID="CheckBox_airport_alert" runat="server" TextAlign="Left"/></td>
                      <td align="center" valign="middle"><b>AirportAlert</b></td>
                      <td align="center" nowrap="nowrap" valign="middle"><small>When an airport field alert has been declared</small></td>
                    </tr>
                    <tr>
                      <td align="right" valign="middle"><asp:CheckBox ID="CheckBox_mrt_call" runat="server" TextAlign="Left"/></td>
                      <td align="center" valign="middle"><b>MrtCall</b></td>
                      <td align="center" nowrap="nowrap" valign="middle"><small>When the Marine Rescue Team is called out</small></td>
                    </tr>
                    <tr>
                      <td align="right" valign="middle"><asp:CheckBox ID="CheckBox_sar_call" runat="server" TextAlign="Left"/></td>
                      <td align="center" valign="middle"><b>SarCall</b></td>
                      <td align="center" nowrap="nowrap" valign="middle"><small>When the Search And Rescue Team is called out</small></td>
                    </tr>
                    <tr><td colspan="5" style="border-left: thin solid Gainsboro; border-right: thin solid Gainsboro">&nbsp;</td></tr>
                    <tr>
                      <td nowrap="nowrap" style="border-left: thin solid Gainsboro"><font class="">&nbsp;</font></td>
                      <td colspan="3"><asp:Button ID="Button_save_oscalert_settings_2" runat="server" Text="Save OSCALERT settings" ValidationGroup="oscalert_settings" onclick="Button_save_oscalert_settings_Click" UseSubmitBehavior="False"/></td>
                      <td nowrap="nowrap" style="border-right: thin solid Gainsboro">&nbsp;</td>
                    </tr>
                    <tr><td colspan="5" style="border-left: thin solid Gainsboro; border-bottom: thin solid Gainsboro; border-right: thin solid Gainsboro">&nbsp;</td></tr>
                  </table>
                </asp:Panel>
              </ContentTemplate>
            </asp:UpdatePanel>
          </td>
        </tr>
      </table>
    </td>
  </tr>
      </table>
    </td>
  </tr>
</table>
