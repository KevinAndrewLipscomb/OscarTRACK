using Class_db_vehicles;
using System.Collections.Generic;
using System.ServiceModel;

namespace OscarDotNet.service
  {
  // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IFleetStatus" in both code and config file together.
  [ServiceContract]
  public interface IFleetStatus
    {
    [OperationContract]
    List<vehicle_summary> Items
      (
      string sort_order,
      bool be_sort_order_ascending,
      string agency_filter,
      string vehicle_kind_filter,
      bool be_four_or_all_wheel_drive_filter,
      string quarters_filter
      );
    }
  }
