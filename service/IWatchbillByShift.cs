using Class_db_schedule_assignments;
using System.Collections.Generic;
using System.ServiceModel;

namespace OscarDotNet.service
  {
  // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IWatchbillByShift" in both code and config file together.
  [ServiceContract]
  public interface IWatchbillByShift
    {
    [OperationContract]
    List<schedule_assignment_summary> Assignments
      (
      string agency_filter,
      string relative_month_val,
      string shift_name,
      string nominal_day_filter,
      string depth_filter
      );
    }
  }
