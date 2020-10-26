<!DOCTYPE html>
<%@ Page language="c#" codebehind="member_detail.aspx.cs" AutoEventWireup="True" Inherits="member_detail.TWebForm_member_detail" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register Src="~/usercontrol/app/UserControl_role_member_map_log.ascx" TagPrefix="uc1" TagName="UserControl_role_member_map_log" %>

<html>
  <head runat="server">
    <title></title>
  </head>
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
          <tr>
            <td>
              <table cellspacing="0" cellpadding="10" width="100%" border="0">
                <tr>
                  <td bgcolor="#f5f5f5">
                    <table width="100%">
                      <tr>
                        <td><strong>Member detail record</strong></td>
                        <td align="right"><small><asp:LinkButton ID="LinkButton_schedule_detail" runat="server" Visible="false" OnClick="LinkButton_schedule_detail_Click">(schedule detail)</asp:LinkButton></small></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td>
                    <table cellspacing="0" cellpadding="10" width="100%" border="0">
                      <tr>
                        <td>Name:</td>
                        <td><ASP:LinkButton id="LinkButton_change_name" runat="server" visible="False" onclick="LinkButton_change_name_Click"><img src="~/protected/image/draw_freehand_16_h.png" alt="Edit" border="0" height="16" width="16" /></ASP:LinkButton></td>
                        <td><ASP:Label id="Label_member_designator" runat="server" font-bold="True"></ASP:Label></td>
                      </tr>
                      <tr>
                        <td>CAD #:</td>
                        <td><ASP:LinkButton id="LinkButton_change_cad_num" runat="server" visible="False" onclick="LinkButton_change_cad_num_Click"><img src="~/protected/image/draw_freehand_16_h.png" alt="Edit" border="0" height="16" width="16" /></ASP:LinkButton></td>
                        <td><ASP:Label id="Label_cad_num" runat="server"></ASP:Label></td>
                      </tr>
                      <tr>
                        <td>Phone #:</td>
                        <td><ASP:LinkButton id="LinkButton_change_member_phone_num" runat="server" visible="False" onclick="LinkButton_change_member_phone_num_Click"><img src="~/protected/image/draw_freehand_16_h.png" alt="Edit" border="0" height="16" width="16" /></ASP:LinkButton></td>
                        <td><ASP:Label id="Label_phone_num" runat="server"></ASP:Label></td>
                      </tr>
                      <tr>
                        <td>Email address:</td>
                        <td><ASP:LinkButton id="LinkButton_change_member_email_address" runat="server" visible="False" onclick="LinkButton_change_member_email_address_Click"><img src="~/protected/image/draw_freehand_16_h.png" alt="Edit" border="0" height="16" width="16" /></ASP:LinkButton></td>
                        <td><asp:HyperLink id="HyperLink_email_address" runat="server"></asp:HyperLink></td>
                      </tr>
                      <tr>
                        <td>Leave/reduction:</td>
                        <td><ASP:LinkButton id="LinkButton_leave_detail" runat="server" onclick="LinkButton_leave_detail_Click"><img src="~/protected/image/open_document16_h.png" alt="Detail" border="0" height="16" width="16" /></ASP:LinkButton></td>
                        <td valign="middle">
                          <table cellspacing="0" cellpadding="1" border="0">
                              <tr>
                                <td>This month:</td>
                                <td>&nbsp;&nbsp;&nbsp;</td>
                                <td><ASP:Label id="Label_leave_this_month" runat="server" font-bold="True"></ASP:Label></td>
                              </tr>
                              <tr>
                                <td>Next month:</td>
                                <td>&nbsp;&nbsp;&nbsp;</td>
                                <td><ASP:Label id="Label_leave_next_month" runat="server" font-bold="True"></ASP:Label></td>
                              </tr>
                          </table>
                          </td>
                      </tr>
                      <tr>
                        <td>Agency:</td>
                        <td><ASP:LinkButton id="LinkButton_change_agency" runat="server" onclick="LinkButton_change_agency_Click"><img src="~/protected/image/draw_freehand_16_h.png" alt="Edit" border="0" height="16" width="16" /></ASP:LinkButton></td>
                        <td><ASP:Label id="Label_agency" runat="server"></ASP:Label></td>
                      </tr>
                      <tr>
                        <td>Section:</td>
                        <td><ASP:LinkButton id="LinkButton_change_section" runat="server" onclick="LinkButton_change_section_Click"><img src="~/protected/image/draw_freehand_16_h.png" alt="Edit" border="0" height="16" width="16" /></ASP:LinkButton></td>
                        <td><ASP:Label id="Label_section" runat="server"></ASP:Label></td>
                      </tr>
                      <tr>
                        <td valign="top">Released cert level:</td>
                        <td valign="top"><ASP:LinkButton id="LinkButton_change_medical_release_level" runat="server" onclick="LinkButton_change_medical_release_level_Click"><img src="~/protected/image/draw_freehand_16_h.png" alt="Edit" border="0" height="16" width="16" /></ASP:LinkButton></td>
                        <td valign="top">
                          <ASP:Label id="Label_medical_release_level" runat="server"></ASP:Label>
                          <blockquote>
                            <small><i>First release as an AIC <ASP:Literal id="Literal_first_release_as_aic_phrase" runat="server"></ASP:Literal></i></small>
                          </blockquote>
                        </td>
                      </tr>
                      <tr>
                        <td valign="top">Membership status:</td>
                        <td valign="top"><ASP:LinkButton id="LinkButton_enrollment_detail" runat="server" onclick="LinkButton_enrollment_detail_Click"><img src="~/protected/image/open_document16_h.png" alt="Detail" border="0" height="16" width="16" /></ASP:LinkButton></td>
                        <td valign="top">
                          <ASP:Label id="Label_enrollment" runat="server"></ASP:Label> <ASP:Label id="Label_effective_date_clause" runat="server"></ASP:Label>
                          <blockquote>
                            <small><ASP:Label id="Label_elaboration" runat="server" font-italic="True"></ASP:Label></small>
                          </blockquote>
                        </td>
                      </tr>
                      <tr>
                        <td valign="top">Years of service:</td>
                        <td valign="top"><ASP:LinkButton id="LinkButton_adjust_years_of_service" runat="server" onclick="LinkButton_adjust_years_of_service_Click" Visible="False"><img src="~/protected/image/draw_freehand_16_h.png" alt="Adjust" border="0" height="16" width="16" /></ASP:LinkButton></td>
                        <td valign="top"><ASP:Label id="Label_years_of_service" runat="server"></ASP:Label></td>
                      </tr>
                      <tr>
                        <td>Driver qualified:</td>
                        <td><ASP:LinkButton id="LinkButton_change_driver_qual" runat="server" onclick="LinkButton_change_driver_qual_Click"><img src="~/protected/image/draw_freehand_16_h.png" alt="Edit" border="0" height="16" width="16" /></ASP:LinkButton></td>
                        <td><ASP:Label id="Label_be_driver_qualified" runat="server"></ASP:Label></td>
                      </tr>
                      <tr runat="server" visible="false">
                        <td>On squad truck team:</td>
                        <td><ASP:LinkButton id="LinkButton_change_squad_truck_team_qual" runat="server" onclick="LinkButton_change_squad_truck_team_qual_Click"><img src="~/protected/image/draw_freehand_16_h.png" alt="Edit" border="0" height="16" width="16" /></ASP:LinkButton></td>
                        <td><ASP:Label id="Label_be_on_squad_truck_team" runat="server"></ASP:Label></td>
                      </tr>
                      <tr runat="server" visible="false">
                        <td>Flight medic:</td>
                        <td><ASP:LinkButton id="LinkButton_change_flight_medic_qual" runat="server" onclick="LinkButton_change_flight_medic_qual_Click"><img src="~/protected/image/draw_freehand_16_h.png" alt="Edit" border="0" height="16" width="16" /></ASP:LinkButton></td>
                        <td><ASP:Label id="Label_be_flight_medic" runat="server"></ASP:Label></td>
                      </tr>
                      <tr>
                        <td>Marine medic:</td>
                        <td><ASP:LinkButton id="LinkButton_change_marine_medic_qual" runat="server" onclick="LinkButton_change_marine_medic_qual_Click"><img src="~/protected/image/draw_freehand_16_h.png" alt="Edit" border="0" height="16" width="16" /></ASP:LinkButton></td>
                        <td><ASP:Label id="Label_be_marine_medic" runat="server"></ASP:Label></td>
                      </tr>
                      <tr>
                        <td>BLS Academy proctor team:</td>
                        <td><ASP:LinkButton id="LinkButton_change_bls_academy_proctor_qual" runat="server" onclick="LinkButton_change_bls_academy_proctor_qual_Click"><img src="~/protected/image/draw_freehand_16_h.png" alt="Edit" border="0" height="16" width="16" /></ASP:LinkButton></td>
                        <td><ASP:Label id="Label_be_bls_academy_proctor" runat="server"></ASP:Label></td>
                      </tr>
                      <tr id="TableRow_tapouts" runat="server" visible="false">
                        <td>Tapouts:</td>
                        <td><ASP:LinkButton id="LinkButton_individual_tapout_detail" runat="server" onclick="LinkButton_individual_tapout_detail_Click"><img src="~/protected/image/open_document16_h.png" alt="Detail" border="0" height="16" width="16" /></ASP:LinkButton></td>
                        <td valign="middle">
                          <table cellspacing="0" cellpadding="1" border="0">
                              <tr style="color:lightgray">
                                <td>Three months ago:</td>
                                <td>&nbsp;&nbsp;&nbsp;</td>
                                <td><ASP:Label id="Label_num_tapouts_3_months_ago" runat="server"></ASP:Label></td>
                              </tr>
                              <tr style="color:darkgray">
                                <td>Two months ago:</td>
                                <td>&nbsp;&nbsp;&nbsp;</td>
                                <td><ASP:Label id="Label_num_tapouts_2_months_ago" runat="server"></ASP:Label></td>
                              </tr>
                              <tr>
                                <td>One month ago:</td>
                                <td>&nbsp;&nbsp;&nbsp;</td>
                                <td><ASP:Label id="Label_num_tapouts_1_month_ago" runat="server" Font-Bold="true"></ASP:Label></td>
                              </tr>
                          </table>
                          </td>
                      </tr>
                    </table>
                    <br/>
                    <uc1:UserControl_role_member_map_log runat="server" ID="UserControl_role_member_map_log_control" />
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
