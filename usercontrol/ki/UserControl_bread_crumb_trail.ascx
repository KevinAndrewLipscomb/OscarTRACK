<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_bread_crumb_trail.ascx.cs" Inherits="UserControl_bread_crumb_trail.TWebUserControl_bread_crumb_trail"%>
<ASP:DataList id="DataList_trail" runat="server" font-italic="True" showheader="False" repeatdirection="Horizontal" repeatlayout="Flow" visible="False">
  <FooterTemplate><ASP:Label id="Label_current" runat="server"></ASP:Label>
  </FooterTemplate>
  <ItemTemplate>
	<ASP:LinkButton id="LinkButton_crumb" runat="server" causesvalidation="False" text="<%# Container.DataItem %>" />
  </ItemTemplate>
  <SeparatorTemplate>
	/
  </SeparatorTemplate>
</ASP:DataList>
<p></p>
