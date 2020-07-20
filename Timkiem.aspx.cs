using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaNhutNam_LTWeb
{
    public partial class Timkiem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            capnhat();
        }

        private void capnhat()
        {
            string chuoitk = Request.QueryString["chuoitk"];
            DataTable dt1,dt2;
            dt1 = XLDL.GetData("SELECT * FROM BaiDang WHERE TieuDe LIKE N'%" + chuoitk + "%' and Duyet = '1'");
            dt2 = XLDL.GetData("SELECT * FROM TinTuc WHERE TieuDe LIKE N'%" + chuoitk + "%' and Duyet = '1'");
            DataList1.DataSource = dt2;
            DataList1.DataBind();
            DataList2.DataSource = dt1;
            DataList2.DataBind();
        }
    }
}