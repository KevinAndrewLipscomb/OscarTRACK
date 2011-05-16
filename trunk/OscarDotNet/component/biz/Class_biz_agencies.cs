using Class_db_agencies;
using Class_db_agency_satellite_stations;
using System.Collections;

namespace Class_biz_agencies
{
    public class TClass_biz_agencies
    {

        private TClass_db_agencies db_agencies = null;
        private TClass_db_agency_satellite_stations db_agency_satellite_stations = null;

        //Constructor  Create()
        public TClass_biz_agencies() : base()
        {
            // TODO: Add any constructor code here
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

        public bool BeImmediateOutTransfersAllowed(string agency)
          {
          return (agency == "EMS");
          }

        public bool BeOkToSharePhoneListWithSiblings(string id)
        {
            bool result;
            result = (id != "14");
            return result;
        }

        public bool Bind(string partial_username, object target)
        {
            bool result;
            result = db_agencies.Bind(partial_username, target);
            return result;
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

        public void Delete(string username)
        {
            db_agencies.Delete(username);
        }

        public bool Get(string short_designator, out string medium_designator, out string long_designator, out bool be_active)
        {
            bool result;
            result = db_agencies.Get(short_designator, out medium_designator, out long_designator, out be_active);

            return result;
        }

        public string IdOfShortDesignator(string short_designator)
        {
            string result;
            result = db_agencies.IdOfShortDesignator(short_designator);
            return result;
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

        public void Set(string short_designator, string medium_designator, string long_designator, bool be_active)
        {
            db_agencies.Set(short_designator, medium_designator, long_designator, be_active);

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
