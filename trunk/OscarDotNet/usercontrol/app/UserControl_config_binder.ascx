<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_config_binder.pas" Inherits="UserControl_config_binder.TWebUserControl_config_binder"%>
<%@ Register TagPrefix="iewc" Namespace="Microsoft.Web.UI.WebControls" Assembly="Microsoft.Web.UI.WebControls, Version=1.0.2.226, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>

  <table cellspacing="0" cellpadding="0" border="0">
	  <tr>
		<td>
		  <iewc:TabStrip id="TabStrip1" runat="server" tabselectedstyle="padding:10;border-top:thin solid silver;border-left:thin solid silver;border-right:thin solid silver;background-color:white;font-weight:bold;"
			   tabdefaultstyle="padding:10;border-top:thin solid white;border-left:thin solid white;border-right:thin solid white;background-color:silver;" forecolor="Blue" tabhoverstyle="background-color:gainsboro;" width="100%" autopostback="True">
		  <iewc:Tab text="Welcome"></iewc:Tab>
		  <iewc:Tab text="Agencies" enabled="False"></iewc:Tab>
		  <iewc:Tab text="Users" enabled="False"></iewc:Tab>
		  </iewc:TabStrip>
		</td>
	  </tr>
	  <tr>
		<td style="BORDER-RIGHT: silver thin solid; PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: silver thin solid; PADDING-TOP: 10px; BORDER-BOTTOM: silver thin solid">
		   <ASP:PlaceHolder id="PlaceHolder_content" runat="server"></ASP:PlaceHolder>
		</td>
	  </tr>
  </table>
