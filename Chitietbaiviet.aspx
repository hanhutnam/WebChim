<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Chitietbaiviet.aspx.cs" Inherits="HaNhutNam_LTWeb.Chitietbaiviet" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table style="width: 100%;" runat="server" id="table1"  class="text-light">
        <tr>
            <td>Tiêu đề:</td>
            <td><asp:TextBox ID="txtTieuDe" runat="server" TextMode="MultiLine" Width="342px"></asp:TextBox></td>
        </tr>        
        <tr>
            <td class="auto-style1" >Tóm tắt:</td>
            <td class="auto-style1"><asp:TextBox ID="txtTomTat" TextMode="MultiLine" runat="server" Width="345px"></asp:TextBox></td>
        </tr>       
        <tr>
            <td >Mô tả:</td>
            <td>
                <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server"></CKEditor:CKEditorControl>
                </td>
        </tr>

        <tr>
            <td></td>
            <td><asp:Button ID="btSua" runat="server" Text="Sửa" OnClick="btSua_Click"  />
                <asp:Button ID="btHuy" runat="server" Text="Hủy" OnClick="btHuy_Click" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lbThongBao" runat="server" CssClass="text-light" Text=""></asp:Label>
</asp:Content>
