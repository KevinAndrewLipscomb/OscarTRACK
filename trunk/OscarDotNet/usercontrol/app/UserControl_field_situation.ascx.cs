// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using AjaxControlToolkit;
using Class_biz_field_situations;
using kix;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace UserControl_field_situation
  {
  public partial class TWebUserControl_field_situation: ki_web_ui.usercontrol_class
    {
    private static class Static
      {
      public const int TCI_PIN = 0;
      public const int TCI_TIME_INITIATED = 1;
      public const int TCI_ADDRESS = 2;
      public const int TCI_ASSIGNMENT = 3;
      public const int TCI_IMPRESSION = 4;
      }

    private struct p_type
      {
      public bool be_ambulance_callsigns_body_visible;
      public bool be_assignment_designator_prefixes_body_visible;
      public bool be_datagrid_empty;
      public bool be_interactive;
      public bool be_loaded;
      public bool be_notes_body_visible;
      public bool be_sort_order_ascending;
      public bool be_station_numbers_body_visible;
      public TClass_biz_field_situations biz_field_situations;
      public char label;
      public Queue<string> marker_address_q;
      public uint num_field_situations;
      public string sort_order;
      }

    private p_type p;

    private void InjectPersistentClientSideScript()
      {
      ToolkitScriptManager.RegisterStartupScript
        (
        control:this,
        type:this.GetType(),
        key:"ClientSideAutorefreshCountdown",
        script:k.EMPTY
        + " function El(id)"
        +   " {"
        +   " return document.getElementById(id);"
        +   " }"
        + " function Countdown()"
        +   " {"
        +   " t = El('Span_countdown').innerHTML;"
        +   " El('Span_countdown').innerHTML = ((t > 10) || (t <= 0) ? t - 1 : '0'.concat(t - 1));"
        +   " setTimeout('Countdown()',1000);"
        +   " }"
        + " Countdown();",
        addScriptTags:true
        );
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        if (!p.be_interactive)
          {
          DataGrid_control.AllowSorting = false;
          }
        Bind();
        p.be_loaded = true;
        }
      InjectPersistentClientSideScript();
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var instance_id = InstanceId();
      if (Session[instance_id + ".p"] != null)
        {
        p = (p_type)(Session[instance_id + ".p"]);
        p.be_loaded = IsPostBack;  // This test is sufficient if this control is being used statically on its page.
        //
        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
        // had it loaded already.
        //
        if (instance_id == "ASP.protected_overview_aspx.UserControl_M_field_situation")
          {
          p.be_loaded &= ((Session["M_PlaceHolder_content"] as string) == "UserControl_field_situation");
          }
        }
      else
        {
        p.biz_field_situations = new TClass_biz_field_situations();
        //
        p.be_interactive = (Session["mode:report"] == null);
        p.be_loaded = false;
        p.be_sort_order_ascending = true;
        p.label = 'A';
        p.marker_address_q = new Queue<string>();
        p.sort_order = "case_num desc, field_situation.id desc";
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      DataGrid_control.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(DataGrid_control_ItemDataBound);
      PreRender += TWebUserControl_field_situation_PreRender;
      }

    private void TWebUserControl_field_situation_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_field_situation Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_control_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      if (new ArrayList {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}.Contains(e.Item.ItemType))
        {
        e.Item.Cells[Static.TCI_PIN].Text = p.label.ToString();
        p.label = (p.label == 'Z' ? 'A' : (char)(((int)p.label) + 1));
        //
        e.Item.Cells[Static.TCI_TIME_INITIATED].Text = "<nobr>" + e.Item.Cells[Static.TCI_TIME_INITIATED].Text.Replace(k.SPACE,"</nobr> <nobr>") + "</nobr>";
        //
        var hyperlink_address = (e.Item.Cells[Static.TCI_ADDRESS].Controls[0] as HyperLink);
        var deidentified_address = p.biz_field_situations.DeidentifiedRenditionOf(hyperlink_address.Text);
        hyperlink_address.Text = "<nobr>" + deidentified_address.Replace("/","/</nobr> <nobr>") + "</nobr>";
        hyperlink_address.NavigateUrl = p.biz_field_situations.MapUrlOf(deidentified_address);
        hyperlink_address.ToolTip = "APPROXIMATE";
        p.marker_address_q.Enqueue(deidentified_address);
        //
        e.Item.Cells[Static.TCI_ASSIGNMENT].Text = e.Item.Cells[Static.TCI_ASSIGNMENT].Text.Replace(k.COMMA,k.SPACE);
        //
        // Remove all cell controls from viewstate.
        //
        foreach (TableCell cell in e.Item.Cells)
          {
          cell.EnableViewState = false;
          }
        //
        p.num_field_situations++;
        }
      }

    private void Bind()
      {
      p.biz_field_situations.BindBaseDataList(p.sort_order,p.be_sort_order_ascending,DataGrid_control);
      Image_control.ImageUrl = p.biz_field_situations.MapUrl
        (
        marker_address_q:p.marker_address_q,
        height:400,
        width:400
        );
      p.be_datagrid_empty = (p.num_field_situations == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      Literal_num_cases.Text = p.num_field_situations.ToString() + " case" + (p.num_field_situations == 1 ? k.EMPTY : "s");
      p.label = 'A';
      p.num_field_situations = 0;
      UserControl_recent_oscalert_samples_control.Bind();
      }

    protected void Timer_control_Tick(object sender, EventArgs e)
      {
      Bind();
      }

    protected void LinkButton_toggle_notes_Click(object sender, EventArgs e)
      {
      p.be_notes_body_visible = !p.be_notes_body_visible;
      LinkButton_toggle_notes.Text = "[" + (p.be_notes_body_visible ? "Hide" : "Show") + "]";
      TableRow_notes_body.Visible = p.be_notes_body_visible;
      Bind();
      }

    protected void LinkButton_toggle_assignment_designator_prefixes_Click(object sender, EventArgs e)
      {
      p.be_assignment_designator_prefixes_body_visible = !p.be_assignment_designator_prefixes_body_visible;
      LinkButton_toggle_assignment_designator_prefixes.Text = "[" + (p.be_assignment_designator_prefixes_body_visible ? "Hide" : "Show") + "]";
      TableRow_assignment_designator_prefixes_body.Visible = p.be_assignment_designator_prefixes_body_visible;
      Bind();
      }

    protected void LinkButton_toggle_station_numbers_Click(object sender, EventArgs e)
      {
      p.be_station_numbers_body_visible = !p.be_station_numbers_body_visible;
      LinkButton_toggle_station_numbers.Text = "[" + (p.be_station_numbers_body_visible ? "Hide" : "Show") + "]";
      TableRow_station_numbers_body.Visible = p.be_station_numbers_body_visible;
      Bind();
      }

    protected void LinkButton_toggle_ambulance_callsigns_Click(object sender, EventArgs e)
      {
      p.be_ambulance_callsigns_body_visible = !p.be_ambulance_callsigns_body_visible;
      LinkButton_toggle_ambulance_callsigns.Text = "[" + (p.be_ambulance_callsigns_body_visible ? "Hide" : "Show") + "]";
      TableRow_ambulance_callsigns_body.Visible = p.be_ambulance_callsigns_body_visible;
      Bind();
      }

    } // end TWebUserControl_field_situation

  }