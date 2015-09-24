<%@ Page language="c#" Debug="true" Codebehind="report_member_schedule_detail_bls_interns.aspx.cs" AutoEventWireup="True" Inherits="report_member_schedule_detail_bls_interns.TWebForm_report_member_schedule_detail_bls_interns" EnableViewState="false" %>
<%@ Register src="../usercontrol/app/UserControl_common_header_bar.ascx" tagname="UserControl_common_header_bar" tagprefix="uc1" %>
<%@ Register src="../usercontrol/app/UserControl_member_schedule_detail_bls_interns.ascx" tagname="UserControl_member_schedule_detail_bls_interns" tagprefix="uc3" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head runat="server">
    <title></title>
  </head>
  <body bgcolor="white">
	  <form runat="server">
      <uc1:UserControl_common_header_bar ID="UserControl_common_header_bar_control" runat="server" />
      <p>
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
          <tr>
            <td>
              <table cellspacing="0" cellpadding="10" width="100%" border="0">
                <tr><td bgcolor="#f5f5f5"><strong>MEMBER SCHEDULE DETAIL for BLS INTERNS</strong></td></tr>
              </table>
            </td>
          </tr>
        </table>
      </p>
      <uc3:UserControl_member_schedule_detail_bls_interns ID="UserControl_member_schedule_detail_bls_interns" runat="server" />
    </form>
  </body>
</html>
