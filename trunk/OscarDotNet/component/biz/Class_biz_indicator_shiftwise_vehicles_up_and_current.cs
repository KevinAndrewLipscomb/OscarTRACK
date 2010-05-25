using Class_db_indicator_shiftwise_vehicles_up_and_current;
using kix;
using System;
using System.Collections;

namespace Class_biz_indicator_shiftwise_vehicles_up_and_current
  {

  public class TClass_biz_indicator_shiftwise_vehicles_up_and_current
    {

    private TClass_db_indicator_shiftwise_vehicles_up_and_current db_indicator_shiftwise_vehicles_up_and_current = null;

    public TClass_biz_indicator_shiftwise_vehicles_up_and_current() : base()
      {
      // TODO: Add any constructor code here
      db_indicator_shiftwise_vehicles_up_and_current = new TClass_db_indicator_shiftwise_vehicles_up_and_current();
      }

    internal void Log
      (
      string agency_filter,
      decimal value
      )
      {
      db_indicator_shiftwise_vehicles_up_and_current.Log(agency_filter, value);
      }

    internal void BindSpecialForMonthlyMedians(object target)
      {
      db_indicator_shiftwise_vehicles_up_and_current.BindSpecialForMonthlyMedians(target);
      }

    } // end TClass_biz_indicator_shiftwise_vehicles_up_and_current

  }
