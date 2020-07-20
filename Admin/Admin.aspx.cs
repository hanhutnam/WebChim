using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaNhutNam_LTWeb.Admin
{
    public partial class Admin1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btOK_Click(object sender, EventArgs e)
        {
            try
            {
                string sTenfile;
                sTenfile = FileUpload1.FileName;
                FileUpload1.SaveAs(MapPath("~/Images/Logo/" + sTenfile));
                string str1 = @"Update LoGo set LoGo = '" + sTenfile + "'";
                XLDL.Execute(str1);
                Response.Write("<script>alert('Đổi logo thành công')</script>");
            }
            catch
            {
                Response.Write("<script>alert('Thất bại')</script>");
            }
           
        }
    }
}