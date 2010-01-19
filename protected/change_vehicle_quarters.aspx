<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->
<%@ Page language="c#" Debug="true" Codebehind="change_vehicle_quarters.aspx.cs" AutoEventWireup="True" Inherits="change_vehicle_quarters.TWebForm_change_vehicle_quarters" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="uc3" TagName="UserControl_update_progress_blocker" Src="~/usercontrol/app/UserControl_update_progress_blocker.ascx" %>
<%@ Register src="../usercontrol/ki/UserControl_drop_down_datetime.ascx" tagname="UserControl_drop_down_datetime" tagprefix="uc2" %>
<html>
  <head runat="server">
    <!-- $Id: template-protected-nonlanding.aspx-template 2944 2009-10-19 20:37:52Z KevinAnLipscomb $ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
      <table cellspacing="0" cellpadding="0" border="1" bordercolor="#dcdcdc">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" border="0">
              <tr>
                <td bgcolor="#f5f5f5"><strong>Change <asp:Literal ID="Literal_vehicle_name" runat="server"></asp:Literal>'s quarters</strong></td>
              </tr>
              <tr>
                <td>
                  <p>In this system, a vehicle's <i>Quarters</i> is the place the vehicle is kept when it is <i>UP</i> but not staffed.</p>
                  <table cellspacing="0" cellpadding="10" border="0">
                    <tr>
                      <td>
                        *Change <asp:Literal ID="Literal_vehicle_name_2" runat="server"></asp:Literal>'s quarters to:
                        <table cellspacing="0" cellpadding="20" border="0"><tr><td><asp:DropDownList ID="DropDownList_quarters" runat="server"></asp:DropDownList></td></tr></table>
                      </td>
                      <td nowrap="nowrap">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_quarters" runat="server" ControlToValidate="DropDownList_quarters" ErrorMessage="Please select Quarters." Font-Bold="True">!ERR!</asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CustomValidator_quarters" runat="server" Display="Dynamic" ErrorMessage="You cannot select the unit's current Quarters." Font-Bold="True" onservervalidate="CustomValidator_quarters_ServerValidate">!ERR!</asp:CustomValidator>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        *What is the effective date and time of the change?
                        <table cellspacing="0" cellpadding="20" border="0"><tr><td><uc2:UserControl_drop_down_datetime ID="UserControl_drop_down_datetime_control" runat="server" /></td></tr></table>
                      </td>
                      <td nowrap="nowrap">
                        <asp:CustomValidator ID="CustomValidator_datetime" runat="server" Display="Dynamic" ErrorMessage="This unit's quarters history in this system has already overtaken the specified Date and Time." Font-Bold="True" onservervalidate="CustomValidator_datetime_ServerValidate">!ERR!</asp:CustomValidator>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        What was the approximate odometer reading at the time of the change?
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
                        Enter any comments that should be known about <asp:Literal ID="Literal_vehicle_name_3" runat="server"></asp:Literal>&nbsp;unit staying at the specified quarters:
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
      <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
      <uc3:UserControl_update_progress_blocker id="UserControl_update_progress_blocker_control" runat="server"></uc3:UserControl_update_progress_blocker>
    </form>
  </body>
</html>
