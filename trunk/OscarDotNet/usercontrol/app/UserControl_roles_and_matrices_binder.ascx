<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_roles_and_matrices_binder.pas" Inherits="UserControl_roles_and_matrices_binder.TWebUserControl_roles_and_matrices_binder"%>
<%@ Register TagPrefix="iewc" Namespace="Microsoft.Web.UI.WebControls" Assembly="Microsoft.Web.UI.WebControls, Version=1.0.2.226, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional"><ContentTemplate>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
          <td>
            <iewc:TabStrip id="TabStrip_control" runat="server" tabselectedstyle="padding:10;border-top:thin solid silver;border-left:thin solid silver;border-right:thin solid silver;background-color:white;font-weight:bold;"
                           tabdefaultstyle="padding:10;border-top:thin solid white;border-left:thin solid white;border-right:thin solid white;background-color:silver;" forecolor="Blue" tabhoverstyle="background-color:gainsboro;" width="100%"
                           autopostback="True">
              <iewc:Tab text="Roles"></iewc:Tab>
              <iewc:Tab text="Role-Member mappings"></iewc:Tab>
              <iewc:Tab text="Role-Privilege mappings"></iewc:Tab>
              <iewc:Tab text="Role-Notification mappings"></iewc:Tab>
            </iewc:TabStrip></td>
        </tr>
        <tr>
          <td style="BORDER-RIGHT: silver thin solid; PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: silver thin solid; PADDING-TOP: 10px; BORDER-BOTTOM: silver thin solid">
            <p>&nbsp;</p>
            <p>Have you read the <a href="../doc/roles.aspx" target="_blank">Important Information About Roles</a>?&nbsp; <small>(opens new window)</small>
            </p>
            <ASP:PlaceHolder id="PlaceHolder_content" runat="server"></ASP:PlaceHolder></td>
        </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>
