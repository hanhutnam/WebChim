<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UCHeader.ascx.cs" Inherits="HaNhutNam_LTWeb.UC.UCHeader" %>

<nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top" style="background-color: #444444;">
    <div class="container">
        <a href="../Index.aspx">
        <asp:Image ID="Image1" runat="server" Width="215" Height="80" /></a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class=" nav-item form-inline">
                    <asp:TextBox ID="txtTimKiem" runat="server" CssClass="form-control form-control-sm "></asp:TextBox>
                    <asp:Button ID="btTimKiem" runat="server" CssClass="ml-2 btn btn-outline-light" Text="Tìm kiếm" OnClick="btTimKiem_Click" />
                </li>
                <li class="nav-item" id="dangnhap" runat="server">
                    <a class="nav-link text-light font-weight-bold" href="Dangnhap.aspx">Đăng nhập</a>
                </li>
                <li class="nav-item" id="dangky" runat="server">
                    <a class="nav-link text-light font-weight-bold" href="Dangky.aspx">Đăng ký</a>
                </li>                
                <li class="nav-item dropdown" id="tendn" runat="server">
                    <asp:Label ID="lbTenDN" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" CssClass="text-light nav-link font-weight-bold" runat="server" Text=""></asp:Label>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="lbTenDN">
                        <a class="dropdown-item" href="../QLBaiviet.aspx">Quản Lý Bài Viết</a>
                        <a class="dropdown-item" href="../QLTaikhoan.aspx">Quản Lý Tài Khoản</a>
                        <asp:Button ID="btDangXuat" CssClass="dropdown-item" runat="server" Text="Đăng xuất" OnClick="btDangXuat_Click" />
                    </div>
                </li>               
                <li class="nav-item ">
                    <a href="../Giohang.aspx" class="nav-link text-light font-weight-bold">Giỏ hàng(<asp:Label ID="lbTongSL" runat="server" Text=""></asp:Label>)</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
