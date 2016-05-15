<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_schedule_assignment_assistant_binder.ascx.cs" Inherits="UserControl_schedule_assignment_assistant_binder.TWebUserControl_schedule_assignment_assistant_binder"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~binder.ascx-template -->
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
      <tr bgcolor="#f5f5f5">
        <td>
          <table cellspacing="0" cellpadding="0" border="1" bordercolor="#dcdcdc" width="100%">
            <tr>
              <td align="center">
                <table cellspacing="0" cellpadding="5" border="0" align="center" width="100%">
                  <tr>
                    <td width="48%"></td>
                    <td width="1%"><b><small>Filters:</small></b></td>
                    <td align="center" width="1%">
                      <table border="1" bordercolor="#808080" cellpadding="0" cellspacing="0">
                        <tr>
                          <td>
                            <table cellpadding="5" cellspacing="0">
                              <tr id="TableRow_guidance_1" runat="server" visible="false" bgcolor="Khaki">
                                <td nowrap="nowrap"><b>STEP 1:</b></td>
                                <td nowrap="nowrap"><b>STEP 2:</b></td>
                              </tr>
                              <tr>
                                <td nowrap="nowrap">
                                  <asp:RadioButtonList ID="RadioButtonList_which_month" runat="server" AutoPostBack="True" Font-Size="Smaller" OnSelectedIndexChanged="RadioButtonList_which_month_SelectedIndexChanged" Enabled="false">
                                    <asp:ListItem Selected="True" Value="0">This&nbsp;month</asp:ListItem>
                                    <asp:ListItem Value="1">Next&nbsp;month</asp:ListItem>
                                  </asp:RadioButtonList>
                                </td>
                                <td>
                                  <asp:Button ID="Button_refresh" runat="server" OnClick="Button_refresh_Click" Text="Refresh" enabled="false"/>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                      </table>
                    </td>
                    <td id="TableData_agency_filter" runat="server" align="center" width="1%">
                      <small>Agency</small><br/>
                      <asp:DropDownList ID="DropDownList_agency_filter" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_agency_filter_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                    <td align="center" nowrap="nowrap" width="1%">
                      <small>Release level</small><br/>
                      <ASP:DropDownList id="DropDownList_release_filter" runat="server" autopostback="True" onselectedindexchanged="DropDownList_release_filter_SelectedIndexChanged">
                        <ASP:ListItem value="" selected="True">All</ASP:ListItem>
                        <ASP:ListItem value="1">Released</ASP:ListItem>
                        <ASP:ListItem value="0">Not released</ASP:ListItem>
                      </ASP:DropDownList>
   							    </td>
                    <td width="48%">&nbsp;</td>
                  </tr>
                  <tr id="TableRow_guidance_2" runat="server" visible="false">
                    <td align="right" colspan="6" valign="top" bgcolor="Khaki" style="text-align: left">
                      <b>Guidance:</b>&nbsp; When developing the schedule, <b>perform the steps in the indicated numerical order</b>, just about each time you log in.&nbsp; On day
                      <asp:Literal ID="Literal_partial_next_month_access_day" runat="server"></asp:Literal> of this month, start checking next month's availability submissions.&nbsp; Encourage holdouts to submit, and encourage
                      all members to be available for unpopular shifts.&nbsp; On day <asp:Literal ID="Literal_full_next_month_access_day" runat="server"></asp:Literal> of this month, start designating stations (home or
                      satellite) and crews (a, b, etc).&nbsp; Per <b><a href="http://www.vbems.com/deputychief/documents/Policies_PDF/103.01.01.EMS_Duty_Policy.pdf" target="_blank">policy</a></b>, a squad
                      gets exclusive access to its next-month schedule until publication, or until <asp:Literal ID="Literal_dept_next_month_access_hour" runat="server"></asp:Literal>00h on day
                      <asp:Literal ID="Literal_dept_next_month_access_day" runat="server"></asp:Literal> of this month, whichever is earlier.&nbsp; Then the Department may revise it.
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td>
          <small>
            <asp:Label ID="Label_post_publish_submissions" runat="server" Text="**Post-publish submissions detected.  Check Compliancy:Submitters." ForeColor="DarkOrange" Font-Bold="True" Font-Italic="True" Visible="False"></asp:Label>&nbsp;
          </small>
        </td>
      </tr>
      <tr>
        <td>
          <cc1:TabContainer id="TabContainer_control" runat="server" autopostback="True" cssclass="ajax__tab_ki">
            <cc1:TabPanel runat="server" headertext="Compliancy" id="TabPanel_holdouts" Enabled="false"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Alerts" id="TabPanel_alert" Enabled="false"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Special requests" id="TabPanel_special_requests" Enabled="false"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Watchbill" id="TabPanel_proposal"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Strength chart" id="TabPanel_strength_chart"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Publish" id="TabPanel_publish_print" Enabled="false"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="About" id="TabPanel_about"></cc1:TabPanel>
          </cc1:TabContainer>
        </td>
      </tr>
      <tr>
        <td class="ki_tab_body">
          <ASP:PlaceHolder id="PlaceHolder_content" runat="server"></ASP:PlaceHolder>
        </td>
      </tr>
    </table>
