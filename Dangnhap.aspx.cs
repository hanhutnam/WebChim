using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaNhutNam_LTWeb
{
    public partial class Dangnhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btDangNhap_Click1(object sender, EventArgs e)
        {
            try
            {
                DataTable dt1, dt2;
                dt1 = XLDL.GetData("select MaTV,TenTV from ThanhVien where Email = '" + txtEmail.Text + "' and MatKhau = '" + txtMatKhau.Text + "'");
                dt2 = XLDL.GetData("select MaAdmin,TenAdmin from Admin where Email = '" + txtEmail.Text + "' and MatKhau = '" + txtMatKhau.Text + "'");
                if (dt1.Rows.Count > 0)
                {
                    Session["MaTV"] = dt1.Rows[0][0].ToString();
                    Session["TenTV"] = dt1.Rows[0][1].ToString();
                    Response.Redirect("~/Index.aspx");
                }
                if (dt2.Rows.Count > 0)
                {
                    Session["MaAdmin"] = dt2.Rows[0][0].ToString();
                    Session["TenAdmin"] = dt2.Rows[0][1].ToString();
                    Response.Redirect("~/Admin/Admin.aspx");
                }
                else
                {
                    Response.Write("<script>alert('sai tài khoản hoặc mật khẩu')</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('Có lỗi trong quá trình đăng nhập')</script>");
            }
        }
    }
}