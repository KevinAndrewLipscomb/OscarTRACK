<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_vehicle.ascx.cs" Inherits="UserControl_vehicle.TWebUserControl_vehicle"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~kicrudhelped~item.ascx-template -->
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
  <tr>
    <td bgcolor="gainsboro" valign="top"><font class="">ID:</font></td>
    <td valign="top"><font class="">
      <table cellspacing="0" cellpadding="0" width="100%" border="0">
         <tr>
           <td valign="middle">
             <table cellspacing="0" cellpadding="0" border="0">
               <tr>
                 <td>
      <ASP:TextBox id="TextBox_id" runat="server"  cssclass=""></ASP:TextBox><ASP:Button id="Button_lookup" runat="server" causesvalidation="False" text="LOOKUP" onclick="Button_lookup_Click"></ASP:Button>
                </td>
                <td nowrap="True"><small><small><asp:Label id="Label_lookup_arrow" runat="server">&lt;--</asp:Label></small></small></td>
                <td><small><small><em><asp:Label id="Label_lookup_hint" runat="server">Lookup by partial or full field value</asp:Label></em></small></small></td>
              </tr>
            </table>
          </td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <td valign="middle">
            <small>
              <ASP:LinkButton id="LinkButton_reset" runat="server" causesvalidation="False" enabled="False" onclick="LinkButton_reset_Click">New lookup</ASP:LinkButton>
            </small>
          </td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <td valign="middle">
            <small>
              <ASP:LinkButton id="LinkButton_new_record" runat="server" causesvalidation="False" visible="False" onclick="LinkButton_new_record_Click">Enter&nbsp;brand&nbsp;new&nbsp;record</ASP:LinkButton>
            </small>
          </td>
        </tr>
      </table>
      <asp:LinkButton id="LinkButton_go_to_match_first" runat="server" text="<IMG src=&quot;~/protected/image/first_track_blue16_h.png&quot; alt=&quot;First match&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; />" causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_first_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_prior" runat="server" text="<IMG src=&quot;~/protected/image/play_blue16_h-flipped.png&quot; alt=&quot;Prior match&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; />" causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_prior_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_next" runat="server" text="<IMG src=&quot;~/protected/image/play_blue16_h.png&quot; alt=&quot;Next match&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; />" causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_next_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_last" runat="server" text="<IMG src=&quot;~/protected/image/last_track_blue16_h.png&quot; alt=&quot;Last match&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; />" causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_last_Click"></asp:LinkButton>
      <ASP:DropDownList id="DropDownList_id" runat="server" visible="False" autopostback="True" onselectedindexchanged="DropDownList_id_SelectedIndexChanged"></ASP:DropDownList><br>
    </font>
    </td>
    <td nowrap="True" valign="top">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_id" runat="server" errormessage="Please enter id." font-bold="True" controltovalidate="TextBox_id">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Name:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_name" runat="server" columns="63" maxlength="63" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="True">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_name" runat="server" errormessage="Please enter Name." font-bold="True" controltovalidate="TextBox_name">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Agency:</font></td>
    <td>
      <font class="">
        <ASP:DropDownList id="DropDownList_agency" runat="server"  cssclass="" enabled="False"></ASP:DropDownList>
      </font>
    </td>
    <td nowrap="True">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_agency" runat="server" errormessage="Please select an Agency." font-bold="True" controltovalidate="DropDownList_agency">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Kind:</font></td>
    <td>
      <font class="">
        <ASP:DropDownList id="DropDownList_kind" runat="server"  cssclass="" enabled="False"></ASP:DropDownList>
      </font>
    </td>
    <td nowrap="True">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_kind" runat="server" errormessage="Please select a Kind." font-bold="True" controltovalidate="DropDownList_kind">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Bumper&nbsp;number:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_bumper_number" runat="server" columns="6" maxlength="6" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="True">
    </td>
  </tr>
  <tr>
    <td><font class="">Model&nbsp;year:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_model_year" runat="server"  cssclass="" enabled="False" MaxLength="4" Columns="4"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="True">
      <asp:RegularExpressionValidator ID="RegularExpressionValidator_model_year" runat="server" ControlToValidate="TextBox_model_year" Display="Dynamic" ErrorMessage="Please enter only numerals for the Model year." Font-Bold="True" ValidationExpression="\d{4}">!ERR!</asp:RegularExpressionValidator>
      <asp:CustomValidator ID="CustomValidator_model_year" runat="server" Display="Dynamic" ErrorMessage="Please enter a valid Model year." Font-Bold="True" onservervalidate="CustomValidator_model_year_ServerValidate">!ERR!</asp:CustomValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Chassis&nbsp;model:</font></td>
    <td>
      <font class="">
        <ASP:DropDownList id="DropDownList_chassis_model" runat="server"  cssclass="" enabled="False"></ASP:DropDownList>
      </font>
    </td>
    <td nowrap="True">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_chassis_model" runat="server" errormessage="Please select a Chassis&nbsp;model." font-bold="True" controltovalidate="DropDownList_chassis_model">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Custom&nbsp;model:</font></td>
    <td>
      <font class="">
        <ASP:DropDownList id="DropDownList_custom_model" runat="server"  cssclass="" enabled="False"></ASP:DropDownList>
      </font>
    </td>
    <td nowrap="True">
    </td>
  </tr>
  <tr>
    <td><font class="">VIN:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_vin" runat="server" columns="17" maxlength="17" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="True">
    </td>
  </tr>
  <tr>
    <td><font class="">Fuel:</font></td>
    <td>
      <font class="">
        <ASP:DropDownList id="DropDownList_fuel" runat="server"  cssclass="" enabled="False"></ASP:DropDownList>
      </font>
    </td>
    <td nowrap="True">
    </td>
  </tr>
  <tr>
    <td><font class="">License&nbsp;plate:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_license_plate" runat="server" columns="15" maxlength="15" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="True">
    </td>
  </tr>
  <tr>
    <td><font class="">Purchase&nbsp;price:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_purchase_price" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="True">
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_purchase_price" runat="server" errormessage="Please enter a valid Purchase&nbsp;price." font-bold="True" controltovalidate="TextBox_purchase_price" validationexpression="(\d*\.?\d*)|(-(\d+\.?\d*)|(\.\d*))">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Recent&nbsp;mileage:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_recent_mileage" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="True">
      <asp:RegularExpressionValidator ID="RegularExpressionValidator_recent_mileage" runat="server" ControlToValidate="TextBox_recent_mileage" ErrorMessage="Please enter a valid Recent mileage (whole miles only)." Font-Bold="True" ValidationExpression="\d+">!ERR!</asp:RegularExpressionValidator>
      <asp:CustomValidator ID="CustomValidator_recent_mileage" runat="server" Display="Dynamic" ErrorMessage="This unit's mileage in this system has already overtaken the specified Recent mileage." Font-Bold="True" onservervalidate="CustomValidator_recent_mileage_ServerValidate">!ERR!</asp:CustomValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Be&nbsp;active:</font></td>
    <td>
      <font class="">
        <ASP:CheckBox id="CheckBox_be_active" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
      </font>
    </td>
    <td nowrap="True">
    </td>
  </tr>
  <tr>
    <td><font class="">Target&nbsp;PM&nbsp;mileage:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_target_pm_mileage" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="True">
      <asp:RegularExpressionValidator ID="RegularExpressionValidator_target_pm_mileage" runat="server" ControlToValidate="TextBox_target_pm_mileage" ErrorMessage="Please enter a valid Target PM mileage (whole miles only)." Font-Bold="True" ValidationExpression="\d+">!ERR!</asp:RegularExpressionValidator>
      <asp:CustomValidator ID="CustomValidator_target_pm_mileage" runat="server" Display="Dynamic" ErrorMessage="You cannot move the Target PM mileage backwards." Font-Bold="True" onservervalidate="CustomValidator_target_pm_mileage_ServerValidate">!ERR!</asp:CustomValidator>
    </td>
  </tr>
      </table>
    </td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server" enabled="False" onclick="Button_submit_Click"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False" onclick="Button_delete_Click"></ASP:Button>

