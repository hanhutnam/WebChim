using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaNhutNam_LTWeb
{
    public partial class Dangbai : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (DropDownList1.SelectedItem.Value == "1")
            {
                hinhanh.Visible = false;
                dongia.Visible = false;
            }
            else
            {
                hinhanh.Visible = true;
                dongia.Visible = true;
            }            
        }
        private void cleartable()
        {
            txtDonGia.Text = "";
            txtTomTat.Text = "";
            txtTieuDe.Text = "";
            CKEditorControl1.Text = "";
        }

        protected void btDang_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Value == "0")
            {
                try
                {
                    string str1 = @"Select * from BaiDang Where TieuDe = '" + txtTieuDe.Text + "'";
                    if (XLDL.GetData(str1).Rows.Count > 0)
                    {
                        lbThongBao.Text = "Bài viết đã tồn tại";
                        txtTieuDe.Focus();
                    }
                    else
                    {

                        string sTenfile;
                        sTenfile = file_upload.FileName;
                       
                        SqlConnection con = new SqlConnection(XLDL.strCon);
                        con.Open();
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        cmd.CommandText = @"INSERT INTO BaiDang(TieuDe,NoiDung,DonGia,NgayDang,MaTV,TomTat,HinhMinhHoa) 
                                        VALUES(@tieude,@noidung,@dongia,@ngaydang,@matv,@tomtat,@hinhminhhoa)";
                        cmd.Parameters.Add("@tieude", SqlDbType.NVarChar, 50);
                        cmd.Parameters["@tieude"].Value = txtTieuDe.Text;
                        cmd.Parameters.Add("@noidung", SqlDbType.NText);
                        cmd.Parameters["@noidung"].Value = CKEditorControl1.Text.ToString();
                        cmd.Parameters.Add("@dongia", SqlDbType.Money);
                        cmd.Parameters["@dongia"].Value = txtDonGia.Text;
                        cmd.Parameters.Add("@ngaydang", SqlDbType.SmallDateTime);
                        cmd.Parameters["@ngaydang"].Value = DateTime.Today;
                        cmd.Parameters.Add("@matv", SqlDbType.Int);
                        cmd.Parameters["@matv"].Value = Session["MaTV"].ToString();
                        cmd.Parameters.Add("@tomtat", SqlDbType.NVarChar, 100);
                        cmd.Parameters["@tomtat"].Value = txtTomTat.Text;
                        cmd.Parameters.Add("@hinhminhhoa", SqlDbType.VarChar, 50);
                        cmd.Parameters["@hinhminhhoa"].Value = file_upload.FileName.ToString();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        file_upload.SaveAs(MapPath("~/Images/BaiDang/" + sTenfile));
                        lbThongBao.Text = "Đăng bài thành công";
                        cleartable();
                    }
                }
                catch
                {
                    lbThongBao.Text = "Thất Bại!";
                }
            }
            if (DropDownList1.SelectedItem.Value == "1")
            {
                try
                {
                    string str1 = @"Select * from TinTuc Where TieuDe = '" + txtTieuDe.Text + "'";
                    if (XLDL.GetData(str1).Rows.Count > 0)
                    {
                        lbThongBao.Text = "Bài viết đã tồn tại";
                        txtTieuDe.Focus();
                    }
                    else
                    {                        
                        SqlConnection con = new SqlConnection(XLDL.strCon);
                        con.Open();
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        cmd.CommandText = @"INSERT INTO TinTuc(TieuDe,TomTat,NoiDung,NgayDang,MaTV) 
                                        VALUES(@tieude,@tomtat,@noidung,@ngaydang,@matv)";
                        cmd.Parameters.Add("@tieude", SqlDbType.NVarChar, 50);
                        cmd.Parameters["@tieude"].Value = txtTieuDe.Text;
                        cmd.Parameters.Add("@noidung", SqlDbType.NText);
                        cmd.Parameters["@noidung"].Value = CKEditorControl1.Text.ToString();
                        cmd.Parameters.Add("@ngaydang", SqlDbType.SmallDateTime);
                        cmd.Parameters["@ngaydang"].Value = DateTime.Today;
                        cmd.Parameters.Add("@matv", SqlDbType.Int);
                        cmd.Parameters["@matv"].Value = Session["MaTV"].ToString();
                        cmd.Parameters.Add("@tomtat", SqlDbType.NVarChar, 200);
                        cmd.Parameters["@tomtat"].Value = txtTomTat.Text;
                        cmd.ExecuteNonQuery();
                        con.Close();
                        lbThongBao.Text = "Đăng thành công. Xin chờ quản trị viên duyệt bài!";
                        cleartable();
                    }
                }
                catch
                {
                    lbThongBao.Text = "Thất Bại!";
                }
            }
        }
    }
}
