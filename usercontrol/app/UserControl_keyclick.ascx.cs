using AjaxControlToolkit;
using Class_biz_members;
using Class_biz_residents;
using Class_biz_user;
using kix;
using System.Configuration;
using System.Web.UI;
using System;

namespace UserControl_keyclick
  {

  public struct p_type
    {
    public string agency_id;
    public bool be_loaded;
    public TClass_biz_members biz_members;
    public TClass_biz_residents biz_residents;
    public TClass_biz_user biz_user;
    public string path_to_external_keyclick;
    }

  public partial class TWebUserControl_keyclick: ki_web_ui.usercontrol_class
    {

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        HyperLink_log_new.NavigateUrl = HyperLink_log_new.NavigateUrl.Replace("$KEYclick",p.path_to_external_keyclick);
        HyperLink_log_old.NavigateUrl = HyperLink_log_old.NavigateUrl.Replace("$KEYclick",p.path_to_external_keyclick);
        HyperLink_add.NavigateUrl = HyperLink_add.NavigateUrl.Replace("$KEYclick",p.path_to_external_keyclick);
        HyperLink_modify_or_remove.NavigateUrl = HyperLink_modify_or_remove.NavigateUrl.Replace("$KEYclick",p.path_to_external_keyclick);
        HyperLink_analyze.NavigateUrl = HyperLink_analyze.NavigateUrl.Replace("$KEYclick",p.path_to_external_keyclick);
        HyperLink_export.NavigateUrl = HyperLink_export.NavigateUrl.Replace("$KEYclick",p.path_to_external_keyclick);
        HyperLink_faq.NavigateUrl = HyperLink_faq.NavigateUrl.Replace("$KEYclick",p.path_to_external_keyclick);
        HyperLink_contact.NavigateUrl = HyperLink_contact.NavigateUrl.Replace("$KEYclick",p.path_to_external_keyclick);
        //
        HyperLink_log_new.NavigateUrl += "?bpn=" + Session["keyclick_boarding_pass_number"].ToString();
        HyperLink_log_old.NavigateUrl += "?bpn=" + Session["keyclick_boarding_pass_number"].ToString();
        HyperLink_add.NavigateUrl += "?bpn=" + Session["keyclick_boarding_pass_number"].ToString();
        HyperLink_modify_or_remove.NavigateUrl += "?bpn=" + Session["keyclick_boarding_pass_number"].ToString();
        HyperLink_analyze.NavigateUrl += "?bpn=" + Session["keyclick_boarding_pass_number"].ToString();
        HyperLink_export.NavigateUrl += "?bpn=" + Session["keyclick_boarding_pass_number"].ToString();
        //
        Literal_num_rod_records.Text = p.biz_residents.NumForAgency(agency_id:p.agency_id).val.ToString("N0");
        //
        p.be_loaded = true;
        }
      ScriptManager.GetCurrent(Page).RegisterPostBackControl(LinkButton_review);
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session[InstanceId() + ".p"] != null)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_funddrive_binder_PlaceHolder_content"] as string) == "UserControl_keyclick");
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_members = new TClass_biz_members();
        p.biz_residents = new TClass_biz_residents();
        p.biz_user = new TClass_biz_user();
        //
        p.agency_id = k.EMPTY;
        p.path_to_external_keyclick = ConfigurationManager.AppSettings["path_to_external_keyclick"];
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
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_keyclick Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    protected void Button_find_Click(object sender, System.EventArgs e)
      {
      ScriptManager.RegisterStartupScript
        (
        Page,
        Page.GetType(),
        "LaunchPopUpAnalyzeWindow",
        "window.open"
          + "("
            + "'"
            + p.path_to_external_keyclick + "/analyze.phtml"
            + "?bpn=" + Session["keyclick_boarding_pass_number"].ToString()
            + "&format=html"
            + "&algorithm=FNDNAMADR"
            + "&search_text=" + Server.UrlEncode(k.Safe(TextBox_search_text.Text,k.safe_hint_type.ALPHA_WORDS))
            + "'"
          + ");",
        true
        );
      }

    protected void Button_modify_or_remove_Click(object sender, System.EventArgs e)
      {
      ScriptManager.RegisterStartupScript
        (
        Page,
        Page.GetType(),
        "LaunchPopUpFormActSinglyWindow",
        "window.open"
          + "("
            + "'"
            + p.path_to_external_keyclick + "/form-act-singly.phtml"
            + "?bpn=" + Session["keyclick_boarding_pass_number"].ToString()
            + "&id=" + Server.UrlEncode(k.Safe(TextBox_id.Text,k.safe_hint_type.NUM))
            + "'"
          + ");",
        true
        );
      }

    protected void LinkButton_review_Click(object sender, System.EventArgs e)
      {
      DropCrumbAndTransferTo(the_path:"donation_log.aspx");
      }

    internal void SetP(string agency_id)
      {
      p.agency_id = agency_id;
      }

    }

  }
