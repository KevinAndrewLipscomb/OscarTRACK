<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_precontent.pas" Inherits="UserControl_precontent.TWebUserControl_precontent"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_common_header_bar" Src="~/usercontrol/app/UserControl_common_header_bar.ascx" %>
<uc1:UserControl_common_header_bar id="UserControl_common_header_bar" runat="server"></uc1:UserControl_common_header_bar>
<table cellspacing="0" cellpadding="10" width="100%" border="0">
  <tr>
	<td valign="top" width="10%">
	  <p>
		  <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="5" width="100%" border="1">
			  <tr>
				<td bgcolor="#f5f5f5">
				  <p align="center"><ASP:HyperLink id="HyperLink_sponsor" runat="server" font-bold="True" navigateurl="http://www.vabeachems.com"></ASP:HyperLink>
				  </p></td>
			  </tr>
		  </table>
	  </p>
	  <p>
	  <table cellspacing="0" cellpadding="0" width="100%" border="0">
		<tr>
		  <td align="center"><a href="http://www.vabeachems.com"><img id="HtmlImage_sponsor_logoseal" height="145" alt="VBDEMS seal" src="~\protected\image\vbemspatch150.jpg" width="149" border="0" runat="Server"></a></td>
		</tr>
	  </table>
	  </p>
	  <p>
	  <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
		<tr>
		  <td>
			<table cellspacing="0" cellpadding="5" border="0" width="100%">
			  <tr>
				<td bgcolor="#f5f5f5">
				  <small><strong>Resources</strong>
				  </small></td>
			  </tr>
			  <tr>
				<td>
				  <small>
					<small>These links open in a new window.</small>
				  </small>
				  <table cellspacing="0" cellpadding="5" border="0">
					<tr>
					  <td valign="top">
						<li></li></td>
					  <td>
						<small><a href="http://www.vabeachems.com">VaBeachEMS.com</a>
						</small></td>
					</tr>
					<tr>
					  <td valign="top">
						<li></li></td>
					  <td>
						<small><a href="http://www.vbgov.com/file_source/dept/ems/Document/103.01.01.EMS_Duty_Policy.pdf">EMS Duty
														            Policy</a>
						</small></td>
					</tr>
							  <tr>
								<td valign="top"><li></li></td>
								<td><small><a href="http://www.oscarsystem.com/">OSCAR (classic)</a></small></td>
							  </tr>
					<tr>
					  <td valign="top">
						<li></li></td>
					  <td>
						<small><a href="http://www.vabeachemstraining.com">VaBeachEmsTraining.com</a>
						</small></td>
					</tr>
				  </table></td>
			  </tr>
			</table></td>
		</tr>
	  </table>
	  </p>
	  <p>
	  <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
		<tr>
		  <td>
			<table cellspacing="0" cellpadding="5" border="0">
			  <tr>
				<td bgcolor="#f5f5f5">
				  <small><strong>Process improvement</strong>
				  </small></td>
			  </tr>
			  <tr>
				<td>
				  <small>
					<small>You can help us make this application better!</small>
				  </small></td>
			  </tr>
			  <tr>
				<td>
				  <small>
					<small>Send suggestions <a href="mailto:feedback@frompaper2web.com?subject=OSCAR%20suggestion">here</a>.
					</small>
				  </small></td>
			  </tr>
			  <tr>
				<td>
				  <small>
					<small><strong>Thanks!</strong>
					</small>
				  </small></td>
			  </tr>
			</table></td>
		</tr>
	  </table>
	  </p>
	  <p>
		<table cellspacing="0" cellpadding="5" width="100%" border="0">
			<tr>
			  <td>
				  <p align="center"><a href="http://groups.yahoo.com/group/BeachEMS/"><img id="HtmlImage_partner_logoseal" height="151" alt="Rescue Council logoseal" src="~/protected/image/rc-logo.jpg" width="154" border="0" runat="Server"></a></p>
				  <p align="center"><a href="http://www.vbgov.com"><img id="HtmlImage_sponsor_sponsor_logoseal" height="162" alt="City of Va Beach seal" src="~\protected\image\cityseal150.jpg" width="154" border="0" runat="Server"></a></p>
			  </td>
			</tr>
		</table>
	  </p>
	  </td>
	<td valign="top">
        <ASP:ValidationSummary id="ValidationSummary1" runat="server"></ASP:ValidationSummary>
