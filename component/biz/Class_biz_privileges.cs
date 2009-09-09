using kix;
using System;
using Class_db_privileges;
namespace Class_biz_privileges
{
    public class TClass_biz_privileges
    {
        private TClass_db_privileges db_privileges = null;
        //Constructor  Create()
        public TClass_biz_privileges() : base()
        {
            // TODO: Add any constructor code here
            db_privileges = new TClass_db_privileges();
        }
        public bool Bind(string partial_name, object target)
        {
            bool result;
            result = db_privileges.Bind(partial_name, target);
            return result;
        }

        public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
        {
            db_privileges.BindDirectToListControl(target, unselected_literal, selected_value);
        }

        public void BindDirectToListControl(object target)
        {
            BindDirectToListControl(target, "-- Privilege --");
        }

        public void BindDirectToListControl(object target, string unselected_literal)
        {
            BindDirectToListControl(target, unselected_literal, k.EMPTY);
        }

        public bool Get(string name, out string soft_hyphenation_text)
        {
            bool result;
            result = db_privileges.Get(name, out soft_hyphenation_text);

            return result;
        }

    } // end TClass_biz_privileges

}
