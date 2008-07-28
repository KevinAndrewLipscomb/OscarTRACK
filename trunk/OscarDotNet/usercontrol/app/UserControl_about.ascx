<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_about.pas" Inherits="UserControl_about.TWebUserControl_about"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
  <asp:UpdatePanel id="UpdatePanel_control" runat="server">
    <ContentTemplate>
<div id="Div_print_area">
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" width="100%" border="0">
        <tr bgcolor="#f5f5f5">
		  <td><strong>About <ASP:Label id="Label_application_name" runat="server"></ASP:Label>&nbsp;&nbsp;&nbsp;&nbsp; <uc1:UserControl_print_div id="UserControl_print_div" runat="server"></uc1:UserControl_print_div></strong></td>
        </tr>
        <tr>
          <td>
				<p>Software developed and&nbsp;services arranged "at-risk" by:</p>
				<blockquote>Kalips'o Infogistics LLC<br>d/b/a FromPaper2Web.com<br>Kevin Lipscomb, President </blockquote>
				<p>Prepared for the volunteer component of the City of Virginia Beach's Emergency Medical Services System, including: </p>
				<ul>
					<li>Virginia Beach Department of EMS </li>
					<li>Virginia Beach Association of Rescue Squad Volunteers Inc. </li>
					<li>Council of Virginia Beach Volunteer Rescue Squads, Inc. </li>
					<li>All the squads, teams, and staff that make up the strongest volunteer-centric 911 agency in the world!</li>
				  </ul>
				<p>Built and controlled using:</p>
				<ul>
				  <li>CodeGear RAD Studio 2007 integrated development environment </li>
				  <li>Delphi programming language </li>
				  <li>Microsoft ASP.NET web application framework </li>
				  <li>Microsoft Internet Explorer Web Controls </li>
				  <li>Steve Stchur's SmartScroller </li>
				  <li>MySQL database management system </li>
				  <li>Quinn-Curtis SPC Control Chart Tools for .Net with QCChart2D </li>
				  <li>Subversion version control system </li>
				  <li>TortoiseSVN </li>
				  <li>Divlocsoft Actual Search &amp; Replace </li>
				  <li>Michael Elsdoerfer's NTFS Link </li>
				  <li>WinMerge </li>
				  <li>SourceForge.net open source code repository</li>
				</ul>
				<p>Ancillary tools:</p>
                <ul>
				  <li>FolderShare </li>
				  <li>IBackup IDrive </li>
				  <li>Llamagraphics Life Balance </li>
				  <li>Microsoft Windows XP </li>
				  <li>Natara Bonsai </li>
				  <li>Palm software </li>
				  <li>PDFCreator </li>
				  <li>Peganza ICARUS </li>
				  <li>PGP </li>
				  <li>Xemacs</li>
                </ul>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
    </ContentTemplate>
  </asp:UpdatePanel>
