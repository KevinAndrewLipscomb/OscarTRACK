<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_gripe.ascx.cs" Inherits="UserControl_gripe.TWebUserControl_gripe"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~kicrudhelped~item.ascx-template -->
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="5" border="0">
  <tr>
    <td bgcolor="gainsboro" valign="top"><font class="">Gripe #:</font></td>
    <td valign="top"><font class="">
      <table cellspacing="0" cellpadding="0" border="0">
         <tr>
           <td valign="middle">
             <table cellspacing="0" cellpadding="0" border="0">
               <tr>
                 <td>
      <ASP:TextBox id="TextBox_id" runat="server"  cssclass="" Enabled="false"></ASP:TextBox><ASP:Button id="Button_lookup" runat="server" causesvalidation="False" text="LOOKUP" onclick="Button_lookup_Click" Visible="false"></ASP:Button>
                </td>
                <td nowrap="True"><small><small><asp:Label id="Label_lookup_arrow" runat="server" Visible="False">&lt;--</asp:Label></small></small></td>
                <td><small><small><em><asp:Label id="Label_lookup_hint" runat="server" Visible="false">Lookup by partial or full gripe or gripe #</asp:Label></em></small></small></td>
              </tr>
            </table>
          </td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <td valign="middle">
            <small>
              <ASP:LinkButton id="LinkButton_reset" runat="server" causesvalidation="False" enabled="False" onclick="LinkButton_reset_Click" Visible="false">New lookup</ASP:LinkButton>
            </small>
          </td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <td valign="middle">
            <small>
              <ASP:LinkButton id="LinkButton_new_record" runat="server" causesvalidation="False" visible="False" onclick="LinkButton_new_record_Click">Enter&nbsp;brand&nbsp;new&nbsp;gripe</ASP:LinkButton>
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
    <td><font class="">Vehicle&nbsp;name:</font></td>
    <td>
      <font class="">
        <ASP:TextBox id="TextBox_vehicle_name" runat="server"  cssclass="" enabled="False"></ASP:TextBox>
      </font>
    </td>
    <td nowrap="True">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_vehicle_id" runat="server" errormessage="Please enter Vehicle&nbsp;id." font-bold="True" controltovalidate="TextBox_vehicle_name">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td valign="top">
      <asp:Label ID="Label_prior_entry" runat="server" Text="Prior entry:" Enabled="False"></asp:Label>
    </td>
    <td>
      <font class="">
        <asp:Panel ID="Panel_prior_entry" runat="server" Enabled="False">
          <ASP:TextBox id="TextBox_description" runat="server" columns="72" maxlength="0" textmode="MultiLine" rows="12" cssclass="" ReadOnly="True" BackColor="Gainsboro"></ASP:TextBox><br />
          <small>The "<small><tt>==v== AUTHOR NAME TIMESTAMP</tt></small>" indicator is inserted by <asp:Literal ID="Literal_application_name" runat="server"></asp:Literal>.</small>
        </asp:Panel>
      </font>
    </td>
    <td nowrap="True"></td>
  </tr>
  <tr>
    <td valign="top"><font class="">New/additional entry:</font></td>
    <td>
      <font class="">
        <small>Please be positive, professional, precise, and concise.&nbsp; Your comments may be displayed on a future shop work order.</small><br />
        <asp:TextBox ID="TextBox_note_to_append" runat="server" Columns="72" Rows="6" TextMode="MultiLine"></asp:TextBox><br />
        <small>Resulting note will be truncated at 16,777,215 characters.</small>
      </font>
    </td>
    <td nowrap="True" valign="top">
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_note_to_append" runat="server" errormessage="Please enter New/additional entry." font-bold="True" controltovalidate="TextBox_note_to_append">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
      </table>
    </td>
  </tr>
</table>
<ASP:Button id="Button_submit" text="Submit" runat="server" enabled="False" onclick="Button_submit_Click"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False" onclick="Button_delete_Click" CausesValidation="False"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_cancel" text="Cancel" runat="server" onclick="Button_cancel_Click" CausesValidation="False"></ASP:Button>

