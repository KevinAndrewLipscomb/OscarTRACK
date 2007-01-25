<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="enrollment_detail.pas" AutoEventWireup="false" Inherits="enrollment_detail.TWebForm_enrollment_detail" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
	<title id="Title" runat="server"></title>
      <!-- $Id$ -->
  </head>

  <body>
     <form runat="server">
	  <asp:placeholder id="PlaceHolder_precontent" runat="server"></asp:placeholder>
	  <p>
		<small>[
		  <ASP:LinkButton id="LinkButton_logout" runat="server" causesvalidation="False">Logout</ASP:LinkButton>&nbsp;]
			                 [ Back to <ASP:LinkButton id="LinkButton_back" runat="server">previous</ASP:LinkButton>&nbsp;form ]&nbsp;
			                 [ Change your <asp:LinkButton id="LinkButton_change_password" runat="server">password</asp:LinkButton>&nbsp;
			|
			<asp:LinkButton id="LinkButton_change_email_address" runat="server">email address</asp:LinkButton>&nbsp;]
		</small>
	  </p>
	  <p><asp:label id="Label_account_descriptor" runat="server" font-bold="True" font-size="Large"></asp:label></p>
	  <p>
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
            <tr>
              <td>
                <table cellspacing="0" cellpadding="10" border="0">
                    <tr>
                      <td bgcolor="#f5f5f5"><strong>
                          <table cellspacing="0" cellpadding="5" width="100%" border="0">
                              <tr><td><strong>Enrollment details for 
                                    <ASP:Label id="Label_member_designator" runat="server"></ASP:Label></strong></td><td><ASP:LinkButton id="LinkButton_add_new_enrollment_status" runat="server">[Add&nbsp;a&nbsp;new&nbsp;status]</ASP:LinkButton></td>
                              </tr>
                          </table></strong></td>
					</tr>
					<tr id="TableRow_none" runat="server">
					  <td><em>--&nbsp;NONE&nbsp;--</em></td>
					</tr>
                    <tr>
                      <td>
                        <ASP:DataGrid id="DataGrid_member_history" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="10" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px">
                          <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                          <Columns>
                            <ASP:BoundColumn visible="False" datafield="id" readonly="True"></ASP:BoundColumn>
                            <ASP:BoundColumn datafield="start_date" sortexpression="start_date" readonly="True" headertext="Date (yyyy-mm-dd)">
                              <ItemStyle horizontalalign="Center"></ItemStyle>
                            </ASP:BoundColumn>
                            <ASP:BoundColumn datafield="description" sortexpression="description" readonly="True" headertext="Level">
                              <ItemStyle horizontalalign="Center"></ItemStyle>
                            </ASP:BoundColumn>
                          </Columns></ASP:DataGrid></td>
                    </tr>
                </table></td>
            </tr>
        </table></p>
	  <p>
	  <asp:placeholder id="PlaceHolder_postcontent" runat="server"></asp:placeholder></p>
     <sstchur:SmartScroller runat="server" /></form>
  </body>
</html>
