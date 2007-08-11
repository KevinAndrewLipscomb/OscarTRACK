<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_dashboard_binder.pas" Inherits="UserControl_dashboard_binder.TWebUserControl_dashboard_binder" %>
<%@ Register TagPrefix="iewc" Namespace="Microsoft.Web.UI.WebControls" Assembly="Microsoft.Web.UI.WebControls, Version=1.0.2.226, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import namespace="Microsoft.Web.UI.WebControls"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_ranked_core_ops_size" Src="~/usercontrol/app/UserControl_ranked_core_ops_size.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_ranked_crew_shifts_forecast" Src="~/usercontrol/app/UserControl_ranked_crew_shifts_forecast.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_ranked_utilization" Src="~/usercontrol/app/UserControl_ranked_utilization.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_ranked_standard_enrollment" Src="~/usercontrol/app/UserControl_ranked_standard_enrollment.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_ranked_length_of_service" Src="~/usercontrol/app/UserControl_ranked_length_of_service.ascx" %>
<table cellspacing="0" cellpadding="0" border="0">
	  <tr>
		<td>
		  <iewc:TabStrip id="TabStrip1" runat="server" tabselectedstyle="padding:10;border-top:thin solid silver;border-left:thin solid silver;border-right:thin solid silver;background-color:white;font-weight:bold;"
			   tabdefaultstyle="padding:10;border-top:thin solid white;border-left:thin solid white;border-right:thin solid white;background-color:silver;" targetid="MultiPage1" forecolor="Blue" tabhoverstyle="background-color:gainsboro;" width="100%">
		  <iewc:Tab text="Current"></iewc:Tab>
		  <iewc:Tab text="Serial" enabled="False"></iewc:Tab>
		  </iewc:TabStrip>
		</td>
	  </tr>
	  <tr>
		<td style="BORDER-RIGHT: silver thin solid; PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: silver thin solid; PADDING-TOP: 10px; BORDER-BOTTOM: silver thin solid">
		  <iewc:MultiPage id="MultiPage1" runat="server">
			 <iewc:pageview>
			  <div id="Div_print_area">
			  <table cellspacing="0" cellpadding="0" border="0" width="100%">
				<tr>
				  <td valign="top" width="50%">
					<p><uc1:UserControl_ranked_core_ops_size id="UserControl_ranked_core_ops_size" runat="server"></uc1:UserControl_ranked_core_ops_size></p>
					<p><uc1:UserControl_ranked_utilization id="UserControl_ranked_utilization" runat="server"></uc1:UserControl_ranked_utilization></p>
					<p><uc1:UserControl_ranked_length_of_service id="UserControl_ranked_length_of_service" runat="server"></uc1:UserControl_ranked_length_of_service></p>
				  </td>
				  <td>&nbsp;&nbsp;</td>
				  <td valign="top" width="50%">
					<p><uc1:UserControl_ranked_crew_shifts_forecast id="UserControl_ranked_crew_shifts_forecast" runat="server"></uc1:UserControl_ranked_crew_shifts_forecast></p>
					<p><uc1:UserControl_ranked_standard_enrollment id="UserControl_ranked_standard_enrollment" runat="server"></uc1:UserControl_ranked_standard_enrollment></p>
				  </td>
				</tr>
			  </table>
			  </div>
			 </iewc:pageview>
			 <iewc:pageview>
			   Uncomment UserControl2 registration and invocation tags and remove space between RUN and AT
			   <!-- uc1:UserControl2 id="UserControl2" run at="server"></uc1:UserControl2 -->
			 </iewc:pageview>
		  </iewc:MultiPage>
		</td>
	  </tr>
  </table>
