<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_efficipay_teaser.ascx.cs" Inherits="UserControl_efficipay_teaser.TWebUserControl_efficipay_teaser"%>
<%@ Register src="../ki/UserControl_efficipay_intro_basic_concept.ascx" tagname="UserControl_efficipay_intro_basic_concept" tagprefix="uc1" %>
<%@ Register src="../ki/UserControl_efficipay_intro_signatures.ascx" tagname="UserControl_efficipay_intro_signatures" tagprefix="uc2" %>
<%@ Register Src="../ki/UserControl_efficipay_intro_slogan.ascx" TagPrefix="uc1" TagName="UserControl_efficipay_intro_slogan" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table cellpadding="10" width="100%" style="background:url(https://frompaper2web.com/EfficiPay/image/097-4-a.png); background-size:cover; background-position:bottom;">
  <tr><td align="center" valign="middle"><uc1:UserControl_efficipay_intro_slogan runat="server" id="UserControl_efficipay_intro_slogan" /></td></tr>
</table>
<br />
<br />
<uc1:UserControl_efficipay_intro_basic_concept ID="UserControl_efficipay_intro_basic_concept_control" runat="server" />
<uc2:UserControl_efficipay_intro_signatures ID="UserControl_efficipay_intro_signatures_control" runat="server" />
<p align="center">If you are not currently privileged to use all the features of this module, and you'd like to be, please contact your Squad President.</p>
<p align="center">This module is also available as a standalone product.</p>
