<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->
<%@ Page language="c#" Debug="true" Codebehind="update_vehicle_mileage.aspx.cs" AutoEventWireup="True" Inherits="update_vehicle_mileage.TWebForm_update_vehicle_mileage" %>
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
    <form runat="server" defaultbutton="Button_submit">
      <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
      <table cellspacing="0" cellpadding="0" border="1" bordercolor="#dcdcdc">
        <tr>
          <td>
            <table cellspacing="0" cellpadding="10" border="0">
              <tr>
                <td bgcolor="#f5f5f5"><strong>Update mileage for <asp:Literal ID="Literal_vehicle_name" runat="server"></asp:Literal></strong></td>
              </tr>
              <tr>
                <td>
                  <table cellspacing="0" cellpadding="10" border="0">
                    <tr>
                      <td>
                        The last mileage entered into this system for <asp:Literal ID="Literal_vehicle_name_2" runat="server"></asp:Literal> &nbsp;was:
                        <table cellspacing="0" cellpadding="20" border="0"><tr><td><tt><b><asp:Literal ID="Literal_recent_mileage" runat="server"></asp:Literal></b></tt></td></tr></table>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        *Change <asp:Literal ID="Literal_vehicle_name_3" runat="server"></asp:Literal>'s mileage to:
                        <table cellspacing="0" cellpadding="20" border="0">
                          <tr>
                            <td>
                              <asp:TextBox ID="TextBox_nominal_mileage" runat="server" Columns="7" MaxLength="7"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<small>(Whole miles only)</small>
                            </td>
                            <td>
                              <asp:CheckBox ID="CheckBox_mileage" runat="server" Text="Force mileage backward" Visible="False" />
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td nowrap="nowrap">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_nominal_mileage" runat="server" ControlToValidate="TextBox_nominal_mileage" ErrorMessage="Please enter a nominal Odometer reading." Font-Bold="True">!ERR!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator_nominal_mileage" runat="server" ControlToValidate="TextBox_nominal_mileage" ErrorMessage="Please enter a valid nominal Odometer reading." Font-Bold="True" ValidationExpression="\d+">!ERR!</asp:RegularExpressionValidator>
                        <asp:CustomValidator ID="CustomValidator_nominal_mileage" runat="server" Display="Dynamic" ErrorMessage="This unit's mileage in this system has already overtaken the specified nominal mileage.  Check the 'Force mileage backward' checkbox to override this error." Font-Bold="True" onservervalidate="CustomValidator_nominal_mileage_ServerValidate">!ERR!</asp:CustomValidator>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        *Re-enter the new mileage to avoid typographical errors:
                        <table cellspacing="0" cellpadding="20" border="0">
                          <tr>
                            <td>
                              <asp:TextBox ID="TextBox_confirmation_mileage" runat="server" Columns="7" MaxLength="7"></asp:TextBox>
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td nowrap="nowrap">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_confirmation_mileage" runat="server" ControlToValidate="TextBox_confirmation_mileage" ErrorMessage="Please enter a confirmation Odometer reading." Font-Bold="True">!ERR!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator_confirmation_mileage" runat="server" ControlToValidate="TextBox_confirmation_mileage" ErrorMessage="Please enter a valid confirmation Odometer reading." Font-Bold="True" ValidationExpression="\d+">!ERR!</asp:RegularExpressionValidator>
                        <asp:CustomValidator ID="CustomValidator_confirmation_mileage" runat="server" Display="Dynamic" ErrorMessage="Nominal and confirmation mileages must match.  Please try again." Font-Bold="True" onservervalidate="CustomValidator_confirmation_mileage_ServerValidate">!ERR!</asp:CustomValidator>
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
