<%@ Page language="c#" Debug="true" Codebehind="report_monthly_current_roster.pas" AutoEventWireup="false" Inherits="report_monthly_current_roster.TWebForm_report_monthly_current_roster" EnableViewState="false" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<%@ Reference Control="~/usercontrol/app/UserControl_roster.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
					  <td bgcolor="#f5f5f5"><strong>Monthly report of CURRENT MEMBERS</strong></td>
					</tr>
					<tr>
					  <td>
						<small>
						<p>Best practices:</p>
						<ul>
						  <li><p>Your scheduler will use the data in
							<asp:label id="Label_application_name_2" runat="server" font-bold="True"></asp:label> as the basis for
							writing next month's schedule.</p></li>
						  <li><p>Your subordinate officers can also view this data at the
							<asp:label id="Label_application_name_3" runat="server" font-bold="True"></asp:label> website.  Make
							sure they are using the QuickMessage feature to maintain an appropriate dialog with personnel who are in
							the pipeline for release.</p></li>
                                                  <li><p>Consider reporting the aggregated calculations at your squad's business meeting and/or having this
                                                    report entered into your squad's corporate minutes.</p></li>						  <li>
						  <li>
							<p>Visit the <asp:label id="Label_application_name_1" runat="server" font-bold="True"></asp:label>
							website to make updates and to use additional features, such as advanced filtering, sorting, detail
							lookups, and QuickMessaging:</p>
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
