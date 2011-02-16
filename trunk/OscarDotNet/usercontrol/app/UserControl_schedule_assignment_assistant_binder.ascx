<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_schedule_assignment_assistant_binder.ascx.cs" Inherits="UserControl_schedule_assignment_assistant_binder.TWebUserControl_schedule_assignment_assistant_binder"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~binder.ascx-template -->
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register src="UserControl_schedule_assignment_assistant_intro.ascx" tagname="UserControl_schedule_assignment_assistant_intro" tagprefix="uc1" %>
<uc1:UserControl_schedule_assignment_assistant_intro ID="UserControl_schedule_assignment_assistant_intro1" runat="server" />
<br />
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
                    <td nowrap="nowrap" align="left">
                      <asp:RadioButtonList ID="RadioButtonList_which_month" runat="server" Font-Size="Smaller" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList_which_month_SelectedIndexChanged">
                        <asp:ListItem Value="0" Selected="True">This&nbsp;month</asp:ListItem>
                        <asp:ListItem Value="1">Next&nbsp;month</asp:ListItem>
                      </asp:RadioButtonList>
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
            <cc1:TabPanel runat="server" headertext="Holdouts" id="TabPanel_holdouts" enabled="True"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Alert" id="TabPanel_alert" enabled="True"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Special requests" id="TabPanel_special_requests" enabled="True"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Proposal" id="TabPanel_proposal" enabled="True"></cc1:TabPanel>
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