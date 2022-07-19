<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FrCart.aspx.cs" Inherits="G216PhanThanhNhaDoNoiThat.FrCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="Medium" ForeColor="#FF9900"></asp:Label>
                <asp:Button ID="btnBuy" runat="server" OnClick="btnBuy_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewCart" runat="server" CellPadding="4" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" ForeColor="Black">
                    <Columns>
                        <asp:BoundField DataField="masp" HeaderText="Mã sản phẩm" />
                        <asp:BoundField DataField="tensp" HeaderText="Tên sản phẩm" ReadOnly="True" />
                        <asp:BoundField DataField="gia" HeaderText="Giá" ReadOnly="True" />
                        <asp:BoundField DataField="dvt" HeaderText="Đơn vị tính" ReadOnly="True" />
                        <asp:BoundField DataField="kichthuoc" HeaderText="Kích thước" ReadOnly="True" />
                        <asp:BoundField DataField="chatlieu" HeaderText="Chất liệu" ReadOnly="True" />
                        <asp:BoundField DataField="mausac" HeaderText="Màu sắc" ReadOnly="True" />
                        <asp:BoundField DataField="baohanh" HeaderText="Bảo hành" ReadOnly="True" />
                        <asp:BoundField DataField="tinhtrang" HeaderText="Tình trạng" ReadOnly="True" />
                        <asp:BoundField DataField="sl" HeaderText="Số lượng" />
                        <asp:BoundField DataField="thanhtien" HeaderText="Thành tiền" ReadOnly="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSum" runat="server" Font-Bold="True" ForeColor="#3333CC"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnOrder" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red" Text="Đặt hàng" OnClick="btnOrder_Click" />
&nbsp;
                <asp:Button ID="btnHome" runat="server" Font-Bold="True" Text="Về trang chủ" OnClick="btnBuy_Click" />
&nbsp;
                <asp:Button ID="btnCancel" runat="server" Font-Size="X-Small" ForeColor="#999966" OnClick="btnCancel_Click" Text="Hủy giỏ hàng" />
            </td>
        </tr>
    </table>
</asp:Content>
