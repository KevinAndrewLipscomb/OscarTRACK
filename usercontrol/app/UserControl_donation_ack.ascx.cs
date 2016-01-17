using Class_biz_members;
using Class_biz_user;
using kix;
using System;

namespace UserControl_donation_ack
  {

  public partial class TWebUserControl_donation_ack: ki_web_ui.usercontrol_class
    {

    private struct p_type
      {
      public string address;
      public string agency_short_designator;
      public string amount;
      public bool be_loaded;
      public TClass_biz_members biz_members;
      public TClass_biz_user biz_user;
      public string city;
      public string donation_date;
      public string donor_name;
      public string state;
      }

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        Literal_ack_date.Text = DateTime.Today.ToString("dddd d MMMM yyyy");
        //
        Literal_donor_name.Text = p.donor_name;
        Literal_address.Text = p.address;
        Literal_city.Text = p.city;
        Literal_state.Text = p.state;
        Label_amount.Text = decimal.Parse(p.amount).ToString("C");
        Label_donation_date.Text = p.donation_date;
        //
        var member_id = p.biz_members.IdOfUserId(p.biz_user.IdNum());
        var member_summary = p.biz_members.Summary(member_id);
        Literal_member_name.Text = p.biz_members.FirstNameOf(member_summary) + k.SPACE + p.biz_members.LastNameOf(member_summary);
        Literal_member_title.Text = p.biz_user.Roles(id_of_highest_tier_of_interest:"2")[0];
        Label_member_email_address.Text = p.biz_members.EmailAddressOf(member_id);
        Literal_member_phone_number.Text = k.FormatAsNanpPhoneNum(p.biz_members.PhoneNumOfSummary(member_summary));
        //
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var instance_id = InstanceId();
      if (Session[instance_id + ".p"] != null)
        {
        p = (p_type)(Session[instance_id + ".p"]);
        p.be_loaded = IsPostBack;  // This test is sufficient if this control is being used statically on its page.
        //
        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
        // had it loaded already.
        //
//#warning Revise the binder-related instance_id to this control appropriately.
//        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_donation_ack")
//          {
//#warning Revise the ClientID path to this control appropriately.
//          p.be_loaded &= ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_donation_ack");
//          }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_donation_ack")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_donation_ack");
//        }
        }
      else
        {
        p.biz_members = new TClass_biz_members();
        p.biz_user = new TClass_biz_user();
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
      PreRender += TWebUserControl_donation_ack_PreRender;
      }

    private void TWebUserControl_donation_ack_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_donation_ack Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    internal void SetP
      (
      string agency_short_designator,
      string donor_name,
      string address,
      string city,
      string state,
      string amount,
      string donation_date
      )
      {
      p.agency_short_designator = agency_short_designator;
      p.donor_name = donor_name;
      p.address = address;
      p.city = city;
      p.state = state;
      p.amount = amount;
      p.donation_date = (donation_date.Length > 0 ? DateTime.Parse(donation_date) : DateTime.Today).ToString("d MMMM yyyy");
      }

    }

  }
