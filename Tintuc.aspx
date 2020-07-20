<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Tintuc.aspx.cs" Inherits="HaNhutNam_LTWeb.Tintuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="text-secondary font-weight-bold">Tin Tức</h3>
    <div class="dropdown-divider"></div>
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"  Width="100%" RepeatLayout="Flow">
        <ItemTemplate>
            <div class=" mb-4">
                <div class="card  h-100">
                    <h4 class="card-header">
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# "~/Chitiettintuc.aspx?MaTin="+Eval("MaTin") %>' Text='<%# Eval("TieuDe") %>'></asp:HyperLink>
                    </h4>
                    <div class="card-body">
                        <p class="card-text"><%# Eval("TomTat")%></p>
                        <p>Người đăng: <%# Eval("TenTV")%></p>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
