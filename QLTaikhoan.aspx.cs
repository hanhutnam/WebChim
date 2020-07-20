using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaNhutNam_LTWeb
{
    public partial class QLTaikhoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack != true)
            {
                if (Session["MaTV"] == null)
                {
                    Response.Redirect("~/Dangnhap.aspx");
                }
                else
                {
                    laydulieu();
                }
            }
        }

        protected void txtCapNhat_Click(object sender, EventArgs e)
        {
            
            try
            {
                int gioitinh = Convert.ToInt16(rblGioiTinh.SelectedItem.Value.Equals("Nam") ? 1 : 0);
                string str1 = @"Update ThanhVien set TenTV = N'" + txtHoTen.Text.Trim() + "', GioiTinh= " + gioitinh + ", NgaySinh = '" + txtNgaySinh.Text.Trim() + "', DiaChi = N'" + txtDiaChi.Text.Trim() + "', SDT = '" + txtSoDienThoai.Text.Trim() + "' WHERE MaTV = " + Session["MaTV"];
                XLDL.Execute(str1);
                lbThongBao.Text = "Cập nhật thành công!";
                laydulieu();
            }
            catch
            {
                lbThongBao.Text = "Cập nhật thất bại";
                laydulieu();
            }
        }
        private void laydulieu()
        {
            DataTable dt = new DataTable();
            dt = XLDL.GetData("select * from ThanhVien where MaTV = " + Session["MaTV"]);
            txtHoTen.Text = dt.Rows[0][1].ToString();
            bool gioitinh = Boolean.Parse(dt.Rows[0][2].ToString());
            if (gioitinh == true)
            {
                rblGioiTinh.SelectedValue = "Nam";
            }
            else
            {
                rblGioiTinh.SelectedValue = "Nữ";
            }
            DateTime ngaysinh = Convert.ToDateTime(dt.Rows[0][3].ToString());
            txtNgaySinh.Text = ngaysinh.ToString("MM/dd/yyyy");
            txtDiaChi.Text = dt.Rows[0][6].ToString();
            txtSoDienThoai.Text = dt.Rows[0][7].ToString();
        }

    }
}