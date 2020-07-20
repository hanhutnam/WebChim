<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Raoban.aspx.cs" Inherits="HaNhutNam_LTWeb.Raoban" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="text-secondary font-weight-bold">Rao Bán</h3>
    <div class="dropdown-divider"></div>
    <asp:DataList ID="DataList2" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" Width="100%">
        <ItemTemplate>
            <div class="row px-4 mb-4">
                <div class="card h-100 mx-auto">
                    <asp:Image ID="Image1" runat="server" Height="304px" ImageUrl='<%# "~/Images/BaiDang/"+Eval("HinhMinhHoa","{0}") %>' Width="340px" />
                    <div class="card-body">
                        <h4 class="card-title">
                           <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("TieuDe") %>' NavigateUrl='<%# "~/Chitietsanpham.aspx?MaBai="+Eval("MaBai") %>'></asp:HyperLink>
                        </h4>
                        <p class="card-text"><%# Eval("TomTat")%></p>
                        <p class="card-text">Đơn giá: <%# Eval("DonGia")%> VNĐ</p>
                         <p>Người đăng: <%# Eval("TenTV")%></p>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/Giohang.aspx?MaBai="+Eval("MaBai") %>'>Thêm vào giỏ hàng</asp:HyperLink>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
