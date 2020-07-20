using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaNhutNam_LTWeb.UC
{
    public partial class UCHeader : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
           if (Session["GioHang"] != null)
            {
                DataTable dt = new DataTable();
                dt = (DataTable)Session["GioHang"];
                System.Int32 tongsl = 0;
                foreach (DataRow r in dt.Rows)
                {
                    tongsl += Convert.ToInt32(r["SoLuong"]);
                    lbTongSL.Text = tongsl.ToString();
                }
            }
            if (Session["MaTV"] != null)
            {
                dangky.Visible = false;
                dangnhap.Visible = false;
                tendn.Visible = true;
                
                lbTenDN.Text = "Xin Chào: " + Session["TenTV"].ToString();

            }
            else
            {
                dangky.Visible = true;
                dangnhap.Visible = true;
                tendn.Visible = false;
               
            }
            laylogo();

           
        }
        private void laylogo()
        {
            DataTable dt1 = XLDL.GetData("select * from LoGo");
            Image1.ImageUrl = "~/Images/Logo/" + dt1.Rows[0][0].ToString();
        }
        protected void btDangXuat_Click(object sender, EventArgs e)
        {
            Session["MaTV"] = null;
            Session["TenTV"] = null;
            Response.Redirect("~/Index.aspx");
        }

        protected void btTimKiem_Click(object sender, EventArgs e)
        {
            string chuoitk = txtTimKiem.Text.Trim();
            if (chuoitk == "")
            {
                Response.Write("<script>alert('Bạn Phải Nhập Từ Khoá Trước Khi Tìm >.<!...')</script>");
            }
            else
            {
                Response.Redirect("Timkiem.aspx?chuoitk=" + chuoitk);
            }
        }
    }
}