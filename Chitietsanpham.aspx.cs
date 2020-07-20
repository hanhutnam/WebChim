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
    public partial class Chitietsanpham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MaTV"] == null)
            {
                btThich.Visible = false;
                btBoThich.Visible = false;

            }
            else
            {
                kiemtralike();
            }
            
                load();
            
           
        }
        private void kiemtralike()
        {
            int MaBai = int.Parse(Request.QueryString["MaBai"]);
            DataTable dt = XLDL.GetData("select * from Thich where MaTV = " + Session["MaTV"] + " and MaBai = " + MaBai);
            if (dt.Rows.Count > 0)
            {
                btBoThich.Visible = true;
                btThich.Visible = false;
            }
            else
            {
                btBoThich.Visible = false;
                btThich.Visible = true;
            }
        }
       
        private void load()
        {
            int MaBai = int.Parse(Request.QueryString["MaBai"]);
            DataTable dt1, dt2, dt3;
            dt1 = XLDL.GetData("select TieuDe,HinhMinhHoa,NoiDung from BaiDang where MaBai = " + MaBai);
            Image1.ImageUrl = "~/Images/BaiDang/" + dt1.Rows[0][1].ToString();
            lbTieuDe.Text = dt1.Rows[0][0].ToString();
            lbNoiDung.Text = dt1.Rows[0][2].ToString();
            dt2 = XLDL.GetData("select TV.TenTV, BLBD.NoiDung,BLBD.NgayBL from ThanhVien TV,BLBaiDang BLBD where TV.MaTV = BLBD.MaTV and BLBD.MaBai = " + MaBai + " order by NgayBL DESC");
            dlBinhLuan.DataSource = dt2;
            dlBinhLuan.DataBind();
            dt3 = XLDL.GetData("SELECT COUNT(*) as SLLike FROM Thich where MaBai = " + MaBai);
            lbSLLike.Text = dt3.Rows[0][0].ToString();
        }
        protected void btGui_Click(object sender, EventArgs e)
        {
            if (Session["MaTV"] == null)
            {
                Response.Redirect("~/Dangnhap.aspx");
            }
            else
            {
                try
                {
                    if (txtBinhLuan.Text.Trim() == "")
                    {
                        Response.Write("<script>alert('Bạn chưa nhập bình luận')</script>");
                    }
                    else
                    {
                        int MaBai = int.Parse(Request.QueryString["MaBai"]);
                        SqlConnection con = new SqlConnection(XLDL.strCon);
                        con.Open();
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        cmd.CommandText = @"INSERT INTO BLBaiDang(MaBai,MaTV,NoiDung,NgayBL) 
                                    VALUES(@mabai,@matv,@noidung,@ngaybinhluan)";
                        cmd.Parameters.Add("@mabai", SqlDbType.Int);
                        cmd.Parameters["@mabai"].Value = MaBai;
                        cmd.Parameters.Add("@matv", SqlDbType.Int);
                        cmd.Parameters["@matv"].Value = Session["MaTV"];
                        cmd.Parameters.Add("@noidung", SqlDbType.NVarChar, 200);
                        cmd.Parameters["@noidung"].Value = txtBinhLuan.Text.Trim();
                        cmd.Parameters.Add("@ngaybinhluan", SqlDbType.SmallDateTime);
                        cmd.Parameters["@ngaybinhluan"].Value = DateTime.Now;

                        cmd.ExecuteNonQuery();
                        con.Close();
                        txtBinhLuan.Text = "";
                        lbThongBao.Text = "Đã gửi bình luận!";
                        load();
                    }
                }
                catch
                {
                    lbThongBao.Text = "Gửi không thành công!";
                }
            }
        }
        protected void btThich_Click1(object sender, EventArgs e)
        {
            int MaBai = int.Parse(Request.QueryString["MaBai"]);
            XLDL.Execute("INSERT INTO Thich(MaTV,MaBai) values(" + Session["MaTV"] + "," + MaBai + ")");
            kiemtralike();
            load();

        }

        protected void btBoThich_Click(object sender, EventArgs e)
        {
            int MaBai = int.Parse(Request.QueryString["MaBai"]);
            XLDL.Execute("delete from Thich where MaTV = " + Session["MaTV"] + " and MaBai = " + MaBai);
            kiemtralike();
            load();
        }
    }
}