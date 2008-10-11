<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_agency.pas" Inherits="UserControl_agency.TWebUserControl_agency"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<table cellspacing="0" cellpadding="5" border="0">
  <tr>
	<td bgcolor="gainsboro" valign="top">Short designator:</td>
	<td valign="top">
              <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                  <td valign="middle">
                    <table cellspacing="0" cellpadding="0" border="0">
                      <tr>
                        <td>
	  <ASP:TextBox id="TextBox_short_designator" runat="server" columns="3" maxlength="3"></ASP:TextBox><ASP:Button id="Button_lookup" runat="server" causesvalidation="False" text="LOOKUP"></ASP:Button>
                        </td>
                        <td nowrap="True"><small><small><asp:Label id="Label_lookup_arrow" runat="server">&lt;--</asp:Label></small></small></td>
                        <td><small><small><em><asp:Label id="Label_lookup_hint" runat="server">Lookup by partial or full Agency short designator</asp:Label></em></small></small></td>
                      </tr>
                    </table>
                  </td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td valign="middle">
                    <small>
                      <ASP:LinkButton id="LinkButton_reset" runat="server" causesvalidation="False" enabled="False">New lookup</ASP:LinkButton>
                    </small>
                  </td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td valign="middle">
                    <small>
                      <ASP:LinkButton id="LinkButton_new_record" runat="server" causesvalidation="False" visible="False">Enter brand new Agency</ASP:LinkButton>
                    </small>
                  </td>
                </tr>
              </table>
	  <ASP:DropDownList id="DropDownList_short_designator" runat="server" visible="False" autopostback="True"></ASP:DropDownList><br>
	</td>
	<td valign="top"><ASP:RequiredFieldValidator id="RequiredFieldValidator_short_designator" runat="server" errormessage="Please enter a short designator." display="Dynamic" font-bold="True" controltovalidate="TextBox_short_designator">!ERR!</ASP:RequiredFieldValidator>
	</td>
  </tr>
  <tr>
	<td>Medium designator:</td>
	<td>
	  <ASP:TextBox id="TextBox_medium_designator" runat="server" columns="23" maxlength="23" enabled="False"></ASP:TextBox>
	</td>
	<td><ASP:RequiredFieldValidator id="RequiredFieldValidator_medium_designator" runat="server" errormessage="Please enter a medium designator." display="Dynamic" font-bold="True" controltovalidate="TextBox_medium_designator">!ERR!</ASP:RequiredFieldValidator>
	</td>
  </tr>
  <tr>
	<td>Long designator:</td>
	<td>
	  <ASP:TextBox id="TextBox_long_designator" runat="server" columns="63" maxlength="63" enabled="False"></ASP:TextBox>
	</td>
				<td><ASP:RequiredFieldValidator id="RequiredFieldValidator_long_designator" runat="server" errormessage="Please enter long designator." display="Dynamic" font-bold="True" controltovalidate="TextBox_long_designator">!ERR!</ASP:RequiredFieldValidator></td>
  </tr>
  <tr>
	<td>Be active:</td>
	<td>
	  <ASP:CheckBox id="CheckBox_be_active" runat="server" enabled="False"></ASP:CheckBox>
	</td>
	<td>
	</td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server" enabled="False"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False"></ASP:Button>
