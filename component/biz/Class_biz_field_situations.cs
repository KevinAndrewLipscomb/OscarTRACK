// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_field_situation_impressions;
using Class_db_field_situations;
using Class_biz_notifications;
using kix;
using System;
using System.Collections;
using System.Configuration;

namespace Class_biz_field_situations
  {

  public class TClass_biz_field_situations
    {

    //--
    //
    // PRIVATE
    //
    //--

    private TClass_db_field_situation_impressions db_field_situation_impressions = null;
    private TClass_db_field_situations db_field_situations = null;
    private TClass_biz_notifications biz_notifications = null;

    private void FormImpression
      (
      TClass_db_field_situations.digest digest,
      out string impression_id,
      out string impression_description,
      out string impression_elaboration,
      out bool be_escalation
      )
      {
      be_escalation = false;
      //
      var impression_pecking_order = new k.int_nonnegative();
      //
      // Set up the default impression.
      //
      if (digest.be_etby || digest.be_ftby)
        {
        impression_pecking_order.val = db_field_situation_impressions.PeckingOrderValOfDescription("Standby");
        //
        // No further analysis needed
        //
        }
      else
        {
        impression_pecking_order.val = db_field_situation_impressions.PeckingOrderValOfDescription("Typical");
        //
        // Form current impression.
        //
        if (digest.num_zone_cars >= 1)
          {
          impression_pecking_order.val = db_field_situation_impressions.PeckingOrderValOfDescription("AlsEms");
          }
        if (digest.be_mrt || (digest.num_fboas >= 1) || (digest.num_rbs >= 1))
          {
          impression_pecking_order.val = db_field_situation_impressions.PeckingOrderValOfDescription("MrtCall");
          }
        if (digest.be_sart)
          {
          impression_pecking_order.val = db_field_situation_impressions.PeckingOrderValOfDescription("SarCall");
          }
        //if ()
        //  {
        //  impression_pecking_order.val = db_field_situation_impressions.GetPeckingOrderOfDescription("AirportAlert");
        //  }
        if (digest.num_holds >= 1)
          {
          impression_pecking_order.val = db_field_situation_impressions.PeckingOrderValOfDescription("AmbNeeded");
          }
        if (digest.num_hzcs >= 1)
          {
          impression_pecking_order.val = db_field_situation_impressions.PeckingOrderValOfDescription("AlsNeeded");
          }
        if(
            (digest.num_ambulances + digest.num_holds == 1)
          &&
            (digest.num_engines + digest.num_ladders + digest.num_frsqs + digest.num_hazs + digest.num_squad_trucks == 1)
          &&
            (digest.num_supervisors >= 1)
          &&
            (digest.num_zone_cars + digest.num_hzcs == 2)
          &&
            (digest.num_hzcs >= 1)
          )
          {
          impression_pecking_order.val = db_field_situation_impressions.PeckingOrderValOfDescription("CardiacArrestAlsNeeded");
          }
        if(
            (digest.num_holds == 1)
          &&
            (digest.num_engines + digest.num_ladders + digest.num_frsqs + digest.num_hazs + digest.num_squad_trucks == 1)
          &&
            (digest.num_supervisors >= 1)
          &&
            (digest.num_zone_cars + digest.num_hzcs == 2)
          )
          {
          impression_pecking_order.val = db_field_situation_impressions.PeckingOrderValOfDescription("CardiacArrestAmbNeeded");
          }
        if(
            (digest.num_engines >= 4)
          &&
            (digest.num_ladders >= 1)
          &&
            (digest.num_frsqs >= 1)
          &&
            (digest.num_tacs >= 1)
          &&
            (digest.num_bats >= 1)
          &&
            (digest.num_ambulances + digest.num_holds >= 1)
          &&
            (digest.num_supervisors >= 1)
          &&
            (digest.num_safes >= 1)
          )
          {
          impression_pecking_order.val = db_field_situation_impressions.PeckingOrderValOfDescription("WorkingFire");
          }
        //if (false)
        //  {
        //  impression_pecking_order.val = db_field_situation_impressions.GetPeckingOrderOfDescription("TwoAlarmFire");
        //  }
        //if (false)
        //  {
        //  impression_pecking_order.val = db_field_situation_impressions.GetPeckingOrderOfDescription("MajorFireIncident");
        //  }
        //if (false)
        //  {
        //  impression_pecking_order.val = db_field_situation_impressions.GetPeckingOrderOfDescription("MultiAlarmFire");
        //  }
        if(digest.be_sqtm)
          {
          impression_pecking_order.val = db_field_situation_impressions.PeckingOrderValOfDescription("Trap");
          }
        if (digest.num_ambulances + digest.num_holds >= 4)
          {
          impression_pecking_order.val = db_field_situation_impressions.PeckingOrderValOfDescription("MciSmall");
          }
        if (digest.num_ambulances + digest.num_holds >= 7)
          {
          impression_pecking_order.val = db_field_situation_impressions.PeckingOrderValOfDescription("MciMedium");
          }
        if (digest.num_ambulances + digest.num_holds >= 11)
          {
          impression_pecking_order.val = db_field_situation_impressions.PeckingOrderValOfDescription("MciLarge");
          }
        if (digest.num_ambulances + digest.num_holds >= 16)
          {
          impression_pecking_order.val = db_field_situation_impressions.PeckingOrderValOfDescription("MciHuge");
          }
        //
        // Consider prior impression, identify escalation, prevent downgrade.
        //
        var prior_impression_pecking_order = db_field_situations.PriorImpressionPeckingOrder(case_num:digest.case_num);
        if (impression_pecking_order.val > prior_impression_pecking_order.val)
          {
          be_escalation = (impression_pecking_order.val > 1750);
          }
        else
          {
          impression_pecking_order.val = prior_impression_pecking_order.val;
          }
        }
      //
      db_field_situation_impressions.GetIdDescriptionElaborationOfPeckingOrder
        (
        pecking_order:impression_pecking_order,
        id:out impression_id,
        description:out impression_description,
        elaboration:out impression_elaboration
        );
      }

    //--
    //
    // INTERNAL/PUBLIC
    //
    //--

    public TClass_biz_field_situations() : base()
      {
      db_field_situation_impressions = new TClass_db_field_situation_impressions();
      db_field_situations = new TClass_db_field_situations();
      biz_notifications = new TClass_biz_notifications();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_field_situations.Bind(partial_spec, target);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_field_situations.BindBaseDataList(sort_order,be_sort_order_ascending,target);
      }

    public void BindDirectToListControl(object target)
      {
      db_field_situations.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_field_situations.Delete(id);
      }

    internal void DetectAndNotify
      (
      ref DateTime saved_multambholds_alert_timestamp,
      ref DateTime saved_multalsholds_alert_timestamp,
      ref DateTime saved_firesurge_alert_timestamp
      )
      {
      //
      // Digest CAD records.
      //
      db_field_situations.MarkAllStale();
      TClass_db_field_situations.digest digest;
      var digest_q = db_field_situations.DigestQ();
      var impression_description = k.EMPTY;
      var impression_elaboration = k.EMPTY;
      var impression_id = k.EMPTY;
      var be_escalation = false;
      var be_any_case_escalated = false;
      while (digest_q.Count > 0)
        {
        digest = digest_q.Dequeue();
        //
        FormImpression
          (
          digest:digest,
          impression_id:out impression_id,
          impression_description:out impression_description,
          impression_elaboration:out impression_elaboration,
          be_escalation:out be_escalation
          );
        //
        db_field_situations.Set
          (
          id:k.EMPTY,
          case_num:digest.case_num,
          address:digest.address,
          assignment:digest.assignment,
          time_initialized:digest.time_initialized,
          nature:k.EMPTY,
          impression_id:impression_id,
          num_ambulances:digest.num_ambulances,
          num_zone_cars:digest.num_zone_cars,
          num_squad_trucks:digest.num_squad_trucks,
          num_supervisors:digest.num_supervisors,
          be_emtals:digest.be_emtals,
          be_etby:digest.be_etby,
          num_holds:digest.num_holds,
          num_hzcs:digest.num_hzcs,
          num_lifeguards:digest.num_lifeguards,
          num_mci_trucks:digest.num_mci_trucks,
          be_mrt:digest.be_mrt,
          num_mrtks:digest.num_mrtks,
          be_pio:digest.be_pio,
          be_pu:digest.be_pu,
          be_rescue_area:digest.be_rescue_area,
          num_rbs:digest.num_rbs,
          be_sqtm:digest.be_sqtm,
          num_tacs:digest.num_tacs,
          num_bats:digest.num_bats,
          num_cars:digest.num_cars,
          num_engines:digest.num_engines,
          num_fboas:digest.num_fboas,
          num_frsqs:digest.num_frsqs,
          be_ftby:digest.be_ftby,
          num_hazs:digest.num_hazs,
          num_ladders:digest.num_ladders,
          be_mirt:digest.be_mirt,
          num_safes:digest.num_safes,
          be_stech:digest.be_stech,
          num_sups:digest.num_sups,
          num_tankers:digest.num_tankers,
          be_sart:digest.be_sart
          );
        //
        if (be_escalation && (impression_description != "WorkingFire"))
          {
          be_any_case_escalated = true;
          //
          biz_notifications.IssueOscalert
            (
            description:impression_description,
            elaboration:impression_elaboration
              .Replace("<address/>",digest.address)
              .Replace("<assignment/>",digest.assignment)
            );
          }
        }
      db_field_situations.DeleteAnyStillStale();
      //
      if (be_any_case_escalated)
        {
        //
        // Meta analyses and notifications
        //
        if (db_field_situations.BeMultAmbHolds() && (DateTime.Now - saved_multambholds_alert_timestamp > TimeSpan.Parse(ConfigurationManager.AppSettings["oscalert_inhibition_period_multambholds"])))
          {
          biz_notifications.IssueOscalert
            (
            description:"MultAmbHolds",
            elaboration:impression_elaboration
            );
          saved_multambholds_alert_timestamp = DateTime.Now;
          }
        if (db_field_situations.BeMultAlsHolds() && (DateTime.Now - saved_multalsholds_alert_timestamp > TimeSpan.Parse(ConfigurationManager.AppSettings["oscalert_inhibition_period_multalsholds"])))
          {
          biz_notifications.IssueOscalert
            (
            description:"MultAlsHolds",
            elaboration:impression_elaboration
            );
          saved_multalsholds_alert_timestamp = DateTime.Now;
          }
        if (db_field_situations.BeFireSurge() && (DateTime.Now - saved_firesurge_alert_timestamp > TimeSpan.Parse(ConfigurationManager.AppSettings["oscalert_inhibition_period_fire_surge"])))
          {
          biz_notifications.IssueOscalert
            (
            description:"FireSurge",
            elaboration:impression_elaboration
            );
          saved_firesurge_alert_timestamp = DateTime.Now;
          }
        }
      }

    public bool Get
      (
      string id,
      out string case_num,
      out string address,
      out string assignment,
      out DateTime time_initialized,
      out string nature,
      out string impression_id,
      out string num_ambulances,
      out string num_zone_cars,
      out string num_squad_trucks,
      out string num_supervisors,
      out bool be_emtals,
      out bool be_etby,
      out string num_holds,
      out string num_hzcs,
      out string num_lifeguards,
      out string num_mci_trucks,
      out bool be_mrt,
      out string num_mrtks,
      out bool be_pio,
      out bool be_pu,
      out bool be_rescue_area,
      out string num_rbs,
      out bool be_sqtm,
      out string num_tacs,
      out string num_bats,
      out string num_cars,
      out string num_engines,
      out string num_fboas,
      out string num_frsqs,
      out bool be_ftby,
      out string num_hazs,
      out string num_ladders,
      out bool be_mirt,
      out string num_safes,
      out bool be_stech,
      out string num_sups,
      out string num_tankers,
      out bool be_sart
      )
      {
      return db_field_situations.Get
        (
        id,
        out case_num,
        out address,
        out assignment,
        out time_initialized,
        out nature,
        out impression_id,
        out num_ambulances,
        out num_zone_cars,
        out num_squad_trucks,
        out num_supervisors,
        out be_emtals,
        out be_etby,
        out num_holds,
        out num_hzcs,
        out num_lifeguards,
        out num_mci_trucks,
        out be_mrt,
        out num_mrtks,
        out be_pio,
        out be_pu,
        out be_rescue_area,
        out num_rbs,
        out be_sqtm,
        out num_tacs,
        out num_bats,
        out num_cars,
        out num_engines,
        out num_fboas,
        out num_frsqs,
        out be_ftby,
        out num_hazs,
        out num_ladders,
        out be_mirt,
        out num_safes,
        out be_stech,
        out num_sups,
        out num_tankers,
        out be_sart
        );
      }

    public void Set
      (
      string id,
      string case_num,
      string address,
      string assignment,
      DateTime time_initialized,
      string nature,
      string impression_id,
      int num_ambulances,
      int num_zone_cars,
      int num_squad_trucks,
      int num_supervisors,
      bool be_emtals,
      bool be_etby,
      int num_holds,
      int num_hzcs,
      int num_lifeguards,
      int num_mci_trucks,
      bool be_mrt,
      int num_mrtks,
      bool be_pio,
      bool be_pu,
      bool be_rescue_area,
      int num_rbs,
      bool be_sqtm,
      int num_tacs,
      int num_bats,
      int num_cars,
      int num_engines,
      int num_fboas,
      int num_frsqs,
      bool be_ftby,
      int num_hazs,
      int num_ladders,
      bool be_mirt,
      int num_safes,
      bool be_stech,
      int num_sups,
      int num_tankers,
      bool be_sart
      )
      {
      db_field_situations.Set
        (
        id,
        case_num,
        address,
        assignment,
        time_initialized,
        nature,
        impression_id,
        num_ambulances,
        num_zone_cars,
        num_squad_trucks,
        num_supervisors,
        be_emtals,
        be_etby,
        num_holds,
        num_hzcs,
        num_lifeguards,
        num_mci_trucks,
        be_mrt,
        num_mrtks,
        be_pio,
        be_pu,
        be_rescue_area,
        num_rbs,
        be_sqtm,
        num_tacs,
        num_bats,
        num_cars,
        num_engines,
        num_fboas,
        num_frsqs,
        be_ftby,
        num_hazs,
        num_ladders,
        be_mirt,
        num_safes,
        be_stech,
        num_sups,
        num_tankers,
        be_sart
        );
      }

    internal object Summary(string id)
      {
      return db_field_situations.Summary(id);
      }

    } // end TClass_biz_field_situations

  }
