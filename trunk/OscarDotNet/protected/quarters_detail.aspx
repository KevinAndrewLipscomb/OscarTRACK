<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<%@ Page Language="c#" Debug="true" CodeBehind="quarters_detail.aspx.cs" AutoEventWireup="True" Inherits="quarters_detail.TWebForm_quarters_detail" %>

<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<html>
  <head runat="server">
    <!-- $Id: quarters_detail.aspx 2817 2009-09-09 13:48:28Z KevinAnLipscomb $ -->
  </head>
  <body bgcolor="white">
    <form runat="server">
    <uc1:UserControl_precontent ID="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
    <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
      <tr>
        <td>
          <table cellspacing="0" cellpadding="10" border="0">
            <tr>
              <td bgcolor="#f5f5f5">
                <strong>
                  <table cellspacing="0" cellpadding="5" width="100%" border="0">
                    <tr>
                      <td>
                        <strong>Quarters detail for vehicle
                          <asp:Literal ID="Literal_vehicle_name" runat="server"></asp:Literal></strong>
                      </td>
                    </tr>
                  </table>
                </strong>
              </td>
            </tr>
            <tr id="TableRow_none" runat="server">
              <td>
                <em>--&nbsp;NONE&nbsp;--</em>
              </td>
            </tr>
            <tr>
              <td>
                <asp:DataGrid ID="DataGrid_control" runat="server" AllowSorting="True" AutoGenerateColumns="False" UseAccessibleHeader="True" CellPadding="10" GridLines="Horizontal" BorderColor="Gainsboro" BorderWidth="1px">
                  <HeaderStyle BackColor="WhiteSmoke" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></HeaderStyle>
                  <Columns>
                    <asp:BoundColumn Visible="False" DataField="id" ReadOnly="True"></asp:BoundColumn>
                    <asp:BoundColumn DataField="designator" SortExpression="designator%" ReadOnly="True" HeaderText="Quarters">
                      <ItemStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" VerticalAlign="Top" Wrap="False" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="note" ReadOnly="True" HeaderText="Note">
                      <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                      <ItemStyle HorizontalAlign="Left" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="start_datetime" SortExpression="start_datetime%" ReadOnly="True" HeaderText="From">
                      <ItemStyle HorizontalAlign="Center" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top" Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="end_datetime" SortExpression="end_datetime%" ReadOnly="True" HeaderText="To">
                      <ItemStyle HorizontalAlign="Center" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top" Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="duration" ReadOnly="True" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Duration" ReadOnly="True" SortExpression="duration%">
                      <HeaderStyle HorizontalAlign="Right" />
                      <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                    </asp:BoundColumn>
                  </Columns>
                </asp:DataGrid>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <uc1:UserControl_postcontent ID="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
    </form>
  </body>
</html>
