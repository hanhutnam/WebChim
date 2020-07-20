using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaNhutNam_LTWeb
{
    public partial class Dangky : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            for (int i = 1; i <= 31; i++)
            {
                ddlNgaySinh.Items.Add(i.ToString());
            }
            for (int i = 1; i <= 12; i++)
            {
                ddlThangSinh.Items.Add(i.ToString());
            }
        }

        protected void btDangKy_Click(object sender, EventArgs e)
        {
            try
            {

                string str1 = @"select * from ThanhVien where Email = '" + txtEmail.Text + "'";
                if (XLDL.GetData(str1).Rows.Count > 0)
                {
                    lbThongBaoLoi.Text = "Tên đăng nhập đã tồn tại";
                    txtEmail.Focus();
                }
                else
                {
                    SqlConnection con = new SqlConnection(XLDL.strCon);
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    cmd.CommandText = "INSERT INTO ThanhVien (TenTV,GioiTinh,NgaySinh,Email,MatKhau,DiaChi,SDT) VALUES (@tentv,@gioitinh,@ngaysinh,@email,@matkhau,@diachi,@sdt)";
                    cmd.Parameters.Add("@tentv", SqlDbType.NVarChar, 50);
                    cmd.Parameters["@tentv"].Value = txtHoTen.Text;
                    cmd.Parameters.Add("@gioitinh", SqlDbType.Int);
                    cmd.Parameters["@gioitinh"].Value = Convert.ToInt16(rblGioiTinh.SelectedItem.Value.Equals("Nam") ? 1 : 0);
                    cmd.Parameters.Add("@ngaysinh", SqlDbType.SmallDateTime);
                    cmd.Parameters["@ngaysinh"].Value = DateTime.Parse(txtNamSinh.Text + "-" + ddlThangSinh.Text + "-" + ddlNgaySinh.Text);
                    cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50);
                    cmd.Parameters["@Email"].Value = txtEmail.Text;
                    cmd.Parameters.Add("@matkhau", SqlDbType.VarChar, 50);
                    cmd.Parameters["@matkhau"].Value = txtMatKhau.Text;
                    cmd.Parameters.Add("@diachi", SqlDbType.NVarChar, 50);
                    cmd.Parameters["@diachi"].Value = txtDiaChi.Text;
                    cmd.Parameters.Add("@sdt", SqlDbType.VarChar, 10);
                    cmd.Parameters["@sdt"].Value = txtDienThoai.Text;                
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("~/Dangnhap.aspx");
                }
            }
            catch
            {
                lbThongBaoLoi.Text = "Thất bại!";
            }
        }
    }
}