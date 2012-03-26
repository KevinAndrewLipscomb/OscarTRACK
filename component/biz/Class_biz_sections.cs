using kix;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Class_biz_sections
{
    public class TClass_biz_sections
    {
        //Constructor  Create()
        public TClass_biz_sections() : base()
        {
            // TODO: Add any constructor code here

        }
        public void BindListControl(object target, string selected_description)
        {
            ((target) as DropDownList).Items.Clear();
            if (selected_description == k.EMPTY)
            {
                ((target) as DropDownList).Items.Add(new ListItem("-- Select --", ""));
            }
            ((target) as DropDownList).Items.Add(new ListItem("*", "0"));
            for (var i = new k.subtype<int>(1,int.Parse(ConfigurationManager.AppSettings["max_section_num"]) + 1); i.val < i.LAST; i.val++)
            {
                ((target) as DropDownList).Items.Add(new ListItem(i.val.ToString(), i.val.ToString()));
                if (i.val.ToString() == selected_description)
                {
                    ((target) as DropDownList).SelectedValue = i.val.ToString();
                }
            }
        }

        public void BindListControl(object target)
        {
            BindListControl(target, "");
        }

    } // end TClass_biz_sections

}
