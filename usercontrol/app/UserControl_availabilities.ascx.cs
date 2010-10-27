using Class_biz_agencies;
using Class_biz_members;
using Class_biz_user;
using System;
using System.Configuration;

namespace UserControl_availabilities
  {

  public struct p_type
    {
    public bool be_loaded;
    public TClass_biz_agencies biz_agencies;
    public TClass_biz_members biz_members;
    public TClass_biz_user biz_user;
    }

  public partial class TWebUserControl_availabilities: ki_web_ui.usercontrol_class
    {

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        var path_to_external_oscar = ConfigurationManager.AppSettings["path_to_external_oscar"];
        HyperLink_submit_avails_for_month_next.NavigateUrl = HyperLink_submit_avails_for_month_next.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_submit_avails_for_month_following.NavigateUrl = HyperLink_submit_avails_for_month_following.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_surrogate.NavigateUrl = HyperLink_surrogate.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_vorps.NavigateUrl = HyperLink_vorps.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_more_stats.NavigateUrl = HyperLink_more_stats.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        Img_mortarboard.Src = Img_mortarboard.Src.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_oscar_u.NavigateUrl = HyperLink_oscar_u.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        Img_trophy.Src = Img_trophy.Src.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_class_act.NavigateUrl = HyperLink_class_act.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_request.NavigateUrl = HyperLink_request.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_reconfirm_or_retract.NavigateUrl = HyperLink_reconfirm_or_retract.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_catch_up.NavigateUrl = HyperLink_catch_up.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_faq.NavigateUrl = HyperLink_faq.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_modify.NavigateUrl = HyperLink_modify.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_read.NavigateUrl = HyperLink_read.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_contribute.NavigateUrl = HyperLink_contribute.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        //
        var member_id = p.biz_members.IdOfUserId(p.biz_user.IdNum());
        var query_string = "?"
        + "first_name=" + Server.UrlEncode(p.biz_members.FirstNameOfMemberId(member_id))
        + "&"
        + "last_name=" + Server.UrlEncode(p.biz_members.LastNameOfMemberId(member_id))
        + "&"
        + "email_addr=" + Server.UrlEncode(p.biz_user.EmailAddress())
        + "&"
        + "coord_agency=" + Server.UrlEncode(p.biz_agencies.OscarClassicEnumeratorOf(p.biz_members.AgencyIdOfId(member_id)))
        + "&"
        + "odnmid=" + Server.UrlEncode(member_id)
        + "&"
        + "applicable_month_num=";
        var month_next = DateTime.Now.AddMonths(1);
        HyperLink_submit_avails_for_month_next.Text = month_next.ToString("MMMM");
        HyperLink_submit_avails_for_month_next.NavigateUrl += query_string + Server.UrlEncode(month_next.ToString("%M"));
        var month_following = DateTime.Now.AddMonths(2);
        HyperLink_submit_avails_for_month_following.Text = month_following.ToString("MMMM");
        HyperLink_submit_avails_for_month_following.NavigateUrl += query_string + Server.UrlEncode(month_following.ToString("%M"));
        //
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (IsPostBack && (Session["UserControl_availabilities.p"] != null) && (Session["UserControl_availabilities.p"].GetType().Namespace == p.GetType().Namespace))
        {
        p = (p_type)(Session["UserControl_availabilities.p"]);
        }
      else
        {
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_members = new TClass_biz_members();
        p.biz_user = new TClass_biz_user();
        p.be_loaded = false;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_availabilities_PreRender;
      }

    private void TWebUserControl_availabilities_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("UserControl_availabilities.p", p);
      }

    public TWebUserControl_availabilities Fresh()
      {
      Session.Remove("UserControl_availabilities.p");
      return this;
      }

    }

  }
