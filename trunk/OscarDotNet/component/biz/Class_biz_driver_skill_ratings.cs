// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_driver_skill_ratings;

namespace Class_biz_driver_skill_ratings
  {
  public class TClass_biz_driver_skill_ratings
    {
    private readonly TClass_db_driver_skill_ratings db_driver_skill_ratings = null;

    public TClass_biz_driver_skill_ratings() : base()
      {
      db_driver_skill_ratings = new TClass_db_driver_skill_ratings();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_driver_skill_ratings.Bind(partial_spec, target);
      }

    internal void BindBaseDataList
      (
      object target,
      string eval_id
      )
      {
      db_driver_skill_ratings.BindBaseDataList(target,eval_id);
      }

    public void BindDirectToListControl(object target)
      {
      db_driver_skill_ratings.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_driver_skill_ratings.Delete(id);
      }

    public bool Get
      (
      string id,
      out string driver_skill_id,
      out string skill_rating_id,
      out string eval_id
      )
      {
      return db_driver_skill_ratings.Get
        (
        id,
        out driver_skill_id,
        out skill_rating_id,
        out eval_id
        );
      }

    public void Set
      (
      string id,
      string driver_skill_id,
      string skill_rating_id,
      string eval_id
      )
      {
      db_driver_skill_ratings.Set
        (
        id,
        driver_skill_id,
        skill_rating_id,
        eval_id
        );
      }

    } // end TClass_biz_driver_skill_ratings

  }
