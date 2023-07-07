<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_iva_attachment_explorer.ascx.cs" Inherits="UserControl_iva_attachment_explorer.TWebUserControl_iva_attachment_explorer"%>
<table cellspacing="0" cellpadding="2" border="0">
  <tr>
    <td valign="middle">
      <asp:GridView id="GridView_attachments" runat="server" showheader="False" cellpadding="3" gridlines="None" onselectedindexchanging="GridView_attachments_SelectedIndexChanging">
        <Columns>
          <asp:ButtonField commandname="Select" text="&lt;IMG src=&quot;@usercontrol/ki/image/paperclip_16x16.gif&quot; alt=&quot;Attachment&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;&amp;nbsp;"></asp:ButtonField>
          <asp:CommandField deletetext="&lt;IMG src=&quot;~/usercontrol/ki/image/delete_x16_h.png&quot; alt=&quot;Delete&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" showdeletebutton="True"></asp:CommandField>
        </Columns>
      </asp:GridView>
    </td>
  </tr>
  <tr>
    <td>
      <asp:Panel ID="Panel_new" runat="server">
        <nobr>
          &nbsp;<img id="Image_paperclip" height="16" alt="New attachment" hspace="0" src="~/usercontrol/ki/image/paperclip_16x16.gif" width="16" border="0" runat="server"/>
          <asp:FileUpload id="FileUpload_control" runat="server" accept="image/*,video/*,audio/*" capture></asp:FileUpload>
          &nbsp;
          <asp:Button ID="Button_upload" runat="server" Text="<==&nbsp;Upload" onclick="Button_upload_Click" CausesValidation="False" />
        </nobr>
      </asp:Panel>
    </td>
  </tr>
</table>
