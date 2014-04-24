using Class_ss;
using ki_windows_forms;
using System;
using System.Collections;
using System.Configuration;
using System.IO;
using System.Net;
using System.Net.Cache;
using System.Threading;
using System.Windows.Forms;

namespace OscarDotNet.component.ss
  {
  public static class Class_ss_vbemsbridge_Static
    {
    }

  public class Class_ss_vbemsbridge : TClass_ss
    {

    //==
    //
    // PRIVATE
    //
    //==

    private bool Request_vbems_emsbridge_com
      (
      //--
      //
      // KI code
      //
      CookieContainer cookie_container,
      //
      //--
      out HttpWebResponse response
      )
    {
	    response = null;

	    try
	    {
		    HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://vbems.emsbridge.com/");
        //--
        //
        // KI code
        //
        request.CookieContainer = cookie_container;
        request.CachePolicy = new RequestCachePolicy(RequestCacheLevel.NoCacheNoStore);
        request.AutomaticDecompression = DecompressionMethods.GZip | DecompressionMethods.Deflate;
        //
        //--

		    request.Accept = "text/html, application/xhtml+xml, */*";
		    request.Headers.Set(HttpRequestHeader.AcceptLanguage, "en-US");
		    request.UserAgent = "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)";
		    request.Headers.Set(HttpRequestHeader.AcceptEncoding, "gzip, deflate");
		    request.Headers.Add("DNT", "1");
		    // KI //request.Headers.Set(HttpRequestHeader.Cookie, @"SITEID=55d6b30b%2De25d%2D42ae%2Dbfdf%2Dc02e2a2f28a5");

		    response = (HttpWebResponse)request.GetResponse();
	    }
	    catch (WebException e)
	    {
		    if (e.Status == WebExceptionStatus.ProtocolError) response = (HttpWebResponse)e.Response;
		    else return false;
	    }
	    catch (Exception)
	    {
		    if(response != null) response.Close();
		    return false;
	    }

	    return true;
    }

    private bool Request_vbems_emsbridge_com_CustomRelease_Yes
      (
      //--
      //
      // KI code
      //
      CookieContainer cookie_container,
      //
      //--
      out HttpWebResponse response
      )
    {
	    response = null;

	    try
	    {
		    HttpWebRequest request = (HttpWebRequest)WebRequest.Create("https://vbems.emsbridge.com/custom/release.cfm");
        //--
        //
        // KI code
        //
        request.CookieContainer = cookie_container;
        request.CachePolicy = new RequestCachePolicy(RequestCacheLevel.NoCacheNoStore);
        request.AutomaticDecompression = DecompressionMethods.GZip | DecompressionMethods.Deflate;
        //
        //--

		    request.Accept = "text/html, application/xhtml+xml, */*";
		    request.Referer = "https://vbems.emsbridge.com/custom/release.cfm";
		    request.Headers.Set(HttpRequestHeader.AcceptLanguage, "en-US");
		    request.UserAgent = "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)";
		    request.ContentType = "application/x-www-form-urlencoded";
		    request.Headers.Set(HttpRequestHeader.AcceptEncoding, "gzip, deflate");
		    request.Headers.Add("DNT", "1");
		    request.Headers.Set(HttpRequestHeader.CacheControl, "no-cache");
		    // KI //request.Headers.Set(HttpRequestHeader.Cookie, @"SITEID=55d6b30b%2De25d%2D42ae%2Dbfdf%2Dc02e2a2f28a5; JSESSIONID=84306c2e13c0987187e1d1f13461b7f3f353");

		    request.Method = "POST";

		    string postString = @"acc=+Yes+";
		    byte[] postBytes = System.Text.Encoding.UTF8.GetBytes(postString);
		    request.ContentLength = postBytes.Length;
		    Stream stream = request.GetRequestStream();
		    stream.Write(postBytes, 0, postBytes.Length);
		    stream.Close();

		    response = (HttpWebResponse)request.GetResponse();
	    }
	    catch (WebException e)
	    {
		    if (e.Status == WebExceptionStatus.ProtocolError) response = (HttpWebResponse)e.Response;
		    else return false;
	    }
	    catch (Exception)
	    {
		    if(response != null) response.Close();
		    return false;
	    }

	    return true;
    }

    private bool Request_vbems_emsbridge_com_Submit
      (
      //--
      //
      // KI code
      //
      CookieContainer cookie_container,
      string security_token,
      string timestamp_token,
      string t,
      string spd,
      string user_id,
      string password,
      //
      //--
      out HttpWebResponse response
      )
    {
	    response = null;

	    try
	    {
		    HttpWebRequest request = (HttpWebRequest)WebRequest.Create("https://vbems.emsbridge.com/default.cfm");
        //--
        //
        // KI code
        //
        request.CookieContainer = cookie_container;
        request.CachePolicy = new RequestCachePolicy(RequestCacheLevel.NoCacheNoStore);
        //
        //--

		    request.Accept = "text/html, application/xhtml+xml, */*";
		    request.Referer = "https://vbems.emsbridge.com/";
		    request.Headers.Set(HttpRequestHeader.AcceptLanguage, "en-US");
		    request.UserAgent = "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)";
		    request.ContentType = "application/x-www-form-urlencoded";
		    request.Headers.Set(HttpRequestHeader.AcceptEncoding, "gzip, deflate");
		    request.Headers.Add("DNT", "1");
		    request.Headers.Set(HttpRequestHeader.CacheControl, "no-cache");
		    // KI //request.Headers.Set(HttpRequestHeader.Cookie, @"SITEID=55d6b30b%2De25d%2D42ae%2Dbfdf%2Dc02e2a2f28a5; JSESSIONID=84306c2e13c0987187e1d1f13461b7f3f353");

		    request.Method = "POST";

		    string postString = @"securityToken=" + security_token + "&timeStampToken=" + timestamp_token + "&UserID=" + user_id + "&Password=" + password + "&t=" + t + "&spd=" + spd + "&submit=Submit";
		    byte[] postBytes = System.Text.Encoding.UTF8.GetBytes(postString);
		    request.ContentLength = postBytes.Length;
		    Stream stream = request.GetRequestStream();
		    stream.Write(postBytes, 0, postBytes.Length);
		    stream.Close();

		    response = (HttpWebResponse)request.GetResponse();
	    }
	    catch (WebException e)
	    {
		    if (e.Status == WebExceptionStatus.ProtocolError) response = (HttpWebResponse)e.Response;
		    else return false;
	    }
	    catch (Exception)
	    {
		    if(response != null) response.Close();
		    return false;
	    }

	    return true;
    }

    //==
    //
    // INTERNAL
    //
    //==

    internal void Login
      (
      webbrowsercontext_class web_browser_context,
      string user_id,
      string password,
      CookieContainer cookie_container
      )
      {
      AutoResetEvent auto_reset_event = new AutoResetEvent(false); 
      web_browser_context.browser.Navigate("http://vbems.emsbridge.com/");
      EventWaitHandle.WaitAll(new AutoResetEvent[] { auto_reset_event }); 
      var hdn = web_browser_context.browser.Document;


      //HttpWebResponse response;
      //if (!Request_vbems_emsbridge_com(cookie_container,out response))
      //  {
      //  throw new Exception("Request_vbems_emsbridge_com() returned FALSE.");
      //  }
      //if(!Request_vbems_emsbridge_com_Submit
      //    (
      //    cookie_container:cookie_container,
      //    security_token:hdn.SelectSingleNode("//input[@name='securityToken']").Attributes["value"].Value,
      //    timestamp_token:hdn.SelectSingleNode("//input[@name='timeStampToken']").Attributes["value"].Value,
      //    t:hdn.SelectSingleNode("//input[@name='t']").Attributes["value"].Value,
      //    spd:hdn.SelectSingleNode("//input[@name='spd']").Attributes["value"].Value,
      //    user_id:user_id,
      //    password:password,
      //    response:out response
      //    )
      //  )
      //  {
      //  throw new Exception("Request_vbems_emsbridge_com_Submit() returned FALSE.");
      //  }
      //response.Close();
      //if (!Request_vbems_emsbridge_com_CustomRelease_Yes(cookie_container,out response))
      //  {
      //  throw new Exception("Request_ems_health_state_pa_us_EmsportalApplicationlist() returned FALSE.");
      //  }
      //response.Close();
//      if (TitleOf(HtmlDocumentOf(ConsumedStreamOf(response))) != "EMS Login | Application List")
//        {
//        throw new Exception("Unexpected response from Request_ems_health_state_pa_us_EmsportalApplicationlist().");
//        }
      }

    internal ArrayList RecentIncidents(webbrowsercontext_class web_browser_context)
      {
      var recent_incidents = new ArrayList();
      var cookie_container = new CookieContainer();
      //
      Login
        (
        web_browser_context:web_browser_context,
        user_id:ConfigurationManager.AppSettings["vbemsbridge_username"],
        password:ConfigurationManager.AppSettings["vbemsbridge_password"],
        cookie_container:cookie_container
        );
      //
      return recent_incidents;
      }

    //==
    //
    // PUBLIC
    //
    //==

    public Class_ss_vbemsbridge() : base()
      {      
      }

    }
  }
