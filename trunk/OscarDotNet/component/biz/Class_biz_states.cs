using kix;
using System;
using Class_db_states;
namespace Class_biz_states
{
    public class TClass_biz_states
    {
        private TClass_db_states db_states = null;
        //Constructor  Create()
        public TClass_biz_states() : base()
        {
            // TODO: Add any constructor code here
            db_states = new TClass_db_states();
        }
        public bool Bind(string partial_code, object target)
        {
            bool result;
            result = db_states.Bind(partial_code, target);
            return result;
        }

        public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
        {
            db_states.BindDirectToListControl(target, unselected_literal, selected_value);
        }

        public void BindDirectToListControl(object target)
        {
            BindDirectToListControl(target, "-- court kind --");
        }

        public void BindDirectToListControl(object target, string unselected_literal)
        {
            BindDirectToListControl(target, unselected_literal, k.EMPTY);
        }

        public bool Delete(string code)
        {
            bool result;
            result = db_states.Delete(code);
            return result;
        }

        public bool Get(string code, out string abbreviation)
        {
            bool result;
            result = db_states.Get(code, out abbreviation);

            return result;
        }

        public void Set(string code, string abbreviation)
        {
            db_states.Set(code, abbreviation);

        }

    } // end TClass_biz_states

}
