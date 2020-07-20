<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Chitietraoban.aspx.cs" Inherits="HaNhutNam_LTWeb.Chitietraoban" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table style="width: 100%;" runat="server" id="table1"  class="text-light">
        <tr>
            <td>Tiêu đề:</td>
            <td><asp:TextBox ID="txtTieuDe" runat="server" TextMode="MultiLine" Width="341px"></asp:TextBox></td>
        </tr>
        <tr id="hinhanh" runat="server">
            <td >Hình ảnh minh họa:</td>
            <td><asp:Image ID="Image1" runat="server" Height="300px" Width="343px" />   <asp:FileUpload ID="file_upload" runat="server"/></td>
        </tr>
        <tr>
            <td >Tóm tắt:</td>
            <td><asp:TextBox ID="txtTomTat" runat="server" TextMode="MultiLine" Width="340px"></asp:TextBox></td>
        </tr>
        <tr id="dongia" runat="server">
            <td >Đơn giá:</td>
            <td><asp:TextBox ID="txtDonGia" runat="server"></asp:TextBox>&nbsp;vnđ</td>
        </tr>
        <tr>
            <td >Mô tả:</td>
            <td>
                <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server"></CKEditor:CKEditorControl></td>
        </tr>

        <tr>
            <td></td>
            <td><asp:Button ID="btSua" runat="server" Text="Sửa" OnClick="btSua_Click" />
                <asp:Button ID="btHuy" runat="server" Text="Hủy" OnClick="btHuy_Click" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lbThongBao" runat="server" CssClass="text-light" Text=""></asp:Label>
</asp:Content>
