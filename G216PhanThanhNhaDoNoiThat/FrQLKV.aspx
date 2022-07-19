<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FrQLKV.aspx.cs" Inherits="G216PhanThanhNhaDoNoiThat.FrQLKV" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 102%;
        }
        .auto-style6 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style5">
        <tr>
            <td colspan="2">
                <asp:Label ID="lblTitle" runat="server" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN LÝ KHU VỰC" Font-Bold="True" Font-Size="Medium" ForeColor="#FF6600"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnThem" runat="server" OnClick="btnThem_Click" Text="Thêm Khu Vực hoạt động" Width="171px" />
                <asp:Label ID="lblmaKV" runat="server" Text="Mã Khu vực: " Visible="False"></asp:Label>
                <asp:TextBox ID="txtmaKV" runat="server" Visible="False" Width="68px"></asp:TextBox>
                <asp:Label ID="lbltenKV" runat="server" Text="Tên KV" Visible="False"></asp:Label>
                <asp:TextBox ID="txttenKV" runat="server" Visible="False" Width="88px"></asp:TextBox>
                <asp:Button ID="btnHuy" runat="server" Text="Hủy" Visible="False" Width="103px" OnClick="btnHuy_Click" />
                </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewKV" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="makv" DataSourceID="SqlDataSourceKV" ForeColor="Black">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="makv" HeaderText="Mã KV" ReadOnly="True" SortExpression="makv" />
                        <asp:BoundField DataField="tenkv" HeaderText="Tên KV" SortExpression="tenkv" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField DeleteText="Ngưng hoạt động" ShowDeleteButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSourceKV" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" DeleteCommand="DELETE FROM KhuVuc WHERE (makv = @makv)" SelectCommand="SELECT * FROM [KhuVuc]" InsertCommand="INSERT INTO KhuVuc(makv, tenkv) VALUES (@makv, @tenkv)" UpdateCommand="UPDATE KhuVuc SET tenkv = @tenkv WHERE (makv = @makv)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewKV" Name="makv" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtmaKV" Name="makv" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttenKV" Name="tenkv" PropertyName="Text" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewKV" Name="tenkv" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="GridViewKV" Name="makv" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewDH" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" Caption="ĐƠN ĐẶT HÀNG TẠI KHU VỰC ĐƯỢC CHỌN Ở TRÊN" CellPadding="3" DataKeyNames="madh" DataSourceID="SqlDataSourceDH" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="madh" HeaderText="Mã Đơn hàng" ReadOnly="True" SortExpression="madh" />
                        <asp:BoundField DataField="ngaylap" HeaderText="Ngày lập" SortExpression="ngaylap" />
                        <asp:BoundField DataField="makh" HeaderText="Mã KH" SortExpression="makh" />
                        <asp:BoundField DataField="diachigiao" HeaderText="Địa chỉ giao" SortExpression="diachigiao" />
                        <asp:BoundField DataField="nguoinhan" HeaderText="Người nhận" SortExpression="nguoinhan" />
                        <asp:BoundField DataField="sdtnhan" HeaderText="SĐT nhận" SortExpression="sdtnhan" />
                        <asp:BoundField DataField="ghichu" HeaderText="Ghi chú" SortExpression="ghichu" />
                        <asp:BoundField DataField="thoihan" HeaderText="Thời hạn" SortExpression="thoihan" />
                        <asp:BoundField DataField="tinhtrang" HeaderText="Tình trạng" SortExpression="tinhtrang" />
                        <asp:BoundField DataField="manv" HeaderText="Mã NV" SortExpression="manv" />
                        <asp:CommandField DeleteText="Chuyển đơn sang khu vực khác" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="Gray" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceDH" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" DeleteCommand="DELETE FROM DonHang WHERE (madh = @madh)" SelectCommand="SELECT * FROM [DonHang] WHERE ([makv] = @makv)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewDH" Name="madh" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewKV" Name="makv" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewKho" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" Caption="KHO TẠI KHU VỰC ĐƯỢC CHỌN TRÊN" CellPadding="3" DataKeyNames="makho" DataSourceID="SqlDataSourceKho" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="makho" HeaderText="Mã Kho" ReadOnly="True" SortExpression="makho" />
                        <asp:BoundField DataField="tenkho" HeaderText="Tên Kho" SortExpression="tenkho" />
                        <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" SortExpression="diachi" />
                        <asp:BoundField DataField="sdt" HeaderText="SĐT" SortExpression="sdt" />
                        <asp:BoundField DataField="succhua" HeaderText="Sức chứa" SortExpression="succhua" />
                        <asp:BoundField DataField="controng" HeaderText="Còn trống" SortExpression="controng" />
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
                <asp:SqlDataSource ID="SqlDataSourceKho" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [Kho] WHERE ([makv] = @makv)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewKV" Name="makv" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:GridView ID="GridViewNV" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="manv" DataSourceID="SqlDataSourceNV" ForeColor="Black" GridLines="Vertical" Caption="NHÂN VIÊN HIỆN LÀM TẠI KHU VỰC TRÊN">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="manv" HeaderText="Mã NV" ReadOnly="True" SortExpression="manv" />
                        <asp:BoundField DataField="tennv" HeaderText="Tên NV" SortExpression="tennv" />
                        <asp:BoundField DataField="ngaysinh" HeaderText="Ngày sinh" SortExpression="ngaysinh" />
                        <asp:BoundField DataField="gioitinh" HeaderText="Giới tính" SortExpression="gioitinh" />
                        <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" SortExpression="diachi" />
                        <asp:BoundField DataField="sdt" HeaderText="SĐT" SortExpression="sdt" />
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                        <asp:BoundField DataField="macm" HeaderText="Mã CM" SortExpression="macm" />
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
                <asp:Button ID="btnChuyenNV" runat="server" OnClick="btnChuyenNV_Click" Text="Chuyển công tác NV" />
                <asp:SqlDataSource ID="SqlDataSourceNV" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [NhanVien] WHERE ([makv] = @makv)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewKV" Name="makv" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style6">
                <asp:Button ID="btnQLC" runat="server" OnClick="btnQLC_Click" Text="Về trang quản lí chung" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
