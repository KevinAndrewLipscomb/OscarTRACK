<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_role_member_matrix.pas" Inherits="UserControl_role_member_matrix.TWebUserControl_role_member_matrix"%>
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" border="0">
        <tr>
          <td bgcolor="#dcdcdc">
            <p><small><em>Please wait for system to refresh after each change.</em></small></p>
            <p><strong>Filter:</strong>&nbsp; <asp:DropDownList id="DropDownList_filter" runat="server" autopostback="True"></asp:DropDownList></p>
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
