<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_user_member_mapping.ascx.cs" Inherits="UserControl_user_member_mapping.TWebUserControl_user_member_mapping"%>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
      <tr>
        <td>
          <table cellspacing="0" cellpadding="10" border="0">
            <tr>
              <td bgcolor="#dcdcdc">
                <table cellspacing="0" cellpadding="0" border="0">
                  <tr>
                    <td>
                      <strong>Filter:</strong>
                      <asp:DropDownList id="DropDownList_filter" runat="server" autopostback="True" OnSelectedIndexChanged="DropDownList_filter_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="1">Current only</asp:ListItem>
                        <asp:ListItem Value="-1">Past only</asp:ListItem>
                        <asp:ListItem Value="0">All</asp:ListItem>
                      </asp:DropDownList>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td align="right">
                      <asp:Literal ID="Literal_num_members" runat="server"></asp:Literal> members
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
            <tr>
              <td>
                <asp:GridView id="GridView_control" runat="server" gridlines="Horizontal" cellpadding="5" allowsorting="True" emptydatatext="No mappings" bordercolor="Gainsboro" borderstyle="Solid" borderwidth="1px" autogeneratecolumns="False">
                  <RowStyle font-size="Small"></RowStyle>
                  <Columns>
                    <asp:BoundField datafield="member_id" visible="false"></asp:BoundField>
                    <asp:BoundField datafield="member_name" headertext="Member" sortexpression="member_name%">
                      <HeaderStyle horizontalalign="Left"></HeaderStyle>
                      <ItemStyle horizontalalign="Left"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField datafield="user_id" visible="false"></asp:BoundField>
                    <asp:BoundField datafield="user_name" headertext="User" sortexpression="user_name%">
                      <HeaderStyle horizontalalign="Left"></HeaderStyle>
                      <ItemStyle horizontalalign="Left"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField Visible="false">
                      <ItemTemplate>
                        <asp:ImageButton ID="ImageButton_imitate" runat="server" CommandName="Select" CommandArgument='<%# Eval("user_name") %>' ImageUrl="~/protected/image/mask-16-16.png" OnClick="ImageButton_imitate_Click"></asp:ImageButton>
                      </ItemTemplate>
                    </asp:TemplateField>
                  </Columns>
                  <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                </asp:GridView>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>
