<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FrQLDDH.aspx.cs" Inherits="G216PhanThanhNhaDoNoiThat.FrQLDDH" %>
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
            <td colspan="2">
                <asp:Label ID="lblTitle" runat="server" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN LÝ ĐƠN ĐẶT HÀNG" Font-Bold="True" Font-Italic="False" Font-Size="Medium" ForeColor="#FF6600"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Chọn KH của đơn hàng: "></asp:Label>
                <asp:DropDownList ID="DropDownListKH" runat="server" DataSourceID="SqlDataSourceKH" DataTextField="tenkh" DataValueField="makh" OnSelectedIndexChanged="DropDownListKH_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceKH" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [KhachHang]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Mã KH: "></asp:Label>
                <asp:Label ID="lblmaKH" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Chọn NV phụ trách đơn hàng: "></asp:Label>
                <asp:DropDownList ID="DropDownListNV" runat="server" DataSourceID="SqlDataSourceNV" DataTextField="tennv" DataValueField="manv" OnSelectedIndexChanged="DropDownListKH_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceNV" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [NhanVien]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Mã NV: "></asp:Label>
                <asp:Label ID="lblmaNV" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Chọn KV của đơn hàng: "></asp:Label>
                <asp:DropDownList ID="DropDownListKV" runat="server" DataSourceID="SqlDataSourceKV" DataTextField="tenkv" DataValueField="makv" OnSelectedIndexChanged="DropDownListKH_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceKV" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [KhuVuc]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Mã KV: "></asp:Label>
                <asp:Label ID="lblmaKV" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewDDH" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="madh" DataSourceID="SqlDataSourceDDH" ForeColor="Black">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="madh" HeaderText="Mã đơn hàng" ReadOnly="True" SortExpression="madh" />
                        <asp:BoundField DataField="ngaylap" HeaderText="Ngày lập" SortExpression="ngaylap" />
                        <asp:BoundField DataField="makh" HeaderText="Mã KH" SortExpression="makh" />
                        <asp:BoundField DataField="diachigiao" HeaderText="Địa chỉ giao" SortExpression="diachigiao" />
                        <asp:BoundField DataField="nguoinhan" HeaderText="Người nhận" SortExpression="nguoinhan" />
                        <asp:BoundField DataField="sdtnhan" HeaderText="SĐT nhận" SortExpression="sdtnhan" />
                        <asp:BoundField DataField="ghichu" HeaderText="Ghi chú" SortExpression="ghichu" />
                        <asp:BoundField DataField="thoihan" HeaderText="Thời hạn" SortExpression="thoihan" />
                        <asp:BoundField DataField="tinhtrang" HeaderText="Tình trạng" SortExpression="tinhtrang" />
                        <asp:BoundField DataField="manv" HeaderText="Mã NV" SortExpression="manv" />
                        <asp:BoundField DataField="makv" HeaderText="Mã KV" SortExpression="makv" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField DeleteText="Hủy đơn" ShowDeleteButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSourceDDH" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" DeleteCommand="DELETE FROM DonHang WHERE (madh = @madh)" SelectCommand="SELECT * FROM [DonHang]" UpdateCommand="UPDATE DonHang SET diachigiao = @diachigiao, nguoinhan = @nguoinhan, sdtnhan = @sdtnhan, ghichu = @ghichu, thoihan = @thoihan WHERE (madh = @madh)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewDDH" Name="madh" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewDDH" Name="diachigiao" PropertyName="SelectedValue[4]" />
                        <asp:ControlParameter ControlID="GridViewDDH" Name="nguoinhan" PropertyName="SelectedValue[5]" />
                        <asp:ControlParameter ControlID="GridViewDDH" Name="sdtnhan" PropertyName="SelectedValue[6]" />
                        <asp:ControlParameter ControlID="GridViewDDH" Name="ghichu" PropertyName="SelectedValue[7]" />
                        <asp:ControlParameter ControlID="GridViewDDH" Name="thoihan" PropertyName="SelectedValue[8]" />
                        <asp:Parameter Name="madh" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewCTDH" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" Caption="DANH SÁCH CHI TIẾT CÁC MẶT HÀNG CỦA ĐƠN HÀNG ĐƯỢC CHỌN Ở TRÊN" CellPadding="3" DataKeyNames="madh,masp" DataSourceID="SqlDataSourceCTDH" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="madh" HeaderText="Mã đơn hàng" ReadOnly="True" SortExpression="madh" />
                        <asp:BoundField DataField="masp" HeaderText="Mã sản phẩm" SortExpression="masp" />
                        <asp:BoundField DataField="sl" HeaderText="Số lượng" SortExpression="sl" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
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
                <asp:SqlDataSource ID="SqlDataSourceCTDH" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" DeleteCommand="DELETE FROM CTDH WHERE (madh = @madh) AND (masp = @masp)" SelectCommand="SELECT * FROM [CTDH] WHERE ([madh] = @madh)" UpdateCommand="UPDATE CTDH SET masp = @masp, sl = @sl WHERE (madh = @madh)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewCTDH" Name="madh" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewCTDH" Name="masp" PropertyName="SelectedValue[2]" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewDDH" Name="madh" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewCTDH" Name="masp" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="GridViewCTDH" DbType="Int32" Name="sl" PropertyName="SelectedValue[3]" />
                        <asp:ControlParameter ControlID="GridViewCTDH" Name="madh" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnQLC" runat="server" OnClick="btnQLC_Click" Text="Về trang quản lí chung" />
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
