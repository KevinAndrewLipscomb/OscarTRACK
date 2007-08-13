<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_member_binder.pas" Inherits="UserControl_member_binder.TWebUserControl_member_binder"%>
<%@ Register TagPrefix="iewc" Namespace="Microsoft.Web.UI.WebControls" Assembly="Microsoft.Web.UI.WebControls, Version=1.0.2.226, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<table cellspacing="0" cellpadding="0" border="0">
	  <tr>
		<td>
		  <iewc:TabStrip id="TabStrip1" runat="server" tabselectedstyle="padding:10;border-top:thin solid silver;border-left:thin solid silver;border-right:thin solid silver;background-color:white;font-weight:bold;"
			   tabdefaultstyle="padding:10;border-top:thin solid white;border-left:thin solid white;border-right:thin solid white;background-color:silver;" forecolor="Blue" tabhoverstyle="background-color:gainsboro;" width="100%" autopostback="True">
		  <iewc:Tab text="Resources"></iewc:Tab>
		  <iewc:Tab text="Results" enabled="False"></iewc:Tab>
		  <iewc:Tab text="Dashboard"></iewc:Tab>
		  <iewc:Tab text="Config" enabled="False"></iewc:Tab>
		  <iewc:Tab text="About"></iewc:Tab>
		  </iewc:TabStrip>
		</td>
	  </tr>
	  <tr>
		<td style="BORDER-RIGHT: silver thin solid; PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: silver thin solid; PADDING-TOP: 10px; BORDER-BOTTOM: silver thin solid">
		   <ASP:PlaceHolder id="PlaceHolder_resources" runat="server"></ASP:PlaceHolder><ASP:PlaceHolder id="PlaceHolder_results" runat="server"></ASP:PlaceHolder><ASP:PlaceHolder id="PlaceHolder_dashboard" runat="server"></ASP:PlaceHolder><ASP:PlaceHolder id="PlaceHolder_config" runat="server"></ASP:PlaceHolder><ASP:PlaceHolder id="PlaceHolder_about" runat="server"></ASP:PlaceHolder>
		</td>
	  </tr>
  </table>
