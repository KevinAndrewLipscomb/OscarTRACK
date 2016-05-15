<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_eval_object_binder.ascx.cs" Inherits="UserControl_eval_object_binder.TWebUserControl_eval_object_binder"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~eval_object~binder.ascx-eval_object -->
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
      <tr>
        <td>
          <cc1:TabContainer id="TabContainer_control" runat="server" autopostback="True" cssclass="ajax__tab_ki">
            <cc1:TabPanel runat="server" headertext="Skill ratings" id="TabPanel_skill_ratings"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Care skills" id="TabPanel_care_skills"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Driver skills" id="TabPanel_driver_skills"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Patient encounter levels" id="TabPanel_patient_encounter_levels"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Patient age units" id="TabPanel_patient_age_units"></cc1:TabPanel>
          </cc1:TabContainer>
        </td>
      </tr>
      <tr>
        <td class="ki_tab_body">
          <ASP:PlaceHolder id="PlaceHolder_content" runat="server"></ASP:PlaceHolder>
        </td>
      </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>