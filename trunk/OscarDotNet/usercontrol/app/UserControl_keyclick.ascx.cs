using System.Configuration;

namespace UserControl_keyclick
  {

  public struct p_type
    {
    public bool be_loaded;
    }

  public partial class TWebUserControl_keyclick: ki_web_ui.usercontrol_class
    {

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        var path_to_external_keyclick = ConfigurationManager.AppSettings["path_to_external_keyclick"];
        HyperLink_log_new.NavigateUrl = HyperLink_log_new.NavigateUrl.Replace("$KEYclick",path_to_external_keyclick);
        HyperLink_log_old.NavigateUrl = HyperLink_log_old.NavigateUrl.Replace("$KEYclick",path_to_external_keyclick);
        HyperLink_add.NavigateUrl = HyperLink_add.NavigateUrl.Replace("$KEYclick",path_to_external_keyclick);
        HyperLink_modify_or_remove.NavigateUrl = HyperLink_modify_or_remove.NavigateUrl.Replace("$KEYclick",path_to_external_keyclick);
        HyperLink_analyze.NavigateUrl = HyperLink_analyze.NavigateUrl.Replace("$KEYclick",path_to_external_keyclick);
        HyperLink_export.NavigateUrl = HyperLink_export.NavigateUrl.Replace("$KEYclick",path_to_external_keyclick);
        HyperLink_catch_up.NavigateUrl = HyperLink_catch_up.NavigateUrl.Replace("$KEYclick",path_to_external_keyclick);
        HyperLink_faq.NavigateUrl = HyperLink_faq.NavigateUrl.Replace("$KEYclick",path_to_external_keyclick);
        HyperLink_contact.NavigateUrl = HyperLink_contact.NavigateUrl.Replace("$KEYclick",path_to_external_keyclick);
        //
        HyperLink_log_new.NavigateUrl += "?bpn=" + Session["keyclick_boarding_pass_number"].ToString();
        HyperLink_log_old.NavigateUrl += "?bpn=" + Session["keyclick_boarding_pass_number"].ToString();
        HyperLink_add.NavigateUrl += "?bpn=" + Session["keyclick_boarding_pass_number"].ToString();
        HyperLink_modify_or_remove.NavigateUrl += "?bpn=" + Session["keyclick_boarding_pass_number"].ToString();
        HyperLink_analyze.NavigateUrl += "?bpn=" + Session["keyclick_boarding_pass_number"].ToString();
        HyperLink_export.NavigateUrl += "?bpn=" + Session["keyclick_boarding_pass_number"].ToString();
        //
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session["UserControl_keyclick.p"] != null)
        {
        p = (p_type)(Session["UserControl_keyclick.p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_funddrive_binder_PlaceHolder_content"] as string) == "UserControl_keyclick");
        }
      else
        {
        p.be_loaded = false;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_keyclick_PreRender;
      }

    private void TWebUserControl_keyclick_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("UserControl_keyclick.p", p);
      }

    public TWebUserControl_keyclick Fresh()
      {
      Session.Remove("UserControl_keyclick.p");
      return this;
      }

    }

  }
