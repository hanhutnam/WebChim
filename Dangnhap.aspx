<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeFile="Dangnhap.aspx.cs" Inherits="HaNhutNam_LTWeb.Dangnhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container text-center mt-5 py-5">
        <div class="border rounded bg-light py-5 px-5">
            <p class="font-weight-bold">ĐĂNG NHẬP</p>
            <table class="auto-style2 text-left mx-auto">
                <tr>
                    <td class="auto-style1">Tài khoản:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Mật khẩu:</td>
                    <td>
                        <asp:TextBox ID="txtMatKhau" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="lbThongBao" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="btDangNhap" runat="server" CssClass="btn btn-warning mt-2" Text="Đăng nhập" OnClick="btDangNhap_Click1" />
                    </td>
                </tr>

            </table>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Quenmatkhau.aspx">Quên mật khẩu</asp:HyperLink>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn chưa nhập tên tài khoản" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn chưa nhập mật khẩu" ControlToValidate="txtMatKhau"></asp:RequiredFieldValidator>
        </div>
    </div>

</asp:Content>
