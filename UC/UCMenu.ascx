<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UCMenu.ascx.cs" Inherits="HaNhutNam_LTWeb.UC.UCMenu" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark mt-5">
    <div class="container">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#Menu" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>   
        <div class="collapse navbar-collapse" id="Menu">
            <ul class="navbar-nav font-weight-bold">
                <li class="nav-item">
                    <a class="nav-link text-white " href="../Index.aspx"><h4>Trang Chủ</h4></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white " href="../Raoban.aspx"><h4>Rao Bán</h4></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white " href="../Tintuc.aspx"><h4>Tin Tức</h4></a>
                </li>                
            </ul>
        </div>
    </div>
</nav>
