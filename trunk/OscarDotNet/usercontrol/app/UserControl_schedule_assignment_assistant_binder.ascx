<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_schedule_assignment_assistant_binder.ascx.cs" Inherits="UserControl_schedule_assignment_assistant_binder.TWebUserControl_schedule_assignment_assistant_binder"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~binder.ascx-template -->
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
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
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr><td>&nbsp;</td></tr>
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
  </ContentTemplate>
</asp:UpdatePanel>