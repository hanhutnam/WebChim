<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="HaNhutNam_LTWeb.Admin.Admin1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center text-light">TRANG QUẢN TRỊ</h1>
    <p> Thay đổi logo: <asp:FileUpload ID="FileUpload1" runat="server" /></p>
    <asp:Button ID="btOK" runat="server" Text="Lưu" OnClick="btOK_Click" />
</asp:Content>
