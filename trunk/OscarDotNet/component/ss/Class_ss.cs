using HtmlAgilityPack;
using kix;
using System;
using System.IO;
using System.Net;
using System.Net.Cache;
using System.Runtime.InteropServices;
using System.Text;

namespace Class_ss
  {

  public abstract class TClass_ss
    {

    //--
    //
    // PRIVATE STATIC
    //
    //--

    private static class Static
      {
      public const Int32 INTERNET_COOKIE_HTTPONLY = 0x2000;
      public const Int32 INTERNET_COOKIE_THIRD_PARTY = 0x10;
      }

    [DllImport("wininet.dll", SetLastError = true)]
    private static extern bool InternetGetCookieEx
      (
      string url, 
      string cookie_name, 
      StringBuilder cookie_data, 
      ref int size,
      Int32 flags,
      IntPtr reserved
      );

    //--
    //
    // INTERNAL
    //
    //--

    internal TClass_ss() : base()
      {
      }

    //--
    //
    // PROTECTED STATIC
    //
    //--

    protected static string AjaxProAppWebAshxTokenOf
      (
      string stream,
      string spec
      )
      {
      return stream
        .Split(new string[] {"<script type=\"text/javascript\" src=\"/ajaxpro/" + spec + ",App_Web_"},StringSplitOptions.None)[1]
        .Split(new string[] {".ashx\"></script>"},StringSplitOptions.None)[0];
      }

    protected static string EventValidationOf(HtmlDocument html_document)
      {
      return html_document.GetElementbyId("__EVENTVALIDATION").Attributes["value"].Value;
      }

    protected static HtmlDocument HtmlDocumentOf(string stream)
      {
      var html_document = new HtmlDocument(); 
      html_document.LoadHtml(stream);
      return html_document;
      }

    protected static string ConsumedStreamOf(HttpWebResponse response)
      {
      var consumed_stream_of = k.EMPTY;
      if (response != null)
        {
        var stream_reader = new StreamReader(response.GetResponseStream());
        consumed_stream_of = stream_reader.ReadToEnd();
        stream_reader.Close();
        stream_reader.Dispose();
        response.Close();  // Prevents timeout errors in later calls to HttpWebRequest.GetResponse() via Fiddler-based scraping code.
        }
      return consumed_stream_of;
      }

    internal static CookieContainer GetUriCookieContainer(Uri uri)
      {
      CookieContainer cookie_container = null;
      //
      // Set up a deliberately bad assumption about the size of the set of cookies.
      //
      int size = 1;
      //
      var cookie_data = new StringBuilder(size);
      //
      // The following call will return FALSE because the specified size will be inadequate, but we will get back the true size of the cookie_data.
      //
      InternetGetCookieEx
        (
        url:uri.ToString(),
        cookie_name:null,
        cookie_data:cookie_data,
        size:ref size,
        flags:Static.INTERNET_COOKIE_HTTPONLY,
        reserved:IntPtr.Zero
        );
      //
      if (size >= 0)
        {
        //
        // Allocate enough to actually hold the cookie_data.
        //
        cookie_data = new StringBuilder(size);
        //
        if(InternetGetCookieEx
            (
            url:uri.ToString(),
            cookie_name:null,
            cookie_data:cookie_data, 
            size:ref size, 
            flags:Static.INTERNET_COOKIE_HTTPONLY,
            reserved:IntPtr.Zero
            )
          )
          {
          if (cookie_data.Length > 0)
            {
            cookie_container = new CookieContainer();
            cookie_container.SetCookies
              (
              uri:uri,
              cookieHeader:cookie_data.ToString().Replace(k.SEMICOLON + k.SPACE,k.COMMA)
              );
            }
          }
        }
      return cookie_container;
      }

    protected static string TitleOf(HtmlDocument html_document)
      {
      return html_document.DocumentNode.SelectSingleNode("/html/head/title").InnerText.Trim();
      }

    protected static string ViewstateOf(HtmlDocument html_document)
      {
      return html_document.GetElementbyId("__VIEWSTATE").Attributes["value"].Value;
      }

    protected static void Normalize
      (
      HttpWebRequest request
      )
      {
      request.CachePolicy = new RequestCachePolicy(RequestCacheLevel.NoCacheNoStore);
      request.AutomaticDecompression = DecompressionMethods.GZip | DecompressionMethods.Deflate;
      }

    protected static void NormalizeWithCookie
      (
      HttpWebRequest request,
      CookieContainer cookie_container
      )
      {
      Normalize(request);
      request.CookieContainer = cookie_container;
      }

    }

  }

