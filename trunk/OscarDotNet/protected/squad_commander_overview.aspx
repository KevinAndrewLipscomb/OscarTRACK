<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="squad_commander_overview.pas" AutoEventWireup="false" Inherits="squad_commander_overview.TWebForm_squad_commander_overview" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
	<title id="Title" runat="server"></title>
	<!-- $Id$ -->
  </head>

  <body>
	 <form runat="server">
	  <p>
	  <asp:placeholder id="PlaceHolder_precontent" runat="server">
	  </asp:placeholder></p>
	  <p><small>[
		  <ASP:LinkButton id="LinkButton_logout" runat="server" causesvalidation="False">Logout</ASP:LinkButton>&nbsp;] [ Change your
		<asp:LinkButton id="LinkButton_change_password" runat="server">password</asp:LinkButton>
		|
		<asp:LinkButton id="LinkButton_change_email_address" runat="server">email address</asp:LinkButton>&nbsp;]
	  </small></p>
<p>
		<ASP:Label id="Label_agency_name" runat="server" font-bold="True" font-size="Large"></ASP:Label></p>
<p>
        <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
            <tr>
              <td>
                <table cellspacing="0" cellpadding="10" width="100%" border="0">
                    <tr bgcolor="#f5f5f5">
					  <td><strong>
                        <p>
                            <table cellspacing="0" cellpadding="5" width="100%" border="0">
                                <tr>
                                  <td><strong>Roster</strong></td><td>&nbsp;&nbsp;

                                    <div align="center"><ASP:LinkButton id="LinkButton_add" runat="server">Add</ASP:LinkButton>
                                    </div>&nbsp;&nbsp;&nbsp;</td>
                                  <td>
                                    <p align="right">Filter:<ASP:DropDownList id="DropDownList_filter" runat="server">
                                        <ASP:ListItem value="all">All</ASP:ListItem>
                                        <ASP:ListItem value="engaged">- Engaged</ASP:ListItem>
                                        <ASP:ListItem value="operational">- - Operational</ASP:ListItem>
                                        <ASP:ListItem value="associate">- - - Associate</ASP:ListItem>
                                        <ASP:ListItem value="regular">- - - Regular</ASP:ListItem>
                                        <ASP:ListItem value="life">- - - Life</ASP:ListItem>
                                        <ASP:ListItem value="tenured">- - - Tenured</ASP:ListItem>
                                        <ASP:ListItem value="special">- - - Special</ASP:ListItem>
                                        <ASP:ListItem value="admin">- - Admin</ASP:ListItem>
                                        <ASP:ListItem value="disengaged">- Disengaged</ASP:ListItem>
                                        <ASP:ListItem value="lost_interest">- - Lost interest</ASP:ListItem>
                                        <ASP:ListItem value="resigned">- - Resigned</ASP:ListItem>
                                        <ASP:ListItem value="retired">- - Retired</ASP:ListItem>
                                        <ASP:ListItem value="disabled">- - Disabled</ASP:ListItem>
                                        <ASP:ListItem value="expelled">- - Expelled</ASP:ListItem>
                                        <ASP:ListItem value="deceased">- - Deceased</ASP:ListItem>
</ASP:DropDownList>
                                    </p></td>
                                </tr>
                            </table>
                        </p></strong></td>
                    </tr>
                    <tr>
                      <td>
                        <ASP:DataGrid id="DataGrid1" runat="server" autogeneratecolumns="False">
                          <Columns>
                            <ASP:BoundColumn datafield="last_name" sortexpression="last_name" readonly="True" headertext="Last name"></ASP:BoundColumn>
                            <ASP:BoundColumn datafield="first_name" sortexpression="first_name" readonly="True" headertext="First name"></ASP:BoundColumn>
                            <ASP:BoundColumn datafield="cad_num" sortexpression="cad_num" readonly="True" headertext="CAD#"></ASP:BoundColumn>
                          </Columns>
                        </ASP:DataGrid></td>
                    </tr>
                </table></td>
            </tr>
        </table></p>
<p></p>
    <asp:placeholder id="PlaceHolder_postcontent" runat="server">
    </asp:placeholder>
     <sstchur:SmartScroller runat="server" /></form>
  </body>
</html>
