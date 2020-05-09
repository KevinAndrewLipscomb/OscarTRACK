using Class_db_skill_ratings;
using kix;

namespace Class_biz_skill_ratings
  {

  public class TClass_biz_skill_ratings
    {

    private readonly TClass_db_skill_ratings db_skill_ratings = null;

    public TClass_biz_skill_ratings() : base()
      {
      db_skill_ratings = new TClass_db_skill_ratings();
      }

    public bool Bind(string partial_code, object target)
      {
      return db_skill_ratings.Bind(partial_code, target);
      }

    public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
      {
      db_skill_ratings.BindDirectToListControl(target, unselected_literal, selected_value);
      }

    public void BindDirectToListControl(object target)
      {
      BindDirectToListControl(target, "-- skill_rating --");
      }

    public void BindDirectToListControl(object target, string unselected_literal)
      {
      BindDirectToListControl(target, unselected_literal, k.EMPTY);
      }

    internal void BindListItemCollectionForEvaluatee(object target)
      {
      db_skill_ratings.BindListItemCollectionForEvaluatee(target);
      }

    internal void BindListItemCollectionForEvaluator(object target)
      {
      db_skill_ratings.BindListItemCollectionForEvaluator(target);
      }

    internal void BindListItemCollectionUnlimited(object target)
      {
      db_skill_ratings.BindListItemCollectionUnlimited(target);
      }

    public bool Delete(string code)
      {
      return db_skill_ratings.Delete(code);
      }

    public bool Get
      (
      string code,
      out string designator,
      out string description
      )
      {
      return db_skill_ratings.Get(code, out designator, out description);
      }

    public void Set
      (
      string code,
      string designator,
      string description
      )
      {
      db_skill_ratings.Set(code,designator,description);
      }

    } // end TClass_biz_skill_ratings

  }