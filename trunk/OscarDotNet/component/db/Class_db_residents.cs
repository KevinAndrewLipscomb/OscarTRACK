using Class_db_agencies;
using Class_dbkeyclick;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Web.UI.WebControls;

namespace Class_db_residents
  {

  public class TClass_db_residents: TClass_dbkeyclick
    {

    private readonly TClass_db_agencies db_agencies = null;
    
    public TClass_db_residents() : base()
      {
      db_agencies = new TClass_db_agencies();
      }

    public bool BeExtantId(string id)
      {
      Open();
      using var my_sql_command = new MySqlCommand("select TRUE from resident where id = '" + id + "'", connection);
      var result = (null != my_sql_command.ExecuteScalar());
      Close();
      return result;
      }

    internal void BindDirectToBaseDataList
      (
      string agency,
      string email_address,
      string name,
      string house_num,
      string street_id,
      object target
      )
      {
      var insert_where_clause =
        "insert possible_match (resident_id,web_donor_id) select resident_base.id,IFNULL(web_donor.id,0) from resident_base left join web_donor on (web_donor.resident_id=resident_base.id) where agency = '" + agency + "'";
      string condition_clause;
      var collision_clause = " on duplicate key update score = score + 1";
      var word_array = name.Split(new char[] {' '});
      var i = new k.subtype<int>(0,word_array.Length);
      //
      Open();
      using var my_sql_command_1 = new MySqlCommand
        (
        "create temporary table possible_match"
        + " ("
        + " resident_id mediumint not null"
        + " , web_donor_id bigint unsigned"
        + " , score smallint not null default 1"
        + " , num_priors mediumint not null default 0"
        + " , avg_amount float not null default 0"
        + " , primary key (resident_id,web_donor_id)"
        + " )",
        connection
        );
      my_sql_command_1.ExecuteNonQuery();
      //
      // Match at least one word in the specified resident name.
      //
      condition_clause = k.EMPTY;
      for (i.val = 0; i.val < word_array.Length; i.val++)
        {
        if (i.val > 0)
          {
          condition_clause += " or";
          }
        condition_clause += " resident_base.name like '%" + word_array[i.val] +"%'";
        }
      using var my_sql_command_2 = new MySqlCommand(insert_where_clause + (condition_clause.Length > 0 ? " and (" + condition_clause + ") " : k.EMPTY) + collision_clause,connection);
      my_sql_command_2.ExecuteNonQuery();
      //
      // Match all words in the specified resident name.
      //
      condition_clause = k.EMPTY;
      for (i.val = 0; i.val < word_array.Length; i.val++)
        {
        if (i.val > 0)
          {
          condition_clause += " and";
          }
        condition_clause += " resident_base.name like '%" + word_array[i.val] +"%'";
        }
      using var my_sql_command_3 = new MySqlCommand(insert_where_clause + (condition_clause.Length > 0 ? " and (" + condition_clause + ") " : k.EMPTY) + collision_clause,connection);
      my_sql_command_3.ExecuteNonQuery();
      //
      // Match the specified house_num and street.
      //
      if ((house_num.Length > 0) && (street_id.Length > 0))
        {
        using var my_sql_command_4 = new MySqlCommand(insert_where_clause + " and house_num like '%" + house_num + "%' and street_id = '" + street_id + "'" + collision_clause,connection);
        my_sql_command_4.ExecuteNonQuery();
        }
      //
      // Match email address
      //
      using var my_sql_command_5 = new MySqlCommand(insert_where_clause + " and email_address = '" + email_address + "'" + collision_clause,connection);
      my_sql_command_5.ExecuteNonQuery();
      //
      // Match prior donations attributed to resident.
      //
      using var my_sql_command_6 = new MySqlCommand
        (
        "update possible_match set score = score + 1"
        + " , num_priors = (select count(*) from donation where donation.id = possible_match.resident_id)"
        + " , avg_amount = IFNULL((select avg(amount) from donation where donation.id = possible_match.resident_id),0)",
        connection
        );
      my_sql_command_6.ExecuteNonQuery();
      //
      // Match prior donations attributed to web_donor.
      //
      using var my_sql_command_7 = new MySqlCommand
        (
        "update possible_match set score = score + 1"
        + " , num_priors = num_priors + (select count(*) from donation where donation.web_donor_id = possible_match.web_donor_id)"
        + " , avg_amount = IFNULL((avg_amount + (select avg(amount) from donation where donation.web_donor_id = possible_match.web_donor_id))/2,avg_amount)",
        connection
        );
      my_sql_command_7.ExecuteNonQuery();
      //
      // Bind possible matches to target
      //
      using var my_sql_command_8 = new MySqlCommand
        (
        "select resident_base.id as id"
        + " , IFNULL(resident_base.name,'') as name"
        + " , concat(house_num,' ',street.name) as house_num_and_street"
        + " , IF(city.name = 'VIRGINIA BEACH','VB',city.name) as city"
        + " , state.abbreviation as state"
        + " , GROUP_CONCAT(DISTINCT web_donor.email_address SEPARATOR ', ') as email_address"
        + " , ROUND(AVG(score)) as score"
        + " , ROUND(AVG(num_priors)) as num_priors"
        + " , ROUND(AVG(avg_amount)) as avg_amount"
        + " from possible_match"
        +   " join resident_base on (resident_base.id=possible_match.resident_id)"
        +   " join street on (street.id=resident_base.street_id)"
        +   " join city on (city.id=street.city_id)"
        +   " join state on (state.id=city.state_id)"
        +   " left join web_donor on (web_donor.resident_id=resident_base.id)"
        + " where resident_base.id > 0"
        + " group by resident_base.id"
        + " order by score desc, num_priors desc",
        connection
        );
      (target as BaseDataList).DataSource = my_sql_command_8.ExecuteReader();
      (target as BaseDataList).DataBind();
      ((target as BaseDataList).DataSource as MySqlDataReader).Close();
      using var my_sql_command_9 = new MySqlCommand("drop temporary table possible_match",connection);
      my_sql_command_9.ExecuteNonQuery();
      Close();
      }

    internal string FilteredFromSceneVisits
      (
      string scene_visits,
      string love_letter_batch_designator,
      string agency
      )
      {
      var output = k.EMPTY;
      var script = k.EMPTY
      + "START TRANSACTION"
      + ";"
      + " delete from scene_visited where love_letter_batch_designator = '" + love_letter_batch_designator + "' and agency = '" + agency + "'"
      + ";";
      var scene_visit_array = scene_visits.Split(new string[] {"\r\n","\n"},StringSplitOptions.RemoveEmptyEntries);
      foreach (var scene_visit in scene_visit_array)
        {
        script += " insert into scene_visited set love_letter_batch_designator = '" + love_letter_batch_designator + "', agency = '" + agency + "', address = '" + scene_visit + "';";
        }
      //**
      //
      // When revising this script, also consider making corresponding revisions to Class_biz_field_situations.MapRenditionOf() and/or keyclick user-defined function `NORMALIZED_STREET_SUFFIX_RENDITION`.
      //
      //**
      script += k.EMPTY
      + " drop table if exists resident_immune_from_love_letter"
      + ";"
      + " create table resident_immune_from_love_letter"
      + " SELECT distinct concat(house_num,' ',street.name) as address1"
      + " FROM resident_base"
        + " join street on (street.id=resident_base.street_id)"
        + " join donation on (donation.id=resident_base.id)"
      + " where date > DATE_SUB(CURDATE(),INTERVAL 1 YEAR)"
      +   " and agency = '" + agency + "'"
      + ";"
      + " drop table if exists immune_scene_visited"
      + ";"
      + " create table immune_scene_visited"
      + " SELECT address"
      + " FROM scene_visited"
        + " join resident_immune_from_love_letter on (resident_immune_from_love_letter.address1=scene_visited.address)"
      + " where love_letter_batch_designator = '" + love_letter_batch_designator + "'"
      +   " and agency = '" + agency + "'"
      + ";"
      + " drop table if exists love_letter_target"
      + ";"
      + " CREATE TABLE love_letter_target SELECT distinct address from scene_visited where love_letter_batch_designator = '" + love_letter_batch_designator + "' and agency = '" + agency + "'"
      + ";"
      + " DELETE from love_letter_target"
      + " WHERE address like '264E % AFTER'" // I-264
        + " or address like '264E % AT'" // I-264
        + " or address like '264E % BEFORE'" // I-264
        + " or address like '264W % AFTER'" // I-264
        + " or address like '264W % AT'" // I-264
        + " or address like '264W % BEFORE'" // I-264
        + " or address like '64E % AFTER'" // I-64
        + " or address like '64E % AT'" // I-64
        + " or address like '64E % BEFORE'" // I-64
        + " or address like '64W % AFTER'" // I-64
        + " or address like '64W % AT'" // I-64
        + " or address like '64W % BEFORE'" // I-64
        + " or address like '100 DN %'" // Dam Neck base
        + " or address like '100 LC %'" // Little Creek base
        + " or address like '%/%'" // an intersection
        + " or address like '100 % BW'" // the boardwalk
        + " or address like '100 % CY'" // mutual aid to another city
        + " or address like '100 % WW'" // waterway
        + " or address in"
          + " ("
          + " '3769 E STRATFORD RD'"
          + " , '4672 HAYGOOD RD'"
          + " , '600 CENTRAL DR'"
          + " , '2444 PLEASURE HOUSE RD'"
          + " , '2461 PRINCESS ANNE RD'"
          + " , '595 PRINCESS ANNE RD'"
          + " , '4817 COLUMBUS ST'"
          + " , '1201 BAYNE DR'"
          + " , '1243 BAYNE DR'"
          + " , '5145 RURITAN CT'"
          + " , '5656 PROVIDENCE RD'"
          + " , '800 VIRGINIA BEACH BLVD'"
          + " , '949 S BIRDNECK RD'"
          + " , '6009 BLACKWATER RD'"
          + " , '740 VIRGINIA BEACH BLVD'"
          + " , '407 THALIA RD'"
          + " , '3608 S PLAZA TRL'"
          + " , '3610 S PLAZA TRL'"
          + " , '305 SANDBRIDGE RD'"
          + " , '1601 S LYNNHAVEN PKWY'"
          + " , '4196 PLEASANT VALLEY RD'"
          + " , '885 LITTLE NECK RD'"
          + " , '1468 NIMMO PKWY'"
          + " , '2837 SHORE DR'"
          + " , '3513 BOW CREEK BLVD'" // Residence of a Plaza Life Member
          + " , '100 MARSH CW'"
          + " , '104 N WITCHDUCK RD'" // Housing Resource Center operations
          + " , '124 N WITCHDUCK RD'" // Housing Resource Center apartments
          + " , '64E TWIN BRIDGES'"
          + " , '64W TWIN BRIDGES'"
          + " )"
      + ";"
      + " DELETE FROM love_letter_target WHERE address in (select address from immune_scene_visited)"
      + ";"
      + " insert love_letter_batch"
      + " set designator = '" + love_letter_batch_designator + "', agency = '" + agency + "',"
        + " immune_scene_visits_factor = (select count(*) from immune_scene_visited)/(select count(*) from scene_visited where love_letter_batch_designator = '" + love_letter_batch_designator + "' and agency = '" + agency + "')"
      + " on duplicate key update"
        + " immune_scene_visits_factor = (select count(*) from immune_scene_visited)/(select count(*) from scene_visited where love_letter_batch_designator = '" + love_letter_batch_designator + "' and agency = '" + agency + "')"
      + ";"
      + " drop table if exists resident_immune_from_love_letter"
      + ";"
      + " drop table if exists immune_scene_visited"
      + ";"
      + " select * from love_letter_target"
      + ";"
      + " COMMIT";
      Open();
      using var my_sql_command = new MySqlCommand(script,connection);
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        output += dr["address"].ToString() + k.NEW_LINE;
        }
      dr.Close();
      Close();
      return output;
      }

    internal k.int_nonnegative NumForAgency(string agency_id)
      {
      var num_for_agency = new k.int_nonnegative();
      Open();
      using var my_sql_command = new MySqlCommand("select count(*) from resident_base  where agency='" + db_agencies.KeyclickEnumeratorOf(agency_id) + "'",connection);
      num_for_agency.val = int.Parse(my_sql_command.ExecuteScalar().ToString());
      Close();
      return num_for_agency;
      }

    internal void ScrubToApplicationStandards()
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "START TRANSACTION"
        + ";"
        + " delete from resident_base"
        + " where house_num not like '1%'"
          + " and house_num not like '2%'"
          + " and house_num not like '3%'"
          + " and house_num not like '4%'"
          + " and house_num not like '5%'"
          + " and house_num not like '6%'"
          + " and house_num not like '7%'"
          + " and house_num not like '8%'"
          + " and house_num not like '9%'"
          + " and house_num not rlike '^0[1-9]-'" // Allow the trick of prepending 0 to single digit house numbers with unit numbers, to force proper USPS interpretation/standardization.
          + " and street_id not in (select id from street where name = 'PO BOX')"
          + " and name is null"
          + " and id not in (select id from donation)"
        + ";"
        + " update resident_base set name = NULL where name like '%TO%OUR%AT%'"
        + ";"
        + " update resident_base set name = NULL where name like '%CURRENT%RESIDENT%'"
        + ";"
        + " update resident_base set name = REPLACE(name,'  ',' ')"
        + ";"
        + " update resident_base set name = UPPER(name)"
        + ";"
        + " update resident_base set house_num = REPLACE(house_num,' -','-')"
        + ";"
        + " update resident_base set house_num = REPLACE(house_num,'- ','-')"
        + ";"
        + " update resident_base set house_num = CONCAT('0',house_num) where house_num rlike '^[1-9]-'"
        + ";"
        + " COMMIT",
        connection
        );
      my_sql_command.ExecuteNonQuery();
      Close();
      }

    }

  }
