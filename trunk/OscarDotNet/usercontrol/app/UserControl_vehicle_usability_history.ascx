<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_vehicle_usability_history.ascx.cs" Inherits="UserControl_vehicle_usability_history.TWebUserControl_vehicle_usability_history"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~kicrudhelped~item.ascx-template -->
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
  <tr>
    <td bgcolor="gainsboro" valign="top"><font class="">id:</font></td>
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
      <table>
        <tr>
          <td><asp:Panel ID="Panel_match_numbers" runat="server" Visible="False"><small>(<asp:Literal ID="Literal_match_index" runat="server"></asp:Literal>/<asp:Literal ID="Literal_num_matches" runat="server"></asp:Literal>)</small></asp:Panel></td>
          <td>
            <asp:LinkButton id="LinkButton_go_to_match_first" runat="server" text="<IMG src=&quot;~/protected/image/first_track_blue16_h.png&quot; alt=&quot;First match&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; />" causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_first_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_prior" runat="server" text="<IMG src=&quot;~/protected/image/play_blue16_h-flipped.png&quot; alt=&quot;Prior match&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; />" causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_prior_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_next" runat="server" text="<IMG src=&quot;~/protected/image/play_blue16_h.png&quot; alt=&quot;Next match&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; />" causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_next_Click"></asp:LinkButton><asp:LinkButton id="LinkButton_go_to_match_last" runat="server" text="<IMG src=&quot;~/protected/image/last_track_blue16_h.png&quot; alt=&quot;Last match&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; />" causesvalidation="False" visible="False" onclick="LinkButton_go_to_match_last_Click"></asp:LinkButton>
          </td>
          <td>
            <div style="width:0px;white-space:nowrap;"><ASP:DropDownList id="DropDownList_id" runat="server" visible="False" autopostback="True" onselectedindexchanged="DropDownList_id_SelectedIndexChanged"></ASP:DropDownList></div>
          </td>
        </tr>
      </table>
    </font>
    </td>
    <td nowrap="True" valign="top">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_id" runat="server" errormessage="Please enter id." font-bold="True" controltovalidate="TextBox_id">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Vehicle&nbsp;id:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_vehicle_id" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="True">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_vehicle_id" runat="server" errormessage="Please enter Vehicle&nbsp;id." font-bold="True" controltovalidate="TextBox_vehicle_id">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_vehicle_id" runat="server" errormessage="Please enter a valid Vehicle&nbsp;id." font-bold="True" controltovalidate="TextBox_vehicle_id" validationexpression="-?\d+">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Time&nbsp;went&nbsp;down:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_time_went_down" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="True">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_time_went_down" runat="server" errormessage="Please enter Time&nbsp;went&nbsp;down." font-bold="True" controltovalidate="TextBox_time_went_down">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Nature&nbsp;id:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_nature_id" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="True">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_nature_id" runat="server" errormessage="Please enter Nature&nbsp;id." font-bold="True" controltovalidate="TextBox_nature_id">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_nature_id" runat="server" errormessage="Please enter a valid Nature&nbsp;id." font-bold="True" controltovalidate="TextBox_nature_id" validationexpression="-?\d+">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Mileage:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_mileage" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="True">
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_mileage" runat="server" errormessage="Please enter a valid Mileage." font-bold="True" controltovalidate="TextBox_mileage" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Time&nbsp;came&nbsp;up:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_time_came_up" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="True">
    </td>
  </tr>
  <tr>
    <td><font class="">Note:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_note" runat="server" columns="0" maxlength="0" textmode="MultiLine" rows="2" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="True">
    </td>
  </tr>
      </table>
    </td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server" enabled="False" onclick="Button_submit_Click"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False" onclick="Button_delete_Click"></ASP:Button>

