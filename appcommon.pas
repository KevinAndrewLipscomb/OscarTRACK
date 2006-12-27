unit appcommon;

interface

uses
  system.configuration,
  system.web.UI.WebControls;

const ID = '$Id$';

procedure PopulatePlaceHolders
  (
  var precontent: System.Web.Ui.WebControls.PlaceHolder;
  var postcontent: System.Web.Ui.WebControls.PlaceHolder
  );

implementation

PROCEDURE PopulatePrecontent(var precontent: System.Web.Ui.WebControls.PlaceHolder);
var
  literal: System.Web.Ui.WebControls.Literal;
  validation_summary_control: System.Web.Ui.WebControls.ValidationSummary;
begin
  literal := System.Web.Ui.WebControls.Literal.Create;
  literal.Text := ''
  + '<table cellpadding=5>'
  +   '<tr>'
  +     '<td nowrap valign=top width=1>'
  +       '[Logo&nbsp;cell]'
  +     '</td>'
  +     '<td nowrap valign=top>'
  +       '[Detail&nbsp;cell]'
  +     '</td>'
  +   '</tr>'
  + '</table>'
  + '<h1>' + ConfigurationSettings.AppSettings['application_name'] + ' system</h1>'
  + '<table cellspacing="0" cellpadding="10" width="100%" border="0">'
  + '	 <tr>'
  + '		 <td valign="top" width="15%">'
  + '		   <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">'
  + '			   <tr>'
  + '			     <td>'
  + '				     <table cellspacing="0" cellpadding="5" border="0">'
  + '					     <tr>'
  + '					       <td bgcolor="#f5f5f5"><small><strong>Resources</strong></small></td>'
  + '					     </tr>'
  + '					     <tr>'
  + '					       <td>'
  + '                  <small><small>These links open in a new window.</small></small>'
  + '                  <table cellspacing="0" cellpadding="5" border="0">'
  + '	                   <tr>'
  + '                      <td valign="top"><li></li></td>'
  + '		                   <td><small>Resource1</small></td>'
  + '	                   </tr>'
  + '	                   <tr>'
  + '                      <td valign="top"><li></li></td>'
  + '		                   <td><small>Resource2</small></td>'
  + '	                   </tr>'
  + '	                   <tr>'
  + '                      <td valign="top"><li></li></td>'
  + '		                   <td><small>Resource3</small></td>'
  + '	                   </tr>'
  + '                  </table>'
  + '                </td>'
  + '					     </tr>'
  + '				     </table>'
  + '          </td>'
  + '			   </tr>'
  + '		   </table>'
  + '      <p></p>'
  + '		   <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">'
  + '			   <tr>'
  + '			     <td>'
  + '				     <table cellspacing="0" cellpadding="5" border="0">'
  + '					     <tr><td bgcolor="#f5f5f5"><small><strong>Process improvement</strong></small></td></tr>'
  + '					     <tr><td><small><small>You can help us make this application better!</small></small></td></tr>'
  + '              <tr>'
  + '                <td>'
  + '                  <small><small>Copy any fatal errors and paste them into an email '
  + '                    <a href="mailto:feedback@frompaper2web.com?subject=OSCAR%20bug%20report">here</a>.</small></small>'
  + '                </td>'
  + '              </tr>'
  + '              <tr><td><small><small>Send suggestions <a href="mailto:feedback@frompaper2web.com?subject=OSCAR%20suggestion">here</a>.</small></small></td></tr>'
  + '              <tr><td><small><small><strong>Thanks!</strong></small></small></td></tr>'
  + '				     </table>'
  + '          </td>'
  + '			   </tr>'
  + '		   </table>'
  + '    </td>'
  + '		 <td valign="top">';
  precontent.Controls.Add(literal);
  validation_summary_control := System.Web.Ui.WebControls.ValidationSummary.Create;
  precontent.Controls.Add(validation_summary_control);
end;

PROCEDURE PopulatePostcontent(var postcontent: System.Web.Ui.WebControls.PlaceHolder);
var
  literal: System.Web.Ui.WebControls.Literal;
begin
  literal := System.Web.Ui.WebControls.Literal.Create;
  literal.Text := ''
  + '    </td>'
  + '	 </tr>'
  + '</table>'
  + '<!-- Copyright Kalips''o Infogistics LLC -->';
  postcontent.Controls.Add(literal);
end;

PROCEDURE PopulatePlaceHolders
  (
  var precontent: System.Web.Ui.WebControls.PlaceHolder;
  var postcontent: System.Web.Ui.WebControls.PlaceHolder
  );
begin
PopulatePrecontent(precontent);
PopulatePostcontent(postcontent);
end;

end.
