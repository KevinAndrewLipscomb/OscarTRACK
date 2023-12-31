<!DOCTYPE html>
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->
<%@ Page language="c#" codebehind="adjust_length_of_service.aspx.cs" AutoEventWireup="True" Inherits="adjust_length_of_service.TWebForm_adjust_length_of_service" %>
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
                  <p>Leave/reduction history:</p>
                  <blockquote>
                    <table>
					            <tr id="TableRow_no_leave_history" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
                      <tr>
                        <td>
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
                        </td>
                      </tr>
                    </table>
                  </blockquote>
                  <p>Member status history:</p>
                  <blockquote>
                    <table>
					            <tr id="TableRow_no_member_status_history" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
                      <tr>
                        <td>
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
                        </td>
                      </tr>
                    </table>
                  </blockquote>
                  <p>Effective start date currently set to:</p>
                  <blockquote><asp:Literal ID="Literal_equivalent_los_start_date" runat="server"></asp:Literal></blockquote>
                  <p>Current years-of-service value:</p>
                  <blockquote><ASP:Literal id="Literal_base_years_of_service" runat="server"></ASP:Literal></blockquote>
                  <p>Adjustment:</p>
                  <blockquote>
                    <asp:UpdatePanel ID="UpdatePanel_control" runat="server" UpdateMode="Conditional">
                      <ContentTemplate>
                        <table cellspacing="0" cellpadding="5" border="0">
                          <tr>
                            <td align="right" nowrap="nowrap">Time to subtract:</td>
                            <td>
                              <asp:DropDownList ID="DropDownList_years_to_subtract" runat="server" onselectedindexchanged="DropDownList_years_to_subtract_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                              years
                              <asp:DropDownList ID="DropDownList_months_to_subtract" runat="server" onselectedindexchanged="DropDownList_months_to_subtract_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                              months
                              <asp:DropDownList ID="DropDownList_days_to_subtract" runat="server" onselectedindexchanged="DropDownList_days_to_subtract_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                              days
                            </td>
                            <td></td>
                          </tr>
                          <tr>
                            <td align="right" nowrap="nowrap" valign="top">Adjusted years-of-service value:</td>
                            <td><asp:Literal ID="Literal_adjusted_length_of_service" runat="server"></asp:Literal></td>
                            <td valign="top">&nbsp;</td>
                          </tr>
                          <tr>
                            <td align="right" nowrap="nowrap" valign="top">Rationale:</td>
                            <td><asp:TextBox ID="TextBox_rationale" runat="server" Columns="60" Rows="4" TextMode="MultiLine"></asp:TextBox></td>
                            <td valign="top">
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator_rationale" runat="server" ControlToValidate="TextBox_rationale" ErrorMessage="Please enter a Rationale." Font-Bold="True">&lt;ERR!</asp:RequiredFieldValidator>
                            </td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td style="font-style: italic">
                              Please give <asp:Literal ID="Literal_member_first_name" runat="server"></asp:Literal> advance notice before submitting this change to
                              <asp:Literal ID="Literal_application_name" runat="server"></asp:Literal>, and take the time to address <asp:Literal ID="Literal_member_first_name_2" runat="server"></asp:Literal>'s concerns, if
                              any.&nbsp; The departmental EMS Duty Policy is not without ambiguities, making it subject to interpretation.&nbsp; The use of this form should be the <u>last</u> step in adjusting a member's
                              length-of-service value, not the first.&nbsp; Reversal of this change, if required, will require the intervention of the Application Administrator.&nbsp;
                              <asp:Literal ID="Literal_application_name_2" runat="server"></asp:Literal> will notify all stakeholders when you submit this change.
                            </td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>
                            </td>
                            <td>
                              <asp:Button ID="Button_submit" runat="server" OnClick="Button_submit_Click" Text="Submit" />
                              &nbsp;<asp:Button ID="Button_cancel" runat="server" CausesValidation="False" OnClick="Button_cancel_Click" Text="Cancel" />
                            </td>
                            <td>
                            </td>
                          </tr>
                        </table>
                      </ContentTemplate>
                    </asp:UpdatePanel>
                  </blockquote>
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
