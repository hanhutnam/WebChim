using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaNhutNam_LTWeb
{
    public partial class Tintuc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            laytintuc();
        }
        private void laytintuc()
        {
            DataList1.DataSource = XLDL.GetData("select TT.*,TV.TenTV from TinTuc TT,ThanhVien TV where TV.MaTV = TT.MaTV and Duyet='1' order by NgayDang DESC");
            DataList1.DataBind();
        }

       
    }
}