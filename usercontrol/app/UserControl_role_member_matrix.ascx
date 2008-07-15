<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_role_member_matrix.pas" Inherits="UserControl_role_member_matrix.TWebUserControl_role_member_matrix"%>
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" border="0">
        <tr>
          <td bgcolor="#dcdcdc">
            <p><small><em>Please wait for system to refresh after each change.
</em></small></p>
            <table cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td><b><small>Filters:
</small></b></td>
                <td><p align="center"><small>Roles in Tier
</small><br><ASP:DropDownList id="DropDownList_tier_filter" runat="server" autopostback="True"></ASP:DropDownList></td>
                <td><p align="center"><small>Members in Agency
</small><br><ASP:DropDownList id="DropDownList_agency_filter" runat="server" autopostback="True"></ASP:DropDownList></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <asp:GridView id="GridView_control" runat="server" gridlines="Horizontal" cellpadding="10" allowsorting="True" emptydatatext="No data available">
              <HeaderStyle backcolor="WhiteSmoke" font-size="X-Small"></HeaderStyle>
            </asp:GridView>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
