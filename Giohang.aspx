<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Giohang.aspx.cs" Inherits="HaNhutNam_LTWeb.Giohang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-center text-light mt-5"> 
        <p class=" font-weight-bold">THÔNG TIN GIỎ HÀNG</p>
        <asp:GridView ID="gvGioHang" runat="server" AutoGenerateColumns="False" CssClass="mx-auto" DataKeyNames="MaBai" OnRowCommand="gvGioHang_RowCommand">
        <Columns>
            <asp:BoundField DataField="MaBai" HeaderText="Mã sản phẩm" />
            <asp:BoundField DataField="TieuDe" HeaderText="Tiêu đề" />
            <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" DataFormatString="{0:0,0 } vnđ" />
            <asp:BoundField DataField="ThanhTien" HeaderText="Thành tiền" DataFormatString="{0:0,0 } vnđ" />
            <asp:TemplateField HeaderText="Số lượng">
                <ItemTemplate>
                    <asp:TextBox ID="txtSoLuong" runat="server" Text='<%# Eval("SoLuong") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField CommandName="Xoa" Text="Xóa" />
        </Columns>
        </asp:GridView>
        <p class="mt-3">&nbsp;</p>
        <p class="mt-3"><span class="font-weight-bold">Tổng cộng:</span>  <asp:Label ID="lbTongThanhTien" runat="server" Text="0"></asp:Label>&nbsp;vnđ</p>
        <asp:Button ID="btTiepTucMua" CssClass="btn button-style text-light mx-2" runat="server" Text="Tiếp Tục Mua" OnClick="btTiepTucMua_Click" BackColor="#669900" />
        <asp:Button ID="btXoaGioHang" CssClass="btn button-style text-light mx-2" runat="server" Text="Xóa Giỏ Hàng" OnClick="btXoaGioHang_Click" BackColor="#669900" />
        <asp:Button ID="btCapNhat" CssClass="btn button-style text-light mx-2" runat="server" Text="Cập Nhật" OnClick="btCapNhat_Click" BackColor="#669900"/>
        <asp:Button ID="btDatHang" CssClass="btn button-style text-light mx-2" runat="server" Text="Đặt Hàng" OnClick="btDatHang_Click" BackColor="#669900" />
        <br />
        <asp:Label ID="lbThongBaoLoi" runat="server" ForeColor="#FF3300"></asp:Label>
    </div>
</asp:Content>
