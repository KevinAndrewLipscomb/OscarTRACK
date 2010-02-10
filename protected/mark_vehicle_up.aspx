<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->

<%@ Page Language="c#" Debug="true" CodeBehind="mark_vehicle_up.aspx.cs" AutoEventWireup="True" Inherits="mark_vehicle_up.TWebForm_mark_vehicle_up" %>

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
      <table cellspacing="0" cellpadding="0" border="1" bordercolor="#dcdcdc">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" border="0">
              <tr>
                <td bgcolor="#f5f5f5"><strong>Mark vehicle <asp:Literal ID="Literal_vehicle_name" runat="server"></asp:Literal>&nbsp;UP</strong></td>
              </tr>
              <tr>
                <td>
                  <table cellspacing="0" cellpadding="10" border="0">
                    <tr>
                      <td>
                        *Approximately what date and time did the unit come up?
                        <table cellspacing="0" cellpadding="20" border="0">
                          <tr>
                            <td>
                              <uc5:UserControl_drop_down_datetime ID="UserControl_drop_down_datetime_control" runat="server" />
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td nowrap="nowrap">
                        <asp:CustomValidator ID="CustomValidator_date" runat="server" ErrorMessage="Please enter a valid Date." Font-Bold="True" onservervalidate="CustomValidator_date_ServerValidate">!ERR!</asp:CustomValidator>
                        <asp:CustomValidator ID="CustomValidator_datetime" runat="server" Display="Dynamic" ErrorMessage="This unit's history in this system has already overtaken the specified Date and Time." Font-Bold="True" onservervalidate="CustomValidator_datetime_ServerValidate">!ERR!</asp:CustomValidator>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        If the unit received PM during this downtime, what is the new target PM mileage?
                        <table cellspacing="0" cellpadding="20" border="0">
                          <tr>
                            <td>
                              <asp:TextBox ID="TextBox_target_pm_mileage" runat="server" Columns="7" MaxLength="7"></asp:TextBox>
                            </td>
                            <td>
                              <asp:CheckBox ID="CheckBox_target_pm_mileage" runat="server" Text="Force target PM mileage backward" Visible="False" />
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td nowrap="nowrap" valign="top">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator_target_pm_mileage" runat="server" ControlToValidate="TextBox_target_pm_mileage" ErrorMessage="Please enter a valid Target PM mileage (whole miles only)." Font-Bold="True" ValidationExpression="\d+">!ERR!</asp:RegularExpressionValidator>
                        <asp:CustomValidator ID="CustomValidator_target_pm_mileage" runat="server" Display="Dynamic" ErrorMessage="You should not normally move the Target PM mileage backwards.  Check the 'Force target PM mileage backward' checkbox to override this error." Font-Bold="True" onservervalidate="CustomValidator_target_pm_mileage_ServerValidate">!ERR!</asp:CustomValidator>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        Comments for this episode's downtime were:
                        <table cellspacing="0" cellpadding="20" border="0">
                          <tr>
                            <td>
                              <asp:TextBox ID="TextBox_prior_note" runat="server" Columns="60" Rows="10" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td nowrap="nowrap" valign="top">
                      </td>
                    </tr>
                    <tr>
                      <td>
                        Enter any comments to associate with the unit coming back up:
                        <table cellspacing="0" cellpadding="20" border="0">
                          <tr>
                            <td>
                              <asp:TextBox ID="TextBox_note_to_append" runat="server" Columns="60" Rows="4" TextMode="MultiLine"></asp:TextBox>
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
