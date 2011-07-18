<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.aspx~template -->
<%@ Page language="c#" Debug="true" Codebehind="likes_and_hates.aspx.cs" AutoEventWireup="True" Inherits="likes_and_hates.TWebForm_likes_and_hates" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="uc3" TagName="UserControl_update_progress_blocker" Src="~/usercontrol/app/UserControl_update_progress_blocker.ascx" %>
<html>
  <head runat="server">
    <!-- $Id$ -->
    <link href="../css/standard.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 7]> <style type="text/css">@import "../css/standard-overrides-for-ie6.css";</style><![endif]-->
  </head>
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
      <table cellpadding="0" cellspacing="0" border="1" bordercolor="gainsboro">
        <tr>
          <td>
            <table cellpadding="10" cellspacing="0" width="100%">
              <tr>
                <td bgcolor="WhiteSmoke">
                  <p><strong>Likes & Hates</strong></p>
                  <p>Making selections on this page <u>degrades</u> optimal scheduling.&nbsp; To be of maximum usefulness to Squad and Community...</p>
                  <blockquote><big><big><asp:HyperLink ID="HyperLink_continue_1" runat="server" Font-Bold="True" Target="_blank">You are encouraged to skip this page and CONTINUE TO STEP 2</asp:HyperLink></big></big></blockquote>
                  <p>There is no gaurantee that selections made on this page will be honored.</p>
                </td>
              </tr>
              <tr>
                <td>
                  <table border="1" bordercolor="silver" cellpadding="20" cellspacing="0" width="66%" align="center">
                    <tr>
                      <td align="center">
                        <b>
                          <i>If all men count with you, but none too much:</i><br />
                          <small>--Rudyard Kipling</small>
                        </b>
                        <small>
                          <p>Click the <<< arrows on this side if your desire to run with a particular person <u>outweighs</u> your desire to run when you are most needed.</p>
                          <p>You may work well together, but the more flexible you and your friends are, the better off Squad and Community will be.</p>
                        </small>
                      </td>
                      <td align="center">
                        <b>
                          DON'T BE A HATER!
                        </b>
                        <small>
                          <p>Click the >>> arrows on this side if your desire to avoid a particular person <u>outweighs</u> your desire to run when you are most needed.</p>
                          <p>If this situation persists, Squad and Community suffer.&nbsp; Work to resolve these situations ASAP.</p>
                        </small>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td align="center">
                  <p>When done, <big><asp:HyperLink ID="HyperLink_continue_2" runat="server" Font-Bold="True" Target="_blank">CONTINUE TO STEP 2</asp:HyperLink></big></p>
                  <asp:UpdatePanel ID="UpdatePanel_control" runat="server">
                    <ContentTemplate>
                      <asp:DataGrid ID="DataGrid_control" runat="server" autogeneratecolumns="False" bordercolor="Gainsboro" borderwidth="1px" cellpadding="5" gridlines="Horizontal" useaccessibleheader="True">
                        <HeaderStyle backcolor="WhiteSmoke" />
                        <Columns>
                          <asp:BoundColumn DataField="object_member_id" Visible="False"></asp:BoundColumn>
                          <asp:BoundColumn DataField="be_liked" HeaderText="LIKE" ReadOnly="True"></asp:BoundColumn>
                          <asp:ButtonColumn CommandName="Like" Text="&lt;&lt;&lt;"></asp:ButtonColumn>
                          <asp:BoundColumn DataField="name" HeaderText="Team Member" ReadOnly="True"></asp:BoundColumn>
                          <asp:ButtonColumn CommandName="Hate" Text="&gt;&gt;&gt;"></asp:ButtonColumn>
                          <asp:BoundColumn DataField="be_hated" HeaderText="HATE" ReadOnly="True"></asp:BoundColumn>
                        </Columns>
                      </asp:DataGrid>
                    </ContentTemplate>
                  </asp:UpdatePanel>
                  <p>When done, <big><asp:HyperLink ID="HyperLink_continue_3" runat="server" Font-Bold="True" Target="_blank">CONTINUE TO STEP 2</asp:HyperLink></big></p>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
      <uc3:UserControl_update_progress_blocker id="UserControl_update_progress_blocker_control" runat="server"></uc3:UserControl_update_progress_blocker>
    </form>
  </body>
</html>
