// Derived from template~protected~nonlanding.aspx.cs~template

using Class_biz_members;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Web.UI.WebControls;

namespace likes_and_hates
  {
  public struct p_type
    {
    public TClass_biz_members biz_members;
    public TClass_msg_protected.likes_and_hates incoming;
    public string user_member_id;
    }

  public partial class TWebForm_likes_and_hates: ki_web_ui.page_class
    {
    public class TWebForm_likes_and_hates_Static
      {
      public const int TCI_OBJECT_MEMBER_ID = 0;
      public const int TCI_BE_LIKED = 1;
      public const int TCI_LIKE = 2;
      public const int TCI_OBJECT_MEMBER_NAME = 3;
      public const int TCI_HATE = 4;
      public const int TCI_BE_HATED = 5;
      }

    private p_type p;

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      DataGrid_control.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(DataGrid_control_ItemCommand);
      PreRender += TWebForm_likes_and_hates_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - likes_and_hates";
        HyperLink_continue_1.NavigateUrl = p.incoming.navigate_url;
        HyperLink_continue_1.Attributes.Add("onclick","history.back()");
        HyperLink_continue_2.NavigateUrl = p.incoming.navigate_url;
        HyperLink_continue_2.Attributes.Add("onclick","history.back()");
        HyperLink_continue_3.NavigateUrl = p.incoming.navigate_url;
        HyperLink_continue_3.Attributes.Add("onclick","history.back()");
        p.biz_members.ClearMelodrama(p.user_member_id);
        Bind();
        Alert
          (
          k.alert_cause_type.LOGIC,
          k.alert_state_type.WARNING,
          "meldraclr",
          "Step 1 of submitting schedule availabilities is to declare 'likes' or 'hates', if you must." + k.NEW_LINE
          + k.NEW_LINE
          + "Every time you visit the Likes & Hates page, your prior 'likes' and 'hates' get cleared.  You must declare them again if they are to remain in effect.",
          true
          );
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit = NatureOfVisit(InstanceId() + ".p");
      if (nature_of_visit == nature_of_visit_type.VISIT_INITIAL)
        {
        p.biz_members = new TClass_biz_members();
        //
        p.incoming = Message<TClass_msg_protected.likes_and_hates>("protected","likes_and_hates");
        p.user_member_id = Session["member_id"].ToString();
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      }

    private void Bind()
      {
      p.biz_members.BindMelodramaToBaseDataList(p.user_member_id,p.incoming.relative_month,DataGrid_control);
      }

    private void DataGrid_control_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
      {
      if ((new ArrayList() {ListItemType.AlternatingItem, ListItemType.EditItem, ListItemType.Item, ListItemType.SelectedItem}).Contains(e.Item.ItemType))
        {
        // We are dealing with a data row, not a header or footer row.
        if (e.CommandName == "Like")
          {
          if (e.Item.Cells[TWebForm_likes_and_hates_Static.TCI_BE_LIKED].Text == "LIKE")
            {
            p.biz_members.RemoveMelodrama(p.user_member_id,k.Safe(e.Item.Cells[TWebForm_likes_and_hates_Static.TCI_OBJECT_MEMBER_ID].Text,k.safe_hint_type.NUM));
            }
          else
            {
            p.biz_members.SetMelodrama(p.user_member_id,k.Safe(e.Item.Cells[TWebForm_likes_and_hates_Static.TCI_OBJECT_MEMBER_ID].Text,k.safe_hint_type.NUM),true);
            }
          }
        else if (e.CommandName == "Hate")
          {
          if (e.Item.Cells[TWebForm_likes_and_hates_Static.TCI_BE_HATED].Text == "HATE")
            {
            p.biz_members.RemoveMelodrama(p.user_member_id,k.Safe(e.Item.Cells[TWebForm_likes_and_hates_Static.TCI_OBJECT_MEMBER_ID].Text,k.safe_hint_type.NUM));
            }
          else
            {
            p.biz_members.SetMelodrama(p.user_member_id,k.Safe(e.Item.Cells[TWebForm_likes_and_hates_Static.TCI_OBJECT_MEMBER_ID].Text,k.safe_hint_type.NUM),false);
            }
          }
        Bind();
        }
      }

    private void TWebForm_likes_and_hates_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    } // end TWebForm_likes_and_hates

  }
