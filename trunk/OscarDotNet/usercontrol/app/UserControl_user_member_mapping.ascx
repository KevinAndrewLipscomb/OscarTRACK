<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_user_member_mapping.ascx.cs" Inherits="UserControl_user_member_mapping.TWebUserControl_user_member_mapping"%>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<table cellspacing="0" cellpadding="10" border="0">
  <tr>
    <td valign="top">
      <asp:GridView id="GridView_control" runat="server" gridlines="Horizontal" cellpadding="5" allowsorting="True" emptydatatext="No mappings" bordercolor="Gainsboro" borderstyle="Solid" borderwidth="1px" autogeneratecolumns="False">
        <RowStyle font-size="Small"></RowStyle>
        <Columns>
          <asp:BoundField datafield="user_id"></asp:BoundField>
          <asp:BoundField datafield="user_name" headertext="User" sortexpression="user_name">
            <HeaderStyle horizontalalign="Left"></HeaderStyle>
            <ItemStyle horizontalalign="Left"></ItemStyle>
          </asp:BoundField>
          <asp:BoundField datafield="member_name" headertext="Member" sortexpression="member_name">
            <HeaderStyle horizontalalign="Left"></HeaderStyle>
            <ItemStyle horizontalalign="Left"></ItemStyle>
          </asp:BoundField>
          <asp:BoundField datafield="member_id"></asp:BoundField>
        </Columns>
        <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
      </asp:GridView>
    </td>
  </tr>
</table>
