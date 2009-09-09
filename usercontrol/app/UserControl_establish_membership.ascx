<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_establish_membership.ascx.cs" Inherits="UserControl_establish_membership.TWebUserControl_establish_membership"%>
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" width="100%" border="0">
        <tr bgcolor="#f5f5f5">
          <td><strong>Establish membership</strong>
          </td>
        </tr>
        <tr>
          <td>
                <p>Your <ASP:Label id="Label_application_name_1" runat="server"></ASP:Label>&nbsp;username is not currently linked to a&nbsp;<ASP:Label id="Label_sponsor_1" runat="server"></ASP:Label> membership record.</p>
                <p>Are you already a <ASP:Label id="Label_sponsor_2" runat="server"></ASP:Label>&nbsp;member?</p>
                <p>
                  <table cellspacing="0" cellpadding="10" border="0">
                      <tr>
						<td valign="top">
                          <p align="center"><strong>NO</strong>
                          </p></td>
						<td valign="top" nowrap="true">-&gt;</td>
                        <td valign="top">
                          <p>Visit <a href="http://www.vabeachems.com/">www.VaBeachEms.com</a>&nbsp;and click "EMS Provider Application Process".</p>
                          <p>&nbsp;</p></td>
                      </tr>
                      <tr>
						<td valign="top">
						  <p align="center"><strong>YES</strong>
						  </p></td>
						<td valign="top" nowrap="true">-&gt;</td>
						<td valign="top">
						  <p>Match yourself to a <ASP:Label id="Label_sponsor_3" runat="server"></ASP:Label>&nbsp;membership record by entering <ASP:Label id="Label_shared_secret_description" runat="server"></ASP:Label>&nbsp;here:</p>
						  <p>
							<asp:textbox id="TextBox_noop_ie_behavior_workaround" runat="server" style="DISPLAY: none; VISIBILITY: hidden" /><!-- To work around an IE bug that otherwise prevents Enter in a textbox from submitting a form. -->
							<ASP:TextBox id="TextBox_shared_secret" runat="server" columns="6" maxlength="6"></ASP:TextBox><ASP:Button id="Button_submit" runat="server" text="Submit" font-bold="True" onclick="Button_submit_Click"></ASP:Button><ASP:RequiredFieldValidator id="RequiredFieldValidator_shared_secret" runat="server" errormessage="Please enter your Officer Code (CAD number)" font-bold="True" controltovalidate="TextBox_shared_secret">!ERR!</ASP:RequiredFieldValidator><ASP:RegularExpressionValidator id="RegularExpressionValidator_shared_secret" runat="server" errormessage="Please enter only numbers." font-bold="True" controltovalidate="TextBox_shared_secret" validationexpression="\d{6}">!ERR!</ASP:RegularExpressionValidator>
						  </p>
						  <p>If you have trouble with this feature, <ASP:LinkButton id="LinkButton_trouble_handler" runat="server" causesvalidation="False" onclick="LinkButton_trouble_handler_Click">click here</ASP:LinkButton>.</p>
						  <p>
							<table id="Table_proceed" runat="server" visible="False" bordercolor="#0000ff" cellspacing="0" cellpadding="10" border="3">
							  <tr>
								<td><ASP:LinkButton id="LinkButton_proceed" runat="server" font-bold="True" onclick="LinkButton_proceed_Click">CLICK HERE TO CONTINUE</ASP:LinkButton></td>
							  </tr>
							</table>
						  </p>
						</td>
					  </tr>
				  </table>
                </p>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
