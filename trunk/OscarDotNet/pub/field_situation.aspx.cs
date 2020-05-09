using AjaxControlToolkit;
using System;
using System.Configuration;

namespace field_situation
{
    public partial class TWebForm_field_situation: ki_web_ui.page_class
    {
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - field_situation";
                Meta_control.Content = ((Session.Timeout - 2)*60).ToString();
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
//
// Uncomment the following line to disable partial page rendering.
//
//ScriptManager.GetCurrent(Page).EnablePartialRendering = false;
        }

    } // end TWebForm_field_situation

}
