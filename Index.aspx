<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="HaNhutNam_LTWeb.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="text-secondary font-weight-bold">Tin Tức</h3>
    <div class="dropdown-divider"></div>
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" CssClass="" RepeatDirection="Horizontal" Width="100%" RepeatLayout="Flow">
        <ItemTemplate>
            <div class="mb-4">                
                <div class="card  h-100">
                    <h4 class="card-header">
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# "~/Chitiettintuc.aspx?MaTin="+Eval("MaTin") %>' Text='<%# Eval("TieuDe") %>'></asp:HyperLink></h4>
                    <div class="card-body">
                        <p class="card-text"><%# Eval("TomTat")%></p>
                        <p><i>Người đăng: <%# Eval("TenTV")%></i></p>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <h3 class="text-secondary font-weight-bold">Rao Bán</h3>
    <div class="dropdown-divider"></div>
    <asp:DataList ID="DataList2" runat="server" CssClass="mx-auto" RepeatColumns="3" RepeatDirection="Horizontal" Width="100%">
        <ItemTemplate>
            <div class="px-4 mb-4">
                <div class="card h-100 mx-auto text-center">
                    <asp:Image ID="Image1" runat="server" Height="304px" ImageUrl='<%# "~/Images/BaiDang/"+Eval("HinhMinhHoa","{0}") %>' Width="320px" />
                    <div class="card-body">
                        <h4 class="card-title">
                            <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("TieuDe") %>' NavigateUrl='<%# "~/Chitietsanpham.aspx?MaBai="+Eval("MaBai") %>'></asp:HyperLink>
                        </h4>
                        <p class="card-text"><%# Eval("TomTat")%></p>
                        <p class="card-text">Đơn giá: <%# Eval("DonGia")%> VNĐ</p>
                         <p><i>Người đăng: <%# Eval("TenTV")%></i></p>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/Giohang.aspx?MaBai="+Eval("MaBai") %>'>Thêm vào giỏ hàng</asp:HyperLink>
                    </div>
                </div>

            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
