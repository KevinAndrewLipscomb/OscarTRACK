using kix;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;

//
// When using in the ItemTemplate of a TemplateColumn of a *sortable* DataGrid, use the following pattern:
//
//   attachment_explorer = ((e.Item.Cells[Static.TCI_FILES].FindControl(id:"UserControl_attachment_explorer_control")) as TWebUserControl_attachment_explorer);
//   attachment_explorer.path = k.EMPTY;
//   attachment_explorer.enabled = p.be_{condition};
//   attachment_explorer.be_ok_to_add = p.be_{condition};
//   attachment_explorer.be_ok_to_delete = p.be_{condition};
//   attachment_explorer.Bind(HttpContext.Current.Server.MapPath("~/protected/attachment/{subfolder}/" + e.Item.Cells[Static.TCI_{KEY}].Text));
//   ScriptManager.GetCurrent(Page).RegisterPostBackControl(attachment_explorer);
//

namespace UserControl_attachment_explorer
  {

  public delegate void on_delete_type(string basename);
  public delegate void on_save_type(string basename);

  // [ParseChildren(ChildrenAsProperties = true)]
  public partial class TWebUserControl_attachment_explorer: ki_web_ui.usercontrol_class
    {

    //--
    //
    // PRIVATE
    //
    //--

    private static class Static
      {
      public const int TCI_LINKBUTTON = 0;
      public const int TCI_DELETE_INITIALLY = 1;
      public const int TCI_ITEM_INITIALLY = 2;
      public const int TCI_DELETE_SUBSEQUENTLY = TCI_DELETE_INITIALLY + 1;
      public const int TCI_ITEM_SUBSEQUENTLY = TCI_ITEM_INITIALLY + 1;
      }

    private struct p_type
      {
      public bool be_empty;
      public bool be_enabled;
      public bool be_for_persistence; //that is, if files should be accessible online even if the accessor is not logged into the application
      public bool be_loaded;
      public bool be_ok_to_add;
      public bool be_ok_to_delete;
      public string[] directory_file_string_array;
      public on_delete_type OnDelete;
      public on_save_type OnSave;
      public string path;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    private void GridView_attachments_RowDataBound(object sender, GridViewRowEventArgs e)
      {
      TableCell tablecell_spacer;
      if (e.Row.RowType == DataControlRowType.DataRow)
        {
        var link_button = e.Row.Cells[Static.TCI_LINKBUTTON].Controls[0] as LinkButton;
        link_button.Text = k.ExpandAsperand((e.Row.Cells[Static.TCI_LINKBUTTON].Controls[0] as LinkButton).Text) + Path.GetFileName(e.Row.Cells[Static.TCI_ITEM_INITIALLY].Text);
        if (p.be_for_persistence)
          {
          link_button.Attributes["href"] = e.Row.Cells[Static.TCI_ITEM_INITIALLY].Text.Replace(Server.MapPath("~"),ConfigurationManager.AppSettings["runtime_root_fullspec"].TrimEnd(new char[] {'/'})).Replace('\\','/');
          }
        (e.Row.Cells[Static.TCI_DELETE_INITIALLY].Controls[0] as LinkButton).Text = k.ExpandTildePath((e.Row.Cells[Static.TCI_DELETE_INITIALLY].Controls[0] as LinkButton).Text);
        e.Row.Cells[Static.TCI_ITEM_INITIALLY].Visible = false;
        tablecell_spacer = new TableCell();
        tablecell_spacer.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
        e.Row.Cells.AddAt(Static.TCI_DELETE_INITIALLY, tablecell_spacer);
        e.Row.Cells[Static.TCI_DELETE_SUBSEQUENTLY].Visible = p.be_ok_to_delete;
        }
      }

    private void GridView_attachments_RowDeleting(object sender, GridViewDeleteEventArgs e)
      {
      var fullspec = p.directory_file_string_array[e.RowIndex];
      var basespec = Path.GetFileName(fullspec);
      File.Delete(fullspec);
      p.OnDelete?.Invoke(basespec);
      Bind();
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      GridView_attachments.RowDataBound += new GridViewRowEventHandler(GridView_attachments_RowDataBound);
      GridView_attachments.RowDeleting += new GridViewDeleteEventHandler(GridView_attachments_RowDeleting);
      PreRender += TWebUserControl_attachment_explorer_PreRender;
      }

    private void InjectPersistentClientSideScript()
      {
      // EstablishClientSideFunction(k.client_side_function_enumeral_type.EL);
      // EstablishClientSideFunction(k.client_side_function_enumeral_type.KGS_TO_LBS);
      // EstablishClientSideFunction(k.client_side_function_enumeral_type.LBS_TO_KGS);
      // EstablishClientSideFunction
      // (
      // 'RecalculateDependentValues()',
      // k.EMPTY
      // + 'El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value ='
      // +  ' El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_lbs.clientid + '").value;'
      // + k.NEW_LINE
      // + 'El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value ='
      // +  ' El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_kgs.clientid + '").value;'
      // + k.NEW_LINE
      // + 'El("' + TextBox_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
      // +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
      // + k.NEW_LINE
      // + 'El("' + TextBox_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
      // +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
      // + k.NEW_LINE
      // + 'El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value ='
      // +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value - El("' + TextBox_franchise_in_lbs.clientid + '").value;'
      // + k.NEW_LINE
      // + 'El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value ='
      // +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value - El("' + TextBox_franchise_in_kgs.clientid + '").value;'
      // + k.NEW_LINE
      // + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
      // +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
      // + k.NEW_LINE
      // + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
      // +  ' El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
      // + k.NEW_LINE
      // + 'El("' + TextBox_percent_gain_or_loss.clientid + '").value ='
      // +  ' Math.round(El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_net_invoiced_in_lbs.clientid + '").value*100*100)/100;'
      // + k.NEW_LINE
      // + 'El("' + TextBox_monetary_gain_or_loss.clientid + '").value ='
      // +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value*El("' + TextBox_unit_price_in_cents_per_pound.clientid + '").value;'
      // );
      // //
      // TextBox_bales.attributes.Add('onkeyup','RecalculateDependentValues();');
      // TextBox_gross_landed_weight_in_pounds.attributes.Add
      // (
      // 'onkeyup',
      // 'El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value);'
      // + ' RecalculateDependentValues();'
      // );
      // TextBox_gross_landed_weight_in_kgs.attributes.Add
      // (
      // 'onkeyup',
      // 'El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value);'
      // + ' RecalculateDependentValues();'
      // );
      // TextBox_landed_or_ciq_tare.attributes.Add
      // (
      // 'onkeyup',
      // 'El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_landed_or_ciq_tare.clientid + '").value);'
      // + ' RecalculateDependentValues();'
      // );
      // TextBox_landed_or_ciq_tare_in_kgs.attributes.Add
      // (
      // 'onkeyup',
      // 'El("' + TextBox_landed_or_ciq_tare.clientid + '").value = KgsToLbs(El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value);'
      // + ' RecalculateDependentValues();'
      // );
      // TextBox_net_landed_in_pounds.attributes.Add
      // (
      // 'onkeyup',
      // 'El("' + TextBox_net_landed_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_net_landed_in_pounds.clientid + '").value);'
      // + ' RecalculateDependentValues();'
      // );
      // TextBox_net_landed_in_kgs.attributes.Add
      // (
      // 'onkeyup',
      // 'El("' + TextBox_net_landed_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_net_landed_in_kgs.clientid + '").value);'
      // + ' RecalculateDependentValues();'
      // );
      }

    private void TWebUserControl_attachment_explorer_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    //--
    //
    // PROTECTED
    //
    //--

    protected void Button_upload_Click(object sender, System.EventArgs e)
      {
      //
      // If the UserControl_attachment_explorer control is in an UpdatePanel, it must be specified as a PostBackTrigger for the UpdatePanel.
      //
      // For this to work, the IIS Worker Process (ASP.NET Machine Account (ASPNET) [on IIS5] or the NETWORK SERVICE account [on IIS7] or the IIS APPPOOL\DefaultAppPool) must have write permission for the folder specified
      // by p.path.  Configure this on the Security tab of the folder's Properties.  If the Security tab is missing, open Windows Explorer / Tools / Folder Options... / View, and in the Advanced Settings, clear the "Use
      // simple file sharing" checkbox.
      //
      // ALSO, if the *first* click on the Upload button has no effect, but subsequent clicks work correctly, add the 'enctype="multipart/form-data"' to the <form> tag on this usercontrol's parent page.  We have not found
      // an effective way to do this programmatically yet.
      //
      if (FileUpload_control.HasFile)
        {
        if (!Directory.Exists(p.path))
          {
          Directory.CreateDirectory(p.path);
          }
        var basename = Path.GetFileName(FileUpload_control.FileName);
        FileUpload_control.SaveAs(p.path + "\\" + basename);
        p.OnSave?.Invoke(basename);
        Bind();
        }
      }

    protected void GridView_attachments_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
      {
      FileDownload(filename:p.directory_file_string_array[e.NewSelectedIndex]);
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var instance_id = InstanceId();
      if (IsPostBack && (Session[instance_id + ".p"] != null))
        {
        p = (p_type)(Session[instance_id + ".p"]);
        }
      else
        {
        p.be_empty = true;
        p.be_enabled = true;
        p.be_for_persistence = false;
        p.be_loaded = false;
        p.be_ok_to_add = false;
        p.be_ok_to_delete = false;
        p.directory_file_string_array = null;
        p.path = k.EMPTY;
        }
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        Image_paperclip.Src = k.ExpandTildePath(Image_paperclip.Src);
        p.be_loaded = true;
        }
      Bind();
      Panel_new.Visible = p.be_ok_to_add;
      InjectPersistentClientSideScript();
      }

    //--
    //
    // PUBLIC
    //
    //--

    public bool be_empty
      {
      get
        {
        return p.be_empty;
        }
      }
    public bool be_for_persistence
      {
      get
        {
        return p.be_for_persistence;
        }
      set
        {
        p.be_for_persistence = value;
        SessionSet(InstanceId() + ".p", p);
        }
      }
    public bool be_ok_to_add
      {
      get
        {
        return p.be_ok_to_add;
        }
      set
        {
        p.be_ok_to_add = value;
        Panel_new.Visible = p.be_ok_to_add;
        SessionSet(InstanceId() + ".p", p);
        }
      }
    public bool be_ok_to_delete
      {
      get
        {
        return p.be_ok_to_delete;
        }
      set
        {
        p.be_ok_to_delete = value;
        Bind();
        SessionSet(InstanceId() + ".p", p);
        }
      }
    public bool enabled
      {
      get
        {
        return p.be_enabled;
        }
      set
        {
        FileUpload_control.Enabled = value;
        GridView_attachments.Enabled = value;
        p.be_enabled = value;
        SessionSet(InstanceId() + ".p", p);
        }
      }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Design", "CA1044:Properties should not be write only")]
    public on_delete_type OnDelete
      //
      // Must be set to point to the target object method each and every time the target object is created (ie, unconditionally in Page_Load), otherwise this attribute will be a dangling pointer to an out-of-context object
      // that may not have been garbage collected.
      //
      {
      set
        {
        p.OnDelete = value;
        SessionSet(InstanceId() + ".p", p);
        }
      }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Design", "CA1044:Properties should not be write only")]
    public on_save_type OnSave
      //
      // Must be set to point to the target object method each and every time the target object is created (ie, unconditionally in Page_Load), otherwise this attribute will be a dangling pointer to an out-of-context object
      // that may not have been garbage collected.
      //
      {
      set
        {
        p.OnSave = value;
        SessionSet(InstanceId() + ".p", p);
        }
      }
    public string path
      //
      // Must be set each and every time the target object is created (ie, unconditionally in Page_Load).
      //
      // A common pattern is to set it with some variation of the following statement:
      //
      //   UserControl_attachment_explorer_control.path = HttpContext.Current.Server.MapPath("attachment/ . . . );
      //
      // If using a distinct attachment_key as both the leaf of the path and as a field value on the associated database record, use something like the following at record creation time:
      //
      //   p.attachment_key = DateTime.Now.Ticks.ToString("D19");
      //   UserControl_attachment_explorer_control.path = HttpContext.Current.Server.MapPath("attachment/{table-name}/" + p.attachment_key);
      //
      // For this to work, the IIS Worker Process (ASP.NET Machine Account (ASPNET) [on IIS5] or the NETWORK SERVICE account [on IIS7] or the IIS APPPOOL\DefaultAppPool) must have write permission for the folder specified
      // by p.path.  Configure this on the Security tab of the folder's Properties.  If the Security tab is missing, open Windows Explorer / Tools / Folder Options... / View, and in the Advanced Settings, clear the "Use
      // simple file sharing" checkbox.
      //
      {
      get
        {
        return p.path;
        }
      set
        {
        p.path = value;
        SessionSet(InstanceId() + ".p", p);
        }
      }

    public void Bind(string path = k.EMPTY)
      {
      if (path.Length > 0)
        {
        p.path = path;
        }
      if (Directory.Exists(p.path))
        {
        p.directory_file_string_array = Directory.GetFiles(p.path);
        GridView_attachments.DataSource = p.directory_file_string_array;
        GridView_attachments.DataBind();
        }
      p.be_empty = ((p.directory_file_string_array == null) || (p.directory_file_string_array.Length == 0));
      }

    public TWebUserControl_attachment_explorer Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    } // end TWebUserControl_attachment_explorer

  }