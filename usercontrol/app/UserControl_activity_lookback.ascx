<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_activity_lookback.ascx.cs" Inherits="UserControl_activity_lookback.TWebUserControl_activity_lookback"%>
<!-- Derived from KiAspdotnetFramework/usercontrol/app/UserControl~template~datagrid~sortable.ascx-template -->
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
      <tr>
        <td>
          <table cellspacing="0" cellpadding="10" border="0">
            <tr>
              <td bgcolor="#dcdcdc">
                <table cellspacing="0" cellpadding="0" border="0">
                  <tr>
                    <td>
                      <strong>Filter:&nbsp;<asp:DropDownList id="DropDownList_filter" runat="server" autopostback="True"></asp:DropDownList></strong>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td align="right">
                      <asp:Literal ID="Literal_num_members" runat="server"></asp:Literal> members
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr id="TableRow_none" runat="server"><td><em>--&nbsp;NONE&nbsp;--</em></td></tr>
            <tr>
              <td>
                <asp:DataGrid id="DataGrid_control" runat="server" gridlines="Horizontal" cellpadding="1" autogeneratecolumns="False" allowsorting="True">
                  <Columns>
                    <asp:ButtonColumn text="&lt;IMG src=&quot;~/protected/image/open_document16_h.png&quot; alt=&quot;Detail&quot; border=&quot;0&quot; height=&quot;16&quot; width=&quot;16&quot; /&gt;" commandname="Select"></asp:ButtonColumn>
                    <asp:BoundColumn datafield="member_id" visible="false"></asp:BoundColumn>
                    <asp:BoundColumn datafield="cad_num" headertext="CAD #" sortexpression="cad_num%"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="last_name" headertext="Last name" sortexpression="last_name%,first_name,cad_num"><HeaderStyle VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="first_name" headertext="First name" sortexpression="first_name%,last_name,cad_num"><HeaderStyle VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="year_duty_hours" headertext="Duty hours this YEAR" sortexpression="year_duty_hours%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Font-Bold="true"/><ItemStyle Font-Bold="true" /></asp:BoundColumn>
                    <asp:BoundColumn datafield="year_base_obligation" headertext="Base obligation this YEAR" sortexpression="year_base_obligation%,year_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Font-Bold="true"/><ItemStyle Font-Bold="true" /></asp:BoundColumn>
                    <asp:BoundColumn datafield="year_pct_of_base" headertext="% base ob this YEAR" sortexpression="year_pct_of_base%,year_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Font-Bold="true"/><ItemStyle Font-Bold="true" /></asp:BoundColumn>
                    <asp:BoundColumn datafield="year_effective_obligation" headertext="Effective obligation this YEAR" sortexpression="year_effective_obligation%,year_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Font-Bold="true"/><ItemStyle Font-Bold="true" /></asp:BoundColumn>
                    <asp:BoundColumn datafield="year_pct_of_effective" headertext="% effective ob this YEAR" sortexpression="year_pct_of_effective%,year_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Font-Bold="true"/><ItemStyle Font-Bold="true" /></asp:BoundColumn>
                    <asp:BoundColumn datafield="jan_duty_hours" headertext="JAN duty hours" sortexpression="jan_duty_hours%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="jan_enrollment" headertext="JAN enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="jan_base_obligation" headertext="JAN base ob" sortexpression="jan_base_obligation%,jan_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="jan_pct_of_base" headertext="% JAN base ob" sortexpression="jan_pct_of_base%,jan_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="jan_leave" headertext="JAN leave"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="jan_effective_obligation" headertext="JAN effective ob" sortexpression="jan_effective_obligation%,jan_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="jan_pct_of_effective" headertext="% JAN effective ob" sortexpression="jan_pct_of_effective%,jan_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="feb_duty_hours" headertext="FEB duty hours" sortexpression="feb_duty_hours%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="feb_enrollment" headertext="FEB enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="feb_base_obligation" headertext="FEB base ob" sortexpression="feb_base_obligation%,feb_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="feb_pct_of_base" headertext="% FEB base ob" sortexpression="feb_pct_of_base%,feb_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="feb_leave" headertext="FEB leave"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="feb_effective_obligation" headertext="FEB effective ob" sortexpression="feb_effective_obligation%,feb_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="feb_pct_of_effective" headertext="% FEB effective ob" sortexpression="feb_pct_of_effective%,feb_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="mar_duty_hours" headertext="MAR duty hours" sortexpression="mar_duty_hours%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="mar_enrollment" headertext="MAR enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="mar_base_obligation" headertext="MAR base ob" sortexpression="mar_base_obligation%,mar_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="mar_pct_of_base" headertext="% MAR base ob" sortexpression="mar_pct_of_base%,mar_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="mar_leave" headertext="MAR leave"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="mar_effective_obligation" headertext="MAR effective ob" sortexpression="mar_effective_obligation%,mar_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="mar_pct_of_effective" headertext="% MAR effective ob" sortexpression="mar_pct_of_effective%,mar_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="apr_duty_hours" headertext="APR duty hours" sortexpression="apr_duty_hours%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="apr_enrollment" headertext="APR enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="apr_base_obligation" headertext="APR base ob" sortexpression="apr_base_obligation%,apr_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="apr_pct_of_base" headertext="% APR base ob" sortexpression="apr_pct_of_base%,apr_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="apr_leave" headertext="APR leave"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="apr_effective_obligation" headertext="APR effective ob" sortexpression="apr_effective_obligation%,apr_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="apr_pct_of_effective" headertext="% APR effective ob" sortexpression="apr_pct_of_effective%,apr_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="may_duty_hours" headertext="MAY duty hours" sortexpression="may_duty_hours%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="may_enrollment" headertext="MAY enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="may_base_obligation" headertext="MAY base ob" sortexpression="may_base_obligation%,may_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="may_pct_of_base" headertext="% MAY base ob" sortexpression="may_pct_of_base%,may_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="may_leave" headertext="MAY leave"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="may_effective_obligation" headertext="MAY effective ob" sortexpression="may_effective_obligation%,may_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="may_pct_of_effective" headertext="% MAY effective ob" sortexpression="may_pct_of_effective%,may_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="jun_duty_hours" headertext="JUN duty hours" sortexpression="jun_duty_hours%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="jun_enrollment" headertext="JUN enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="jun_base_obligation" headertext="JUN base ob" sortexpression="jun_base_obligation%,jun_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="jun_pct_of_base" headertext="% JUN base ob" sortexpression="jun_pct_of_base%,jun_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="jun_leave" headertext="JUN leave"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="jun_effective_obligation" headertext="JUN effective ob" sortexpression="jun_effective_obligation%,jun_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="jun_pct_of_effective" headertext="% JUN effective ob" sortexpression="jun_pct_of_effective%,jun_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="jul_duty_hours" headertext="JUL duty hours" sortexpression="jul_duty_hours%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="jul_enrollment" headertext="JUL enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="jul_base_obligation" headertext="JUL base ob" sortexpression="jul_base_obligation%,jul_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="jul_pct_of_base" headertext="% JUL base ob" sortexpression="jul_pct_of_base%,jul_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="jul_leave" headertext="JUL leave"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="jul_effective_obligation" headertext="JUL effective ob" sortexpression="jul_effective_obligation%,jul_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="jul_pct_of_effective" headertext="% JUL effective ob" sortexpression="jul_pct_of_effective%,jul_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="aug_duty_hours" headertext="AUG duty hours" sortexpression="aug_duty_hours%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="aug_enrollment" headertext="AUG enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="aug_base_obligation" headertext="AUG base ob" sortexpression="aug_base_obligation%,aug_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="aug_pct_of_base" headertext="% AUG base ob" sortexpression="aug_pct_of_base%,aug_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="aug_leave" headertext="AUG leave"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="aug_effective_obligation" headertext="AUG effective ob" sortexpression="aug_effective_obligation%,aug_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="aug_pct_of_effective" headertext="% AUG effective ob" sortexpression="aug_pct_of_effective%,aug_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="sep_duty_hours" headertext="SEP duty hours" sortexpression="sep_duty_hours%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="sep_enrollment" headertext="SEP enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="sep_base_obligation" headertext="SEP base ob" sortexpression="sep_base_obligation%,sep_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="sep_pct_of_base" headertext="% SEP base ob" sortexpression="sep_pct_of_base%,sep_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="sep_leave" headertext="SEP leave"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="sep_effective_obligation" headertext="SEP effective ob" sortexpression="sep_effective_obligation%,sep_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="sep_pct_of_effective" headertext="% SEP effective ob" sortexpression="sep_pct_of_effective%,sep_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="oct_duty_hours" headertext="OCT duty hours" sortexpression="oct_duty_hours%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="oct_enrollment" headertext="OCT enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="oct_base_obligation" headertext="OCT base ob" sortexpression="oct_base_obligation%,oct_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="oct_pct_of_base" headertext="% OCT base ob" sortexpression="oct_pct_of_base%,oct_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="oct_leave" headertext="OCT leave"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="oct_effective_obligation" headertext="OCT effective ob" sortexpression="oct_effective_obligation%,oct_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="oct_pct_of_effective" headertext="% OCT effective ob" sortexpression="oct_pct_of_effective%,oct_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="nov_duty_hours" headertext="NOV duty hours" sortexpression="nov_duty_hours%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="nov_enrollment" headertext="NOV enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="nov_base_obligation" headertext="NOV base ob" sortexpression="nov_base_obligation%,nov_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="nov_pct_of_base" headertext="% NOV base ob" sortexpression="nov_pct_of_base%,nov_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="nov_leave" headertext="NOV leave"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="nov_effective_obligation" headertext="NOV effective ob" sortexpression="nov_effective_obligation%,nov_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="nov_pct_of_effective" headertext="% NOV effective ob" sortexpression="nov_pct_of_effective%,nov_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="dec_duty_hours" headertext="DEC duty hours" sortexpression="dec_duty_hours%,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="dec_enrollment" headertext="DEC enrollment"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="dec_base_obligation" headertext="DEC base ob" sortexpression="dec_base_obligation%,dec_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="dec_pct_of_base" headertext="% DEC base ob" sortexpression="dec_pct_of_base%,dec_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="dec_leave" headertext="DEC leave"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="dec_effective_obligation" headertext="DEC effective ob" sortexpression="dec_effective_obligation%,dec_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                    <asp:BoundColumn datafield="dec_pct_of_effective" headertext="% DEC effective ob" sortexpression="dec_pct_of_effective%,dec_duty_hours,cad_num"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom"/></asp:BoundColumn>
                  </Columns>
                  <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
                </asp:DataGrid>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>
