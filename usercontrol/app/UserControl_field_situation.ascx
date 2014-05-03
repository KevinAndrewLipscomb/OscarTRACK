<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_field_situation.ascx.cs" Inherits="UserControl_field_situation.TWebUserControl_field_situation"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~kicrudhelped~item.ascx-template -->
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
  <tr>
    <td bgcolor="gainsboro" valign="top"><font class="">id:</font></td>
    <td valign="top"><font class="">
      <table cellspacing="0" cellpadding="0" border="0">
         <tr>
           <td valign="middle">
             <table cellspacing="0" cellpadding="0" border="0">
               <tr>
                 <td>
      <ASP:TextBox id="TextBox_id" runat="server"  cssclass=""></ASP:TextBox><ASP:Button id="Button_lookup" runat="server" causesvalidation="False" text="LOOKUP" onclick="Button_lookup_Click"></ASP:Button>
                </td>
                <td nowrap="nowrap"><small><small><asp:Label id="Label_lookup_arrow" runat="server">&lt;--</asp:Label></small></small></td>
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
    <td nowrap="nowrap" valign="top">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_id" runat="server" errormessage="Please enter id." font-bold="True" controltovalidate="TextBox_id">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Case&nbsp;num:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_case_num" runat="server" columns="9" maxlength="9" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_case_num" runat="server" errormessage="Please enter Case&nbsp;num." font-bold="True" controltovalidate="TextBox_case_num">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Address:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_address" runat="server" columns="72" maxlength="127" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_address" runat="server" errormessage="Please enter Address." font-bold="True" controltovalidate="TextBox_address">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Assignment:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_assignment" runat="server" columns="72" textmode="MultiLine" rows="2" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_assignment" runat="server" errormessage="Please enter Assignment." font-bold="True" controltovalidate="TextBox_assignment">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_assignment" runat="server" errormessage="Please restrict the Assignment entry to 65535 characters." font-bold="True" controltovalidate="TextBox_assignment" validationexpression="^[\s\S]{0,65535}$">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Time&nbsp;initialized:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_time_initialized" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_time_initialized" runat="server" errormessage="Please enter Time&nbsp;initialized." font-bold="True" controltovalidate="TextBox_time_initialized">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Nature:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_nature" runat="server" columns="63" maxlength="63" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Impression&nbsp;id:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_impression_id" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_impression_id" runat="server" errormessage="Please enter a valid Impression&nbsp;id." font-bold="True" controltovalidate="TextBox_impression_id" validationexpression="-?\d+">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;ambulances:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_ambulances" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_ambulances" runat="server" errormessage="Please enter Num&nbsp;ambulances." font-bold="True" controltovalidate="TextBox_num_ambulances">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_ambulances" runat="server" errormessage="Please enter a valid Num&nbsp;ambulances." font-bold="True" controltovalidate="TextBox_num_ambulances" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;zone&nbsp;cars:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_zone_cars" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_zone_cars" runat="server" errormessage="Please enter a valid Num&nbsp;zone&nbsp;cars." font-bold="True" controltovalidate="TextBox_num_zone_cars" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;squad&nbsp;trucks:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_squad_trucks" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_squad_trucks" runat="server" errormessage="Please enter a valid Num&nbsp;squad&nbsp;trucks." font-bold="True" controltovalidate="TextBox_num_squad_trucks" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;supervisors:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_supervisors" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_supervisors" runat="server" errormessage="Please enter a valid Num&nbsp;supervisors." font-bold="True" controltovalidate="TextBox_num_supervisors" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Be&nbsp;emtals:</font></td>
    <td>
      <font class="">
        <ASP:CheckBox id="CheckBox_be_emtals" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Be&nbsp;etby:</font></td>
    <td>
      <font class="">
        <ASP:CheckBox id="CheckBox_be_etby" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;holds:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_holds" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_holds" runat="server" errormessage="Please enter Num&nbsp;holds." font-bold="True" controltovalidate="TextBox_num_holds">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_holds" runat="server" errormessage="Please enter a valid Num&nbsp;holds." font-bold="True" controltovalidate="TextBox_num_holds" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;hzcs:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_hzcs" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_hzcs" runat="server" errormessage="Please enter Num&nbsp;hzcs." font-bold="True" controltovalidate="TextBox_num_hzcs">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_hzcs" runat="server" errormessage="Please enter a valid Num&nbsp;hzcs." font-bold="True" controltovalidate="TextBox_num_hzcs" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;lifeguards:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_lifeguards" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_lifeguards" runat="server" errormessage="Please enter Num&nbsp;lifeguards." font-bold="True" controltovalidate="TextBox_num_lifeguards">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_lifeguards" runat="server" errormessage="Please enter a valid Num&nbsp;lifeguards." font-bold="True" controltovalidate="TextBox_num_lifeguards" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;mci&nbsp;trucks:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_mci_trucks" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_mci_trucks" runat="server" errormessage="Please enter Num&nbsp;mci&nbsp;trucks." font-bold="True" controltovalidate="TextBox_num_mci_trucks">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_mci_trucks" runat="server" errormessage="Please enter a valid Num&nbsp;mci&nbsp;trucks." font-bold="True" controltovalidate="TextBox_num_mci_trucks" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Be&nbsp;mrt:</font></td>
    <td>
      <font class="">
        <ASP:CheckBox id="CheckBox_be_mrt" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;mrtks:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_mrtks" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_mrtks" runat="server" errormessage="Please enter Num&nbsp;mrtks." font-bold="True" controltovalidate="TextBox_num_mrtks">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_mrtks" runat="server" errormessage="Please enter a valid Num&nbsp;mrtks." font-bold="True" controltovalidate="TextBox_num_mrtks" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Be&nbsp;pio:</font></td>
    <td>
      <font class="">
        <ASP:CheckBox id="CheckBox_be_pio" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Be&nbsp;pu:</font></td>
    <td>
      <font class="">
        <ASP:CheckBox id="CheckBox_be_pu" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Be&nbsp;rescue&nbsp;area:</font></td>
    <td>
      <font class="">
        <ASP:CheckBox id="CheckBox_be_rescue_area" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;rbs:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_rbs" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_rbs" runat="server" errormessage="Please enter Num&nbsp;rbs." font-bold="True" controltovalidate="TextBox_num_rbs">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_rbs" runat="server" errormessage="Please enter a valid Num&nbsp;rbs." font-bold="True" controltovalidate="TextBox_num_rbs" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;sqs:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_sqs" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_sqs" runat="server" errormessage="Please enter Num&nbsp;sqs." font-bold="True" controltovalidate="TextBox_num_sqs">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_sqs" runat="server" errormessage="Please enter a valid Num&nbsp;sqs." font-bold="True" controltovalidate="TextBox_num_sqs" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Be&nbsp;sqtm:</font></td>
    <td>
      <font class="">
        <ASP:CheckBox id="CheckBox_be_sqtm" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;tacs:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_tacs" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_tacs" runat="server" errormessage="Please enter Num&nbsp;tacs." font-bold="True" controltovalidate="TextBox_num_tacs">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_tacs" runat="server" errormessage="Please enter a valid Num&nbsp;tacs." font-bold="True" controltovalidate="TextBox_num_tacs" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;bats:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_bats" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_bats" runat="server" errormessage="Please enter Num&nbsp;bats." font-bold="True" controltovalidate="TextBox_num_bats">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_bats" runat="server" errormessage="Please enter a valid Num&nbsp;bats." font-bold="True" controltovalidate="TextBox_num_bats" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;cars:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_cars" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_cars" runat="server" errormessage="Please enter Num&nbsp;cars." font-bold="True" controltovalidate="TextBox_num_cars">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_cars" runat="server" errormessage="Please enter a valid Num&nbsp;cars." font-bold="True" controltovalidate="TextBox_num_cars" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;engines:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_engines" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_engines" runat="server" errormessage="Please enter Num&nbsp;engines." font-bold="True" controltovalidate="TextBox_num_engines">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_engines" runat="server" errormessage="Please enter a valid Num&nbsp;engines." font-bold="True" controltovalidate="TextBox_num_engines" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;fboas:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_fboas" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_fboas" runat="server" errormessage="Please enter Num&nbsp;fboas." font-bold="True" controltovalidate="TextBox_num_fboas">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_fboas" runat="server" errormessage="Please enter a valid Num&nbsp;fboas." font-bold="True" controltovalidate="TextBox_num_fboas" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;frsqs:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_frsqs" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_frsqs" runat="server" errormessage="Please enter Num&nbsp;frsqs." font-bold="True" controltovalidate="TextBox_num_frsqs">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_frsqs" runat="server" errormessage="Please enter a valid Num&nbsp;frsqs." font-bold="True" controltovalidate="TextBox_num_frsqs" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Be&nbsp;ftby:</font></td>
    <td>
      <font class="">
        <ASP:CheckBox id="CheckBox_be_ftby" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;hazs:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_hazs" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_hazs" runat="server" errormessage="Please enter Num&nbsp;hazs." font-bold="True" controltovalidate="TextBox_num_hazs">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_hazs" runat="server" errormessage="Please enter a valid Num&nbsp;hazs." font-bold="True" controltovalidate="TextBox_num_hazs" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;ladders:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_ladders" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_ladders" runat="server" errormessage="Please enter Num&nbsp;ladders." font-bold="True" controltovalidate="TextBox_num_ladders">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_ladders" runat="server" errormessage="Please enter a valid Num&nbsp;ladders." font-bold="True" controltovalidate="TextBox_num_ladders" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Be&nbsp;mirt:</font></td>
    <td>
      <font class="">
        <ASP:CheckBox id="CheckBox_be_mirt" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;safes:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_safes" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_safes" runat="server" errormessage="Please enter Num&nbsp;safes." font-bold="True" controltovalidate="TextBox_num_safes">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_safes" runat="server" errormessage="Please enter a valid Num&nbsp;safes." font-bold="True" controltovalidate="TextBox_num_safes" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Be&nbsp;stech:</font></td>
    <td>
      <font class="">
        <ASP:CheckBox id="CheckBox_be_stech" runat="server"  cssclass="" enabled="False"></ASP:CheckBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;sups:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_sups" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_sups" runat="server" errormessage="Please enter Num&nbsp;sups." font-bold="True" controltovalidate="TextBox_num_sups">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_sups" runat="server" errormessage="Please enter a valid Num&nbsp;sups." font-bold="True" controltovalidate="TextBox_num_sups" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td><font class="">Num&nbsp;tankers:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_num_tankers" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_tankers" runat="server" errormessage="Please enter Num&nbsp;tankers." font-bold="True" controltovalidate="TextBox_num_tankers">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_tankers" runat="server" errormessage="Please enter a valid Num&nbsp;tankers." font-bold="True" controltovalidate="TextBox_num_tankers" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
      </table>
    </td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server" enabled="False" onclick="Button_submit_Click"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False" onclick="Button_delete_Click"></ASP:Button>

