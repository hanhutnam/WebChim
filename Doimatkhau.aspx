<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Doimatkhau.aspx.cs" Inherits="HaNhutNam_LTWeb.Doimatkhau" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-light">
        <p>Đổi mật khẩu</p>
    <table style="width:100%;">
        <tr>
            <td>Mật khẩu cũ:</td>
            <td>
                <asp:TextBox ID="txtMKCu" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td>Mật khẩu mới:</td>
            <td>
                <asp:TextBox ID="txtMKMoi" runat="server"></asp:TextBox>
            </td>
           
        </tr>
        <tr>
            <td>Xác nhận mật khẩu mới:</td>
            <td>
                <asp:TextBox ID="txtXacNhanMK" runat="server"></asp:TextBox>
            </td>
          
        </tr>
        </table>
    <asp:Button ID="btLuu" runat="server" Text="Lưu" OnClick="btLuu_Click" /><asp:Button ID="btHuy" runat="server" Text="Hủy" OnClick="btHuy_Click" />

    <asp:Label ID="lbThongBao" runat="server" Text=""></asp:Label>
    </div>
    
</asp:Content>
