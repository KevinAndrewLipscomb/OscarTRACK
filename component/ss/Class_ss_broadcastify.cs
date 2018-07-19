using Class_ss;
using HtmlAgilityPack;
using System;
using System.Configuration;
using System.Net;

namespace Class_ss_broadcastify
  {
  public class TClass_ss_broadcastify : TClass_ss
    {

    private static class Static
      {
      }

    public TClass_ss_broadcastify() : base()
      {      
      }

    private bool Request_api_broadcastify_com_EmbedPlayer
      (
      string feed_id,
      string domain_key,
      out HttpWebResponse response
      )
    {
	    response = null;

	    try
	    {
		    HttpWebRequest request = (HttpWebRequest)WebRequest.Create("https://api.broadcastify.com/embed/player/?html5=1&feedId=" + feed_id + "&key=" + domain_key);
        Normalize(request);

		    request.Accept = "text/html, application/xhtml+xml, image/jxr, */*";
		    request.Headers.Set(HttpRequestHeader.AcceptLanguage, "en-US");
		    request.UserAgent = "Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko";
		    request.Headers.Set(HttpRequestHeader.AcceptEncoding, "gzip, deflate");

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

    internal string AudioSrcUrl
      (
      string feed_id,
      string domain_key
      )
      {
      HttpWebResponse response;
      if(!Request_api_broadcastify_com_EmbedPlayer(feed_id,domain_key,out response))
        {
        throw new Exception("Request_api_broadcastify_com_EmbedPlayer() returned FALSE.");
        }
      return HtmlDocumentOf(ConsumedStreamOf(response)).DocumentNode.SelectSingleNode(xpath:"audio").Attributes[name:"src"].Value;
      //
      }

    }
  }
