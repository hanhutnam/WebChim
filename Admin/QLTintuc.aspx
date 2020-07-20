<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeFile="QLTintuc.aspx.cs" Inherits="HaNhutNam_LTWeb.Admin.QLTintuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-center">
        <p class="text-light">
            Lọc tin tức :
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1">
        <asp:ListItem Value="0">Chưa duyệt</asp:ListItem>
        <asp:ListItem Value="1">Đã duyệt</asp:ListItem>
    </asp:DropDownList>
        </p>
    </div>
    <asp:GridView ID="gvTinTuc" runat="server" CssClass="text-light text-center mx-auto" AutoGenerateColumns="False" DataKeyNames="MaTin" AllowPaging="True" OnPageIndexChanging="gvTinTuc_PageIndexChanging" OnRowCommand="gvTinTuc_RowCommand">
        <Columns>
            <asp:BoundField DataField="MaTin" HeaderText="Mã tin" />
            <asp:BoundField DataField="TieuDe" HeaderText="Tiêu đề" />
            <asp:BoundField DataField="NgayDang" HeaderText="Ngày Đăng" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:HyperLinkField Text="Xem chi tiết" />
            <asp:ButtonField CommandName="Duyet" Text="Duyệt" />
            <asp:ButtonField CommandName="Xoa" Text="Xóa" />
        </Columns>
    </asp:GridView>
    <asp:Label ID="lbThongBao" runat="server" CssClass="" Text=""></asp:Label>
</asp:Content>
