<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_agency.pas" Inherits="UserControl_agency.TWebUserControl_agency"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<table cellspacing="0" cellpadding="5" border="0">
  <tr>
	<td valign="top">Short designator:</td>
	<td valign="top">
	  <ASP:TextBox id="TextBox_short_designator" runat="server" columns="3" maxlength="3"></ASP:TextBox>
	  &nbsp;&nbsp;&nbsp;
	  <ASP:LinkButton id="LinkButton_search" runat="server" causesvalidation="False">Lookup</ASP:LinkButton>
	  &nbsp;&nbsp;&nbsp;
	  <ASP:LinkButton id="LinkButton_reset" runat="server" causesvalidation="False">Reset</ASP:LinkButton><br>
	  <ASP:DropDownList id="DropDownList_short_designator" runat="server" visible="False" autopostback="True"></ASP:DropDownList><br>
	</td>
	<td valign="top"><ASP:RequiredFieldValidator id="RequiredFieldValidator_short_designator" runat="server" errormessage="Please enter a short designator." display="Dynamic" font-bold="True" controltovalidate="TextBox_short_designator">!ERR!</ASP:RequiredFieldValidator>
	</td>
  </tr>
  <tr>
	<td>Medium designator:</td>
	<td>
	  <ASP:TextBox id="TextBox_medium_designator" runat="server" columns="23" maxlength="23"></ASP:TextBox>
	</td>
	<td><ASP:RequiredFieldValidator id="RequiredFieldValidator_medium_designator" runat="server" errormessage="Please enter a medium designator." display="Dynamic" font-bold="True" controltovalidate="TextBox_medium_designator">!ERR!</ASP:RequiredFieldValidator>
	</td>
  </tr>
  <tr>
	<td>Long designator:</td>
	<td>
	  <ASP:TextBox id="TextBox_long_designator" runat="server" columns="63" maxlength="63"></ASP:TextBox>
	</td>
				<td><ASP:RequiredFieldValidator id="RequiredFieldValidator_long_designator" runat="server" errormessage="Please enter long designator." display="Dynamic" font-bold="True" controltovalidate="TextBox_long_designator">!ERR!</ASP:RequiredFieldValidator></td>
  </tr>
  <tr>
	<td>Be active:</td>
	<td>
	  <ASP:CheckBox id="CheckBox_be_active" runat="server"></ASP:CheckBox>
	</td>
	<td>
	</td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False"></ASP:Button>
