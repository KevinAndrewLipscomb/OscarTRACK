<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_cad_record.ascx.cs" Inherits="UserControl_cad_record.TWebUserControl_cad_record"%>
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
    <td><font class="">Incident&nbsp;date:</font></td>
    <td>
      <font class="">
        <uc1:UserControl_drop_down_date id="UserControl_drop_down_date_incident_date" runat="server"  cssclass=""></uc1:UserControl_drop_down_date>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Incident&nbsp;num:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_incident_num" runat="server" columns="9" maxlength="9" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Incident&nbsp;address:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_incident_address" runat="server" columns="72" maxlength="127" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Call&nbsp;sign:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_call_sign" runat="server" columns="31" maxlength="31" cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
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
    </td>
  </tr>
  <tr>
    <td><font class="">Time&nbsp;of&nbsp;alarm:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_time_of_alarm" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Time&nbsp;enroute:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_time_enroute" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Time&nbsp;on&nbsp;scene:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_time_on_scene" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Time&nbsp;transporting:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_time_transporting" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Time&nbsp;at&nbsp;hospital:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_time_at_hospital" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Time&nbsp;available:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_time_available" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
  <tr>
    <td><font class="">Time&nbsp;downloaded:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_time_downloaded" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="nowrap">
    </td>
  </tr>
      </table>
    </td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server" enabled="False" onclick="Button_submit_Click"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False" onclick="Button_delete_Click"></ASP:Button>

