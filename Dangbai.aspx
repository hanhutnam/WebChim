<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Dangbai.aspx.cs" Inherits="HaNhutNam_LTWeb.Dangbai" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="text-light">
        Chọn chuyên mục:
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
        <asp:ListItem Value="0">Mua bán</asp:ListItem>
        <asp:ListItem Value="1">Tin tức</asp:ListItem>
    </asp:DropDownList>
    </p>
    <table style="width: 100%;" runat="server" id="table1"  class="text-light">
        <tr>
            <td>Tiêu đề:</td>
            <td><asp:TextBox ID="txtTieuDe" runat="server"></asp:TextBox></td>
        </tr>
        <tr id="hinhanh" runat="server">
            <td >Hình ảnh minh họa:</td>
            <td><asp:FileUpload ID="file_upload" runat="server" /></td>
        </tr>
        <tr>
            <td >Tóm tắt:</td>
            <td><asp:TextBox ID="txtTomTat" runat="server"></asp:TextBox></td>
        </tr>
        <tr id="dongia" runat="server">
            <td >Đơn giá:</td>
            <td><asp:TextBox ID="txtDonGia" runat="server"></asp:TextBox>&nbsp;vnđ</td>
        </tr>
        <tr>
            <td >Mô tả:</td>
            <td><CKEditor:CKEditorControl ID="CKEditorControl1" runat="server"></CKEditor:CKEditorControl></td>
        </tr>

        <tr>
            <td></td>
            <td><asp:Button ID="btDang" runat="server" Text="Đăng" OnClick="btDang_Click" /></td>
        </tr>
    </table>
    <asp:Label ID="lbThongBao" runat="server" CssClass="text-light" Text=""></asp:Label>
    
 
</asp:Content>
