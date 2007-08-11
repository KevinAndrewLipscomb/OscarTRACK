<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_member_binder.pas" Inherits="UserControl_member_binder.TWebUserControl_member_binder"%>
<%@ Register TagPrefix="iewc" Namespace="Microsoft.Web.UI.WebControls" Assembly="Microsoft.Web.UI.WebControls, Version=1.0.2.226, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_roster" Src="~/usercontrol/app/UserControl_roster.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_dashboard_binder" Src="~/usercontrol/app/UserControl_dashboard_binder.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_about" Src="~/usercontrol/app/UserControl_about.ascx" %>
<table cellspacing="0" cellpadding="0" border="0">
	  <tr>
		<td>
		  <iewc:TabStrip id="TabStrip1" runat="server" tabselectedstyle="padding:10;border-top:thin solid silver;border-left:thin solid silver;border-right:thin solid silver;background-color:white;font-weight:bold;"
			   tabdefaultstyle="padding:10;border-top:thin solid white;border-left:thin solid white;border-right:thin solid white;background-color:silver;" targetid="MultiPage1" forecolor="Blue" tabhoverstyle="background-color:gainsboro;" width="100%">
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
		  <iewc:MultiPage id="MultiPage1" runat="server">
			 <iewc:pageview>
               <uc1:UserControl_roster id="UserControl_roster" runat="server"></uc1:UserControl_roster>
			 </iewc:pageview>
			 <iewc:pageview>
			 </iewc:pageview>
			 <iewc:pageview>
               <uc1:UserControl_dashboard_binder id="UserControl_dashboard_binder" runat="server"></uc1:UserControl_dashboard_binder>
			 </iewc:pageview>
			 <iewc:pageview>
			 </iewc:pageview>
			 <iewc:pageview>
               <uc1:UserControl_about id="UserControl_about" runat="server"></uc1:UserControl_about>
			 </iewc:pageview>
		  </iewc:MultiPage>
		</td>
	  </tr>
  </table>
