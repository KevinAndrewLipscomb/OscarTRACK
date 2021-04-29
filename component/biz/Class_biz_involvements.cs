using Class_db_involvements;
using kix;

namespace Class_biz_involvements
  {

  public class TClass_biz_involvements
    {

    private readonly TClass_db_involvements db_involvements = null;

    public TClass_biz_involvements() : base()
      {
      db_involvements = new TClass_db_involvements();
      }

    public bool Bind(string partial_code, object target)
      {
      return db_involvements.Bind(partial_code, target);
      }

    public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
      {
      db_involvements.BindDirectToListControl(target, unselected_literal, selected_value);
      }

    public void BindDirectToListControl(object target)
      {
      BindDirectToListControl(target, "-- involvement --");
      }

    public void BindDirectToListControl(object target, string unselected_literal)
      {
      BindDirectToListControl(target, unselected_literal, k.EMPTY);
      }

    public bool Delete(string code)
      {
      return db_involvements.Delete(code);
      }

    public bool Get(string code, out string description)
      {
      return db_involvements.Get(code, out description);
      }

    public void Set(string code, string description)
      {
      db_involvements.Set(code, description);
      }

    } // end TClass_biz_involvements

  }