<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="QLBaiviet.aspx.cs" Inherits="HaNhutNam_LTWeb.QLBaiviet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <a href="../Dangbai.aspx">Đăng bài</a>
    <h3 class="text-light">Tin Tức</h3>
    <div class="dropdown-divider"></div>
     <asp:GridView ID="gvTinTuc" runat="server"  CssClass="text-light text-center mx-auto" AutoGenerateColumns="False" DataKeyNames="MaTin" AllowPaging="True" OnPageIndexChanging="gvTinTuc_PageIndexChanging" OnRowCommand="gvTinTuc_RowCommand">
        <Columns>
            <asp:BoundField DataField="MaTin" HeaderText="Mã tin" />
            <asp:BoundField DataField="TieuDe" HeaderText="Tiêu đề" />
            <asp:BoundField DataField="NgayDang" HeaderText="Ngày Đăng" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:TemplateField HeaderText="Duyệt">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Duyet") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# CheckDuyet(Eval("Duyet")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="MaTin" DataNavigateUrlFormatString="~/Chitietbaiviet.aspx?MaTin={0}" Text="Chi tiết" />
            <asp:ButtonField CommandName="Xoa" Text="Xóa" />
        </Columns>
    </asp:GridView>
    <h3 class="text-light">Đăng Bán</h3>
    <div class="dropdown-divider"></div>
    <asp:GridView ID="gvDangBan" runat="server" CssClass="text-light text-center mx-auto" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="gvDangBan_PageIndexChanging" OnRowCommand="gvDangBan_RowCommand" DataKeyNames="MaBai">
        <Columns>
            
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
            <asp:TemplateField HeaderText="Duyệt">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Duyet") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# CheckDuyet(Eval("Duyet")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:HyperLinkField Text="Chi tiết" DataNavigateUrlFields="MaBai" DataNavigateUrlFormatString="~/Chitietraoban.aspx?MaBai={0}" />
            <asp:ButtonField CommandName="Xoa" Text="Xóa" />

        </Columns>
    </asp:GridView>
</asp:Content>
