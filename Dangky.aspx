<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Dangky.aspx.cs" Inherits="HaNhutNam_LTWeb.Dangky" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="text-center font-weight-bold mt-5 text-light">ĐĂNG KÝ THÀNH VIÊN</p>
        <table style="width:50%; border-style: solid;border:1px" class="mx-auto">
            <tr>
                <td class="text-light">Họ và tên:</td>
                <td ><asp:TextBox ID="txtHoTen" class="form-control" runat="server"></asp:TextBox></td>
            </tr>
            <tr >
                <td class="text-light">Giới tính:</td>
                <td class="text-light"><asp:RadioButtonList ID="rblGioiTinh" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Nam</asp:ListItem>
                        <asp:ListItem>Nữ</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr >
                <td class="text-light">Ngày sinh:</td>
                <td class="text-light"><asp:DropDownList ID="ddlNgaySinh" runat="server">
                </asp:DropDownList>Tháng<asp:DropDownList ID="ddlThangSinh" runat="server"></asp:DropDownList> Năm<asp:TextBox ID="txtNamSinh" CssClass="rounded" runat="server"></asp:TextBox></td>            
            </tr>
            <tr >
                <td class="text-light">Địa chỉ:</td>
                <td><asp:TextBox ID="txtDiaChi" class="form-control" runat="server"></asp:TextBox></td>            
            </tr>
             <tr >
                <td class="text-light">Điện thoại:</td>
                <td ><asp:TextBox ID="txtDienThoai" class="form-control" runat="server"></asp:TextBox></td>            
            </tr >
             <tr>
                <td class="text-light">Email:</td>
                <td><asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox></td>            
            </tr>           
            <tr>
                <td class="text-light">Mật khẩu:</td>
                <td><asp:TextBox ID="txtMatKhau" class="form-control" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="text-light">Nhập lại mật khẩu:</td>
                <td><asp:TextBox ID="txtNhapLaiMatKhau" class="form-control" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
              <tr>
                <td ></td>
                <td><asp:Button ID="btDangKy" runat="server" CssClass="mt-3 btn btn-warning" Text="Đăng ký" OnClick="btDangKy_Click" /></td>
            </tr>
        </table>       
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtHoTen" ErrorMessage="Họ tên không được bỏ trống"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn chưa nhập Email" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Địa chỉ Email không hợp lệ" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Bạn chưa nhập năm sinh" ControlToValidate="txtNamSinh"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="RangeValidator" ControlToValidate="txtNamSinh" MaximumValue="2500" MinimumValue="1900"></asp:RangeValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Mật khẩu không được bỏ trống" ControlToValidate="txtMatKhau"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Nhập lại mật khẩu không chính xác" ControlToValidate="txtNhapLaiMatKhau"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Nhập lại mật khẩu không chính xác" ControlToCompare="txtMatKhau" ControlToValidate="txtNhapLaiMatKhau"></asp:CompareValidator>
        <p><asp:Label ID="lbThongBaoLoi" runat="server"></asp:Label></p>
</asp:Content>
