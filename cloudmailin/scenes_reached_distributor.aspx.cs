using Class_biz_scenes_reached_distributor;
using kix;
using System;
using System.Text;

namespace scenes_reached_distributor
{

  public partial class TWebForm_scenes_reached_distributor: ki_web_ui.page_class
    {

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      }

    protected void Page_Load(object sender, EventArgs e)
      {
      //
      // https://docs.cloudmailin.com/http_post_formats/multipart_normalized/
      //
      var content_length = Request.Files[0].ContentLength;
      var buffer = new byte[content_length];
      if (Request.Files[0].InputStream.Read(buffer:buffer, offset:0, count:content_length) > 0)
        {
        new TClass_biz_scenes_reached_distributor().ProcessCloudmailinRequest
          (
          envelope_to:k.Safe(Request.Unvalidated.Form["envelope[to]"],k.safe_hint_type.EMAIL_ADDRESS),
          headers_to:k.Safe(Request.Unvalidated.Form["headers[to]"],k.safe_hint_type.EMAIL_ADDRESS),
          attachment:k.Safe(Encoding.ASCII.GetString(bytes:buffer),k.safe_hint_type.MEMO)
          );
        }
      else
        {
        throw new Exception(message:"Zero-length attachment");
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      }

    } // end TWebForm_scenes_reached_distributor

  }
