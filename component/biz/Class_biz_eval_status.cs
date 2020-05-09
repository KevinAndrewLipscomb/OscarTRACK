using Class_db_eval_statuses;
using kix;

namespace Class_biz_eval_statuses
  {

  public class TClass_biz_eval_statuses
    {

    private readonly TClass_db_eval_statuses db_eval_statuses = null;

    public TClass_biz_eval_statuses() : base()
      {
      db_eval_statuses = new TClass_db_eval_statuses();
      }

    public bool Bind(string partial_code, object target)
      {
      return db_eval_statuses.Bind(partial_code, target);
      }

    public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
      {
      db_eval_statuses.BindDirectToListControl(target, unselected_literal, selected_value);
      }

    public void BindDirectToListControl(object target)
      {
      BindDirectToListControl(target, "-- eval_status --");
      }

    public void BindDirectToListControl(object target, string unselected_literal)
      {
      BindDirectToListControl(target, unselected_literal, k.EMPTY);
      }

    public bool Delete(string code)
      {
      return db_eval_statuses.Delete(code);
      }

    public bool Get(string code, out string description)
      {
      return db_eval_statuses.Get(code, out description);
      }

    public void Set(string code, string description)
      {
      db_eval_statuses.Set(code, description);
      }

    } // end TClass_biz_eval_statuses

  }