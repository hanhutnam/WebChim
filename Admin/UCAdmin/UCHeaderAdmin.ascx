<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UCHeaderAdmin.ascx.cs" Inherits="HaNhutNam_LTWeb.Admin.UCAdmin.UCHeaderAdmin" %>


<nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top" style="background-color: #444444;">
    <div class="container">
         <asp:Image ID="Image1" runat="server" CssClass="navbar-brand" Width="215" Height="80" />
       
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <asp:Label ID="lbTenDN" CssClass="nav-link text-light" runat="server" Text=""></asp:Label>

                </li>
                <li class="nav-item">
                    <asp:Button ID="Button1" runat="server" CssClass="nav-link text-white dropdown-item btn btn-secondaly" Text="Đăng Xuất" OnClick="Button1_Click" />
                </li>
            </ul>
        </div>
    </div>
</nav>
