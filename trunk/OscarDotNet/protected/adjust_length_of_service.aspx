<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->
<%@ Page language="c#" Debug="true" Codebehind="adjust_length_of_service.aspx.cs" AutoEventWireup="True" Inherits="adjust_length_of_service.TWebForm_adjust_length_of_service" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="uc3" TagName="UserControl_update_progress_blocker" Src="~/usercontrol/app/UserControl_update_progress_blocker.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register src="../usercontrol/ki/UserControl_drop_down_date.ascx" tagname="UserControl_drop_down_date" tagprefix="uc2" %>
<html>
  <head runat="server">
    <title></title>
    <!-- $Id$ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
      <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" width="100%" border="0">
              <tr><td bgcolor="#f5f5f5"><strong>Adjust <asp:Label ID="Label_member_name" runat="server"></asp:Label>'s length of service</strong></td></tr>
              <tr>
                <td>
                  <p>Leave history (for reference only):</p>
                  <blockquote>
                    <table>
					            <tr id="TableRow_no_leave_history" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
                      <tr>
                        <asp:DataGrid ID="DataGrid_leaves" runat="server" AutoGenerateColumns="False" UseAccessibleHeader="True" CellPadding="5" GridLines="Horizontal" BorderColor="Gainsboro" BorderWidth="1px" onitemdatabound="DataGrid_leaves_ItemDataBound">
                          <HeaderStyle BackColor="WhiteSmoke"></HeaderStyle>
                          <Columns>
                            <asp:BoundColumn DataField="start_date" SortExpression="start_date%" ReadOnly="True" HeaderText="Start month">
                              <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="end_date" SortExpression="end_date%" ReadOnly="True" HeaderText="End month">
                              <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="kind_of_leave" SortExpression="kind_of_leave%,start_date%" ReadOnly="True" HeaderText="Kind">
                              <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="num_obliged_shifts" SortExpression="num_obliged_shifts%,start_date%" ReadOnly="True" HeaderText="Num shifts">
                              <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="note" SortExpression="note%" ReadOnly="True" HeaderText="Note" Visible="false">
                              <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                              <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundColumn>
                          </Columns>
                        </asp:DataGrid>
                      </tr>
                    </table>
                  </blockquote>
                  <p>Member status history (for reference only):</p>
                  <blockquote>
                    <table>
					            <tr id="TableRow_no_member_status_history" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
                      <tr>
                        <asp:DataGrid ID="DataGrid_member_history" runat="server" AutoGenerateColumns="False" UseAccessibleHeader="True" CellPadding="5" GridLines="Horizontal" BorderColor="Gainsboro" BorderWidth="1px" onitemdatabound="DataGrid_member_history_ItemDataBound">
                          <HeaderStyle BackColor="WhiteSmoke"></HeaderStyle>
                          <Columns>
                            <asp:BoundColumn DataField="start_date" SortExpression="start_date" ReadOnly="True" HeaderText="Date (yyyy-mm-dd)">
                              <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="description" SortExpression="description" ReadOnly="True" HeaderText="Level">
                              <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="note" SortExpression="note%" ReadOnly="True" HeaderText="Note" Visible="false">
                              <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                              <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundColumn>
                          </Columns>
                        </asp:DataGrid>
                      </tr>
                    </table>
                  </blockquote>
                  Base length-of-service calculation:
                  <blockquote><ASP:Literal id="Literal_years_of_service" runat="server"></ASP:Literal></blockquote>
                  <table cellspacing="0" cellpadding="5" border="0">
                    <tr>
                      <td align="right">Time to subtract:</td>
                      <td>
                        <asp:TextBox ID="TextBox_years_to_subtract" runat="server" Columns="2" MaxLength="2"></asp:TextBox>
                        <cc1:NumericUpDownExtender TargetControlID="TextBox_years_to_subtract" runat="server" ID="NumericUpDownExtender_years_to_subtract" Minimum="0" Maximum="99" Width="100"></cc1:NumericUpDownExtender>
                        years,
                        <asp:TextBox ID="TextBox_months_to_subtract" runat="server" Columns="2" MaxLength="2"></asp:TextBox>
                        <cc1:NumericUpDownExtender TargetControlID="TextBox_months_to_subtract" runat="server" ID="NumericUpDownExtender_months_to_subtract" Minimum="0" Maximum="12" Width="100"></cc1:NumericUpDownExtender>
                        months,
                        <asp:TextBox ID="TextBox_days_to_subtract" runat="server" Columns="2" MaxLength="2"></asp:TextBox>
                        <cc1:NumericUpDownExtender TargetControlID="TextBox_days_to_subtract" runat="server" ID="NumericUpDownExtender_days_to_subtract" Minimum="0" Maximum="31" Width="100"></cc1:NumericUpDownExtender>
                        days
                      </td>
                      <td>
                        <asp:CustomValidator ID="CustomValidator_time_to_subtract" runat="server" ErrorMessage="Please enter a valid Time to subtract." Font-Bold="True" onservervalidate="CustomValidator_time_to_subtract_ServerValidate">&lt;ERR!</asp:CustomValidator>
                      </td>
                    </tr>
                    <tr>
                      <td></td>
                      <td>
                        <asp:Button ID="Button_submit" runat="server" Text="Submit" OnClick="Button_submit_Click"></asp:Button>&nbsp;<asp:Button ID="Button_cancel" runat="server" Text="Cancel" CausesValidation="False" OnClick="Button_cancel_Click"></asp:Button>
                      </td>
                      <td></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
      <uc3:UserControl_update_progress_blocker id="UserControl_update_progress_blocker_control" runat="server"></uc3:UserControl_update_progress_blocker>
    </form>
  </body>
</html>
