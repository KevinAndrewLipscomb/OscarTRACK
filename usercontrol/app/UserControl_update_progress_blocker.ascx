<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_update_progress_blocker.pas" Inherits="UserControl_update_progress_blocker.TWebUserControl_update_progress_blocker"%>
<asp:UpdateProgress id="UpdateProgress_control" runat="server">
  <ProgressTemplate>
    <div id="Div_progress_indicator_outer" style="position:fixed; top:0px; bottom:0px; left:0px; right:0px; overflow:hidden; padding:0; margin:0; background-color:#000; filter:alpha(opacity=85); opacity:0.85; z-index:1000;"></div>
    <div id="Div_progress_indicator_inner" style="position:fixed; top:35%; left:32%; padding:50px; z-index:1001; background-color:#fff; border:solid 1px black;">
      <center>
        <p><big><big><strong>-&nbsp;-&nbsp;-&nbsp;&nbsp;&nbsp;P&nbsp;R&nbsp;O&nbsp;C&nbsp;E&nbsp;S&nbsp;S&nbsp;I&nbsp;N&nbsp;G&nbsp;&nbsp;&nbsp;-&nbsp;-&nbsp;-</strong></big></big></p>
        <asp:Image id="Image_processing_indicator" runat="server" imageurl="~/protected/image/processing-indicator.gif"></asp:Image>
      </center>
    </div>
  </ProgressTemplate>
</asp:UpdateProgress>
