using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaNhutNam_LTWeb.Admin
{
    public partial class QLBaidang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
             chuaduyet();
            
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
        private void daduyet()
        {
            gvDangBan.DataSource = XLDL.GetData("select * from BaiDang where Duyet='1' order by NgayDang DESC ");
            gvDangBan.DataBind();
        }
        private void chuaduyet()
        {
            gvDangBan.DataSource = XLDL.GetData("select * from BaiDang where Duyet='0' order by NgayDang DESC ");
            gvDangBan.DataBind();
        }
        private void capnhat()
        {
            if (DropDownList1.SelectedItem.Value == "0")
            {
                chuaduyet();
                gvDangBan.Columns[8].Visible = true;
            }
            if (DropDownList1.SelectedItem.Value == "1")
            {
                daduyet();
                gvDangBan.Columns[8].Visible = false;
            }
        }
        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            capnhat();
        }

        protected void gvDangBan_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDangBan.PageIndex = e.NewPageIndex;
            gvDangBan.DataBind();
        }

        protected void gvDangBan_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int chiso = int.Parse(e.CommandArgument.ToString());
            int ma = int.Parse(gvDangBan.Rows[chiso].Cells[1].Text);
            if (e.CommandName == "Xoa")
            {
                try
                {
                    DataTable dt = XLDL.GetData("select * from BLBaiDang where MaBai = " + ma);
                    if (dt.Rows.Count > 0)
                        Response.Write("<script>alert('Không thể xóa tin này. Bạn cần xóa hêt bình luận có trong tin này trước')</script>");
                    else
                    {
                        dt = XLDL.GetData("delete from BaiDang where MaBai =" + ma);
                        lbThongBao.Text = "Xóa thành công";
                        capnhat();
                    }
                }
                catch
                {
                    Response.Write("<script>alert('Có lỗi trong quá trình xóa')</script>");
                }
            }
            if (e.CommandName == "Duyet")
            {
                int duyet = 1;
                try
                {
                    string str1 = @"Update BaiDang set Duyet = " + duyet + " where MaBai = " + ma;
                    XLDL.Execute(str1);
                    lbThongBao.Text = "Đã duyệt";
                    capnhat();
                }
                catch
                {
                    lbThongBao.Text = "Cập nhật thất bại";
                }
            }
        }
    }
}