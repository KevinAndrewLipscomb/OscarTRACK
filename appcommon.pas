unit appcommon;

interface

uses
  system.configuration,
  system.web.UI.WebControls;

const
  NOT_APPLICABLE_INDICATION_HTML = '-&nbsp;-&nbsp;-';

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
  + '<table cellpadding="10" cellspacing="0" border="0">'
  +   '<tr>'
  +     '<td valign=middle>'
  +       '<img src="https://sslws010.alentus.com/frompaper2web/' + ConfigurationSettings.AppSettings['application_name'] + '/protected/image/vbemspatch150.jpg" height="145" width="149">'
  +     '</td>'
  +     '<td valign=middle>'
  +       '<img src="https://sslws010.alentus.com/frompaper2web/' + ConfigurationSettings.AppSettings['application_name'] + '/protected/image/vbemslogosmall.jpg" height="127" width="500">'
  +     '</td>'
  +     '<td valign=middle>'
  +       '<img src="https://sslws010.alentus.com/frompaper2web/' + ConfigurationSettings.AppSettings['application_name'] + '/protected/image/cityseal150.jpg" height="138" width="139">'
  +     '</td>'
  +   '</tr>'
  + '</table>'
  + '<table cellspacing="0" cellpadding="10" width="100%" border="0">'
  + '	 <tr>'
  + '		 <td valign="top" width="10%">'
  + '      <h3>' + ConfigurationSettings.AppSettings['application_name'] + '</h3>'
  + '		   <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">'
  + '			   <tr>'
  + '			     <td>'
  + '				     <table cellspacing="0" cellpadding="5" border="0" width="100%">'
  + '					     <tr>'
  + '					       <td bgcolor="#f5f5f5"><small><strong>Resources</strong></small></td>'
  + '					     </tr>'
  + '					     <tr>'
  + '					       <td>'
  + '                  <small><small>These links open in a new window.</small></small>'
  + '                  <table cellspacing="0" cellpadding="5" border="0">'
  + '	                   <tr>'
  + '                      <td valign="top"><li></li></td>'
  + '		                   <td><small><a href="http://www.vabeachems.com">VaBeachEMS.com</a></small></td>'
  + '	                   </tr>'
  + '	                   <tr>'
  + '                      <td valign="top"><li></li></td>'
  + '		                   <td><small><a href="http://www.vbgov.com/file_source/dept/ems/Document/103.01.01.EMS_Duty_Policy.pdf">EMS Duty Policy</a></small></td>'
  + '	                   </tr>'
  + '	                   <tr>'
  + '                      <td valign="top"><li></li></td>'
  + '		                   <td><small><a href="http://www.vabeachemstraining.com">VaBeachEmsTraining.com</a></small></td>'
  + '	                   </tr>'
  + '                  </table>'
  + '                </td>'
  + '					     </tr>'
  + '				     </table>'
  + '          </td>'
  + '			   </tr>'
  + '		   </table>'
  + '      <p></p>'
  + '		   <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">'
  + '			   <tr>'
  + '			     <td>'
  + '				     <table cellspacing="0" cellpadding="5" border="0">'
  + '					     <tr><td bgcolor="#f5f5f5"><small><strong>Process improvement</strong></small></td></tr>'
  + '					     <tr><td><small><small>You can help us make this application better!</small></small></td></tr>'
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
