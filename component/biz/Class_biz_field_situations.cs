// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_field_situations;
using kix;
using System;

namespace Class_biz_field_situations
  {
  public class TClass_biz_field_situations
    {
    private TClass_db_field_situations db_field_situations = null;

    public TClass_biz_field_situations() : base()
      {
      db_field_situations = new TClass_db_field_situations();
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

    internal void DetectAndNotify()
      {
      //
      // Digest CAD records.
      //
      db_field_situations.MarkAllStale();
      TClass_db_field_situations.digest digest;
      var digest_q = db_field_situations.DigestQ();
      while (digest_q.Count > 0)
        {
        digest = digest_q.Dequeue();
        db_field_situations.Set
          (
          id:k.EMPTY,
          case_num:digest.case_num,
          address:digest.address,
          assignment:digest.assignment,
          time_initialized:digest.time_initialized,
          nature:k.EMPTY,
          impression_id:k.EMPTY,
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
          num_sqs:digest.num_sqs,
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
          num_tankers:digest.num_tankers
          );
        }
      db_field_situations.DeleteAnyStillStale();
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
      out string num_sqs,
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
      out string num_tankers
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
        out num_sqs,
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
        out num_tankers
        );
      }

    public void Set
      (
      string id,
      string case_num,
      string address,
      string assignment,
      string time_initialized,
      string nature,
      string impression_id,
      string num_ambulances,
      string num_zone_cars,
      string num_squad_trucks,
      string num_supervisors,
      string be_emtals,
      string be_etby,
      string num_holds,
      string num_hzcs,
      string num_lifeguards,
      string num_mci_trucks,
      string be_mrt,
      string num_mrtks,
      string be_pio,
      string be_pu,
      string be_rescue_area,
      string num_rbs,
      string num_sqs,
      string be_sqtm,
      string num_tacs,
      string num_bats,
      string num_cars,
      string num_engines,
      string num_fboas,
      string num_frsqs,
      string be_ftby,
      string num_hazs,
      string num_ladders,
      string be_mirt,
      string num_safes,
      string be_stech,
      string num_sups,
      string num_tankers
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
        num_sqs,
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
        num_tankers
        );
      }

    internal object Summary(string id)
      {
      return db_field_situations.Summary(id);
      }

    } // end TClass_biz_field_situations

  }
