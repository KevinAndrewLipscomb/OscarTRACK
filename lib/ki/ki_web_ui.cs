using kix;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.IO;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ki_web_ui
  {

  static class common
    {
    public const string APP_HANDLED_ASYNC_POST_BACK_ERROR_MESSAGE_HEADER_VALUE = "App-Handled-Message";
      // For use with CUSTOM_RESPONSE_HEADER_NAME if we can ever add this combination as an HTTP partial postback response header .
      // Must correspond to the APP_HANDLED_ERROR_MESSAGE_LINE in ErrorHandler.js
    public const string CUSTOM_RESPONSE_HEADER_NAME = "KiAspdotnetFramework-Pragma";
    public const string SESSION_INTERRUPTED_HEADER_VALUE = "Session-Interrupted";
    public const string VALIDATION_ALERT = "Something about the data you just submitted is invalid.  Look for !ERR! indications near the data fields.  A more detailed explanation may appear near the top of the page.";
    //
    public const string APP_HANDLED_ASYNC_POST_BACK_ERROR_MESSAGE_MARK = "-=:" + APP_HANDLED_ASYNC_POST_BACK_ERROR_MESSAGE_HEADER_VALUE + ":=-" + k.NEW_LINE;
      // For use as a workaround since we can't alter HTTP partial postback headers.
      // Must correspond to the APP_HANDLED_ERROR_MESSAGE_LINE in ErrorHandler.js
    }
  
  // ==================================================================================================================================
  // templatecontrol_class
  // ==================================================================================================================================
  public class templatecontrol_class : TemplateControl
    {

    #pragma warning disable CA1822 // Member does not access instance data and can be marked as static

    public templatecontrol_class() : base() // CONSTRUCTOR
      {
      }

    internal void LabelizeAndSetTextForeColor
      (
      TableCell table_cell,
      Color fore_color
      )
      {
      var the_label = new Label();
      the_label.ForeColor = fore_color;
      the_label.Text = table_cell.Text;
      table_cell.Text = k.EMPTY;
      table_cell.Controls.Add(the_label);
      }

    protected override void OnInit(EventArgs e)
      {
      base.OnInit(e);
      TemplateControl = new templatecontrol_class();
      }

    public void AddCopyFromFeatureToControl
      (
      Page the_page,
      string instance_function_name,
      Dictionary<WebControl,WebControl> target_source_dictionary,
      WebControl c
      )
      {
      EstablishClientSideFunction
        (
        the_page:the_page,
        enumeral: k.client_side_function_enumeral_type.EL
        );
      //
      var body = k.EMPTY;
      foreach (var target_source in target_source_dictionary)
        {
        body += "El('" + target_source.Key.ClientID + "').value = El('" + target_source.Value.ClientID + "').value;" + k.NEW_LINE;
        }
      //
      EstablishClientSideFunction
        (
        the_page:the_page,
        profile: instance_function_name + "()",
        body: body
        );
      //
      c.Attributes.Add
        (
        key: "OnClick",
        value: instance_function_name + "(); return false;" // Appending "return false;" prevents a postback.
        );
      }

    public string AddIdentifiedControlToPlaceHolder
      (
      Page the_page,
      Control c,
      string id,
      PlaceHolder p,
      string instance_context_id_for_freshening = k.EMPTY
      )
      {
      //
      // Without specifying an ID for a dynamically-added control, ASP.NET supplies its own ID for the control.  The problem is that
      // ASP.NET may specify one ID for the control at initial page presentation time and another ID at postback page presentation.
      // Because postback events are tied to the ID of the control generating the postback, ASP.NET's ID assignment behavior may result
      // in a postback event that is ignored the first time (but not subsequent times).
      //
      if (instance_context_id_for_freshening.Length > 0)
        {
        the_page.Session.Remove((instance_context_id_for_freshening + (instance_context_id_for_freshening.Contains(".UserControl_") ? "_" : ".UserControl_") + id.Replace("UserControl",k.EMPTY)).Replace("__","_") + ".p");
        }
      c.ID = id;
      p.Controls.Add(c);
      return id;
      }

    public void Alert
      (
      Page the_page,
      k.alert_cause_type cause,
      k.alert_state_type state,
      string key,
      string value,
      bool be_using_scriptmanager = false // Ideally the default should be true, but for backward compatibility (particularly in WebEMSOF) we default to false.
      )
      {
      var script = "alert(\"" + AlertMessage(ConfigurationManager.AppSettings["application_name"],cause,state,key,value).Replace(Convert.ToString(k.NEW_LINE),"\\n").Replace(k.TAB,"\\t") + "\");";
      if (be_using_scriptmanager)
        {
        ScriptManager.RegisterStartupScript
          (
          control:the_page,
          type:the_page.GetType(),
          key:key,
          script:script,
          addScriptTags:true
          );
        }
      else
        {
        the_page.ClientScript.RegisterStartupScript
          (
          type:the_page.GetType(),
          key:key,
          script:script,
          addScriptTags:true
          );
        }
      }

    public string AlertMessage
      (
      string application_name,
      k.alert_cause_type cause,
      k.alert_state_type state,
      string key,
      string s
      )
      {
      return k.EMPTY
      + "- - - ---------------------------------------------------- - - -"
      + k.NEW_LINE
      + "       issuer:  " + k.TAB + application_name + k.NEW_LINE
      + "       cause:   " + k.TAB + cause.ToString().ToLower() + k.NEW_LINE
      + "       state:   " + k.TAB + state.ToString().ToLower() + k.NEW_LINE
      + "       key:     " + k.TAB + key.ToLower() + k.NEW_LINE
      + "       time:    " + k.TAB + DateTime.Now.ToString("s") + k.NEW_LINE
      + "- - - ---------------------------------------------------- - - -" + k.NEW_LINE
      + k.NEW_LINE
      + k.NEW_LINE
      + s + k.NEW_LINE
      + k.NEW_LINE;
      }

    public void EstablishClientSideFunction
      (
      Page the_page,
      string profile,
      string body,
      string usercontrol_clientid = k.EMPTY
      )
      {
      the_page.ClientScript.RegisterClientScriptBlock
        (
        the_page.GetType(),
        usercontrol_clientid + "__" + profile.Remove(profile.IndexOf(k.OPEN_PARENTHESIS)),
        "function " + profile + k.NEW_LINE
        + " {" + k.NEW_LINE
        + ' ' + body.Replace(Convert.ToString(k.NEW_LINE),Convert.ToString(k.NEW_LINE + k.SPACE)) + k.NEW_LINE
        + " }" + k.NEW_LINE,
        true
        );
      }

    public void EstablishClientSideFunction
      (
      Page the_page,
      k.client_side_function_enumeral_type enumeral
      )
      {
      if (enumeral == k.client_side_function_enumeral_type.EL)
        {
        EstablishClientSideFunction
          (
          the_page:the_page,
          profile:"El(id)",
          body:"return document.getElementById(id);"
          );
        }
      else if (enumeral == k.client_side_function_enumeral_type.KGS_TO_LBS)
        {
        EstablishClientSideFunction
          (
          the_page:the_page,
          profile:"KgsToLbs(num_kgs)",
          body:"return Math.round(+num_kgs*2.204622);"
          );
        }
      else if (enumeral == k.client_side_function_enumeral_type.LBS_TO_KGS)
        {
        EstablishClientSideFunction
          (
          the_page:the_page,
          profile:"LbsToKgs(num_lbs)",
          body:"return Math.round(+num_lbs/2.204622);"
          );
        }
      else if (enumeral == k.client_side_function_enumeral_type.REMOVE_EL)
        {
        EstablishClientSideFunction
          (
          the_page:the_page,
          profile:"RemoveEl(id)",
          body:"condemned_el = El(id); condemned_el.parentNode.removeChild(condemned_el);"
          );
        }
      }

    public void EstablishClientSideFunction
      (
      Page the_page,
      k.client_side_function_rec_type r
      )
      {
      EstablishClientSideFunction
        (
        the_page:the_page,
        profile:r.profile,
        body:r.body
        );
      }

    public void EstablishFormReenablementScript(Page the_page)
      {
      the_page.ClientScript.RegisterClientScriptBlock
        (
        GetType(),
        "FormReenablementScript",
        "window.onLoad = document.getElementById('Form_control').disabled = false;" + k.NEW_LINE,
        true
        );
      }

    public void EstablishGoogleWebFontLoader
      (
      Page the_page,
      string web_font_config
      )
      {
      //
      // NOTE: The value of the "key" query parameter must be registered on the Google Developers Console as an API key with a Referrer value of "frompaper2web.com/*".
      //
      the_page.ClientScript.RegisterClientScriptInclude
        (
        key:"GoogleWebFontLoaderInclude",
        url:"https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js?key=AIzaSyADewoPKVk4Yu42GkxP1zpihWZts78ig_8"
        );
      the_page.ClientScript.RegisterClientScriptBlock
        (
        type:the_page.GetType(),
        key:"GoogleWebFontLoaderBlock",
        script:"WebFont.load({" + web_font_config + "});",
        addScriptTags:true
        );
      }

    public void EstablishUpdatePanelCompliantTimeoutHandler
      (
      Page the_page,
      int redirect_timeout,
      string path_to_timeout_page
      )
      {
      the_page.ClientScript.RegisterClientScriptBlock
        (
        type:the_page.GetType(),
        key:"UpdatePanelCompliantTimeoutHandler",
        script:"var redirect_timer; clearTimeout(redirect_timer); redirect_timer = setTimeout('window.location.href=\"" + path_to_timeout_page + "\";'," + redirect_timeout.ToString() + ");" + k.NEW_LINE,
        addScriptTags:true
        );
      }

    public void ExportToCsv
      (
      Page the_page,
      string filename_sans_extension,
      string csv_string
      )
      {
      the_page.Response.ClearHeaders(); // Clear out the effects of generating no-cache & no-store headers in UserControl_precontent.
      the_page.Response.Clear();
      the_page.Response.AppendHeader("Content-Disposition", "attachment; filename=\"" + filename_sans_extension + ".csv\"");  //Don't enclose filename in apostrophes.
      the_page.Response.BufferOutput = true;
      the_page.Response.ContentType = "text/csv";
      the_page.EnableViewState = false;
      the_page.Response.Write(csv_string);
      the_page.Response.End();
      }

    public void ExportToExcel
      (
      Page the_page,
      string filename_sans_extension,
      string excel_string
      )
      {
      //
      // Note that if the excel_string you supply to this routine is actually in HTML or XMLSS format and the end-user uses MS Excel 2007 or later, Excel will prompt the end-user whether to continue opening the file,
      // because this routine sends the file with an XLS extension (which implies BFF content).  Adjusting the ContentType (MIME type) will not help.  Consider alerting the end-user that it's ok to respond "Yes" to
      // continue opening the file in Excel.
      //
      the_page.Response.ClearHeaders(); // Clear out the effects of generating no-cache & no-store headers in UserControl_precontent.
      the_page.Response.Clear();
      the_page.Response.AppendHeader("Content-Disposition", "attachment; filename=\"" + filename_sans_extension + ".xls\"");  //Don't wrap filename in apostrophes.
      the_page.Response.BufferOutput = true;
      the_page.Response.ContentType = "application/vnd.ms-excel";
      the_page.EnableViewState = false;
      the_page.Response.Write(excel_string);
      the_page.Response.End();
      }

    public void FileDownload
      (
      Page the_page,
      string filename
      )
      {
      the_page.Response.ClearHeaders(); // Clear out the effects of generating no-cache & no-store headers in UserControl_precontent.
      the_page.Response.Clear();
      the_page.Response.AppendHeader("Content-Disposition", "attachment; filename=\"" + Path.GetFileName(filename) + "\"");  //Don't enclose filename in apostrophes.
      the_page.Response.BufferOutput = true;
      the_page.Response.ContentType = "application/octet-stream";
      the_page.EnableViewState = false;
      the_page.Response.TransmitFile(filename);
      the_page.Response.End();
      }

    //
    // This routine is most likely insufficient and deprecated.  Use the control's built-in .Focus() method instead.
    //
    public void Focus
      (
      Page the_page,
      Control c,
      bool be_using_scriptmanager = false, // Ideally the default should be true, but for backward compatibility (particularly in WebEMSOF) we default to false.
      bool be_redo = false
      )
      {
      var key = "SetFocus";
      var script = k.EMPTY
      + " if (!document.getElementById(\"" + c.ClientID + "\").disabled)"
      +   " {"
      +   " document.getElementById(\"" + c.ClientID + "\").focus();";
      if (be_redo)
        //
        // Place cursor at end of input.  Inefficiency necessary for cross-browser compatibility.
        //
        {
        script += k.EMPTY
        + " var v = document.getElementById(\"" + c.ClientID + "\").value;"
        + " document.getElementById(\"" + c.ClientID + "\").value = '';"
        + " document.getElementById(\"" + c.ClientID + "\").value = v;";
        }
      script += k.EMPTY
      +   " }";
      if (be_using_scriptmanager)
        {
        ScriptManager.RegisterStartupScript
          (
          control:the_page,
          type:the_page.GetType(),
          key:key,
          script:script,
          addScriptTags:true
          );
        }
      else
        {
        Page.ClientScript.RegisterStartupScript
          (
          type:the_page.GetType(),
          key:key,
          script:script,
          addScriptTags:true
          );
        }
      }

    public void MessageBack
      (
      Page the_page,
      object msg,
      string folder_name,
      string aspx_name
      )
      {
      SessionSet
        (
        the_page:the_page,
        name:"msg_" + folder_name + "." + aspx_name,
        value:msg
        );
      }

    public void RequireConfirmation(WebControl c, string prompt)
      {
      c.Attributes.Add
        (
        key:"onclick",
        value:"if(!confirm(\"- - - ---------------------------------------------------- - - -\\n"
        +                   "       issuer:  \\t" + ConfigurationManager.AppSettings["application_name"] + "\\n"
        +                   "       state:   \\twarning\\n" + "       time:    \\t" + DateTime.Now.ToString("s") + "\\n"
        +                   "- - - ---------------------------------------------------- - - -\\n\\n\\n"
        + prompt.Replace(Convert.ToString(k.NEW_LINE),"\\n")
        +                   "\\n\\n\""
        +                   ")) return false;"
        );
      }

    public void SessionSet
      (
      Page the_page,
      string name,
      object value
      )
      {
      the_page.Session.Remove(name);
      the_page.Session.Add(name,value);
      }

    public string ShieldedQueryStringOfHashtable
      (
      Page the_page,
      Hashtable hash_table,
      bool do_compress = false
      )
      {
      return "q=" + the_page.Server.UrlEncode(k.ShieldedValueOfHashtable(hash_table,do_compress));
      }

    public string StringOfControl(Control c)
      {
      var string_writer = new StringWriter();
      using var html_text_writer = new HtmlTextWriter(string_writer);
      c.RenderControl(html_text_writer);
      return string_writer.ToString();
      }

    public void TransferToPageBinderTab
      (
      Page the_page,
      string page_nick,
      string binder_nick,
      uint tab_index
      )
      {
      SessionSet(the_page,"UserControl_" + binder_nick + "_binder_selected_tab",(tab_index));
      the_page.Server.Transfer(page_nick + ".aspx");
      }

    public void ValidationAlert
      (
      Page the_page,
      bool be_using_scriptmanager
      )
      {
      Alert
        (
        the_page:the_page,
        cause:k.alert_cause_type.USER,
        state:k.alert_state_type.FAILURE,
        key:"stdsvrval",
        value:common.VALIDATION_ALERT,
        be_using_scriptmanager:be_using_scriptmanager
        );
      }

    public void ValidationAlert(Page the_page)
      {
      ValidationAlert
        (
        the_page:the_page,
        be_using_scriptmanager:false
        );
      }

    #pragma warning restore CA1822 // Member does not access instance data and can be marked as static

    } // end templatecontrol_class

  // ==================================================================================================================================
  // PAGE_CLASS
  // ==================================================================================================================================
  public class page_class : Page
    {

    protected readonly static string APP_HANDLED_ASYNC_POST_BACK_ERROR_MESSAGE_HEADER_VALUE = common.APP_HANDLED_ASYNC_POST_BACK_ERROR_MESSAGE_HEADER_VALUE;
    protected readonly static string APP_HANDLED_ASYNC_POST_BACK_ERROR_MESSAGE_MARK = common.APP_HANDLED_ASYNC_POST_BACK_ERROR_MESSAGE_MARK;
    protected readonly static string CUSTOM_RESPONSE_HEADER_NAME = common.CUSTOM_RESPONSE_HEADER_NAME;
    protected readonly static string SESSION_INTERRUPTED_HEADER_VALUE = common.SESSION_INTERRUPTED_HEADER_VALUE;

    public enum nature_of_visit_type
      {
      VISIT_COLD_CALL,
      VISIT_INITIAL,
      VISIT_POSTBACK_STANDARD,
      VISIT_POSTBACK_STALE,
      }

    private readonly templatecontrol_class templatecontrol = null;

    public page_class() : base() // CONSTRUCTOR
      {
      templatecontrol = new templatecontrol_class();
      }

    public void AddCopyFromFeatureToControl
      (
      string instance_function_name,
      Dictionary<WebControl,WebControl> target_source_dictionary,
      WebControl c
      )
      {
      templatecontrol.AddCopyFromFeatureToControl
        (
        the_page:Page,
        instance_function_name:instance_function_name,
        target_source_dictionary:target_source_dictionary,
        c:c
        );
      }

    protected string AddIdentifiedControlToPlaceHolder
      (
      Control c,
      string id,
      PlaceHolder p,
      string instance_context_id_for_freshening = k.EMPTY
      )
      {
      return templatecontrol.AddIdentifiedControlToPlaceHolder(Page,c,id,p,instance_context_id_for_freshening);
      }

    protected void Alert
      (
      k.alert_cause_type cause,
      k.alert_state_type state,
      string key,
      string value,
      bool be_using_scriptmanager = false // Ideally the default should be true, but for backward compatibility (particularly in WebEMSOF) we default to false.
      )
      {
      templatecontrol.Alert(Page,cause,state,key,value,be_using_scriptmanager);
      }

    protected void AlertAndBackTrack
      (
      k.alert_cause_type cause,
      k.alert_state_type state,
      string key,
      string value,
      uint num_backsteps = 1
      )
      {
      var script = "alert(\"" + templatecontrol.AlertMessage(ConfigurationManager.AppSettings["application_name"],cause,state,key,value).Replace(Convert.ToString(k.NEW_LINE),"\\n").Replace(k.TAB,"\\t") + "\");";
      Response.Write("<script>" + script + "</script>");
      BackTrack(num_backsteps);
      }

    protected void AlertAndWindowHistoryBack
      (
      k.alert_cause_type cause,
      k.alert_state_type state,
      string key,
      string value
      )
      {
      var script = "alert(\"" + templatecontrol.AlertMessage(ConfigurationManager.AppSettings["application_name"],cause,state,key,value).Replace(Convert.ToString(k.NEW_LINE),"\\n").Replace(k.TAB,"\\t") + "\");";
      Response.Write
        (
        "<script>"
        + script
        + " window.history.back();"
        + "</script>"
        );
      }

    protected void BackTrack(uint num_backsteps = 1)
      {
      var p = "~/Default.aspx";
      var session_index = new k.subtype<int>(0,Session.Count);
      var be_page_p_found = false;
      var key = k.EMPTY;
      if ((Session["waypoint_stack"] != null))
        {
        for (var i = new k.int_positive(); i.val <= num_backsteps; i.val++)
          {
          if (((Session["waypoint_stack"]) as Stack).Count > 0)
            {
            p = ((Session["waypoint_stack"]) as Stack).Pop().ToString();
            for (session_index.val = Session.Count; !be_page_p_found && session_index.val > 0; session_index.val--)
              {
              key = Session.Keys[session_index.val - 1].ToString();
              if (key.EndsWith(".p"))
                {
                Session.Remove(key);
                be_page_p_found = !key.Contains("UserControl");
                }
              }
            }
          }
        }
      if (!File.Exists(path:Server.MapPath(".") + "/" + p))
        {
        if (Session["waypoint_stack"] != null)
          {
          (Session["waypoint_stack"] as Stack).Clear();
          }
        Server.Transfer("~/Default.aspx");
        }
      Server.Transfer(p);
      }

    protected void BeginBreadCrumbTrail()
      {
      SessionSet("waypoint_stack",new Stack());
      }

    protected void LabelizeAndSetTextForeColor
      (
      TableCell table_cell,
      Color fore_color
      )
      {
      templatecontrol.LabelizeAndSetTextForeColor(table_cell,fore_color);
      }

    protected T Message<T>
      (
      string folder_name,
      string aspx_name
      )
      {
      return (T)(Session["msg_" + folder_name + "." + aspx_name]);
      }

    protected void DropCrumbAndTransferTo
      (
      string the_path,
      string anchor_name = k.EMPTY
      )
      {
      var current = Path.GetFileName(Request.CurrentExecutionFilePath);
      if ((Session["waypoint_stack"] != null) && ((((Session["waypoint_stack"]) as Stack).Count == 0) || (((Session["waypoint_stack"]) as Stack).Peek().ToString() != current)))
        {
        ((Session["waypoint_stack"]) as Stack).Push(current);
        }
      if (anchor_name.Length == 0)
        {
        Server.Transfer(the_path);
        }
      else
        {
        Response.Redirect(the_path + "#" + anchor_name);
        }
      }

    protected void EstablishClientSideFunction
      (
      string profile,
      string body
      )
      {
      templatecontrol.EstablishClientSideFunction(Page,profile,body);
      }

    protected void EstablishClientSideFunction(k.client_side_function_enumeral_type enumeral)
    {
    templatecontrol.EstablishClientSideFunction(Page,enumeral);
    }

    protected void EstablishClientSideFunction(k.client_side_function_rec_type r)
      {
      templatecontrol.EstablishClientSideFunction(Page,r);
      }

    protected void EstablishFormReenablementScript()
      {
      templatecontrol.EstablishFormReenablementScript(Page);
      }

    protected void EstablishGoogleWebFontLoader(string web_font_config)
      {
      templatecontrol.EstablishGoogleWebFontLoader(Page,web_font_config);
      }

    public void EstablishUpdatePanelCompliantTimeoutHandler
      (
      int redirect_timeout,
      string path_to_timeout_page
      )
      {
      templatecontrol.EstablishUpdatePanelCompliantTimeoutHandler(Page,redirect_timeout,path_to_timeout_page);
      }

    protected void ExportToCsv
      (
      string filename_sans_extension,
      string csv_string
      )
      {
      templatecontrol.ExportToCsv(Page,filename_sans_extension,csv_string);
      }

    protected void ExportToExcel
      (
      string filename_sans_extension,
      string excel_string
      )
      {
      templatecontrol.ExportToExcel(Page,filename_sans_extension,excel_string);
      }

    protected void FileDownload
      (
      string filename
      )
      {
      templatecontrol.FileDownload(Page,filename);
      }

    //
    // This routine is most likely insufficient and deprecated.  Use the control's built-in .Focus() method instead.
    //
    protected void Focus
      (
      Control c,
      bool be_using_scriptmanager = false, // Ideally the default should be true, but for backward compatibility (particularly in WebEMSOF) we default to false.
      bool be_redo = false
      )
      {
      templatecontrol.Focus(Page,c,be_using_scriptmanager,be_redo);
      }

    protected Hashtable HashtableOfShieldedRequest
      (
      string name = "q",
      bool do_uncompress = false
      )
      {
      return new JavaScriptSerializer().Deserialize<Hashtable>
        (
        k.StringOfShieldedValue
          (
          shielded_value:Request[name],
          do_uncompress:do_uncompress
          )
        );
      }

    public string InstanceId()
      {
      return Page.ToString();
      }

    public void MessageBack
      (
      object msg,
      string folder_name,
      string aspx_name
      )
      {
      templatecontrol.MessageBack(Page,msg,folder_name,aspx_name);
      }

    public void MessageDropCrumbAndTransferTo
      (
      object msg,
      string folder_name,
      string aspx_name,
      string anchor_name = k.EMPTY
      )
      {
      SessionSet("msg_" + folder_name + "." + aspx_name,msg);
      DropCrumbAndTransferTo(aspx_name + ".aspx",anchor_name);
      }

    private nature_of_visit_type NatureOfInvocation
      (
      string expected_session_item_name,
      bool be_timeout_behavior_standard,
      bool be_landing_from_login,
      bool be_cold_call_allowed
      )
      {
      nature_of_visit_type nature_of_invocation;
      bool be_cold_call;
      if (!IsPostBack)
        {
        if (be_landing_from_login)
          {
          be_cold_call_allowed = false;
          be_cold_call = (Session["user_id"] == null) || (Session["username"] == null);
          }
        else
          {
          be_cold_call = (Request.ServerVariables["URL"] == Request.CurrentExecutionFilePath);
          }
        if (be_cold_call)
          {
          nature_of_invocation = nature_of_visit_type.VISIT_COLD_CALL;
          //
          // The request for this page could not have been the result of a Server.Transfer call, and the session state is therefore unknown.  This is rarely allowed.
          //
          if (!be_cold_call_allowed)
            {
            Session.Clear();
            Server.Transfer("~/login.aspx");
            }
          }
        else
          {
          nature_of_invocation = nature_of_visit_type.VISIT_INITIAL;
          }
        }
      else
        {
        if ((Session[expected_session_item_name] != null))
          {
          nature_of_invocation = nature_of_visit_type.VISIT_POSTBACK_STANDARD;
          }
        else
          {
          nature_of_invocation = nature_of_visit_type.VISIT_POSTBACK_STALE;
          if (be_timeout_behavior_standard)
            {
            Server.Transfer("~/timeout.aspx");
            }
          }
        }
      return nature_of_invocation;
      }

    protected nature_of_visit_type NatureOfLanding
      (
      string expected_session_item_name,
      bool be_timeout_behavior_standard = true
      )
      {
      return NatureOfInvocation
        (
        expected_session_item_name:expected_session_item_name,
        be_timeout_behavior_standard:be_timeout_behavior_standard,
        be_landing_from_login:true,
        be_cold_call_allowed:false
        );
      }

    protected nature_of_visit_type NatureOfVisit
      (
      string expected_session_item_name,
      bool be_timeout_behavior_standard = true
      )
      {
      return NatureOfInvocation
        (
        expected_session_item_name:expected_session_item_name,
        be_timeout_behavior_standard:be_timeout_behavior_standard,
        be_landing_from_login:false,
        be_cold_call_allowed:false
        );
      }

    protected nature_of_visit_type NatureOfVisitUnlimited
      (
      string expected_session_item_name,
      bool be_timeout_behavior_standard = true
      )
      {
      return NatureOfInvocation
        (
        expected_session_item_name:expected_session_item_name,
        be_timeout_behavior_standard:be_timeout_behavior_standard,
        be_landing_from_login:false,
        be_cold_call_allowed:true
        );
      }

    protected override void OnInit(EventArgs e)
      {
      base.OnInit(e);
      if (Context.Session != null)
        {
        ViewStateUserKey = Session.SessionID; // Prevents Cross-Site Request Forgery attacks (and bugs?)
        }
      }

    protected void RequireConfirmation
      (
      WebControl c,
      string prompt
      )
      {
      templatecontrol.RequireConfirmation(c,prompt);
      }

    protected void SessionSet
      (
      string name,
      object value
      )
      {
      templatecontrol.SessionSet(Page,name,value);
      }

    protected string ShieldedQueryStringOfHashtable
      (
      Hashtable hash_table,
      bool do_compress = false
      )
      {
      return templatecontrol.ShieldedQueryStringOfHashtable(Page,hash_table,do_compress);
      }

    protected static string ShieldedValueOfHashtable(Hashtable hash_table)
      {
      return k.ShieldedValueOfHashtable(hash_table);
      }

    protected string StringOfControl(Control c)
      {
      return templatecontrol.StringOfControl(c);
      }

    protected void TransferToPageBinderTab
      (
      string page_nick,
      string binder_nick,
      uint tab_index
      )
      {
      templatecontrol.TransferToPageBinderTab(Page,page_nick,binder_nick,tab_index);
      }

    protected void ValidationAlert(bool be_using_scriptmanager = false) // Ideally the default should be true, but for backward compatibility (particularly in WebEMSOF) we default to false.
      {
      templatecontrol.ValidationAlert(Page,be_using_scriptmanager);
      }
      
    } // end page_class

  // ==================================================================================================================================
  // USERCONTROL_CLASS
  // ==================================================================================================================================
  public class usercontrol_class : UserControl
    {

    protected readonly static string APP_HANDLED_ASYNC_POST_BACK_ERROR_MESSAGE_HEADER_VALUE = common.APP_HANDLED_ASYNC_POST_BACK_ERROR_MESSAGE_HEADER_VALUE;
    protected readonly static string APP_HANDLED_ASYNC_POST_BACK_ERROR_MESSAGE_MARK = common.APP_HANDLED_ASYNC_POST_BACK_ERROR_MESSAGE_MARK;
    protected readonly static string CUSTOM_RESPONSE_HEADER_NAME = common.CUSTOM_RESPONSE_HEADER_NAME;
    protected readonly static string SESSION_INTERRUPTED_HEADER_VALUE = common.SESSION_INTERRUPTED_HEADER_VALUE;

    private readonly templatecontrol_class templatecontrol = null;

    public usercontrol_class() : base() // CONSTRUCTOR
      {
      templatecontrol = new templatecontrol_class();
      }

    public void AddCopyFromFeatureToControl
      (
      string instance_function_name,
      Dictionary<WebControl,WebControl> target_source_dictionary,
      WebControl c
      )
      {
      templatecontrol.AddCopyFromFeatureToControl
        (
        the_page:Page,
        instance_function_name:instance_function_name,
        target_source_dictionary:target_source_dictionary,
        c:c
        );
      }

    protected string AddIdentifiedControlToPlaceHolder
      (
      Control c,
      string id,
      PlaceHolder p,
      string instance_context_id_for_freshening = k.EMPTY
      )
      {
      return templatecontrol.AddIdentifiedControlToPlaceHolder(Page,c,id,p,instance_context_id_for_freshening);
      }

    protected void Alert
      (
      k.alert_cause_type cause,
      k.alert_state_type state,
      string key,
      string value,
      bool be_using_scriptmanager = false // Ideally the default should be true, but for backward compatibility (particularly in WebEMSOF) we default to false.
      )
      {
      templatecontrol.Alert(Page,cause,state,key,value,be_using_scriptmanager);
      }

    protected void AlertAndBackTrack
      (
      k.alert_cause_type cause,
      k.alert_state_type state,
      string key,
      string value,
      uint num_backsteps = 1
      )
      {
      var script = "alert(\"" + templatecontrol.AlertMessage(ConfigurationManager.AppSettings["application_name"],cause,state,key,value).Replace(Convert.ToString(k.NEW_LINE),"\\n").Replace(k.TAB,"\\t") + "\");";
      Response.Write("<script>" + script + "</script>");
      BackTrack(num_backsteps);
      }

    protected string AlertMessage
      (
      k.alert_cause_type cause,
      k.alert_state_type state,
      string key,
      string value
      )
      {
      return templatecontrol.AlertMessage(ConfigurationManager.AppSettings["application_name"],cause,state,key,value);
      }

    protected void BackTrack(uint num_backsteps = 1)
      {
      var p = "~/Default.aspx";
      if ((Session["waypoint_stack"] != null))
        {
        for (var i = new k.int_positive(); i.val <= num_backsteps; i.val++)
          {
          if (((Session["waypoint_stack"]) as Stack).Count > 0)
            {
            p = ((Session["waypoint_stack"]) as Stack).Pop().ToString();
            }
          }
        }
      Server.Transfer(p);
      }

    protected void DropCrumbAndTransferTo
      (
      string the_path,
      string anchor_name = k.EMPTY
      )
      {
      var current = Path.GetFileName(Request.CurrentExecutionFilePath);
      if ((Session["waypoint_stack"] != null) && ((((Session["waypoint_stack"]) as Stack).Count == 0) || (((Session["waypoint_stack"]) as Stack).Peek().ToString() != current)))
        {
        ((Session["waypoint_stack"]) as Stack).Push(current);
        }
      if (anchor_name.Length == 0)
        {
        Server.Transfer(the_path);
        }
      else
        {
        Response.Redirect(the_path + "#" + anchor_name);
        }
      }

    protected void EstablishClientSideFunction
      (
      string profile,
      string body
      )
      {
      templatecontrol.EstablishClientSideFunction(Page,profile,body,ClientID);
      }

    protected void EstablishClientSideFunction(k.client_side_function_enumeral_type enumeral)
      {
      templatecontrol.EstablishClientSideFunction(Page,enumeral);
      }

    protected void EstablishClientSideFunction(k.client_side_function_rec_type r)
      {
      templatecontrol.EstablishClientSideFunction(Page,r);
      }

    protected void EstablishFormReenablementScript()
      {
      templatecontrol.EstablishFormReenablementScript(Page);
      }

    protected void EstablishGoogleWebFontLoader(string web_font_config)
      {
      templatecontrol.EstablishGoogleWebFontLoader(Page,web_font_config);
      }

    public void EstablishUpdatePanelCompliantTimeoutHandler
      (
      int redirect_timeout,
      string path_to_timeout_page
      )
      {
      templatecontrol.EstablishUpdatePanelCompliantTimeoutHandler(Page,redirect_timeout,path_to_timeout_page);
      }

    protected void ExportToCsv
      (
      string filename_sans_extension,
      string csv_string
      )
      {
      templatecontrol.ExportToCsv(Page,filename_sans_extension,csv_string);
      }

    protected void ExportToExcel
      (
      string filename_sans_extension,
      string excel_string
      )
      {
      templatecontrol.ExportToExcel(Page,filename_sans_extension,excel_string);
      }

    protected void FileDownload
      (
      string filename
      )
      {
      templatecontrol.FileDownload(Page, filename);
      }

    protected void Focus
      (
      Control c,
      bool be_using_scriptmanager = false, // Ideally the default should be true, but for backward compatibility (particularly in WebEMSOF) we default to false.
      bool be_redo = false
      )
      {
      templatecontrol.Focus(Page,c,be_using_scriptmanager,be_redo);
      }

    public string InstanceId()
      {
      return (Page.ToString() + ".UserControl_" + ClientID.Replace("UserControl",k.EMPTY)).Replace("__","_");
      }

    protected void LabelizeAndSetTextForeColor
      (
      TableCell table_cell,
      Color fore_color
      )
      {
      templatecontrol.LabelizeAndSetTextForeColor(table_cell,fore_color);
      }

    public void MessageBack
      (
      object msg,
      string folder_name,
      string aspx_name
      )
      {
      templatecontrol.MessageBack(Page,msg,folder_name,aspx_name);
      }

    public void MessageDropCrumbAndTransferTo
      (
      object msg,
      string folder_name,
      string aspx_name,
      string anchor_name = k.EMPTY
      )
      {
      SessionSet("msg_" + folder_name + "." + aspx_name,msg);
      DropCrumbAndTransferTo(aspx_name + ".aspx",anchor_name);
      }

    protected override void OnInit(EventArgs e)
      {
      base.OnInit(e);
      }

    protected void RequireConfirmation
      (
      WebControl c,
      string prompt
      )
      {
      templatecontrol.RequireConfirmation(c,prompt);
      }

    protected void SessionSet
      (
      string name,
      object value
      )
      {
      templatecontrol.SessionSet(Page,name,value);
      }

    protected string ShieldedQueryStringOfHashtable
      (
      Hashtable hash_table,
      bool do_compress = false
      )
      {
      return templatecontrol.ShieldedQueryStringOfHashtable(Page,hash_table,do_compress);
      }

    protected static string ShieldedValueOfHashtable(Hashtable hash_table)
      {
      return k.ShieldedValueOfHashtable(hash_table);
      }

    protected string StringOfControl(Control c)
      {
      return templatecontrol.StringOfControl(c);
      }

    protected void TransferToPageBinderTab
      (
      string page_nick,
      string binder_nick,
      uint tab_index
      )
      {
      templatecontrol.TransferToPageBinderTab(Page,page_nick,binder_nick,tab_index);
      }

    protected void ValidationAlert(bool be_using_scriptmanager)
      {
      templatecontrol.ValidationAlert(Page,be_using_scriptmanager);
      }

    protected void ValidationAlert()
      {
      ValidationAlert(false);
      }

    } // end usercontrol_class

  // ==================================================================================================================================
  // usercontrol_subjoined_attribute_capture_class
  // ==================================================================================================================================
  public abstract class usercontrol_subjoined_attribute_capture_class : usercontrol_class
    {
    public abstract void ServerValidate
      (
      object source,
      ServerValidateEventArgs args
      );
    public abstract void Submit();
    }

  // ==================================================================================================================================
  // extensions_class
  // ==================================================================================================================================
  public static class extensions_class
    {
    public static string UntieKeyFromSelection
      (
      this ListControl wandering_list_control
      )
      {
      return wandering_list_control.SelectedValue.Split(':')[0];
      }
    public static string UntieValueFromSelection
      (
      this ListControl wandering_list_control
      )
      {
      return wandering_list_control.SelectedValue.Split(':')[1];
      }
    public static void TieKeyToPotentialValuesForWanderingListControl
      (
      this ListControl wandering_list_control,
      string key
      )
      {
      foreach (ListItem item in wandering_list_control.Items)
        {
        item.Value = $"{key}:{item.Value}";
        }
      }
    }

  }
