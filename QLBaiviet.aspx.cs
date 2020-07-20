using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaNhutNam_LTWeb
{
    public partial class QLBaiviet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /* if (Session["TenTV"] == null)
             {
                 Response.Redirect("~/Dangnhap.aspx");
             }*/

            laytintuc();
            laybaidang();


        }
        private void laytintuc()
        {
            gvTinTuc.DataSource = XLDL.GetData("select * from TinTuc where MaTV = " + Session["MaTV"] + " order by NgayDang DESC ");
            gvTinTuc.DataBind();
        }
        private void laybaidang()
        {
            gvDangBan.DataSource = XLDL.GetData("Select * from BaiDang where MaTV = " + Session["MaTV"] + " order by NgayDang DESC ");
            gvDangBan.DataBind();
        }
        public string CheckDuyet(object obj)
        {
            bool b = bool.Parse(obj.ToString());
            if (b)
                return "Đã duyệt.";
            else
                return "Chưa duyệt.";
        }
        public string CheckBan(object obj)
        {
            bool b = bool.Parse(obj.ToString());
            if (b)
                return "Đã bán";
            else
                return "Chưa bán";
        }


        protected void gvTinTuc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTinTuc.PageIndex = e.NewPageIndex;
            gvTinTuc.DataBind();
        }

        protected void gvDangBan_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDangBan.PageIndex = e.NewPageIndex;
            gvDangBan.DataBind();
        }

        protected void gvTinTuc_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Xoa")
            {
                try
                {
                    int chiso = int.Parse(e.CommandArgument.ToString());
                    int ma = int.Parse(gvTinTuc.Rows[chiso].Cells[0].Text);
                    DataTable dt = XLDL.GetData("delete from TinTuc where MaTin =" + ma);
                    Response.Write("<script>alert('Xóa thành công')</script>");
                    laytintuc();
                }
                catch
                {
                    Response.Write("<script>alert('Lỗi')</script>");
                }
            }
        }

        protected void gvDangBan_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Xoa")
            {
                try
                {
                    int chiso = int.Parse(e.CommandArgument.ToString());
                    int ma = int.Parse(gvDangBan.Rows[chiso].Cells[0].Text);

                    DataTable dt = XLDL.GetData("delete from BaiDang where MaBai = " + ma);
                    Response.Write("<script>alert('Xóa thành công')</script>");
                    laytintuc();
                }
                catch
                {
                    Response.Write("<script>alert('Lỗi')</script>");
                }
            }
        }
    }
}