<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_vehicle.ascx.cs" Inherits="UserControl_vehicle.TWebUserControl_vehicle"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~kicrudhelped~item.ascx-template -->
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
  <tr runat="server" id="TableRow_record_navigation_controls">
    <td bgcolor="gainsboro" valign="top"><font class="">ID:</font></td>
    <td></td>
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
    <td></td>
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
    <td></td>
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
    <td></td>
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
    <td></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_bumper_number" runat="server" columns="6" maxlength="6" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="True">
      <asp:CustomValidator ID="CustomValidator_bumper_number" runat="server" ControlToValidate="TextBox_bumper_number" ErrorMessage="The specified Bumper number already belongs to vehicle " Font-Bold="True" onservervalidate="CustomValidator_bumper_number_ServerValidate">!ERR!</asp:CustomValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Model&nbsp;year:</font></td>
    <td></td>
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
    <td></td>
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
    <td></td>
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
    <td></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_vin" runat="server" columns="17" maxlength="17" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="True">
      <asp:CustomValidator ID="CustomValidator_vin" runat="server" ControlToValidate="TextBox_vin" ErrorMessage="The specified VIN already belongs to vehicle " Font-Bold="True" onservervalidate="CustomValidator_vin_ServerValidate">!ERR!</asp:CustomValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Fuel:</font></td>
    <td></td>
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
    <td></td>
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
    <td></td>
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
    <td><font class="">Be&nbsp;active:</font></td>
    <td></td>
    <td>
      <font class="">
        <ASP:CheckBox id="CheckBox_be_active" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
      </font>
    </td>
    <td nowrap="True">
    </td>
  </tr>
  <tr>
    <td><font class="">Usability:</font></td>
    <td><ASP:LinkButton id="LinkButton_usability" runat="server" onclick="LinkButton_usability_Click"><IMG src="~/protected/image/open_document16_h.png" alt="Detail" border="0" height="16" width="16" /></ASP:LinkButton></td>
    <td>
      <table  id="Table_usability" runat="server" cellpadding="10" cellspacing="0" border="1">
        <tr>
          <td>
            <tt><asp:Literal ID="Literal_usability" runat="server"></asp:Literal></tt>
          </td>
        </tr>
      </table>
    </td>
    <td nowrap="True"></td>
  </tr>
  <tr>
    <td><font class="">Quarters:</font></td>
    <td><ASP:LinkButton id="LinkButton_quarters" runat="server" onclick="LinkButton_quarters_Click"><IMG src="~/protected/image/open_document16_h.png" alt="Detail" border="0" height="16" width="16" /></ASP:LinkButton></td>
    <td>
      <font class="">
        <asp:Literal ID="Literal_quarters" runat="server"></asp:Literal>
      </font>
    </td>
    <td nowrap="True"></td>
  </tr>
  <tr>
    <td><font class="">Recent&nbsp;mileage:</font></td>
    <td><ASP:LinkButton id="LinkButton_update_vehicle_mileage" runat="server" onclick="LinkButton_update_vehicle_mileage_Click"><IMG src="~/protected/image/draw_freehand_16_h.png" alt="Edit" border="0" height="16" width="16" /></ASP:LinkButton></td>
    <td>
      <font class="">
        <ASP:Literal id="Literal_recent_mileage" runat="server"></ASP:Literal> (updated <asp:Literal ID="Literal_recent_mileage_update_time" runat="server"></asp:Literal>)
      </font>
    </td>
    <td nowrap="True"></td>
  </tr>
  <tr>
    <td><font class="">Target&nbsp;PM&nbsp;mileage:</font></td>
    <td></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_target_pm_mileage" runat="server"  cssclass="" enabled="False"></ASP:TextBox>&nbsp;<asp:CheckBox ID="CheckBox_target_pm_mileage" runat="server" Text="Force target PM mileage backward" Visible="False" />
      </font>
    </td>
    <td nowrap="True">
      <asp:RegularExpressionValidator ID="RegularExpressionValidator_target_pm_mileage" runat="server" ControlToValidate="TextBox_target_pm_mileage" ErrorMessage="Please enter a valid Target PM mileage (whole miles only)." Font-Bold="True" ValidationExpression="\d+">!ERR!</asp:RegularExpressionValidator>
      <asp:CustomValidator ID="CustomValidator_target_pm_mileage" runat="server" Display="Dynamic" ErrorMessage="You should not normally move the Target PM mileage backwards.  Check the 'Force target PM mileage backward' checkbox to override this error." Font-Bold="True" onservervalidate="CustomValidator_target_pm_mileage_ServerValidate">!ERR!</asp:CustomValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">DMV&nbsp;inspection&nbsp;due:</font></td>
    <td></td>
    <td>
      <font class="">
        <uc1:UserControl_drop_down_date id="UserControl_drop_down_date_dmv_inspection_due" runat="server"  cssclass="" enabled="False"></uc1:UserControl_drop_down_date><small>(Day of month will be disregarded and forced to end of month)</small>
      </font>
    </td>
    <td nowrap="True">
      <asp:CustomValidator ID="CustomValidator_dmv_inspection_due" runat="server" Display="Dynamic" ErrorMessage="You cannot move the DMV inspection due date backwards." Font-Bold="True" onservervalidate="CustomValidator_dmv_inspection_due_ServerValidate">!ERR!</asp:CustomValidator>
    </td>
  </tr>
      </table>
    </td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server" enabled="False" onclick="Button_submit_Click"></ASP:Button>&nbsp;&nbsp;
<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False" onclick="Button_delete_Click"></ASP:Button>&nbsp;&nbsp;
<ASP:Button id="Button_cancel" text="Cancel" runat="server" enabled="True" onclick="Button_cancel_Click"></ASP:Button>