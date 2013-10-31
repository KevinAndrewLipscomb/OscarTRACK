<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->

<%@ Page Language="c#" Debug="true" CodeBehind="bounty_program.aspx.cs" AutoEventWireup="True" Inherits="bounty_program.TWebForm_bounty_program" %>

<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="uc3" TagName="UserControl_update_progress_blocker" Src="~/usercontrol/app/UserControl_update_progress_blocker.ascx" %>
<html>
<head runat="server">
  <title></title>
  <!-- $Id$ -->
  <link href="../css/standard.css" rel="stylesheet" type="text/css" />
  <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
</head>
<body bgcolor="white">
  <form runat="server">
  <uc1:UserControl_precontent ID="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
  <h1 align="center">Bounty Program</h1>
  <blockquote>
    <center>
      <b>Abstract</b><br />
      <p>This program encourages and rewards contributions from certain individuals who help make this system more secure, or who help solve certain difficult system problems.&nbsp; Through this program Kalips'o Infogistics LLC
        will provide monetary awards and recognition for vulnerabilities or solutions responsibly disclosed to the company.</p>
    </center>
  </blockquote>
  <p>&nbsp;</p>
  <h2>Guidelines</h2>
  <p>The Kalips'o Infogistics LLC Bounty Program applies to vulnerabilities found within this system and to difficult problems present in this system. While the scope of this program is limited, submissions outside this scope
    may be examined.</p>
  <p>Kalips'o Infogistics LLC:</p>
  <ul>
    <li>Will determine which vulnerabilities and solutions are considered in scope and the amount of the reward given, <strong>but the typical amount rewarded will be US$50</strong>.</li>
    <li>May determine that multiple related reports constitute only a single reward, or alternatively that a single report is related to multiple vulnerabilities or solutions.</li>
  </ul>
  <p>The submitter:</p>
  <ul>
    <li>Must be a current volunteer member of the Virginia Beach EMS System in good standing (ie, not suspended or undergoing investigation or corrective action), or a past member who was not dismissed</li>
    <li>Must not be employed by Kalips'o Infogistics LLC directly or indirectly, nor be a paid employee of the Virginia Beach Department Of EMS</li>
  </ul>
  <p>&nbsp;</p>
  <h2>What is eligible for reward?</h2>
  <ul>
    <li>
      <h3>REPORTS OF VULNERABILITIES</h3>
      <p>Any report of a vulnerability, subject to the following limitations, may be eligible:</p>
      <ul>
        <li>A vulnerability is an error, flaw, mistake, failure, or fault in the computer program or system that impacts the security of this system or its data. Any vulnerability may be considered for this program; however, it must
          be new and previously unreported. Typically the in-scope submissions will include high impact vulnerabilities; however, any vulnerability at any severity might be rewarded.</li>
        <li>Some characteristics that would be considered in qualifying vulnerabilities include those that:
          <ul>
            <li>Directly affect the confidentiality or integrity of this system's data or which breaches intended privacy features</li>
            <li>Compromise the integrity of this system</li>
            <li>Enable unauthorized access to significant data or resources</li>
            <li>Enable the running of unauthorized code</li>
            <li>Increase privileges or access over that intended</li>
            <li>Interfere with or bypass security controls or mechanisms</li>
            <li>Are exploitable (not impractical or purely theoretical)</li>
            <li>Are launchable remotely</li>
            <li>Have the potential to cause malicious damage to this system</li>
          </ul>
        </li>
      </ul>
      <br />
    </li>
    <li>
      <h3>SOLUTIONS TO CERTAIN DIFFICULT PROBLEMS</h3>
      <p>Solutions to the following difficult problems may be eligible:</p>
      <ul>
        <li><strong>Further optimization of the monthly initial Watchbill Proposal</strong></li>
      </ul>
    </li>
  </ul>
  <p>&nbsp;</p>
  <h2>Program Exclusions</h2>
  <p>There are categories of vulnerabilities and solutions which are definitively excluded from reward in the Kalips'o Infogistics LLC Bounty Program:</p>
  <ul>
    <li>For <strong>vulnerabilities</strong>:
      <ul>
        <li>Attacks against Kalips'o Infogistics LLC infrastructure</li>
        <li>Social engineering and physical attacks</li>
        <li>Denial of service attacks that require large volumes of data</li>
        <li>Attacks that require harnessing an inordinately massive collection of resources</li>
        <li>Provisioning errors</li>
        <li>Violation of licenses or other restrictions applicable to any vendor's product</li>
        <li>Security bugs in third-party applications (e.g. java, plugins) or websites</li>
        <li>The submitter must not be the author of the code (or originator of the solution) with the vulnerability</li>
        <li>Those that are disclosed to any party other than Kalips'o Infogistics LLC, including vulnerability brokers, will usually not qualify for award. This includes both full public disclosure and limited private
          release.</li>
      </ul>
      <br />
    </li>
    <li>For <strong>solutions</strong>, those that:
      <ul>
        <li>Require business domain policy changes</li>
        <li>Describe nothing more than changes in user behavior</li>
        <li>Describe nothing more than cosmetic changes</li>
        <li>Degrade citywide staffing</li>
        <li>Are too ambiguous</li>
        <li>Are not practical to implement</li>
        <li>A significant number or class of stakeholders object to or fail to adopt over the short or long terms</li>
        <li>Contain vulnerabilities</li>
      </ul>
    </li>
  </ul>
  <p>&nbsp;</p>
  <h2>Terms &amp; Conditions</h2>
  <p>There may be additional restrictions depending upon the local laws. The submitter is responsible for any tax implications of their reward.</p>
  <p>Also:</p>
  <ul>
    <li>The submitter must abide by the law.</li>
    <li>Do not access, disclose or otherwise disrupt data or accounts that are not your own.</li>
    <li>You must not disclose a potential vulnerability publicly or privately to any other person or entity. You must not disclose a potential solution to any competitor of Kalips'o Infogistics LLC. You must allow Kalips'o
      Infogistics LLC time to review, analyze, and address the vulnerability or solution. Submissions selected for payment, and the individuals who submitted a vulnerability or solution will receive appropriate recognition at
      the discretion of Kalips'o Infogistics LLC.</li>
    <li>The scope of this bounty program is limited to this system unless otherwise specified.</li>
    <li>Only the first report of a given vulnerability or solution is eligible. In the event of a duplicate submission, only the earliest received report is considered.</li>
    <li>Eligibility for payment and determination of the recipients and amounts of payments is left up to the discretion of Kalips'o Infogistics LLC.</li>
    <li>Kalips'o Infogistics LLC reserves the right to discontinue the program at any time without notice. Kalips'o Infogistics LLC further reserves the right to continue the program if we find we are able to successfully
      partner with researchers to improve security and provide valuable feedback and collaboration.</li>
    <li>A submitter may only exploit, investigate, or target vulnerabilities against their own accounts. Testing must not violate any law, or disrupt or compromise any data that is not the submitter's.</li>
  </ul>
  <uc1:UserControl_postcontent ID="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
  <uc3:UserControl_update_progress_blocker ID="UserControl_update_progress_blocker_control" runat="server"></uc3:UserControl_update_progress_blocker>
  </form>
</body>
</html>
