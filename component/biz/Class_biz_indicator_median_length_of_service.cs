using Class_db_indicator_median_length_of_service;
using kix;
using System;
using System.Collections;

namespace Class_biz_indicator_median_length_of_service
{
    public class TClass_biz_indicator_median_length_of_service
    {
        private TClass_db_indicator_median_length_of_service db_indicator_median_length_of_service = null;
        //Constructor  Create()
        public TClass_biz_indicator_median_length_of_service() : base()
        {
            // TODO: Add any constructor code here
            db_indicator_median_length_of_service = new TClass_db_indicator_median_length_of_service();
        }
        public void BindLatestRankedYearsOfService(object target, bool be_trendable)
        {
            db_indicator_median_length_of_service.BindLatestRankedYearsOfService(target, be_trendable);
        }

        public void Log(bool be_trendable, ArrayList citywide_array_list, ArrayList ems_array_list, ArrayList r01_array_list, ArrayList r02_array_list, ArrayList r04_array_list, ArrayList r05_array_list, ArrayList r06_array_list, ArrayList r09_array_list, ArrayList r13_array_list, ArrayList r14_array_list, ArrayList r16_array_list, ArrayList r17_array_list)
        {
            citywide_array_list.Sort();
            ems_array_list.Sort();
            r01_array_list.Sort();
            r02_array_list.Sort();
            r04_array_list.Sort();
            r05_array_list.Sort();
            r06_array_list.Sort();
            r09_array_list.Sort();
            r13_array_list.Sort();
            r14_array_list.Sort();
            r16_array_list.Sort();
            r17_array_list.Sort();
            db_indicator_median_length_of_service.Log(be_trendable, k.Median(citywide_array_list), k.Median(ems_array_list), k.Median(r01_array_list), k.Median(r02_array_list), k.Median(r04_array_list), k.Median(r05_array_list), k.Median(r06_array_list), k.Median(r09_array_list), k.Median(r13_array_list), k.Median(r14_array_list), k.Median(r16_array_list), k.Median(r17_array_list));
        }

    } // end TClass_biz_indicator_median_length_of_service

}
