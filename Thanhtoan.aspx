<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Thanhtoan.aspx.cs" Inherits="HaNhutNam_LTWeb.Thanhtoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mt-3 boder-style bg-light">
    <p class="text-center font-weight-bold">Thông tin thanh toán</p>
        <table style="width:80%;" class="mx-auto mb-4">
        <tr>
            <td >Họ tên: <asp:Label ID="lbHoTen" runat="server"></asp:Label></td>           
        </tr>
         <tr>
            <td >Địa chỉ: <asp:Label ID="lbDiaChi" runat="server"></asp:Label></td>           
        </tr>
         <tr>
            <td >Điện thoại: <asp:Label ID="lbDienThoai" runat="server"></asp:Label></td>           
        </tr>
         <tr>
            <td >Email: <asp:Label ID="lbEmail" runat="server"></asp:Label></td>          
        </tr>        
        </table>
    </div>
    <div class="mt-3 boder-style bg-light">
        <p class="text-center font-weight-bold">Thông tin giỏ hàng</p>
        <asp:GridView ID="gvGioHang" runat="server" AutoGenerateColumns="False" CssClass="mx-auto">
            <Columns>
                <asp:BoundField DataField="MaBai" HeaderText="Mã sản phẩm" />
                <asp:BoundField DataField="TieuDe" HeaderText="Tiêu đề" />
                <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" DataFormatString="{0:0,0 } vnđ" />
                <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
                <asp:BoundField DataField="ThanhTien" HeaderText="Thành tiền" DataFormatString="{0:0,0 } vnđ" />
            </Columns>
        </asp:GridView>
        <p class="text-center">Tổng tiền: <asp:Label ID="lbTongTien" runat="server"></asp:Label> vnđ</p>
    </div>
    <div class="text-center mt-3 boder-style bg-light">
        <p class="text-center font-weight-bold">Thông tin giao hàng</p>
        <table style="width:80%;" class="mx-auto mb-4 text-left">
            <tr class="mb-3">
                <td>Ngày giao:</td>
                <td>
                    <asp:Calendar ID="calNgayGiao" runat="server" Height="16px" Width="318px"></asp:Calendar>
                </td>         
            </tr>
            <tr class="mb-2">
                <td>Người nhận:</td>
                <td>
                    <asp:TextBox ID="txtNguoiNhan" runat="server"></asp:TextBox>
                </td>               
            </tr>
            <tr class="mb-2">
                <td>Địa chỉ:</td>
                <td>
                    <asp:TextBox ID="txtDiaChi" runat="server"></asp:TextBox>
                </td>               
            </tr>
            <tr class="mb-2">
                <td>Điện thoại:</td>
                <td>
                    <asp:TextBox ID="txtDienThoai" runat="server"></asp:TextBox>
                </td>               
            </tr>
            <tr class="mb-2">
                <td>Hình thức thanh toán:</td>
                <td>
                    <div id="paypal-button-container"></div>       
           
                </td>
                <td>
                    <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                        <asp:ListItem Value="0">Thanh toán sau khi nhận hàng</asp:ListItem>                        
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr class="mb-2">
                <td>Hình thức giao hàng:</td>
                <td>
                    <asp:RadioButtonList ID="rblhinhThucGiaoHang" runat="server">
                        <asp:ListItem Value="0">Giao trực tiếp</asp:ListItem>
                        <asp:ListItem Value="1">Chuyển giao</asp:ListItem>
                    </asp:RadioButtonList>
                </td>                
            </tr>
        </table>
        <asp:Button ID="btDongY" BackColor="#669900" runat="server" Text="Đồng ý" OnClick="btDongY_Click" CssClass="btn button-style text-light mx-2"/><br />
        <asp:Label ID="lbThongBaoLoi" runat="server" CssClass="text-center" Text=""></asp:Label> 
        

    </div>
        <script src="https://www.paypalobjects.com/api/checkout.js"> </script>
            <script type="text/javascript">
            
        // Render the PayPal button
                paypal.Button.render({
        // Set your environment
                env: 'sandbox', // sandbox | production

        // Specify the style of the button
            style: {
                      layout: 'vertical',  // horizontal | vertical
                      size:   'medium',    // medium | large | responsive
                      shape:  'rect',      // pill | rect
                      color:  'gold'       // gold | blue | silver | white | black
                    },

            // Specify allowed and disallowed funding sources
            //
            // Options:
            // - paypal.FUNDING.CARD
            // - paypal.FUNDING.CREDIT
            // - paypal.FUNDING.ELV
            funding: {
              allowed: [
                paypal.FUNDING.CARD,
                paypal.FUNDING.CREDIT
              ],
              disallowed: []
            },

            // Enable Pay Now checkout flow (optional)
            commit: true,

            // PayPal Client IDs - replace with your own
            // Create a PayPal app: https://developer.paypal.com/developer/applications/create
            client: {
              sandbox: 'AbvVSHgQfzkbEoU68zwUEMgtI8jc-6gmykzjOFn1cjxQYylFs7VX-A25dNuTSum24y0nJHN9_9KkU4sf',
              production: '<insert production client id>'
            },

            payment: function (data, actions) {
              return actions.payment.create({
                payment: {
                  transactions: [
                    {
                          amount: {
                              total: 1000000,
                            currency: 'USD'
                      }
                    }
                  ]
                }
              });
            },

            onAuthorize: function (data, actions) {
              return actions.payment.execute()
                .then(function () {
                  window.alert('Thanh toán thành công!!!');
                });
            }
            }, '#paypal-button-container');
            </script>
</asp:Content>
