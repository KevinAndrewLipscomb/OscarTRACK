<!DOCTYPE HTML>
<%@ Page language="c#" Debug="true" Codebehind="add_vehicle.aspx.cs" AutoEventWireup="True" Inherits="add_vehicle.TWebForm_add_vehicle" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register src="../usercontrol/app/UserControl_vehicle.ascx" tagname="UserControl_vehicle" tagprefix="uc2" %>
<html>
  <head runat="server" />
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
          <tr>
            <td>
              <table cellspacing="0" cellpadding="10" width="100%" border="0">
                <tr><td bgcolor="#f5f5f5"><strong>Add vehicle</strong></td></tr>
                <tr>
                  <td>
                    <uc2:UserControl_vehicle ID="UserControl_vehicle_control" runat="server" />
                  </td>
                </tr>
              </table>
            </td>
        </tr>
      </table>
      <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
    </form>
  </body>
</html>
