<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_update_progress_blocker.pas" Inherits="UserControl_update_progress_blocker.TWebUserControl_update_progress_blocker"%>
<asp:UpdateProgress id="UpdateProgress_control" runat="server">
  <ProgressTemplate>
    <div id="Div_progress_indicator_outer"></div>
    <div id="Div_progress_indicator_inner">
      <center>
        <p><big><big><strong>-&nbsp;-&nbsp;-&nbsp;&nbsp;&nbsp;P&nbsp;R&nbsp;O&nbsp;C&nbsp;E&nbsp;S&nbsp;S&nbsp;I&nbsp;N&nbsp;G&nbsp;&nbsp;&nbsp;-&nbsp;-&nbsp;-</strong></big></big></p>
        <asp:Image id="Image_processing_indicator" runat="server" imageurl="~/protected/image/processing-indicator.gif"></asp:Image>
      </center>
    </div>
  </ProgressTemplate>
</asp:UpdateProgress>
