using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaNhutNam_LTWeb
{
    public partial class Chitietbaiviet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack != true)
            {
                load();
            }
            
        }
        private void load()
        {
            int MaTin = int.Parse(Request.QueryString["MaTin"]);
            DataTable dt = new DataTable();
            dt = XLDL.GetData("Select TieuDe,TomTat,NoiDung from TinTuc where MaTin = " + MaTin);
            txtTieuDe.Text = dt.Rows[0][0].ToString();
            txtTomTat.Text = dt.Rows[0][1].ToString();
            CKEditorControl1.Text = dt.Rows[0][2].ToString();
        }

        protected void btHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/QLBaiviet.aspx");
        }

        protected void btSua_Click(object sender, EventArgs e)
        {
            try
            {
                int MaTin = int.Parse(Request.QueryString["MaTin"]);
                XLDL.Execute("update TinTuc set TieuDe = N'" + txtTieuDe.Text.Trim() + "', TomTat = N'" + txtTomTat.Text.Trim() + "', NoiDung = N'" + CKEditorControl1.Text.ToString() + "' where MaTin = " + MaTin);
                Response.Redirect("~/QLBaiviet.aspx");

            }
            catch
            {
                Response.Write("<script>alert('lỗi')</script>");
            }
        }
    }
}