using appcommon;
using Class_biz_members;
using Class_biz_indicator_median_length_of_service;
using System;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using kix;

namespace UserControl_ranked_length_of_service
{
    public struct p_type
    {
        public bool be_loaded;
        public TClass_biz_members biz_members;
        public TClass_biz_indicator_median_length_of_service biz_indicator_median_length_of_service;
        public ArrayList citywide_years_of_service_array_list;
        public ArrayList ems_years_of_service_array_list;
        public ArrayList r01_years_of_service_array_list;
        public ArrayList r02_years_of_service_array_list;
        public ArrayList r04_years_of_service_array_list;
        public ArrayList r05_years_of_service_array_list;
        public ArrayList r06_years_of_service_array_list;
        public ArrayList r09_years_of_service_array_list;
        public ArrayList r13_years_of_service_array_list;
        public ArrayList r14_years_of_service_array_list;
        public ArrayList r16_years_of_service_array_list;
        public ArrayList r17_years_of_service_array_list;
        public uint rank;
    } // end p_type

    public partial class TWebUserControl_ranked_length_of_service: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            bool be_trendable;
            if (!p.be_loaded)
            {
                p.biz_members.BindSpecialForRankedLengthOfService(DataGrid_special);
                p.citywide_years_of_service_array_list.Sort();
                Label_overall.Text = k.Median(p.citywide_years_of_service_array_list).ToString("F2");
                be_trendable = (Session["mode:report/monthly-core-ops-dashboard"] != null);
                p.biz_indicator_median_length_of_service.Log(be_trendable, p.citywide_years_of_service_array_list, p.ems_years_of_service_array_list, p.r01_years_of_service_array_list, p.r02_years_of_service_array_list, p.r04_years_of_service_array_list, p.r05_years_of_service_array_list, p.r06_years_of_service_array_list, p.r09_years_of_service_array_list, p.r13_years_of_service_array_list, p.r14_years_of_service_array_list, p.r16_years_of_service_array_list, p.r17_years_of_service_array_list);
                p.biz_indicator_median_length_of_service.BindLatestRankedYearsOfService(DataGrid_detail, be_trendable);
                p.be_loaded = true;
            }

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack && (Session["UserControl_ranked_length_of_service.p"] != null) && (Session["UserControl_ranked_length_of_service.p"].GetType().Namespace == p.GetType().Namespace))
            {
                p = (p_type)(Session["UserControl_ranked_length_of_service.p"]);
            }
            else
            {
                p.be_loaded = false;
                p.biz_members = new TClass_biz_members();
                p.biz_indicator_median_length_of_service = new TClass_biz_indicator_median_length_of_service();
                p.citywide_years_of_service_array_list = new ArrayList();
                p.ems_years_of_service_array_list = new ArrayList();
                p.r01_years_of_service_array_list = new ArrayList();
                p.r02_years_of_service_array_list = new ArrayList();
                p.r04_years_of_service_array_list = new ArrayList();
                p.r05_years_of_service_array_list = new ArrayList();
                p.r06_years_of_service_array_list = new ArrayList();
                p.r09_years_of_service_array_list = new ArrayList();
                p.r13_years_of_service_array_list = new ArrayList();
                p.r14_years_of_service_array_list = new ArrayList();
                p.r16_years_of_service_array_list = new ArrayList();
                p.r17_years_of_service_array_list = new ArrayList();
                p.rank = 0;
            }

        }

        private void DataGrid_special_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            decimal years_of_service;
            if ((e.Item.ItemType == ListItemType.AlternatingItem) || (e.Item.ItemType == ListItemType.EditItem) || (e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.SelectedItem))
            {
                // We are dealing with a data row, not a header or footer row.
                if (e.Item.Cells[1].Text != "&nbsp;")
                {
                    years_of_service = decimal.Parse(e.Item.Cells[1].Text);
                    p.citywide_years_of_service_array_list.Add(years_of_service);
                    switch(uint.Parse(e.Item.Cells[0].Text))
                    {
                        case 00:
                            p.ems_years_of_service_array_list.Add(years_of_service);
                            break;
                        case 01:
                            p.r01_years_of_service_array_list.Add(years_of_service);
                            break;
                        case 02:
                            p.r02_years_of_service_array_list.Add(years_of_service);
                            break;
                        case 04:
                            p.r04_years_of_service_array_list.Add(years_of_service);
                            break;
                        case 05:
                            p.r05_years_of_service_array_list.Add(years_of_service);
                            break;
                        case 06:
                            p.r06_years_of_service_array_list.Add(years_of_service);
                            break;
                        case 09:
                            p.r09_years_of_service_array_list.Add(years_of_service);
                            break;
                        case 13:
                            p.r13_years_of_service_array_list.Add(years_of_service);
                            break;
                        case 14:
                            p.r14_years_of_service_array_list.Add(years_of_service);
                            break;
                        case 16:
                            p.r16_years_of_service_array_list.Add(years_of_service);
                            break;
                        case 17:
                            p.r17_years_of_service_array_list.Add(years_of_service);
                            break;
                    }
                }
            }
        }

        private void DataGrid_detail_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.AlternatingItem) || (e.Item.ItemType == ListItemType.EditItem) || (e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.SelectedItem))
            {
                // We are dealing with a data row, not a header or footer row.
                p.rank = p.rank + 1;
                e.Item.Cells[0].Text = p.rank.ToString();
            }
        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.DataGrid_detail.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid_detail_ItemDataBound);
            this.DataGrid_special.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid_special_ItemDataBound);
            this.Load += this.Page_Load;
            this.PreRender += this.TWebUserControl_ranked_length_of_service_PreRender;
        }

        private void TWebUserControl_ranked_length_of_service_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("UserControl_ranked_length_of_service.p", p);
        }

        public TWebUserControl_ranked_length_of_service Fresh()
        {
            TWebUserControl_ranked_length_of_service result;
            Session.Remove("UserControl_ranked_length_of_service.p");
            result = this;
            return result;
        }

    } // end TWebUserControl_ranked_length_of_service

}
