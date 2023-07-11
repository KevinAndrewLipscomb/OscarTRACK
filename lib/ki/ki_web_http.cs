using System.Web;
using System.Web.Http;

namespace ki_web_http
{

  static class common
    {
    }
  
  // ==================================================================================================================================
  // apicontroller__class
  // ==================================================================================================================================
  public class apicontroller_class : ApiController
    {

    //public enum nature_of_visit_type
    //  {
    //  VISIT_COLD_CALL,
    //  VISIT_INITIAL,
    //  VISIT_POSTBACK_STANDARD,
    //  VISIT_POSTBACK_STALE,
    //  }

    public apicontroller_class() : base() // CONSTRUCTOR
      {
      }

    //private nature_of_visit_type NatureOfInvocation
    //  (
    //  string expected_session_item_name,
    //  bool be_timeout_behavior_standard,
    //  bool be_landing_from_login,
    //  bool be_cold_call_allowed
    //  )
    //  {
    //  nature_of_visit_type nature_of_invocation;
    //  bool be_cold_call;
    //  if (!IsPostBack)
    //    {
    //    if (be_landing_from_login)
    //      {
    //      be_cold_call_allowed = false;
    //      be_cold_call = (HttpContext.Current.Session["user_id"] == null) || (HttpContext.Current.Session["username"] == null);
    //      }
    //    else
    //      {
    //      be_cold_call = (Request.ServerVariables["URL"] == Request.CurrentExecutionFilePath);
    //      }
    //    if (be_cold_call)
    //      {
    //      nature_of_invocation = nature_of_visit_type.VISIT_COLD_CALL;
    //      //
    //      // The request for this page could not have been the result of a Server.Transfer call, and the session state is therefore unknown.  This is rarely allowed.
    //      //
    //      if (!be_cold_call_allowed)
    //        {
    //        HttpContext.Current.Session.Clear();
    //        Server.Transfer("~/login.aspx");
    //        }
    //      }
    //    else
    //      {
    //      nature_of_invocation = nature_of_visit_type.VISIT_INITIAL;
    //      }
    //    }
    //  else
    //    {
    //    if ((HttpContext.Current.Session[expected_session_item_name] != null))
    //      {
    //      nature_of_invocation = nature_of_visit_type.VISIT_POSTBACK_STANDARD;
    //      }
    //    else
    //      {
    //      nature_of_invocation = nature_of_visit_type.VISIT_POSTBACK_STALE;
    //      if (be_timeout_behavior_standard)
    //        {
    //        Server.Transfer("~/timeout.aspx");
    //        }
    //      }
    //    }
    //  return nature_of_invocation;
    //  }

    //protected nature_of_visit_type NatureOfLanding
    //  (
    //  string expected_session_item_name,
    //  bool be_timeout_behavior_standard = true
    //  )
    //  {
    //  return NatureOfInvocation
    //    (
    //    expected_session_item_name:expected_session_item_name,
    //    be_timeout_behavior_standard:be_timeout_behavior_standard,
    //    be_landing_from_login:true,
    //    be_cold_call_allowed:false
    //    );
    //  }

    //protected nature_of_visit_type NatureOfVisit
    //  (
    //  string expected_session_item_name,
    //  bool be_timeout_behavior_standard = true
    //  )
    //  {
    //  return NatureOfInvocation
    //    (
    //    expected_session_item_name:expected_session_item_name,
    //    be_timeout_behavior_standard:be_timeout_behavior_standard,
    //    be_landing_from_login:false,
    //    be_cold_call_allowed:false
    //    );
    //  }

    //protected nature_of_visit_type NatureOfVisitUnlimited
    //  (
    //  string expected_session_item_name,
    //  bool be_timeout_behavior_standard = true
    //  )
    //  {
    //  return NatureOfInvocation
    //    (
    //    expected_session_item_name:expected_session_item_name,
    //    be_timeout_behavior_standard:be_timeout_behavior_standard,
    //    be_landing_from_login:false,
    //    be_cold_call_allowed:true
    //    );
    //  }

    public static void SessionSet
      (
      string name,
      object value
      )
      {
      HttpContext.Current.Session.Remove(name);
      HttpContext.Current.Session.Add(name,value);
      }

    } // end apicontroller_class

  }
