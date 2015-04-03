// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
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
      object target
      )
      {
      Open();
      ((target) as BaseDataList).DataSource = new MySqlCommand
        (
        "select timestamp"
        + " , content"
        + " from oscalert_log"
        + " where content not like '%need%'"
        +   " and content not like '%hold%'"
        + " order by id desc"
        + " limit 20",
        connection
        )
        .ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    } // end TClass_db_oscalert_logs

  }
