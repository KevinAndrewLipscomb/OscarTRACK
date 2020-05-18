using kix;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Class_biz_sections
  {
  public class TClass_biz_sections
    {

    public TClass_biz_sections() : base()
      {
      }

    public void BindListControl
      (
      object target,
      string selected_description = k.EMPTY
      )
      {
      ((target) as DropDownList).Items.Clear();
      if (selected_description.Length == 0)
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

    } // end TClass_biz_sections

  }
