<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Chitietsanpham.aspx.cs" Inherits="HaNhutNam_LTWeb.Chitietsanpham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="Index.aspx">Trang Chủ</a>
        </li>
        <li class="breadcrumb-item active">
            <asp:Label ID="lbTieuDe" runat="server" Text=""></asp:Label></li>
    </ol>
    <div class="row text-light my-3">
        <div class="col-lg-6 text-center">
            <asp:Image ID="Image1" runat="server" Height="323px" Width="316px" /><br />
            <asp:Button ID="btThich" CssClass="btn rounded mt-2" runat="server" Text="Thích" OnClick="btThich_Click1" /><asp:Button ID="btBoThich" CssClass="btn rounded mt-2" runat="server" Text="Bỏ thích" OnClick="btBoThich_Click" />
            <p> Số lượt like: <asp:Label ID="lbSLLike" runat="server" Text="0"></asp:Label> </p>
        </div>
        <div class="col-lg-6 px-4">
            <asp:Label ID="lbNoiDung" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="dropdown-divider"></div>
    <div class="row text-light">
        <div class="col-6">
            <table style="width: 100%;">
                <tr>
                    <td>
                        <asp:TextBox ID="txtBinhLuan" runat="server" CssClass="rounded" TextMode="MultiLine" Width="348px"></asp:TextBox><br />
                        <asp:Button ID="btGui" runat="server" CssClass="btn" Text="Gửi" OnClick="btGui_Click" /><asp:Label ID="lbThongBao" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <h4 class="text-light mt-3">Bình luận</h4>
    <div class="dropdown-divider"></div>
    <div class="row text-light">
        <div class="col-6 mx-3">
            <asp:DataList ID="dlBinhLuan" runat="server" CssClass="" Width="100%">
                <ItemTemplate>
                    <div class="border rounded m-2 ">
                        <p class="mx-3"><%# Eval("NoiDung")%></p>
                        <div class="dropdown-divider"></div>
                        <div class="row mx-2">
                            <div class="col-6"><%# Eval("TenTV")%>:</div>
                            <div class="col-6 text-right"><i><%# Eval("NgayBL")%></i></div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
