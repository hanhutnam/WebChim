using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaNhutNam_LTWeb
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataList1.DataSource = XLDL.GetData("select top 3 TT.*,TV.TenTV from TinTuc TT,ThanhVien TV where TV.MaTV = TT.MaTV and Duyet='1' order by NgayDang DESC");
            DataList1.DataBind();
            DataList2.DataSource = XLDL.GetData("select top 6 BD.*,TV.TenTV from BaiDang BD, ThanhVien TV where TV.MaTV = BD.MaTV and Duyet='1' order by NgayDang DESC");
            DataList2.DataBind();
        }
    }
}