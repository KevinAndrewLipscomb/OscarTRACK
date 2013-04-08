using Class_biz_roles;
using Class_db_agencies;
using Class_db_agency_satellite_stations;
using kix;
using System.Collections;

namespace Class_biz_agencies
{
    public class TClass_biz_agencies
    {

        private TClass_biz_roles biz_roles = null;
        private TClass_db_agencies db_agencies = null;
        private TClass_db_agency_satellite_stations db_agency_satellite_stations = null;

        //Constructor  Create()
        public TClass_biz_agencies() : base()
        {
            biz_roles = new TClass_biz_roles();
            db_agencies = new TClass_db_agencies();
            db_agency_satellite_stations = new TClass_db_agency_satellite_stations();
        }

        internal bool BeAgencyResponsibleForPost
          (
          string agency_id,
          string post_id
          )
          {
          if (agency_id == post_id)
            {
            return true;
            }
          else
            {
            return db_agency_satellite_stations.BeStationSatelliteOfAgency(post_id,agency_id);
            }
          }

        internal bool BeFullWatchbillPublishMandatory
          (
          string agency_filter,
          k.subtype<int> relative_month
          )
          {
          return db_agencies.BeNotificationPendingForAllInScope(agency_filter,relative_month);
          }

        public bool BeImmediateOutTransfersAllowed(string agency)
          {
          return (agency == "EMS");
          }

        internal bool BeOkToDefaultAgencyFilterToAll
          (
          bool be_ok_to_see_all_squads,
          string[] roles
          )
          {
          return be_ok_to_see_all_squads && (int.Parse(biz_roles.TierOfName(roles[0])) == 1);
          }

        public bool BeOkToSharePhoneListWithSiblings(string id)
        {
            bool result;
            result = (id != "14");
            return result;
        }

        public bool Bind(string partial_spec, object target)
          {
          return db_agencies.Bind(partial_spec, target);
          }

        public void BindEmsPostListControlShort(object target, string selected_id, bool be_available_option_all, string unselected_literal)
        {
            db_agencies.BindEmsPostListControlShort(target, selected_id, be_available_option_all, unselected_literal);
        }

        public void BindEmsPostListControlShort(object target)
        {
            BindEmsPostListControlShort(target, "");
        }

        public void BindEmsPostListControlShort(object target, string selected_id)
        {
            BindEmsPostListControlShort(target, selected_id, true);
        }

        public void BindEmsPostListControlShort(object target, string selected_id, bool be_available_option_all)
        {
            BindEmsPostListControlShort(target, selected_id, be_available_option_all, "All");
        }

        public void BindListControlShort(object target)
        {
            BindListControlShort(target, "");
        }

        public void BindListControlShort(object target, string selected_id)
        {
            BindListControlShort(target, selected_id, true);
        }

        public void BindListControlShort(object target, string selected_id, bool be_available_option_all)
        {
            BindListControlShort(target, selected_id, be_available_option_all, "All");
        }

        public void BindListControlShort(object target, string selected_id, bool be_available_option_all, string unselected_literal)
        {
            db_agencies.BindListControlShort(target, selected_id, be_available_option_all, unselected_literal);
        }

        public void BindListControlShortDashLong(object target, string selected_id, bool be_available_option_all, string option_all_text)
        {
            db_agencies.BindListControlShortDashLong(target, selected_id, be_available_option_all, option_all_text);
        }

        public void BindListControlShortDashLong(object target)
        {
            BindListControlShortDashLong(target, "");
        }

        public void BindListControlShortDashLong(object target, string selected_id)
        {
            BindListControlShortDashLong(target, selected_id, true);
        }

        public void BindListControlShortDashLong(object target, string selected_id, bool be_available_option_all)
        {
            BindListControlShortDashLong(target, selected_id, be_available_option_all, "-- Select --");
        }

        internal void BindListControlShortDashLongSatelliteStations(object target)
          {
          db_agencies.BindListControlShortDashLongSatelliteStations(target);
          }

        internal void BindEmsPostListItemCollectionShort
          (
          string tier,
          string agency_filter,
          string post_footprint,
          bool be_condensed,
          object target
          )
          {
          db_agencies.BindEmsPostListItemCollectionShort(tier,agency_filter,post_footprint,be_condensed,target);
          }

        internal void BindEvalPostDirectToListControl(object target)
          {
          db_agencies.BindEvalPostDirectToListControl(target);
          }

        public void BindForCommensuration(object target)
        {
            db_agencies.BindForCommensuration(target);
        }

        public void BindForControlCharts(string indicator, object target)
        {
            db_agencies.BindForControlCharts(indicator, target);
        }

        public void BindRankedCommensuration(object target)
        {
            db_agencies.BindRankedCommensuration(target);
        }

        public bool Delete(string id)
          {
          return db_agencies.Delete(id);
          }

        public bool Get
          (
          string id,
          out string short_designator,
          out string medium_designator,
          out string long_designator,
          out bool be_active,
          out string keyclick_enumerator,
          out string oscar_classic_enumerator,
          out bool be_ems_post,
          out string door_code,
          out bool be_ok_to_nag,
          out bool be_ok_to_send_duty_reminders,
          out string address
          )
          {
          return db_agencies.Get(id,out short_designator,out medium_designator,out long_designator,out be_active,out keyclick_enumerator,out oscar_classic_enumerator,out be_ems_post,out door_code,out be_ok_to_nag,out be_ok_to_send_duty_reminders,out address);
          }

        public string IdOfShortDesignator(string short_designator)
        {
            string result;
            result = db_agencies.IdOfShortDesignator(short_designator);
            return result;
        }

        internal string IdResponsibleForPost(string post_id)
          {
          return db_agencies.IdResponsibleForPost(post_id);
          }

        internal string KeyclickEnumeratorOf(string id)
          {
          return db_agencies.KeyclickEnumeratorOf(id);
          }

        public string LongDesignatorOf(string id)
        {
            string result;
            result = db_agencies.LongDesignatorOf(id);
            return result;
        }

        public string MediumDesignatorOf(string id)
        {
            string result;
            result = db_agencies.MediumDesignatorOf(id);
            return result;
        }

        internal string OscarClassicEnumeratorOf(string id)
          {
          return db_agencies.OscarClassicEnumeratorOf(id);
          }

        public string OverallCommensuration()
        {
            string result;
            result = db_agencies.OverallCommensuration();
            return result;
        }

        public Queue SerialIndicatorData(string indicator, string agency_id, string be_agency_id_applicable)
        {
            Queue result;
            result = db_agencies.SerialIndicatorData(indicator, agency_id, be_agency_id_applicable);
            return result;
        }

        public void Set
          (
          string id,
          string short_designator,
          string medium_designator,
          string long_designator,
          bool be_active,
          string keyclick_enumerator,
          string oscar_classic_enumerator,
          bool be_ems_post,
          string door_code,
          bool be_ok_to_nag,
          bool be_ok_to_send_duty_reminders,
          string address
          )
          {
          db_agencies.Set(id,short_designator,medium_designator,long_designator,be_active,keyclick_enumerator,oscar_classic_enumerator,be_ems_post,door_code,be_ok_to_nag,be_ok_to_send_duty_reminders,address);
          }

        public void SetCommensuration(Queue commensuration_rec_q)
        {
            db_agencies.SetCommensuration(commensuration_rec_q);
        }

        public string ShortDesignatorOf(string id)
        {
            string result;
            result = db_agencies.ShortDesignatorOf(id);
            return result;
        }

    } // end TClass_biz_agencies

}
