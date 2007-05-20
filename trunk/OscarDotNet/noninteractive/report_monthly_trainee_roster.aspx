<%@ Page language="c#" Debug="true" Codebehind="report_monthly_trainee_roster.pas" AutoEventWireup="false" Inherits="report_monthly_trainee_roster.TWebForm_report_monthly_trainee_roster" EnableViewState="false" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_roster.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title id="Title" runat="server"></title>
	<!-- $Id$ -->
  </head>
  <body>
	<form runat="server">
      <uc1:UserControl_common_header_bar id="UserControl_common_header_bar" runat="server"></uc1:UserControl_common_header_bar>
	  <p>
		<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
			<tr>
			  <td>
				<table cellspacing="0" cellpadding="10" width="100%" border="0">
					<tr>
					  <td bgcolor="#f5f5f5"><strong>Best practices</strong></td>
					</tr>
					<tr>
					  <td>
						<p>Monthly report of TRAINEE personnel</p>
						<small>
						<ul>
						  <li><p>Use the <asp:label id="Label_application_name_2" runat="server"></asp:label> website's QuickMessage
							feature or other methods to maintain an appropriate dialog with these personnel.</p></li>
						  <li><p>Make sure these personnel have been scheduled for a full set of duties this month.</p></li>
						  <li><p>Consider checking with these personnel at this time to see how they are doing on their check-off
						    sheets, and if it would be useful for you to arrange any special support for them.</p></li>
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
