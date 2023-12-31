<%@ Page language="c#" codebehind="report_monthly_applicant_roster.aspx.cs" AutoEventWireup="True" Inherits="report_monthly_applicant_roster.TWebForm_report_monthly_applicant_roster" EnableViewState="false" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_roster.ascx" %>
<!DOCTYPE html>
<html>
  <head runat="server">
	<title></title>
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
					  <td bgcolor="#f5f5f5"><strong>Monthly report of APPLICANTS</strong></td>
					</tr>
					<tr>
					  <td>
						<small>
						<p>Best practices:</p>
						<ul>
						  <li><p>Use the <asp:label id="Label_application_name_2" runat="server"></asp:label> website's QuickMessage
							feature or other methods to maintain an appropriate dialog with these personnel.</p></li>
						  <li><p>Consider reminding these personnel that we are counting on them to complete their applications, and
						    that we are looking forward to welcoming them aboard.</p></li>
						  <li><p>Consider reporting the aggregated calculations at your squad's business meeting and/or having this
							report entered into your squad's corporate minutes.</p></li>
						  <li>
							<p>Visit the <asp:label id="Label_application_name_1" runat="server"></asp:label>
							website to use additional features, such as advanced filtering, sorting, detail lookups, and
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
