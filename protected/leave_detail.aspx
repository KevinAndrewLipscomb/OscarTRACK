<!DOCTYPE html>
<%@ Page language="c#" codebehind="leave_detail.aspx.cs" AutoEventWireup="True" Inherits="leave_detail.TWebForm_leave_detail" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<html>
  <head runat="server">
	<title></title>
      <!-- $Id$ -->
  </head>
  <body bgcolor="white">
	 <form runat="server">
	   <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
		<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
			<tr>
			  <td>
				<table cellspacing="0" cellpadding="10" border="0">
					<tr>
					  <td bgcolor="#f5f5f5"><strong>
						  <table cellspacing="0" cellpadding="5" width="100%" border="0">
							  <tr>
                                <td><strong>Leave/reduction detail for <ASP:Label id="Label_member_designator" runat="server"></ASP:Label></strong></td>
                                <td>
                                  </td>
                              </tr>
                          </table></strong></td>
					</tr>
					<tr id="TableRow_none" runat="server">
					  <td><em>--&nbsp;NONE&nbsp;--</em></td>
					</tr>
                    <tr>
                      <td>
                          <p align="left"><ASP:LinkButton id="LinkButton_new" runat="server" onclick="LinkButton_new_Click">Grant&nbsp;new</ASP:LinkButton></p>
                        <ASP:DataGrid id="DataGrid_leaves" runat="server" allowsorting="True" autogeneratecolumns="False" useaccessibleheader="True" cellpadding="10" gridlines="Horizontal" bordercolor="Gainsboro" borderwidth="1px">
                            <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                            <Columns>
                              <asp:BoundColumn DataField="be_canonical" ReadOnly="True" HeaderText="Record type">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                              </asp:BoundColumn>
                              <ASP:BoundColumn visible="False" datafield="id" readonly="True"></ASP:BoundColumn>
                              <ASP:BoundColumn datafield="start_date" sortexpression="start_date%" readonly="True" headertext="Start month">
                                <ItemStyle horizontalalign="Center"></ItemStyle>
                              </ASP:BoundColumn>
                              <ASP:BoundColumn datafield="end_date" sortexpression="end_date%" readonly="True" headertext="End month">
                                <ItemStyle horizontalalign="Center"></ItemStyle>
                              </ASP:BoundColumn>
                              <asp:BoundColumn DataField="specific_end_date" Visible="False"></asp:BoundColumn>
                              <ASP:BoundColumn datafield="kind_of_leave" sortexpression="kind_of_leave%,start_date" readonly="True" headertext="Kind">
                                <ItemStyle horizontalalign="Center"></ItemStyle>
                              </ASP:BoundColumn>
                              <ASP:BoundColumn datafield="num_obliged_shifts" sortexpression="num_obliged_shifts%,start_date" readonly="True" headertext="Num shifts">
                                <ItemStyle horizontalalign="Center"></ItemStyle>
                              </ASP:BoundColumn>
                              <asp:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/ksysv.png&quot; alt=&quot;ClearToRun&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" CommandName="ClearToReturnToDuty"></asp:ButtonColumn>
                              <ASP:BoundColumn datafield="note" sortexpression="note%" readonly="True" headertext="Note" Visible="false">
                                <HeaderStyle horizontalalign="Left"></HeaderStyle>
                                <ItemStyle horizontalalign="Left"></ItemStyle>
                              </ASP:BoundColumn>
                              <ASP:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/draw_freehand_16_h.png&quot; alt=&quot;Edit&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Select"></ASP:ButtonColumn>
                              <ASP:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/delete_x16_h.png&quot; alt=&quot;Delete&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Delete"></ASP:ButtonColumn>
                            </Columns></ASP:DataGrid></td>
                    </tr>
                </table></td>
            </tr>
		</table>
	  <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
	</form>
  </body>
</html>
