<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Chitiettintuc.aspx.cs" Inherits="HaNhutNam_LTWeb.Chitiettintuc" %>

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
    <div class="row text-light">
        <div class="col-lg-12 col-sm-12">
            <asp:Label ID="lbNoiDung" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="dropdown-divider"></div>
    <div class="row text-light">
        <div class="col-6">
            <table style="width: 100%;">
                <tr>
                    <td>
                        <asp:TextBox ID="txtBinhLuan" runat="server" CssClass="rounded" TextMode="MultiLine" Width="359px"></asp:TextBox><br />
                        <asp:Button ID="btGui" runat="server" Text="Gửi" OnClick="btGui_Click" CssClass="btn" /><asp:Label ID="lbThongBao" runat="server" Text=""></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBinhLuan" ErrorMessage="Bạn chưa nhập bình luận"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <h4 class="text-light mt-3">Bình luận</h4>
    <div class="dropdown-divider"></div>
    <div class="row text-light">
        <div class="col-6">
            <asp:DataList ID="dlBinhLuan" runat="server" CssClass="" Width="100%">
                <ItemTemplate>
                    <div class="border rounded m-2 ">
                        <%# Eval("NoiDung")%>
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
