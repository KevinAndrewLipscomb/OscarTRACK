<%@ Page language="c#" Debug="true" Codebehind="report_monthly_core_ops_roster.pas" AutoEventWireup="false" Inherits="report_monthly_core_ops_roster.TWebForm_report_monthly_core_ops_roster" EnableViewState="false" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_roster.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
	<title id="Title" runat="server"></title>
	<!-- $Id$ -->
  </head>
  <body bgcolor="white">
	<form runat="server">
      <uc1:UserControl_common_header_bar id="UserControl_common_header_bar" runat="server"></uc1:UserControl_common_header_bar>
	  <p>
		<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
			<tr>
			  <td>
				<table cellspacing="0" cellpadding="10" width="100%" border="0">
					<tr>
					  <td bgcolor="#f5f5f5"><strong>Monthly report of CORE OPERATIONS PERSONNEL</strong></td>
					</tr>
					<tr>
					  <td>
						<small>
						<p>Best practices:</p>
						<ul>
						  <li><p>Use this report along with any subsequent
							<asp:label id="Label_application_name_1" runat="server"></asp:label> email notifications as the basis
							for writing	the upcoming schedule.</p></li>
						  <li><p>Make sure to assign the required number of duties to all members, including "thirds", even if doing
							so means scheduling	members as Driver Only or scheduling them to staff units at other stations.</p></li>
						  <li><p>It is critically important to arrive at the citywide scheduling meeting with the most complete
						    schedule possible.&nbsp; This includes placing "thirds" on the schedule.</p></li>  
						  <li><p>Immediately advise the appropriate Squad Commander of any discrepancies in this report.</p></li>
						  <li><p>Schedule the least available personnel first.</p></li>
						  <li><p>Generally, you should favor personnel with longer lengths of service unless doing so would reduce
							staffing.</p></li>
						  <li><p>Consider reporting the aggregated calculations at your squad's business meeting and/or having this
							report entered into your squad's corporate minutes.</p></li>
						  <li>
							<p>Visit the <asp:label id="Label_application_name_2" runat="server" font-bold="True"></asp:label>
							website for additional features, such as advanced filtering, sorting, detail lookups, and
							QuickMessaging:</p>
							<blockquote>
							  <ASP:HyperLink id="HyperLink_web_site" runat="server" font-bold="True"></ASP:HyperLink>
							</blockquote>
						  </li>
						</ul>
						</small>
                      </td>
					</tr>
				</table></td>
			</tr>
		</table></p>
	  <p<ASP:PlaceHolder id="PlaceHolder_roster" runat="server"></ASP:PlaceHolder></p>
	</form>
  </body>
</html>
