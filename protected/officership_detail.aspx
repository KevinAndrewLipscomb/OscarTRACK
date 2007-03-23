<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="officership_detail.pas" AutoEventWireup="false" Inherits="officership_detail.TWebForm_officership_detail" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
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
		  <table cellspacing="0" cellpadding="0" width="100%" border="0">
			  <tr>
				<td>
		<small>[
		  <ASP:LinkButton id="LinkButton_logout" runat="server" causesvalidation="False">Logout</ASP:LinkButton>&nbsp;]
			                 [ Back to <ASP:LinkButton id="LinkButton_back" runat="server" causesvalidation="False">previous</ASP:LinkButton>&nbsp;form ]&nbsp;
			                 [ Change your <asp:LinkButton id="LinkButton_change_password" runat="server" causesvalidation="False">password</asp:LinkButton>&nbsp;
			|
			<asp:LinkButton id="LinkButton_change_email_address" runat="server" causesvalidation="False">email address</asp:LinkButton>&nbsp;]
		</small>
				</td>
				<td align="right"><uc1:UserControl_print_div id="UserControl_print_div" runat="server"></uc1:UserControl_print_div>
				</td>
			  </tr>
		  </table>
	  </p>
<div id="Div_print_area">
	  <p><asp:label id="Label_account_descriptor" runat="server" font-bold="True" font-size="Large"></asp:label></p>
	  <p>
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
            <tr>
              <td>
                <table cellspacing="0" cellpadding="10" border="0">
                    <tr>
                      <td bgcolor="#f5f5f5"><strong>Officership detail for <ASP:Label id="Label_member_designator" runat="server"></ASP:Label></strong></td>
					</tr>
					<tr id="TableRow_none" runat="server">
					  <td><em>--&nbsp;NONE&nbsp;--</em></td>
					</tr>
                    <tr>
                      <td>
                        <ASP:DataGrid id="DataGrid_officerships" runat="server" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="10" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px">
                          <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                          <Columns>
                            <ASP:BoundColumn visible="False" datafield="id" readonly="True"></ASP:BoundColumn>
                            <ASP:BoundColumn datafield="start_date" sortexpression="start_date" readonly="True" headertext="Start date">
                              <ItemStyle horizontalalign="Center"></ItemStyle>
                            </ASP:BoundColumn>
                            <ASP:BoundColumn datafield="end_date" sortexpression="end_date" readonly="True" headertext="End date">
                              <ItemStyle horizontalalign="Center"></ItemStyle>
                            </ASP:BoundColumn>
                            <ASP:BoundColumn datafield="rank" sortexpression="rank" readonly="True" headertext="Rank">
                              <ItemStyle horizontalalign="Center"></ItemStyle>
                            </ASP:BoundColumn>
                          </Columns></ASP:DataGrid></td>
                    </tr>
                </table></td>
            </tr>
		</table></p>
</div>
	  <p>
	  <asp:placeholder id="PlaceHolder_postcontent" runat="server"></asp:placeholder></p>
	 <sstchur:SmartScroller runat="server" /></form>
  </body>
</html>
