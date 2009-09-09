using MySql.Data.MySqlClient;
using System;

using System.Web.UI.WebControls;
using Class_db;
namespace Class_db_officerships
{
    public static class Class_db_officerships_Static
    {
        public const int TCCI_ID = 0;
        public const int TCCI_START_DATE = 1;
        public const int TCCI_END_DATE = 2;
        public const int TCCI_RANK = 3;
    } // end Class_db_officerships

    public class TClass_db_officerships: TClass_db
    {
        //Constructor  Create()
        public TClass_db_officerships() : base()
        {
            // TODO: Add any constructor code here

        }
        public void Bind(string member_id, object target)
        {
            this.Open();
            // column 0
            // column 1
            // column 2
            // column 3
            ((target) as DataGrid).DataSource = new MySqlCommand("select officership.id as id" + " , date_format(start_date,\"%Y-%m-%d\") as start_date" + " , date_format(end_date,\"%Y-%m-%d\") as end_date" + " , rank.name as rank" + " from officership" + " join member on (member.id=officership.member_id)" + " join rank on (rank.code=officership.rank_code)" + " where member.id = " + member_id + " order by start_date desc", this.connection).ExecuteReader();
            ((target) as DataGrid).DataBind();
            this.Close();
        }

    } // end TClass_db_officerships

}

