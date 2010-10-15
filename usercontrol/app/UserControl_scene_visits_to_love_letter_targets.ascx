<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_scene_visits_to_love_letter_targets.ascx.cs" Inherits="UserControl_scene_visits_to_love_letter_targets.TWebUserControl_scene_visits_to_love_letter_targets"%>
<style type="text/css">
  .style1
  {
    width: 100%;
  }
</style>
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" width="100%" border="0">
        <tr bgcolor="#f5f5f5">
          <td>
          </td>
        </tr>
        <tr>
          <td>
            <table cellpadding="5" cellspacing="0" class="style1">
              <tr>
                <td style="text-align: center">
                  Scenes visited</td>
                <td>
                  &nbsp;</td>
                <td style="text-align: center">
                  Love letter targets</td>
              </tr>
              <tr>
                <td align="center">
                  <asp:TextBox ID="TextBox_scene_visits" runat="server" Columns="45" Rows="40" TextMode="MultiLine" Wrap="False"></asp:TextBox>
                </td>
                <td style="text-align: center" valign="top">
                  Batch designator:<br />
                  <asp:TextBox ID="TextBox_batch_designator" runat="server" Columns="9" MaxLength="9"></asp:TextBox>
                  <br />
                  <br />
                  <asp:Button ID="Button_process" runat="server" Text="=&gt; Process =&gt;" onclick="Button_process_Click" />
                </td>
                <td align="center">
                  <asp:TextBox ID="TextBox_love_letter_targets" runat="server" Columns="45" ReadOnly="True" Rows="40" TextMode="MultiLine" Wrap="False"></asp:TextBox>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>