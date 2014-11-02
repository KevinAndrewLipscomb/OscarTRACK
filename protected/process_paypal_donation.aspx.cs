// Derived from template~protected~nonlanding.aspx.cs~template

using Class_biz_residents;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace process_paypal_donation
  {
  public struct p_type
    {
    public TClass_biz_residents biz_residents;
    public TClass_msg_protected.process_paypal_donation incoming;
    public TClass_msg_protected.confirm_paypal_donation msg_protected_confirm_paypal_donation;
    }

  public partial class TWebForm_process_paypal_donation: ki_web_ui.page_class
    {
    public class TWebForm_process_paypal_donation_Static
      {
      public const int TCI_SELECT = 0;
      public const int TCI_ID = 1;
      public const int TCI_NAME = 2;
      public const int TCI_HOUSE_NUM_AND_STREET = 3;
      public const int TCI_CITY = 4;
      public const int TCI_STATE = 5;
      public const int TCI_EMAIL_ADDRESS = 6;
      public const int TCI_SCORE = 7;
      public const int TCI_NUM_PRIORS = 8;
      public const int TCI_AVG_AMOUNT = 9;
      }

    private p_type p;

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      DataGrid_possible_match.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(DataGrid_possible_match_ItemCommand);
      PreRender += TWebForm_process_paypal_donation_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - process_paypal_donation";
        Literal_amount_donated.Text = p.incoming.amount_donated;
        Literal_donor_email_address.Text = p.incoming.donor_email_address;
        Literal_donor_name.Text = p.incoming.donor_name;
        Literal_donation_date.Text = p.incoming.donation_date.ToString("yyyy-MM-dd");
        Literal_donor_house_num.Text = p.incoming.donor_house_num;
        Literal_donor_street.Text = p.incoming.donor_street_name;
        p.biz_residents.BindDirectToBaseDataList(p.incoming.agency,p.incoming.donor_email_address,p.incoming.donor_name,p.incoming.donor_house_num,p.incoming.donor_street_id,DataGrid_possible_match);
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit = NatureOfVisitUnlimited(InstanceId() + ".p");
      if (new ArrayList() {nature_of_visit_type.VISIT_INITIAL,nature_of_visit_type.VISIT_COLD_CALL}.Contains(nature_of_visit))
        {
        p.biz_residents = new TClass_biz_residents();
        p.msg_protected_confirm_paypal_donation = new TClass_msg_protected.confirm_paypal_donation();
        //
        p.incoming = Message<TClass_msg_protected.process_paypal_donation>("protected","process_paypal_donation");
        if (p.incoming == null)
          {
          var hash_table = HashtableOfShieldedRequest();
          p.incoming = new TClass_msg_protected.process_paypal_donation();
          p.incoming.agency = hash_table["agency"].ToString();
          p.incoming.amount_donated = hash_table["amount_donated"].ToString();
          p.incoming.donation_date = DateTime.Parse(hash_table["donation_date"].ToString());
          p.incoming.donor_email_address = hash_table["donor_email_address"].ToString();
          p.incoming.donor_house_num = hash_table["donor_house_num"].ToString();
          p.incoming.donor_name = hash_table["donor_name"].ToString();
          p.incoming.donor_street_id = hash_table["donor_street_id"].ToString();
          p.incoming.donor_street_name = hash_table["donor_street_name"].ToString();
          }
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      }

    protected void Button_cancel_Click(object sender, System.EventArgs e)
      {
      BackTrack();
      }

    private void DataGrid_possible_match_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
      {
      if ((new ArrayList() {ListItemType.AlternatingItem, ListItemType.EditItem, ListItemType.Item, ListItemType.SelectedItem}).Contains(e.Item.ItemType))
        {
        // We are dealing with a data row, not a header or footer row.
        p.msg_protected_confirm_paypal_donation.from_process_paypal_donation = p.incoming;
        p.msg_protected_confirm_paypal_donation.resident_id = k.Safe(e.Item.Cells[TWebForm_process_paypal_donation_Static.TCI_ID].Text,k.safe_hint_type.NUM);
        p.msg_protected_confirm_paypal_donation.resident_name = k.Safe(e.Item.Cells[TWebForm_process_paypal_donation_Static.TCI_NAME].Text.Replace("&nbsp;",k.EMPTY),k.safe_hint_type.ORG_NAME_ASTERICIZED);
        p.msg_protected_confirm_paypal_donation.resident_house_num_and_street = k.Safe(e.Item.Cells[TWebForm_process_paypal_donation_Static.TCI_HOUSE_NUM_AND_STREET].Text,k.safe_hint_type.POSTAL_STREET_ADDRESS);
        p.msg_protected_confirm_paypal_donation.resident_city = k.Safe(e.Item.Cells[TWebForm_process_paypal_donation_Static.TCI_CITY].Text,k.safe_hint_type.POSTAL_CITY);
        p.msg_protected_confirm_paypal_donation.resident_state = k.Safe(e.Item.Cells[TWebForm_process_paypal_donation_Static.TCI_STATE].Text,k.safe_hint_type.ALPHA);
        p.msg_protected_confirm_paypal_donation.num_priors = k.Safe(e.Item.Cells[TWebForm_process_paypal_donation_Static.TCI_NUM_PRIORS].Text,k.safe_hint_type.NUM);
        p.msg_protected_confirm_paypal_donation.avg_amount = k.Safe(e.Item.Cells[TWebForm_process_paypal_donation_Static.TCI_AVG_AMOUNT].Text,k.safe_hint_type.CURRENCY_USA);
        MessageDropCrumbAndTransferTo(p.msg_protected_confirm_paypal_donation,"protected","confirm_paypal_donation");
        }
      }

    protected void Button_unknown_Click(object sender, System.EventArgs e)
      {
      p.msg_protected_confirm_paypal_donation.from_process_paypal_donation = p.incoming;
      p.msg_protected_confirm_paypal_donation.resident_id = k.EMPTY;
      MessageDropCrumbAndTransferTo(p.msg_protected_confirm_paypal_donation,"protected","confirm_paypal_donation");
      }

    private void TWebForm_process_paypal_donation_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    } // end TWebForm_process_paypal_donation

  }
