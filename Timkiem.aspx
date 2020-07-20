<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Timkiem.aspx.cs" Inherits="HaNhutNam_LTWeb.Timkiem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-6 col-sm-6">
            <h3 class="text-secondary font-weight-bold">Tin Tức</h3>
            <div class="dropdown-divider"></div>
            <asp:DataList ID="DataList1" runat="server" CssClass="" RepeatDirection="Vertical" Width="100%">
                <ItemTemplate>
                    <div class="px-4 mb-4">
                        <div class="card  h-100">
                            <h4 class="card-header">

                                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# "~/Chitiettintuc.aspx?MaTin="+Eval("MaTin") %>' Text='<%# Eval("TieuDe") %>'></asp:HyperLink>
                            </h4>
                            <div class="card-body">
                                <p class="card-text"><%# Eval("TomTat")%></p>
                            </div>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div class="col-lg-6 col-sm-6">
            <h3 class="text-secondary font-weight-bold">Rao Bán</h3>
            <div class="dropdown-divider"></div>
            <asp:DataList ID="DataList2" runat="server" RepeatDirection="Vertical" Width="100%">
                <ItemTemplate>
                    <div class="px-4 mb-4 text-center">
                        <div class="card h-100 mx-auto">
                            <asp:Image ID="Image1" CssClass="mx-auto" runat="server" Height="200px" ImageUrl='<%# "~/Images/BaiDang/"+Eval("HinhMinhHoa","{0}") %>' Width="250px" />
                            <div class="card-body">
                                <h4 class="card-title">
                                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("TieuDe") %>'></asp:HyperLink>
                                </h4>
                                <p class="card-text"><%# Eval("TomTat")%></p>
                                <p class="card-text">Đơn giá: <%# Eval("DonGia")%> VNĐ</p>
                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/Giohang.aspx?MaBai="+Eval("MaBai") %>'>Thêm vào giỏ hàng</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
