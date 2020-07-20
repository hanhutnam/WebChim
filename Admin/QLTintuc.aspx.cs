using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaNhutNam_LTWeb.Admin
{
    public partial class QLTintuc : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack != true)
            {
                chuaduyet();
            }
        }
        private void daduyet()
        {           
            gvTinTuc.DataSource = XLDL.GetData("select * from TinTuc where Duyet='1' order by NgayDang DESC ");
            gvTinTuc.DataBind();
        }
        private void chuaduyet()
        {
            gvTinTuc.DataSource = XLDL.GetData("select * from TinTuc where Duyet='0' order by NgayDang DESC ");
            gvTinTuc.DataBind();
        }
      
        protected void gvTinTuc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTinTuc.PageIndex = e.NewPageIndex;
            gvTinTuc.DataBind();
        }
       private void capnhat()
        {
            if (DropDownList1.SelectedItem.Value == "0")
            {
                chuaduyet();
                gvTinTuc.Columns[4].Visible = true;
            }
            if (DropDownList1.SelectedItem.Value == "1")
            {
                daduyet();
                gvTinTuc.Columns[4].Visible = false;
            }
        }        

        protected void gvTinTuc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int chiso = int.Parse(e.CommandArgument.ToString());
            int ma = int.Parse(gvTinTuc.Rows[chiso].Cells[0].Text);
            if (e.CommandName == "Xoa")
            {
                try
                {                    
                    DataTable dt = XLDL.GetData("select * from BLTinTuc where MaTin = " + ma);
                    if (dt.Rows.Count > 0)
                        Response.Write("<script>alert('Không thể xóa tin này. Bạn cần xóa hêt bình luận có trong tin này trước')</script>");
                    else
                    {
                        dt = XLDL.GetData("delete from TinTuc where MaTin =" + ma);
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
                    string str1 = @"Update TinTuc set Duyet = " + duyet + " where MaTin = " + ma;
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

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            capnhat();
        }

    }
}