<%@ Page language="c#" Debug="true" Codebehind="report_monthly_in_class_roster.aspx.cs" AutoEventWireup="True" Inherits="report_monthly_in_class_roster.TWebForm_report_monthly_in_class_roster" EnableViewState="false" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_roster.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
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
					  <td bgcolor="#f5f5f5"><strong>Monthly report of Student personnel</strong></td>
					</tr>
					<tr>
					  <td>
						<small>
						<p>Best practices:</p>
						<ul>
						  <li><p>These people should be scheduled for no more than <strong>two (2) shifts</strong>.</p></li>
						  <li><p>It is critically important to place these people on the schedule prior to the citywide scheduling
							meeting.</p></li>
						  <li><p>Use <asp:label id="Label_application_name_2" runat="server"></asp:label>'s QuickMessage
							feature or other methods to maintain an appropriate dialog with these personnel.</p></li>
						  <li><p>Consider checking with these personnel at this time to see how they are doing in class, and if it
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