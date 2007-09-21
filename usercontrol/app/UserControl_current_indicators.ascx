<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_current_indicators.pas" Inherits="UserControl_current_indicators.TWebUserControl_current_indicators"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
<div id="Div_print_area">
<uc1:UserControl_print_div id="UserControl_print_div" runat="server"></uc1:UserControl_print_div><table cellspacing="0" cellpadding="0" border="0" width="100%">
	<tr>
	  <td valign="top" width="50%">
		<p><ASP:PlaceHolder id="PlaceHolder_ranked_core_ops_size" runat="server"></ASP:PlaceHolder></p>
		<p><ASP:PlaceHolder id="PlaceHolder_ranked_crew_shifts_forecast" runat="server"></ASP:PlaceHolder></p>
		<p><ASP:PlaceHolder id="PlaceHolder_ranked_utilization" runat="server"></ASP:PlaceHolder></p>
		<p><ASP:PlaceHolder id="PlaceHolder_ranked_length_of_service" runat="server"></ASP:PlaceHolder></p>
	  </td>
	  <td>&nbsp;&nbsp;</td>
	  <td valign="top" width="50%">
		<p><ASP:PlaceHolder id="PlaceHolder_ranked_num_members_in_pipeline" runat="server"></ASP:PlaceHolder></p>
		<p><ASP:PlaceHolder id="PlaceHolder_ranked_commensuration" runat="server"></ASP:PlaceHolder></p>
		<p><ASP:PlaceHolder id="PlaceHolder_ranked_standard_enrollment" runat="server"></ASP:PlaceHolder></p>
	  </td>
	</tr>
  </table>
</div>
