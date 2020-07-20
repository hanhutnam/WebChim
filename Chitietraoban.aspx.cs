using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaNhutNam_LTWeb
{
    public partial class Chitietraoban : System.Web.UI.Page
    {
        string sTenfile;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack != true)
            {
                load();
            }
        }
        private void load()
        {
            int MaBai = int.Parse(Request.QueryString["MaBai"]);
            DataTable dt = new DataTable();
            dt = XLDL.GetData("Select TieuDe,NoiDung,DonGia,TomTat,HinhMinhHoa from BaiDang where MaBai = " + MaBai);
            txtTieuDe.Text = dt.Rows[0][0].ToString();
            CKEditorControl1.Text = dt.Rows[0][1].ToString();
            txtDonGia.Text = dt.Rows[0][2].ToString();
            txtTomTat.Text = dt.Rows[0][3].ToString();
            Image1.ImageUrl = "~/Images/BaiDang/" + dt.Rows[0][4].ToString();    
            Session["TenHinh"]= dt.Rows[0][4].ToString();

        }


        protected void btSua_Click(object sender, EventArgs e)
        {
            if (file_upload.HasFile == false)
            {
                sTenfile = Session["TenHinh"].ToString();
            }
            else
            {
                sTenfile = file_upload.FileName;
            }
            try
            {                              
                int MaBai = int.Parse(Request.QueryString["MaBai"]);
                XLDL.Execute("update BaiDang set TieuDe = N'" + txtTieuDe.Text.Trim() + "', TomTat = N'" + txtTomTat.Text.Trim() + "', NoiDung = N'" + CKEditorControl1.Text.ToString() + "', DonGia = " + txtDonGia.Text.Trim() + ", HinhMinhHoa = '" + sTenfile + "' where MaBai = " + MaBai);
                file_upload.SaveAs(MapPath("~/Images/BaiDang/" + sTenfile));
                Response.Redirect("~/QLBaiviet.aspx");
                Session["TenHinh"] = null;
            }
            catch
            {
                Response.Write("<script>alert('lỗi')</script>");
            }
        }

        protected void btHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/QLBaiviet.aspx");
        }
    }
}