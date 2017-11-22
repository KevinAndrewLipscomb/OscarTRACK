<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_uniform_object_binder.ascx.cs" Inherits="UserControl_uniform_object_binder.TWebUserControl_uniform_object_binder"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~uniform_object~binder.ascx-uniform_object -->
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
      <tr>
        <td>
          <cc1:TabContainer id="TabContainer_control" runat="server" autopostback="True" cssclass="ajax__tab_ki" CssTheme="None">
            <cc1:TabPanel runat="server" headertext="Priority" id="TabPanel_priority" enabled="False"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Class" id="TabPanel_class" enabled="False"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Piece" id="TabPanel_piece" enabled="False"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Rank group" id="TabPanel_rank_group" enabled="False"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Option category" id="TabPanel_option_category" enabled="False"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Vendor" id="TabPanel_vendor" enabled="False"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Make" id="TabPanel_make" enabled="False"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Model" id="TabPanel_model" enabled="False"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Color" id="TabPanel_color" enabled="False"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Catalog" id="TabPanel_catalog" enabled="False"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Rank" id="TabPanel_rank" enabled="False"></cc1:TabPanel>
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