using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaNhutNam_LTWeb
{
    public partial class Doimatkhau : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MaTV"] == null)
                Response.Redirect("~/Dangnhap.aspx");
        }

        protected void btLuu_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = XLDL.GetData("select MatKhau from ThanhVien where MaTV = " + Session["MaTV"]);
                if (dt.Rows[0][0].ToString()==txtMKCu.Text)
                {
                    XLDL.Execute("UPDATE KHACHHANG Set MatKhau = '" + txtMKMoi.Text + "' where MaTV = " + Session["MaTV"]);
                    
                    Response.Redirect("~/QLTaikhoan.aspx");
                }
                else
                {
                    lbThongBao.Text = "Mật khẩu cũ không đúng!";
                }


            }
            catch
            {
                lbThongBao.Text = "Thất bại!";
            }
        }

        protected void btHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/QLTaikhoan.aspx");
        }
    }
}