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
    public partial class Thanhtoan : System.Web.UI.Page
    {
        //decimal a;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack != true)
            {
                if (Session["MaTV"] == null)
                    Response.Redirect("~/Dangnhap.aspx");
                if (Session["GioHang"] == null)
                    Response.Redirect("~/Giohang.aspx");
                if (Session["MaTV"] != null)
                {
                    string s = @"select MaTV,TenTV,DiaChi,SDT,Email from ThanhVien where MaTV ='" + Session["MaTV"].ToString() + "'";
                    DataTable dt = XLDL.GetData(s);
                    if (dt.Rows.Count > 0)
                    {

                        lbHoTen.Text = dt.Rows[0][1].ToString();
                        lbDiaChi.Text = dt.Rows[0][2].ToString();
                        lbDienThoai.Text = dt.Rows[0][3].ToString();
                        lbEmail.Text = dt.Rows[0][4].ToString();
                        txtNguoiNhan.Text = dt.Rows[0][1].ToString();
                        txtDiaChi.Text = dt.Rows[0][2].ToString();
                        txtDienThoai.Text = dt.Rows[0][3].ToString();
                    }
                }
                if (Session["GioHang"] != null)
                {
                    DataTable dt = new DataTable();
                    dt = (DataTable)Session["GioHang"];
                    System.Decimal tongthanhtien = 0;
                    foreach (DataRow r in dt.Rows)
                    {
                        r["ThanhTien"] = Convert.ToInt32(r["SoLuong"]) * Convert.ToDecimal(r["DonGia"]);
                        tongthanhtien += Convert.ToDecimal(r["Thanhtien"]);
                        lbTongTien.Text = tongthanhtien.ToString();
                        
                        //Session["lbtongthanhtien"] = tongthanhtien;
                       // a = tongthanhtien;
                    }
                    gvGioHang.DataSource = dt;
                    gvGioHang.DataBind();
                }
                calNgayGiao.SelectedDate = DateTime.Today;

            }

        }

        protected void btDongY_Click(object sender, EventArgs e)
        {           
            int httt = 0, htgh = 0;
            string TenNguoiNhan, DiaChiNhan, DienThoaiNhan;
            TenNguoiNhan = txtNguoiNhan.Text;
            DiaChiNhan = txtNguoiNhan.Text;
            DienThoaiNhan = txtDienThoai.Text;
            decimal tongthanhtien = decimal.Parse(lbTongTien.Text);
           // httt = Convert.ToInt32(rblHinhThucThanhToan.SelectedItem.Value);
            htgh = Convert.ToInt32(rblhinhThucGiaoHang.SelectedItem.Value);
            try
            {
                SqlConnection con = new SqlConnection(XLDL.strCon);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                cmd.CommandText = @"insert into DonDatHang(MaTV,NgayDH,TriGia,NgayGH,TenNguoiNhan,DiaChiNhan,DTNhan,HTTT,HTGH)
                Values(" + Session["MaTV"] + ",@ngaydathang," + tongthanhtien + ",@ngaygiaohang,N'" + TenNguoiNhan + "',N'" + DiaChiNhan + "','" + DienThoaiNhan + "'," + httt + "," + htgh + ")";
                cmd.Parameters.Add("@ngaydathang", SqlDbType.SmallDateTime);
                cmd.Parameters["@ngaydathang"].Value = DateTime.Now;
                cmd.Parameters.Add("@ngaygiaohang", SqlDbType.SmallDateTime);
                cmd.Parameters["@ngaygiaohang"].Value = calNgayGiao.SelectedDate;
                cmd.ExecuteNonQuery();
                con.Close();

                //laymadonhang
                string s = @"Select max(MaDH) from  DonDatHang Where MaTV = " + Session["MaTV"];
                int MaDH = int.Parse(XLDL.GetData(s).Rows[0][0].ToString());
                DataTable dt = new DataTable();
                dt = (DataTable)Session["GioHang"];
                int MaSP, SoLuong;
                double DonGia, ThanhTien;
                /* Luu san pham vao table CTDATHANG */
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    MaSP = int.Parse(dt.Rows[i]["MaBai"].ToString());
                    SoLuong = int.Parse(dt.Rows[i]["SoLuong"].ToString());
                    DonGia = double.Parse(dt.Rows[i]["DonGia"].ToString());
                    ThanhTien = double.Parse(dt.Rows[i]["ThanhTien"].ToString());
                    s = "INSERT INTO CTDatHang(MaDH,MaBai,SoLuong,DonGia,ThanhTien) VALUES(" + MaDH + "," + MaSP + "," + SoLuong + "," + DonGia + "," + ThanhTien + ")";
                    XLDL.Execute(s);
                    XLDL.Execute("Update BaiDang set TrangThai = '1' where MaBai = " + MaSP);
                }
                /* xoa gio hang sau khi da thuc hien xong dat hang*/
                Session["GioHang"] = null;
                /*Sau khi dat hang se chuyen toi trang XAc nhan don hang */
                Response.Redirect("~/Xacnhandonhang.aspx");
            }
            catch
            {
                lbThongBaoLoi.Text = "Lỗi trong quá trình cập nhật dữ liệu!";

            }
        }
    }
}