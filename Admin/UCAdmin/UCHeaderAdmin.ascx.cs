using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaNhutNam_LTWeb.Admin.UCAdmin
{
    public partial class UCHeaderAdmin : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MaAdmin"] != null)
            {

                lbTenDN.Text = "Xin Chào: " + Session["TenAdmin"].ToString();

            }
            else
            {
                Response.Redirect("~/Dangnhap.aspx");
            }
            if (IsPostBack != true)
            {
                laylogo();
            }
           
        }
        private void laylogo()
        {
            DataTable dt1 = XLDL.GetData("select * from LoGo");
            Image1.ImageUrl = "~/Images/Logo/" + dt1.Rows[0][0].ToString();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["MaAdmin"] = null;
            Session["TenAdmin"] = null;
            Response.Redirect("~/Index.aspx");
        }
    }
}