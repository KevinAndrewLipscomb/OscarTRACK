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
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      Open();
      ((target) as BaseDataList).DataSource = new MySqlCommand
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
        + " order by case_num desc, field_situation.id desc",
        connection
        )
        .ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    internal void Remove(string id)
      {
      Open();
      new MySqlCommand
        (
        "START TRANSACTION"
        + ";"
        + " update cad_record set be_current = false where incident_num = (select case_num from field_situation where id = '" + id + "')"
        + ";"
        + " delete from field_situation where id = '" + id + "'"
        + ";"
        + " COMMIT",
        connection
        )
        .ExecuteNonQuery();
      Close();
      }

    } // end TClass_db_field_situations

  }