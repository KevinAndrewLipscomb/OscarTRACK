<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UserControl_keyclick.ascx.cs" Inherits="UserControl_keyclick.TWebUserControl_keyclick" %>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~std.ascx-template -->
<table border="0" cellspacing="10">
  <tr>
    <td colspan="5">
      <h3>
        Actions</h3>
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right">
      <b><asp:HyperLink ID="HyperLink_log_new" runat="server" target="_blank" NavigateUrl="$KEYclick/form-add-donation.phtml">Log</asp:HyperLink> </b>
    </td>
    <td>
      <table border="0">
        <tr>
          <td>
            a new donation - <small><i><asp:HyperLink ID="HyperLink_log_old" runat="server" target="_blank" NavigateUrl="$KEYclick/form-add-donation-old.phtml">or log an old one</asp:HyperLink></i></small>.
          </td>
        </tr>
      </table>
    </td>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td rowspan="6" valign="top">
      <table bgcolor="#E8E8E8">
        <tr>
          <td colspan="2">
            <small><u>Summary</u></small>
          </td>
        </tr>
        <tr>
          <td>
            <small># ROD records:</small>
          </td>
          <td align="right"><small><asp:Literal ID="Literal_num_rod_records" runat="server"></asp:Literal></small></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right">
      <b>Find</b>
    </td>
    <td>
      <table border="0">
        <tr>
          <td>
            by name or address:
          </td>
          <td>
            <asp:TextBox ID="TextBox_search_text" runat="server" MaxLength="50" Columns="20"></asp:TextBox><asp:Button ID="Button_find" runat="server" Text="Go!" onclick="Button_find_Click" />
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right">
      <b><asp:HyperLink ID="HyperLink_add" runat="server" target="_blank" NavigateUrl="$KEYclick/form-add-resident.phtml">Add</asp:HyperLink></b>
    </td>
    <td>
      <table border="0">
        <tr>
          <td>
            a name and address to the ROD (Resident/Occupant Database).
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right">
      <b><asp:HyperLink ID="HyperLink_modify_or_remove" runat="server" target="_blank" NavigateUrl="$KEYclick/form-act-singly.phtml">Modify or remove</asp:HyperLink></b>
    </td>
    <td>
      <table border="0">
        <tr>
          <td>
            ROD record #
          </td>
          <td>
            <asp:TextBox ID="TextBox_id" runat="server" MaxLength="5" Columns="5"></asp:TextBox><asp:Button ID="Button_modify_or_remove" runat="server" Text="Go!" onclick="Button_modify_or_remove_Click" />
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right">
      <b><asp:HyperLink ID="HyperLink_analyze" runat="server" target="_blank" NavigateUrl="$KEYclick/form-analyze.phtml">Analyze</asp:HyperLink></b>
    </td>
    <td>
      <table border="0">
        <tr>
          <td>
            data and get reports.
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right">
      <b><asp:HyperLink ID="HyperLink_export" runat="server" target="_blank" NavigateUrl="$KEYclick/form-export.phtml">Export</asp:HyperLink></b>
    </td>
    <td>
      <table border="0">
        <tr>
          <td>
            the ROD for mailing label generation.
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td colspan="5">
      <h3>
        <br>
        Administrivia</h3>
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right" valign="top">
      <b><asp:HyperLink ID="HyperLink_catch_up" runat="server" target="_blank" NavigateUrl="$KEYclick/whats-new.phtml">Catch up</asp:HyperLink></b>
    </td>
    <td valign="top">
      on what's new.
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right" valign="top">
      <b><font color="D0D0D0">Modify</font></b>
    </td>
    <td valign="top">
      system settings (KEYclick Authorities only).
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right" valign="top">
      <b><asp:HyperLink ID="HyperLink_faq" runat="server" target="_blank" NavigateUrl="$KEYclick/faq.phtml">FAQ</asp:HyperLink></b>
    </td>
    <td valign="top">
      Answers to frequently asked questions.
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td align="right" valign="top">
      <b><asp:HyperLink ID="HyperLink_contact" runat="server" NavigateUrl="mailto:oscartrack@frompaper2web.com">Contact</asp:HyperLink></b>
    </td>
    <td valign="top">
      the KEYclick System Administrator.
    </td>
  </tr>
</table>
