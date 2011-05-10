using Class_biz_agencies;
using Class_biz_members;
using Class_biz_user;
using kix;
using System;
using System.Configuration;

namespace UserControl_availabilities
  {

  public struct p_type
    {
    public string base_navigate_url_for_month_following;
    public string base_navigate_url_for_month_next;
    public bool be_loaded;
    public TClass_biz_agencies biz_agencies;
    public TClass_biz_members biz_members;
    public TClass_biz_user biz_user;
    public string member_id;
    public string query_string_invariant_part;
    }

  public partial class TWebUserControl_availabilities: ki_web_ui.usercontrol_class
    {

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        p.biz_agencies.BindListControlShortDashLong(DropDownList_coord_agency,p.biz_members.AgencyIdOfId(p.member_id));
        //
        HyperLink_submit_avails_for_month_next.Text = DateTime.Now.AddMonths(1).ToString("MMMM");
        HyperLink_submit_avails_for_month_following.Text = DateTime.Now.AddMonths(2).ToString("MMMM");
        //
        var path_to_external_oscar = ConfigurationManager.AppSettings["path_to_external_oscar"];
        p.base_navigate_url_for_month_next = HyperLink_submit_avails_for_month_next.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        p.base_navigate_url_for_month_following = HyperLink_submit_avails_for_month_following.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_vorps.NavigateUrl = HyperLink_vorps.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_more_stats.NavigateUrl = HyperLink_more_stats.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        Img_mortarboard.Src = k.ExpandTildePath(Img_mortarboard.Src);
        HyperLink_oscar_u.NavigateUrl = HyperLink_oscar_u.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        Img_trophy.Src = k.ExpandTildePath(Img_trophy.Src);
        HyperLink_class_act.NavigateUrl = HyperLink_class_act.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_request.NavigateUrl = HyperLink_request.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_reconfirm_or_retract.NavigateUrl = HyperLink_reconfirm_or_retract.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_catch_up.NavigateUrl = HyperLink_catch_up.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_faq.NavigateUrl = HyperLink_faq.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_modify.NavigateUrl = HyperLink_modify.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_read.NavigateUrl = HyperLink_read.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        HyperLink_contribute.NavigateUrl = HyperLink_contribute.NavigateUrl.Replace("$OSCAR",path_to_external_oscar);
        //
        UpdateSubmitAvailHyperLinks();
        //
        p.be_loaded = true;
        }
      }

    private void UpdateSubmitAvailHyperLinks()
      {
      var url_encoded_coord_agency = Server.UrlEncode(p.biz_agencies.OscarClassicEnumeratorOf(k.Safe(DropDownList_coord_agency.SelectedValue,k.safe_hint_type.NUM)));
      HyperLink_submit_avails_for_month_next.NavigateUrl = p.base_navigate_url_for_month_next + p.query_string_invariant_part
      + "&coord_agency=" + url_encoded_coord_agency
      + "&applicable_month_num=" + (DateTime.Now.Month + 1).ToString();
      HyperLink_submit_avails_for_month_following.NavigateUrl = p.base_navigate_url_for_month_following + p.query_string_invariant_part
      + "&coord_agency=" + url_encoded_coord_agency
      + "&applicable_month_num=" + (DateTime.Now.Month + 2).ToString();
      //
      HyperLink_submit_avails_for_month_next.Focus();
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (IsPostBack && (Session[InstanceContextId() + ".p"] != null) && (Session[InstanceContextId() + ".p"].GetType().Namespace == p.GetType().Namespace))
        {
        p = (p_type)(Session[InstanceContextId() + ".p"]);
        }
      else
        {
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_members = new TClass_biz_members();
        p.biz_user = new TClass_biz_user();
        //
        p.member_id = p.biz_members.IdOfUserId(p.biz_user.IdNum());
        //
        var user_member_agency_id = p.biz_members.AgencyIdOfId(Session["member_id"].ToString());
        var home_squad = (user_member_agency_id == "0" ? "ERS" : user_member_agency_id);
        var be_als_string = p.biz_members.BeAlsForLegacyOscarPurposes(Session["member_id"].ToString()).ToString().ToUpper();
        p.query_string_invariant_part = "?"
        + "first_name=" + Server.UrlEncode(p.biz_members.FirstNameOfMemberId(p.member_id))
        + "&"
        + "last_name=" + Server.UrlEncode(p.biz_members.LastNameOfMemberId(p.member_id))
        + "&"
        + "email_addr=" + Server.UrlEncode(p.biz_user.EmailAddress())
        + "&"
        + "odnmid=" + Server.UrlEncode(p.member_id)
        + "&"
        + "squad=" + Server.UrlEncode(home_squad)
        + "&"
        + "be_als=" + Server.UrlEncode(be_als_string)
        + "&"
        + "be_driver=" + Server.UrlEncode(p.biz_members.BeDriverQualifiedOfId(Session["member_id"].ToString()).ToString().ToUpper())
        + "&"
        + "be_aic=" + Server.UrlEncode(p.biz_members.BeReleased(Session["member_id"].ToString()).ToString().ToUpper())
        + "&"
        + "be_needing_driver=" + Server.UrlEncode(be_als_string);
        //
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
      SessionSet(InstanceContextId() + ".p", p);
      }

    public TWebUserControl_availabilities Fresh()
      {
      Session.Remove(InstanceContextId());
      return this;
      }

    protected void DropDownList_coord_agency_SelectedIndexChanged(object sender, EventArgs e)
      {
      UpdateSubmitAvailHyperLinks();
      }

    }

  }
