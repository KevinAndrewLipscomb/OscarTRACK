<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_current_indicators.ascx.cs" Inherits="UserControl_current_indicators.TWebUserControl_current_indicators"%>
<table bordercolor="#dcdcdc" border="1" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" border="0" width="100%">
        <tr bgcolor="#f5f5f5"><td><h3>Personnel metrics</h3></td></tr>
        <tr>
          <td>
            <table cellspacing="0" cellpadding="0" border="0" width="100%">
              <tr>
                <td valign="top" width="50%">
                  <p><ASP:PlaceHolder id="PlaceHolder_ranked_core_ops_size" runat="server"></ASP:PlaceHolder></p>
                  <p><ASP:PlaceHolder id="PlaceHolder_ranked_crew_shifts_forecast" runat="server"></ASP:PlaceHolder></p>
                  <p><ASP:PlaceHolder id="PlaceHolder_ranked_utilization" runat="server"></ASP:PlaceHolder></p>
                  <p><ASP:PlaceHolder id="PlaceHolder_ranked_length_of_service" runat="server"></ASP:PlaceHolder></p>
                </td>
                <td>&nbsp;&nbsp;</td>
                <td valign="top" width="50%">
                  <p><ASP:PlaceHolder id="PlaceHolder_ranked_num_members_in_pipeline" runat="server"></ASP:PlaceHolder></p>
                  <p><ASP:PlaceHolder id="PlaceHolder_ranked_third_slot_saturation" runat="server"></ASP:PlaceHolder></p>
                  <p><ASP:PlaceHolder id="PlaceHolder_ranked_commensuration" runat="server"></ASP:PlaceHolder></p>
                  <p><ASP:PlaceHolder id="PlaceHolder_ranked_standard_enrollment" runat="server"></ASP:PlaceHolder></p>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
&nbsp;
<table bordercolor="#dcdcdc" border="1" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" border="0" width="100%">
        <tr bgcolor="#f5f5f5"><td><h3>Fleet metrics</h3></td></tr>
        <tr>
          <td>
            <table cellspacing="0" cellpadding="0" border="0" width="100%">
              <tr>
                <td valign="top" width="50%">
                  <p><ASP:PlaceHolder id="PlaceHolder_ranked_fleet_tracking_participation" runat="server"></ASP:PlaceHolder></p>
                </td>
                <td>&nbsp;&nbsp;</td>
                <td valign="top" width="50%">
                  &nbsp;
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
