using System;
using System.Collections;
using System.IO;
using System.Web.UI.WebControls;

namespace UserControl_bread_crumb_trail
  {
    public partial class TWebUserControl_bread_crumb_trail: ki_web_ui.usercontrol_class
    {
    private struct p_type
      {
          public bool be_loaded;
      }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

        protected void Page_Load(object sender, System.EventArgs e)
        {
            uint i;
            uint num_waypoints;
            Queue q;
            Stack waypoint_stack;
            if (!p.be_loaded)
            {

                if (Session["waypoint_stack"] != null)
                {

                    waypoint_stack = new Stack(((Session["waypoint_stack"]) as Stack));
                    num_waypoints = (uint)(waypoint_stack.Count);
                    if (num_waypoints > 0)
                    {
                        q = new Queue();
                        for (i = 1; i <= num_waypoints; i ++ )
                        {
                            q.Enqueue(Path.GetFileNameWithoutExtension(waypoint_stack.Pop().ToString()));
                        }
                        DataList_trail.DataSource = q;
                        DataList_trail.DataBind();
                        DataList_trail.Visible = true;
                    }
                }
                p.be_loaded = true;
            }

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);







            if (IsPostBack && (Session[InstanceId() + ".p"] != null))
            {

                p = (p_type)(Session[InstanceId() + ".p"]);
            }
            else
            {
                p.be_loaded = false;
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            DataList_trail.ItemCommand += new System.Web.UI.WebControls.DataListCommandEventHandler(DataList_trail_ItemCommand);
            DataList_trail.ItemDataBound += new System.Web.UI.WebControls.DataListItemEventHandler(DataList_trail_ItemDataBound);

            PreRender += TWebUserControl_bread_crumb_trail_PreRender;
        }

        private void TWebUserControl_bread_crumb_trail_PreRender(object sender, System.EventArgs e)
        {

            SessionSet(InstanceId() + ".p", p);
        }

        public TWebUserControl_bread_crumb_trail Fresh()
        {
            TWebUserControl_bread_crumb_trail result;


            Session.Remove(InstanceId() + ".p");
            result = this;
            return result;
        }

        private void DataList_trail_ItemDataBound(object sender, System.Web.UI.WebControls.DataListItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Footer)
            {


                ((e.Item.Controls[0]) as Label).Text = " / " + Path.GetFileNameWithoutExtension(Request.CurrentExecutionFilePath);
            }
        }

        private void DataList_trail_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
          {
          if (((Session["waypoint_stack"]) as Stack).Count > 0)
            {
            int i;
            for (i = ((Session["waypoint_stack"]) as Stack).Count - 1; i >= Math.Max(e.Item.ItemIndex, 0); i-- )
              {
              ((Session["waypoint_stack"]) as Stack).Pop();
              }
            var target = ((e.CommandSource) as LinkButton).Text + ".aspx";
            if (!File.Exists(path:Server.MapPath(".") + "/" + target))
              {
              (Session["waypoint_stack"] as Stack).Clear();
              Server.Transfer("~/Default.aspx");
              }
            Server.Transfer(target);
            }
          }

    } // end TWebUserControl_bread_crumb_trail

}
