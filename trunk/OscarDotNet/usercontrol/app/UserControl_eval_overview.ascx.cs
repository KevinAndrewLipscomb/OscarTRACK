using Class_biz_members;
using Class_biz_user;
using System.Configuration;
using UserControl_evaluatee_overview;
using UserControl_evaluator_overview;

namespace UserControl_eval_overview
  {

  public partial class TWebUserControl_eval_overview: ki_web_ui.usercontrol_class
    {

    private struct p_type
      {
      public bool be_loaded;
      public TClass_biz_members biz_members;
      public TClass_biz_user biz_user;
      }

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session[InstanceId() + ".p"] != null)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        p.be_loaded = IsPostBack && ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_eval_overview");
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_members = new TClass_biz_members();
        p.biz_user = new TClass_biz_user();
        }
      //
      var user_member_id = p.biz_members.IdOfUserId(p.biz_user.IdNum());
      if (p.biz_members.BeReleased(user_member_id))
        {
        var c = (TWebUserControl_evaluator_overview)(LoadControl("~/usercontrol/app/UserControl_evaluator_overview.ascx"));
        AddIdentifiedControlToPlaceHolder
          (
          c:c,
          id:"UserControl_evaluator_overview",
          p:PlaceHolder_evaluator_overview
          );
        c.SetEvaluatorMemberId(id:user_member_id);
        }
      if (!p.biz_members.BeReleased(user_member_id) || !p.biz_members.BeDriverQualifiedOfId(user_member_id))
        {
        var c = (TWebUserControl_evaluatee_overview)(LoadControl("~/usercontrol/app/UserControl_evaluatee_overview.ascx"));
        AddIdentifiedControlToPlaceHolder
          (
          c:c,
          id:"UserControl_evaluatee_overview",
          p:PlaceHolder_evaluatee_overview
          );
        c.SetEvaluateeMemberId(id:user_member_id);
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_eval_overview_PreRender;
      }

    private void TWebUserControl_eval_overview_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_eval_overview Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    }

  }
