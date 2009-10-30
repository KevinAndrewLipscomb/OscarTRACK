<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->

<%@ Page Language="c#" Debug="true" CodeBehind="mark_vehicle_down.aspx.cs" AutoEventWireup="True" Inherits="mark_vehicle_down.TWebForm_mark_vehicle_down" %>

<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="uc3" TagName="UserControl_update_progress_blocker" Src="~/usercontrol/app/UserControl_update_progress_blocker.ascx" %>
<%@ Register src="../usercontrol/ki/UserControl_drop_down_datetime.ascx" tagname="UserControl_drop_down_datetime" tagprefix="uc5" %>
<html>
  <head runat="server">
    <!-- $Id: template-protected-nonlanding.aspx-template 2660 2008-10-22 20:33:51Z kevinanlipscomb $ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>
  <body bgcolor="white">
    <form runat="server" defaultbutton="Button_submit">
      <uc1:UserControl_precontent ID="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
      <table cellspacing="0" cellpadding="0" width="100%" border="1" bordercolor="#dcdcdc">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" border="0">
              <tr>
                <td bgcolor="#f5f5f5"><strong>Mark vehicle <asp:Literal ID="Literal_vehicle_name" runat="server"></asp:Literal>&nbsp;DOWN</strong></td>
              </tr>
              <tr>
                <td>
                  <table cellspacing="0" cellpadding="10" border="0">
                    <tr>
                      <td>
                        *Approximately what date and time did the unit go down?
                        <table cellspacing="0" cellpadding="20" border="0">
                          <tr>
                            <td>
                              <uc5:UserControl_drop_down_datetime ID="UserControl_drop_down_datetime_control" runat="server" />
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td nowrap="nowrap">
                        <asp:CustomValidator ID="CustomValidator_datetime" runat="server" Display="Dynamic" ErrorMessage="This unit's history in this system has already overtaken the specified Date and Time." Font-Bold="True" onservervalidate="CustomValidator_datetime_ServerValidate">!ERR!</asp:CustomValidator>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        *The following choices are situations in which a unit might go down.&nbsp; Choose the situation that best applies.&nbsp; Severity is indicated with respect to mission impact and controllability.
                        <table cellspacing="0" cellpadding="20" border="0">
                          <tr>
                            <td valign="top"><small>MOST&nbsp;SEVERE&nbsp;>>></small></td>
                            <td rowspan="2" valign="middle">
                              <asp:RadioButtonList ID="RadioButtonList_nature" runat="server"></asp:RadioButtonList>
                            </td>
                          </tr>
                          <tr>
                            <td valign="bottom"><small>LEAST&nbsp;SEVERE&nbsp;>>></small></td>
                          </tr>
                        </table>
                      </td>
                      <td nowrap="nowrap" valign="top">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_nature" runat="server" ControlToValidate="RadioButtonList_nature" ErrorMessage="Please select a Severity." Font-Bold="True">!ERR!</asp:RequiredFieldValidator>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        What was the approximate odometer reading (whole miles only) when the unit went down?
                        <table cellspacing="0" cellpadding="20" border="0">
                          <tr>
                            <td>
                              <asp:TextBox ID="TextBox_mileage" runat="server" Columns="7" MaxLength="7"></asp:TextBox>
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td nowrap="nowrap" valign="top">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator_mileage" runat="server" ControlToValidate="TextBox_mileage" ErrorMessage="Please enter a valid Odometer reading (whole miles only)." Font-Bold="True" ValidationExpression="\d+">!ERR!</asp:RegularExpressionValidator>
                        <asp:CustomValidator ID="CustomValidator_mileage" runat="server" Display="Dynamic" ErrorMessage="This unit's mileage in this system has already overtaken the specified mileage." Font-Bold="True" onservervalidate="CustomValidator_mileage_ServerValidate">!ERR!</asp:CustomValidator>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        Enter any comments about this episode here:
                        <table cellspacing="0" cellpadding="20" border="0">
                          <tr>
                            <td>
                              <asp:TextBox ID="TextBox_note" runat="server" Columns="60" Rows="4" TextMode="MultiLine"></asp:TextBox>
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td nowrap="nowrap" valign="top">
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <asp:Button ID="Button_submit" runat="server" Text="Submit" OnClick="Button_submit_Click"></asp:Button>
                        &nbsp;
                        <asp:Button ID="Button_cancel" runat="server" Text="Cancel" CausesValidation="False" OnClick="Button_cancel_Click"></asp:Button>
                      </td>
                      <td>
                      </td>
                    </tr>
                  </table>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <uc1:UserControl_postcontent ID="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
      <uc3:UserControl_update_progress_blocker ID="UserControl_update_progress_blocker_control" runat="server"></uc3:UserControl_update_progress_blocker>
    </form>
  </body>
</html>
