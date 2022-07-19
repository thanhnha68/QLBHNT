<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FrQLKH.aspx.cs" Inherits="G216PhanThanhNhaDoNoiThat.FrQLKH" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style5">
        <tr>
            <td>
                <asp:Label ID="lblTitle" runat="server" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN LÝ KHÁCH HÀNG" Font-Bold="True" ForeColor="#FF6600"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewKH" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="makh" DataSourceID="SqlDataSourceKH" ForeColor="Black">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="makh" HeaderText="Mã KH" ReadOnly="True" SortExpression="makh" />
                        <asp:BoundField DataField="tenkh" HeaderText="Tên KH" SortExpression="tenkh" />
                        <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" SortExpression="diachi" />
                        <asp:BoundField DataField="sdt" HeaderText="SĐT" SortExpression="sdt" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa thông tin KH" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField DeleteText="Hủy KH" ShowDeleteButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSourceKH" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" DeleteCommand="DELETE FROM KhachHang WHERE (makh = @makh)" SelectCommand="SELECT * FROM [KhachHang]" UpdateCommand="UPDATE KhachHang SET tenkh = @tenkh, diachi = @diachi, sdt = @sdt, email = @email, diem = @diem WHERE (makh = @makh)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewKH" Name="makh" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewKH" Name="tenkh" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="GridViewKH" Name="diachi" PropertyName="SelectedValue[3]" />
                        <asp:ControlParameter ControlID="GridViewKH" Name="sdt" PropertyName="SelectedValue[4]" />
                        <asp:ControlParameter ControlID="GridViewKH" Name="email" PropertyName="SelectedValue[5]" />
                        <asp:ControlParameter ControlID="GridViewKH" Name="diem" PropertyName="SelectedValue[6]" />
                        <asp:ControlParameter ControlID="GridViewKH" Name="makh" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewDH" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" Caption="HIỆN TẠI KHÁCH HÀNG TRÊN CÓ ĐƠN ĐẶT HÀNG NHƯ SAU" CellPadding="3" DataKeyNames="madh" DataSourceID="SqlDataSourceDH" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="madh" HeaderText="Mã đơn hàng" ReadOnly="True" SortExpression="madh" />
                        <asp:BoundField DataField="ngaylap" HeaderText="Ngày lập" SortExpression="ngaylap" />
                        <asp:BoundField DataField="diachigiao" HeaderText="Địa chỉ giao" SortExpression="diachigiao" />
                        <asp:BoundField DataField="nguoinhan" HeaderText="Người nhận" SortExpression="nguoinhan" />
                        <asp:BoundField DataField="sdtnhan" HeaderText="SĐT nhận" SortExpression="sdtnhan" />
                        <asp:BoundField DataField="ghichu" HeaderText="Ghi chú" SortExpression="ghichu" />
                        <asp:BoundField DataField="thoihan" HeaderText="Thời hạn" SortExpression="thoihan" />
                        <asp:BoundField DataField="tinhtrang" HeaderText="Tình trạng" SortExpression="tinhtrang" />
                        <asp:BoundField DataField="manv" HeaderText="Mã NV" SortExpression="manv" />
                        <asp:BoundField DataField="makv" HeaderText="Mã KV" SortExpression="makv" />
                        <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceDH" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" DeleteCommand="DELETE FROM DonHang WHERE (madh = @madh)" SelectCommand="SELECT * FROM [DonHang] WHERE ([makh] = @makh)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewDH" Name="madh" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewKH" Name="makh" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewCTDH" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" Caption="DANH SÁCH CHI TIẾT CÁC MẶT HÀNG CỦA ĐƠN HÀNG ĐƯỢC CHỌN Ở TRÊN" CellPadding="3" DataKeyNames="madh,masp" DataSourceID="SqlDataSourceCTDH" ForeColor="Black" GridLines="Vertical" Width="380px">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="madh" HeaderText="Mã đơn hàng" ReadOnly="True" SortExpression="madh" />
                        <asp:BoundField DataField="masp" HeaderText="Mã SP" ReadOnly="True" SortExpression="masp" />
                        <asp:BoundField DataField="sl" HeaderText="Số lượng tồn" SortExpression="sl" />
                        <asp:CommandField DeleteText="Hủy CTDH" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceCTDH" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" DeleteCommand="DELETE FROM CTDH WHERE (madh = @madh) AND (masp = @masp)" SelectCommand="SELECT * FROM [CTDH] WHERE ([madh] = @madh)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewCTDH" Name="madh" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewCTDH" Name="masp" PropertyName="SelectedValue[2]" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewDH" Name="madh" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnQLC" runat="server" OnClick="btnQLC_Click" Text="Về trang quản lí chung" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
