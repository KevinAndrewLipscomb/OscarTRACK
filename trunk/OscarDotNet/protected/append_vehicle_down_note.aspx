<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->

<%@ Page Language="c#" Debug="true" CodeBehind="append_vehicle_down_note.aspx.cs" AutoEventWireup="True" Inherits="append_vehicle_down_note.TWebForm_append_vehicle_down_note" %>

<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="uc3" TagName="UserControl_update_progress_blocker" Src="~/usercontrol/app/UserControl_update_progress_blocker.ascx" %>
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
                <td bgcolor="#f5f5f5"><strong>Append a note for <asp:Literal ID="Literal_vehicle_name" runat="server"></asp:Literal>&#39;s DOWN episode</strong></td>
              </tr>
              <tr>
                <td>
                  <table cellspacing="0" cellpadding="10" border="0">
                    <tr>
                      <td>
                        Prior comments about this episode were:
                        <table cellspacing="0" cellpadding="20" border="0">
                          <tr>
                            <td>
                              <asp:TextBox ID="TextBox_prior_note" runat="server" Columns="60" Rows="4" TextMode="MultiLine" Enabled="false"></asp:TextBox>
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td nowrap="nowrap" valign="top">
                      </td>
                    </tr>
                    <tr>
                      <td>
                        Append any additional comments about this episode here:
                        <table cellspacing="0" cellpadding="20" border="0">
                          <tr>
                            <td>
                              <asp:TextBox ID="TextBox_note_to_append" runat="server" Columns="60" Rows="4" TextMode="MultiLine"></asp:TextBox>
                              <p><small>Resulting note will be truncated at 65,536 characters.</small></p>
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td nowrap="nowrap" valign="top">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_note_to_append" ErrorMessage="Please enter Additional comments." Font-Bold="True">!ERR!</asp:RequiredFieldValidator>
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
