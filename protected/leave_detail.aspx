<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="leave_detail.pas" AutoEventWireup="false" Inherits="leave_detail.TWebForm_leave_detail" %>
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
                              <tr>
                                <td><strong>Leave detail for <ASP:Label id="Label_member_designator" runat="server"></ASP:Label></strong></td>
                                <td>
                                  <p align="right"><ASP:LinkButton id="LinkButton_new" runat="server">[Grant&nbsp;new]</ASP:LinkButton></p></td>
                              </tr>
                          </table></strong></td>
					</tr>
					<tr id="TableRow_none" runat="server">
					  <td><em>--&nbsp;NONE&nbsp;--</em></td>
					</tr>
                    <tr>
                      <td>
                        <ASP:DataGrid id="DataGrid_leaves" runat="server" allowsorting="True" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="10" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px">
                          <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                          <Columns>
                            <ASP:BoundColumn visible="False" datafield="id" readonly="True"></ASP:BoundColumn>
                            <ASP:BoundColumn datafield="start_date" sortexpression="start_date%" readonly="True" headertext="Start month">
                              <ItemStyle horizontalalign="Center"></ItemStyle>
                            </ASP:BoundColumn>
                            <ASP:BoundColumn datafield="end_date" sortexpression="end_date%" readonly="True" headertext="End month">
                              <ItemStyle horizontalalign="Center"></ItemStyle>
                            </ASP:BoundColumn>
                            <ASP:BoundColumn datafield="kind_of_leave" sortexpression="kind_of_leave%,start_date%" readonly="True" headertext="Kind">
                              <ItemStyle horizontalalign="Center"></ItemStyle>
                            </ASP:BoundColumn>
                            <ASP:BoundColumn datafield="num_obliged_shifts" sortexpression="num_obliged_shifts%,start_date%" readonly="True" headertext="Num shifts">
                              <ItemStyle horizontalalign="Center"></ItemStyle>
                            </ASP:BoundColumn>
                            <ASP:BoundColumn datafield="note" sortexpression="note%" readonly="True" headertext="Note">
                              <HeaderStyle horizontalalign="Left"></HeaderStyle>
                              <ItemStyle horizontalalign="Left"></ItemStyle>
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
