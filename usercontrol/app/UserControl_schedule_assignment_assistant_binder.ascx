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
                    <td align="right"><b><small>Filters:</small></b></td>
                    <td align="center">
                      <table border="1" bordercolor="#808080" cellpadding="0" cellspacing="0">
                        <tr>
                          <td>
                            <table cellpadding="5" cellspacing="0">
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
                    <td id="TableData_agency_filter" runat="server" align="center">
                      <small>Agency</small><br/>
                      <asp:DropDownList ID="DropDownList_agency_filter" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_agency_filter_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                    <td align="center" nowrap="nowrap">
                      <small>Release level</small><br/>
                      <ASP:DropDownList id="DropDownList_release_filter" runat="server" autopostback="True" onselectedindexchanged="DropDownList_release_filter_SelectedIndexChanged">
                        <ASP:ListItem value="" selected="True">All</ASP:ListItem>
                        <ASP:ListItem value="1">Released</ASP:ListItem>
                        <ASP:ListItem value="0">Not released</ASP:ListItem>
                      </ASP:DropDownList>
   							    </td>
                    <td align="left">
                      <small>
                        <em>
                          <span id="Span_exclusivity_notice" runat="server" style="visibility:hidden">
                            Per <b><a href="http://www.vbems.com/deputychief/documents/Policies_PDF/103.01.01.EMS_Duty_Policy.pdf" target="_blank">policy</a></b>, a squad gets exclusive access to its next-month schedule until publication, or
                            through the 17th, whichever is earlier.&nbsp; Then the Department may revise it.
                          </span>
                        </em>
                      </small>
                    </td>
                  </tr>
                  <tr id="TableRow_guidance" runat="server" visible="false">
                    <td align="right"><b>Guidance:</b></td>
                    <td colspan="4" align="left">
                      When developing the schedule, the way to get the best results with the least amount of work is to <b>perform the steps in the indicated numerical order</b>, just about each time you log in.
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
            <cc1:TabPanel runat="server" headertext="Publish" id="TabPanel_publish_print" Enabled="false"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="About" id="TabPanel_about"></cc1:TabPanel>
          </cc1:TabContainer>
        </td>
      </tr>
      <tr>
        <td style="PADDING:8px; BORDER-BOTTOM:thin solid silver; BORDER-LEFT:thin solid silver; BORDER-RIGHT:thin solid silver;">
          <ASP:PlaceHolder id="PlaceHolder_content" runat="server"></ASP:PlaceHolder>
        </td>
      </tr>
    </table>
