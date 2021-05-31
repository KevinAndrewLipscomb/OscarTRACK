// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace Class_db_field_situations
  {

  public class TClass_db_field_situations: TClass_db
    {

    internal void BindBaseDataList
      (
      #pragma warning disable IDE0060 // Remove unused parameter
      #pragma warning disable CA1801 // Remove unused parameter
      string sort_order,
      bool be_sort_order_ascending,
      object target
      #pragma warning restore CA1801 // Remove unused parameter
      #pragma warning restore IDE0060 // Remove unused parameter
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select field_situation.id as id"
        + " , DATE_FORMAT(time_initialized,'%Y-%m-%d %H:%i') as time_initialized"
        + " , nature"
        + " , address"
        + " , assignment"
        + " , description as impression"
        + " from field_situation"
        +   " join field_situation_impression on (field_situation_impression.id=field_situation.impression_id)"
        + " where assignment not like '%FAST%'"
        +   " and assignment not rlike '^R[[:digit:]]+$'"
        +   " and assignment not in ('ECOMM','FCOMM')"
        +   " and"
        +     " ("
        +       " time_initialized >= DATE_SUB(NOW(),INTERVAL 3 HOUR)"
        +     " or"
        +       " assignment like '%,%'"
        +     " )"
        + " order by time_initialized desc, case_num desc, field_situation.id desc",
        connection
        );
      ((target) as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    internal void Remove(string id)
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "START TRANSACTION"
        + ";"
        + " update cad_record set be_current = false where incident_num = (select case_num from field_situation where id = '" + id + "')"
        + ";"
        + " delete from field_situation where id = '" + id + "'"
        + ";"
        + " COMMIT",
        connection
        );
      my_sql_command.ExecuteNonQuery();
      Close();
      }

    } // end TClass_db_field_situations

  }
