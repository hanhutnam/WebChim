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
    public partial class Chitiettintuc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }
        private void load()
        {
            int MaTin = int.Parse(Request.QueryString["MaTin"]);
            DataTable dt1,dt2;
            dt1 = XLDL.GetData("select TieuDe,NoiDung from TinTuc where MaTin = " + MaTin);
            lbTieuDe.Text = dt1.Rows[0][0].ToString();
            lbNoiDung.Text = dt1.Rows[0][1].ToString();
            dt2 = XLDL.GetData("select TV.TenTV, BLTT.NoiDung,BLTT.NgayBL from ThanhVien TV,BLTinTuc BLTT where TV.MaTV = BLTT.MaTV and BLTT.MaTin = " + MaTin + " order by NgayBL DESC");
            dlBinhLuan.DataSource = dt2;
            dlBinhLuan.DataBind();
           

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
                    int MaTin = int.Parse(Request.QueryString["MaTin"]);
                    SqlConnection con = new SqlConnection(XLDL.strCon);
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    cmd.CommandText = @"INSERT INTO BLTinTuc(MaTin,MaTV,NoiDung,NgayBL) 
                                    VALUES(@matin,@matv,@noidung,@ngaybinhluan)";
                    cmd.Parameters.Add("@matin", SqlDbType.Int);
                    cmd.Parameters["@matin"].Value = MaTin;
                    cmd.Parameters.Add("@matv", SqlDbType.Int);
                    cmd.Parameters["@matv"].Value = Session["MaTV"];
                    cmd.Parameters.Add("@noidung", SqlDbType.NVarChar, 200);
                    cmd.Parameters["@noidung"].Value = txtBinhLuan.Text;
                    cmd.Parameters.Add("@ngaybinhluan", SqlDbType.SmallDateTime);
                    cmd.Parameters["@ngaybinhluan"].Value = DateTime.Now;

                    cmd.ExecuteNonQuery();
                    con.Close();
                    txtBinhLuan.Text = "";
                    lbThongBao.Text = "Đã gửi bình luận!";

                    load();
                }
                catch
                {
                    lbThongBao.Text = "Gửi không thành công!";
                }
            }
        }
    }
}