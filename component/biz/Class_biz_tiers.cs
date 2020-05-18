using Class_db_tiers;

namespace Class_biz_tiers
  {
  public class TClass_biz_tiers
    {
        private readonly TClass_db_tiers db_tiers = null;

        //Constructor  Create()
        public TClass_biz_tiers() : base()
        {
            // TODO: Add any constructor code here
            db_tiers = new TClass_db_tiers();
        }
        
        #pragma warning disable IDE0060 // Remove unused parameter
        #pragma warning disable CA2211 // Remove unused parameter
        #pragma warning disable CA1801 // Remove unused parameter
        public void BindListControl(object target, string selected_id, bool be_available_option_all, string unselected_literal)
        #pragma warning restore CA1801 // Remove unused parameter
        #pragma warning restore CA2211 // Remove unused parameter
        #pragma warning restore IDE0060 // Remove unused parameter
        {
            db_tiers.BindListControl(target, unselected_literal, selected_id);
        }

        public void BindListControl(object target)
        {
            BindListControl(target, "");
        }

        public void BindListControl(object target, string selected_id)
        {
            BindListControl(target, selected_id, true);
        }

        public void BindListControl(object target, string selected_id, bool be_available_option_all)
        {
            BindListControl(target, selected_id, be_available_option_all, "All");
        }

        public string IdOfName(string name)
        {
            string result;
            result = db_tiers.IdOfName(name);
            return result;
        }

        public string NameOfId(string id)
        {
            string result;
            result = db_tiers.NameOfId(id);
            return result;
        }

    } // end TClass_biz_tiers

}
