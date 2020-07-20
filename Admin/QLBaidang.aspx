<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeFile="QLBaidang.aspx.cs" Inherits="HaNhutNam_LTWeb.Admin.QLBaidang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-center">
        <p class="text-light">
            Lọc bài đăng:
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1">
        <asp:ListItem Value="0">Chưa duyệt</asp:ListItem>
        <asp:ListItem Value="1">Đã duyệt</asp:ListItem>
    </asp:DropDownList>
        </p>
    </div>

     <asp:GridView ID="gvDangBan" runat="server" CssClass="text-light text-center mx-auto" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="gvDangBan_PageIndexChanging" DataKeyNames="MaBai" OnRowCommand="gvDangBan_RowCommand">
        <Columns>
            <asp:ImageField HeaderText="Hình ảnh">
            </asp:ImageField>
            <asp:BoundField DataField="MaBai" HeaderText="Mã bài" />
            <asp:BoundField DataField="TieuDe" HeaderText="Tiêu đề" />
            <asp:BoundField DataField="TomTat" HeaderText="Tóm tắt" />
            <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" DataFormatString="{0:0,0 } VNĐ" />
            <asp:BoundField DataField="NgayDang" HeaderText="Ngày đăng" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:TemplateField HeaderText="Trạng thái">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TrangThai") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# CheckBan(Eval("TrangThai")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField CommandName="Xoa" Text="Xóa" />
            <asp:ButtonField CommandName="Duyet" Text="Duyệt" />

        </Columns>
    </asp:GridView>
    <asp:Label ID="lbThongBao" runat="server" CssClass="text-light" Text=""></asp:Label>
</asp:Content>
