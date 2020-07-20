<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UCMenuAdmin.ascx.cs" Inherits="HaNhutNam_LTWeb.Admin.UCAdmin.UCMenuAdmin" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark mt-5">
    <div class="container">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#Menu" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>   
        <div class="collapse navbar-collapse" id="Menu">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link text-white font-weight-bold" href="../Admin/Admin.aspx">Trang Chủ</a>
                </li>                
                <li class="nav-item">
                    <a class="nav-link text-white font-weight-bold" href="../Admin/QLBaidang.aspx">Rao Bán</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white font-weight-bold" href="../Admin/QLTintuc.aspx">Tin Tức</a>
                </li>                
            </ul>
        </div>
    </div>
</nav>