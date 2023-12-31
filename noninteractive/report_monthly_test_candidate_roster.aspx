<%@ Page language="c#" codebehind="report_monthly_test_candidate_roster.aspx.cs" AutoEventWireup="True" Inherits="report_monthly_test_candidate_roster.TWebForm_report_monthly_test_candidate_roster" EnableViewState="false" %>
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
					  <td bgcolor="#f5f5f5"><strong>Monthly report of Test Candidate personnel</strong></td>
					</tr>
					<tr>
					  <td>
						<small>
						<p>Best practices:</p>
						<ul>
						  <li>
                <p>
                  These personnel have graduated from class, but are waiting to test, and have not yet received their state certification.&nbsp; They cannot be placed on the schedule.&nbsp; It's important to keep them otherwise
                  engaged with us.
                </p>
						  </li>
						  <li><p>Use <asp:label id="Label_application_name_2" runat="server"></asp:label>'s QuickMessage
							feature or other methods to maintain an appropriate dialog with these personnel.</p></li>
						  <li><p>Consider checking with these personnel at this time to see if they have scheduled a test, and if it
							would be useful for you to arrange any special study support for them.</p></li>
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
	  <p><ASP:PlaceHolder id="PlaceHolder_roster" runat="server"></ASP:PlaceHolder></p>
	</form>
  </body>
</html>
