// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using kix;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace Class_db_oscalert_logs
  {

  public class TClass_db_oscalert_logs: TClass_db
    {

    internal void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string impression_filter,
      string recency_filter
      )
      {
      var impression_filter_clause = k.EMPTY;
      if (impression_filter.Length > 0)
        {
        if (impression_filter == "Fire")
          {
          impression_filter_clause = " and REPLACE(content,'OSCALERT: ','') like 'VBFD %'";
          }
        else if (impression_filter == "Mci")
          {
          impression_filter_clause = " and REPLACE(content,'OSCALERT: ','') like '% MCI %'";
          }
        else if (impression_filter == "FireSurge")
          {
          impression_filter_clause = " and REPLACE(content,'OSCALERT: ','') like 'VBFD has m%'";
          }
        else if (impression_filter == "TwoAlarmFire")
          {
          impression_filter_clause = " and REPLACE(content,'OSCALERT: ','') like 'VBFD has a 2%'";
          }
        else if (impression_filter == "MultiAlarmFire")
          {
          impression_filter_clause = " and REPLACE(content,'OSCALERT: ','') like 'VBFD has a M%'";
          }
        else if (impression_filter == "MciSmall")
          {
          impression_filter_clause = " and REPLACE(content,'OSCALERT: ','') like 'Sm%'";
          }
        else if (impression_filter == "MciMedium")
          {
          impression_filter_clause = " and REPLACE(content,'OSCALERT: ','') like 'Me%'";
          }
        else if (impression_filter == "MciLarge")
          {
          impression_filter_clause = " and REPLACE(content,'OSCALERT: ','') like 'L%'";
          }
        else if (impression_filter == "MciHuge")
          {
          impression_filter_clause = " and REPLACE(content,'OSCALERT: ','') like 'H%'";
          }
        else
          {
          impression_filter_clause = " and REPLACE(content,'OSCALERT: ','') like '" + impression_filter + "%'";
          }
        }
      var recency_filter_unit = "DAY";
      if (recency_filter.Length > 0)
        {
        if (recency_filter == "ThisWeek")
          {
          recency_filter_unit = "WEEK";
          }
        else if (recency_filter == "ThisMonth")
          {
          recency_filter_unit = "MONTH";
          }
        else
          {
          recency_filter_unit = "QUARTER";
          }
        }
      Open();
      ((target) as BaseDataList).DataSource = new MySqlCommand
        (
        "select DATE_FORMAT(timestamp,'%Y-%m-%d %H:%i:%s') as timestamp"
        + " , content"
        + " from oscalert_log"
        + " where content not like '%need%'"
        +   " and content not like '%hold%'"
        +   impression_filter_clause
        +   " and timestamp >= DATE_SUB(NOW(),INTERVAL 1 " + recency_filter_unit + ")"
        + " order by id desc",
        connection
        )
        .ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    } // end TClass_db_oscalert_logs

  }
