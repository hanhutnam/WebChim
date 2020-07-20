using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaNhutNam_LTWeb
{
    public partial class Giohang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack != true)
            {
                if (Request.QueryString["MaBai"] != null)/*xảy ra trường hợp 1*/
                {

                    int MaBai = int.Parse(Request.QueryString["MaBai"]);
                    DataTable dt = XLDL.GetData("SELECT TieuDe,DonGia from BaiDang WHERE MaBai = " + MaBai);
                    String TieuDe = dt.Rows[0][0].ToString();
                    double DonGia = double.Parse(dt.Rows[0][1].ToString());
                    int SoLuong = 1;
                    ThemVaoGioHang(MaBai, TieuDe, DonGia, SoLuong);

                }
                if (Session["GioHang"] != null)
                {

                    DataTable dt = new DataTable();
                    dt = (DataTable)Session["GioHang"];
                    System.Decimal TongThanhTien = 0;
                    foreach (DataRow r in dt.Rows)
                    {
                        r["ThanhTien"] = Convert.ToInt32(r["SoLuong"]) * Convert.ToDouble(r["DonGia"]);
                        TongThanhTien += Convert.ToDecimal(r["ThanhTien"]);
                        lbTongThanhTien.Text = TongThanhTien.ToString();
                    }
                    gvGioHang.DataSource = dt;
                    gvGioHang.DataBind();
                }
            }
        }
        public void ThemVaoGioHang(int MaBai, string TieuDe, double DonGia, int SoLuong)
        {
            DataTable dt;
            if (Session["GioHang"] == null)
            {
                dt = new DataTable();
                dt.Columns.Add("MaBai");
                dt.Columns.Add("TieuDe");
                dt.Columns.Add("DonGia");
                dt.Columns.Add("SoLuong");
                dt.Columns.Add("ThanhTien");
            }

            else
                dt = (DataTable)Session["GioHang"];
            int dong = SPDaCoTrongGioHang(MaBai, dt);
            if (dong != -1)
            {
                dt.Rows[dong]["SoLuong"] = Convert.ToInt32(dt.Rows[dong]["SoLuong"]) + SoLuong;
            }
            else
            {
                DataRow dr = dt.NewRow();
                dr["MaBai"] = MaBai;
                dr["TieuDe"] = TieuDe;
                dr["DonGia"] = DonGia;
                dr["SoLuong"] = SoLuong;
                dr["ThanhTien"] = DonGia * SoLuong;
                dt.Rows.Add(dr);
            }
            Session["GioHang"] = dt;
        }
        //Hàm kiểm tra sản phẩm đã có thì tăng số lượng
        public static int SPDaCoTrongGioHang(int MaBai, DataTable dt)
        {
            int dong = -1;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (int.Parse(dt.Rows[i]["MaBai"].ToString()) == MaBai)
                {
                    dong = i;
                    break;
                }
            }
            return dong;
        }

        protected void btTiepTucMua_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Index.aspx");
        }

        protected void btXoaGioHang_Click(object sender, EventArgs e)
        {
            Session["GioHang"] = null;
            Response.Redirect("~/Index.aspx");
        }

        protected void btCapNhat_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)Session["GioHang"];
            foreach (GridViewRow r in gvGioHang.Rows)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (Convert.ToString(gvGioHang.DataKeys[r.DataItemIndex].Value) == dr["MaBai"].ToString())
                    {
                        TextBox t = (TextBox)r.Cells[4].FindControl("txtSoLuong");
                        if (Convert.ToInt32(t.Text) <= 0)
                        {
                            dt.Rows.Remove(dr);
                        }
                        else
                        {
                            dr["SoLuong"] = t.Text;
                        }
                        break;
                    }
                }
            }
            Session["GioHang"] = dt;
            Response.Redirect("~/Giohang.aspx");
        }

        protected void btDatHang_Click(object sender, EventArgs e)
        {
            if (Session["MaTV"] == null)
            {
                
                Response.Redirect("~/Dangnhap.aspx");
            }
            else
            {
                Response.Redirect("~/Thanhtoan.aspx");
            }
        }

        protected void gvGioHang_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Xoa")
            {
                int chiso = int.Parse(e.CommandArgument.ToString());
                try
                {
                    DataTable dt = (DataTable)Session["GioHang"];
                    dt.Rows.RemoveAt(chiso);
                    Session["GioHang"] = dt;
                    Response.Redirect("~/Giohang.aspx");

                }
                catch
                {
                    Response.Redirect("~/Giohang.aspx");
                }
            }
        }
    }
}