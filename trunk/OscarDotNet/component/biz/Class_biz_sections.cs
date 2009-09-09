using kix;
using System;
using System.Collections.Generic;
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
            uint i;
            ((target) as DropDownList).Items.Clear();
            if (selected_description == k.EMPTY)
            {
                ((target) as DropDownList).Items.Add(new ListItem("-- Select --", ""));
            }
            ((target) as DropDownList).Items.Add(new ListItem("*", "0"));
            for (i = 1; i <= 14; i ++ )
            {
                ((target) as DropDownList).Items.Add(new ListItem(i.ToString(), i.ToString()));
                if (i.ToString() == selected_description)
                {
                    ((target) as DropDownList).SelectedValue = i.ToString();
                }
            }
        }

        public void BindListControl(object target)
        {
            BindListControl(target, "");
        }

    } // end TClass_biz_sections

}
