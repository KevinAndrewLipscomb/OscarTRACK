<%@ Page language="c#" Debug="true" Codebehind="change_member_section.aspx.cs" AutoEventWireup="True" Inherits="change_member_section.TWebForm_change_member_section" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<!DOCTYPE html>

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
                <table cellspacing="0" cellpadding="10" width="100%" border="0">
                    <tr><td bgcolor="#f5f5f5"><strong>Change 
                          <ASP:Label id="Label_member_name_1" runat="server"></ASP:Label>'s section assignment</strong></td>
                    </tr>
                    <tr>
                      <td>
						<p>If a squad finds that its personnel lieutenants are overwhelmed by the size of its&nbsp;operational membership, it should consider subdividing the members into <em>sections</em> and appointing <em>section sergeants</em>.&nbsp; Doing so is an optimization of the officers' <em>span of control</em>.</p>
						<p><ASP:Label id="Label_member_name_2" runat="server"></ASP:Label>&nbsp;is assigned to Section <ASP:DropDownList id="DropDownList_section" runat="server"></ASP:DropDownList>.&nbsp; (*&nbsp;=&nbsp;unassigned)</p>
						<p><ASP:Button id="Button_submit" runat="server" text="Submit" onclick="Button_submit_Click"></ASP:Button>&nbsp;<ASP:Button id="Button_cancel" runat="server" text="Cancel" causesvalidation="False" onclick="Button_cancel_Click"></ASP:Button></p></td>
                    </tr>
                </table></td>
            </tr>
        </table><uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
    </form>
  </body>
</html>
