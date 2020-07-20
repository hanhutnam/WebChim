<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="QLTaikhoan.aspx.cs" Inherits="HaNhutNam_LTWeb.QLTaikhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-light">
        <p>Thông Tin Tài Khoản</p>
        <table style="width: 100%;">
            <tr>
                <td>Họ và tên:</td>
                <td>
                    <asp:TextBox ID="txtHoTen" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtHoTen"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Ngày sinh:</td>
                <td>
                    <asp:TextBox ID="txtNgaySinh" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtNgaySinh"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Giới tính:</td>
                <td>
                    <asp:RadioButtonList ID="rblGioiTinh" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="Nam">Nam</asp:ListItem>
                        <asp:ListItem Value="Nữ">Nữ</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>Số điện thoại:</td>
                <td>
                    <asp:TextBox ID="txtSoDienThoai" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtSoDienThoai"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Địa chỉ:</td>
                <td>
                    <asp:TextBox ID="txtDiaChi" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtDiaChi"></asp:RequiredFieldValidator>
                </td>
            </tr>

        </table>
        <asp:Button ID="txtCapNhat" runat="server" Text="Cập nhật" OnClick="txtCapNhat_Click" />

        <br />
        <asp:Label ID="lbThongBao" runat="server"></asp:Label><br />
        <a href="../Doimatkhau.aspx">Đổi mật khẩu</a>
    </div>

</asp:Content>
