<!DOCTYPE html>
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->
<%@ Page language="c#" codebehind="process_paypal_donation.aspx.cs" AutoEventWireup="True" Inherits="process_paypal_donation.TWebForm_process_paypal_donation" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="uc3" TagName="UserControl_update_progress_blocker" Src="~/usercontrol/app/UserControl_update_progress_blocker.ascx" %>
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
      <table cellpadding="0" cellspacing="0" border="1" bordercolor="gainsboro">
        <tr>
          <td>
            <table cellpadding="10" cellspacing="0">
              <tr>
                <td bgcolor="WhiteSmoke"><strong>PayPal assistant step 2 of 3</strong></td>
              </tr>
              <tr>
                <td>
                  <table cellpadding="5" cellspacing="0">
                    <tr>
                      <td align="right">Amount donated:</td>
                      <td><strong>$<asp:Literal ID="Literal_amount_donated" runat="server"></asp:Literal></strong></td>
                    </tr>
                    <tr>
                      <td align="right">Donor email address:</td>
                      <td><strong><asp:Literal ID="Literal_donor_email_address" runat="server"></asp:Literal></strong></td>
                    </tr>
                    <tr>
                      <td align="right">Donor name:</td>
                      <td><strong><asp:Literal ID="Literal_donor_name" runat="server"></asp:Literal></strong></td>
                    </tr>
                    <tr>
                      <td align="right">Donation date:</td>
                      <td><strong><asp:Literal ID="Literal_donation_date" runat="server"></asp:Literal></strong></td>
                    </tr>
                    <tr>
                      <td align="right">Donor house #:</td>
                      <td><strong><asp:Literal ID="Literal_donor_house_num" runat="server"></asp:Literal></strong></td>
                    </tr>
                    <tr>
                      <td align="right">Donor street:</td>
                      <td><strong><asp:Literal ID="Literal_donor_street" runat="server"></asp:Literal></strong></td>
                    </tr>
                  </table>
                  <hr size="1" />
                  <table width="100%">
                    <tr>
                      <td>To which of the following ROD records, if any, should this donation be logged?</td>
                      <td align="right"><asp:Button ID="Button_cancel" runat="server" Text="Cancel" onclick="Button_cancel_Click"/></td>
                    </tr>
                  </table>
                  <ASP:DataGrid id="DataGrid_possible_match" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="5" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px">
                    <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                    <Columns>
                      <ASP:ButtonColumn text="Select" commandname="Select">
                        <ItemStyle HorizontalAlign="Right" />
                      </ASP:ButtonColumn>
                      <ASP:BoundColumn visible="False" datafield="id"></ASP:BoundColumn>
                      <ASP:BoundColumn datafield="name" headertext="Name">
                        <HeaderStyle HorizontalAlign="Left"/>
                      </ASP:BoundColumn>
                      <ASP:BoundColumn datafield="house_num_and_street" headertext="House# and Street">
                        <HeaderStyle HorizontalAlign="Left"/>
                      </ASP:BoundColumn>
                      <ASP:BoundColumn datafield="city" headertext="City">
                        <HeaderStyle HorizontalAlign="Left"/>
                      </ASP:BoundColumn>
                      <ASP:BoundColumn datafield="state" headertext="St">
                        <HeaderStyle HorizontalAlign="Left"/>
                      </ASP:BoundColumn>
                      <ASP:BoundColumn datafield="email_address" headertext="Email address">
                        <HeaderStyle HorizontalAlign="Left"/>
                      </ASP:BoundColumn>
                      <ASP:BoundColumn datafield="score" headertext="Score">
                        <ItemStyle HorizontalAlign="Right" />
                      </ASP:BoundColumn>
                      <ASP:BoundColumn datafield="num_priors" headertext="#priors">
                        <ItemStyle HorizontalAlign="Right" />
                      </ASP:BoundColumn>
                      <ASP:BoundColumn datafield="avg_amount" headertext="Avg amount" DataFormatString="{0:C0}">
                        <ItemStyle HorizontalAlign="Right" />
                      </ASP:BoundColumn>
                    </Columns>
                  </ASP:DataGrid>
                  <table cellpadding="10" cellspacing="0">
                    <tr>
                      <td><asp:Button ID="Button_out_of_area" runat="server" Font-Bold="true" Text="OUT OF AREA" OnClick="Button_out_of_area_Click"/></td>
                      <td><asp:Button ID="Button_unknown" runat="server" Font-Bold="true" Text="UNKNOWN" OnClick="Button_unknown_Click"/></td>
                    </tr>
                  </table>
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
