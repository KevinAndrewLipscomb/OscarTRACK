// Derived from KiAspdotnetFramework/KiAspdotnetFramework.Db/Class~db~template~kicrudhelped~items.cs~template

using Class_dbkeyclick_trail;
using Class_dbkeyclick;
using MySql.Data.MySqlClient;
using System.Text;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Class_db_trespasses
  {
  public class TClass_db_trespasses : TClass_dbkeyclick
    {

    private readonly TClass_dbkeyclick_trail db_trail = null;

    public TClass_db_trespasses() : base()
      {
      db_trail = new TClass_dbkeyclick_trail();
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string keyclick_enumerator_filter
      )
      {
      var trespass_nonparticipant_quoted_csv_list = ConfigurationManager.AppSettings["trespass_nonparticipant_quoted_csv_list"];
      Open();
      using var my_sql_command = new MySqlCommand
        (
        cmdText:new StringBuilder()
          .Append($"select x.house_num as house_num")
          .Append($" , street.id as street_id")
          .Append($" , street.name as street_name")
          .Append($" , GROUP_CONCAT(DISTINCT x.agency separator ',') as agencies")
          .Append($" from resident_base x")
          .Append(  $" join resident_base y on (y.agency<>x.agency and y.street_id=x.street_id and y.house_num=x.house_num)")
          .Append(  $" join street on (street.id=x.street_id)")
          .Append($" where x.agency not in ({trespass_nonparticipant_quoted_csv_list}) and y.agency not in ({trespass_nonparticipant_quoted_csv_list})")
          .Append($" group by x.house_num,x.street_id")
          .Append(  $" having GROUP_CONCAT(DISTINCT x.agency separator ',') like'%{keyclick_enumerator_filter}%'")
          .Append($" order by {sort_order.Replace("%",(be_sort_order_ascending ? " asc" : " desc"))}")
          .ToString(),
        connection:connection
        );
      ((target) as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    internal void BindClaimDetailsBaseDataList
      (
      string house_num,
      string street_id,
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      throw new System.NotImplementedException();
      }

    } // end TClass_db_trespasses
  }
