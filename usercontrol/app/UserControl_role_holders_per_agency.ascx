<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_role_holders_per_agency.pas" Inherits="UserControl_role_holders_per_agency.TWebUserControl_role_holders_per_agency"%>
<asp:GridView id="GridView_control" runat="server" gridlines="Horizontal" cellpadding="10" autogeneratecolumns="False" emptydatatext="No data available" bordercolor="Gainsboro" borderwidth="1px">
  <Columns>
    <asp:BoundField datafield="role_name" headertext="Role"></asp:BoundField>
    <asp:BoundField datafield="member_name" headertext="Member"></asp:BoundField>
  </Columns>
  <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
</asp:GridView>
