<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<%@ Page Language="c#" Debug="true" CodeBehind="usability_detail.aspx.cs" AutoEventWireup="True" Inherits="usability_detail.TWebForm_usability_detail" %>

<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<html>
  <head runat="server">
    <!-- $Id: usability_detail.aspx 2817 2009-09-09 13:48:28Z KevinAnLipscomb $ -->
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
                        <strong>Usability detail for vehicle
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
                <table cellpadding="10" cellspacing="0" border="0">
                  <tr>
                    <td nowrap="nowrap">Current status:</td>
                    <td>
                      <table  id="Table_current" runat="server" cellpadding="10" cellspacing="0" border="1">
                        <tr>
                          <td>
                            <tt><asp:LinkButton ID="LinkButton_new" runat="server" OnClick="LinkButton_new_Click"></asp:LinkButton></tt>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
                <asp:DataGrid ID="DataGrid_control" runat="server" AllowSorting="True" AutoGenerateColumns="False" UseAccessibleHeader="True" CellPadding="10" GridLines="Horizontal" BorderColor="Gainsboro" BorderWidth="1px">
                  <HeaderStyle BackColor="WhiteSmoke" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></HeaderStyle>
                  <Columns>
                    <asp:BoundColumn Visible="False" DataField="id" ReadOnly="True"></asp:BoundColumn>
                    <asp:BoundColumn Visible="false" DataField="nature_id" SortExpression="nature_id%,time_went_down" ReadOnly="True"></asp:BoundColumn>
                    <asp:BoundColumn DataField="nature_name" SortExpression="nature_name%,duration" ReadOnly="True" HeaderText="Nature">
                      <ItemStyle HorizontalAlign="Center" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top" Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="time_went_down" SortExpression="time_went_down%" ReadOnly="True" HeaderText="DOWN">
                      <ItemStyle HorizontalAlign="Center" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top" Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="mileage" SortExpression="mileage%" ReadOnly="True" HeaderText="Mileage">
                      <ItemStyle HorizontalAlign="Right" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="down_comment" ReadOnly="True" HeaderText="DOWN comment">
                      <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                      <ItemStyle HorizontalAlign="Left" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:ButtonColumn Text="&lt;IMG src=&quot;~/protected/image/draw_freehand_16_h.png&quot; alt=&quot;Journal&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" CommandName="AppendNote" Visible="false">
                      <ItemStyle BackColor="LightGray" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:ButtonColumn>
                    <asp:BoundColumn DataField="time_came_up" SortExpression="time_came_up%" ReadOnly="True" HeaderText="UP">
                      <ItemStyle HorizontalAlign="Center" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top" Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="up_comment" ReadOnly="True" HeaderText="UP comment">
                      <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                      <ItemStyle HorizontalAlign="Left" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top"></ItemStyle>
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
