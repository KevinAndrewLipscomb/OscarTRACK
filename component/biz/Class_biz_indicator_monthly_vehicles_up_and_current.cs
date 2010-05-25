using Class_db_indicator_monthly_vehicles_up_and_current;
using kix;
using System.Collections;

namespace Class_biz_indicator_monthly_vehicles_up_and_current
  {

  public class TClass_biz_indicator_monthly_vehicles_up_and_current
    {

    private TClass_db_indicator_monthly_vehicles_up_and_current db_indicator_monthly_vehicles_up_and_current = null;

    public TClass_biz_indicator_monthly_vehicles_up_and_current() : base()
      {
      // TODO: Add any constructor code here
      db_indicator_monthly_vehicles_up_and_current = new TClass_db_indicator_monthly_vehicles_up_and_current();
      }

    internal void Log
      (
      ArrayList citywide_array_list,
      ArrayList mrt_array_list,
      ArrayList r01_array_list,
      ArrayList r02_array_list,
      ArrayList r04_array_list,
      ArrayList r05_array_list,
      ArrayList r06_array_list,
      ArrayList r09_array_list,
      ArrayList r13_array_list,
      ArrayList r14_array_list,
      ArrayList r16_array_list,
      ArrayList r17_array_list,
      ArrayList sar_array_list
      )
      {
      citywide_array_list.Sort();
      mrt_array_list.Sort();
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
      sar_array_list.Sort();
      db_indicator_monthly_vehicles_up_and_current.Log
        (
        k.Median(citywide_array_list),
        k.Median(mrt_array_list),
        k.Median(r01_array_list),
        k.Median(r02_array_list),
        k.Median(r04_array_list),
        k.Median(r05_array_list),
        k.Median(r06_array_list),
        k.Median(r09_array_list),
        k.Median(r13_array_list),
        k.Median(r14_array_list),
        k.Median(r16_array_list),
        k.Median(r17_array_list),
        k.Median(sar_array_list)
        );
      }

    }

  }