namespace UserControl_session_interrupted
  {
  public partial class TWebUserControl_session_interrupted: ki_web_ui.usercontrol_class
    {

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      Response.AppendHeader(name:CUSTOM_RESPONSE_HEADER_NAME,value:SESSION_INTERRUPTED_HEADER_VALUE);
      }

    } // end TWebUserControl_session_interrupted

  }
