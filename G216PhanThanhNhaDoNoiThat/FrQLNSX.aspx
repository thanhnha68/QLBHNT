<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FrQLNSX.aspx.cs" Inherits="G216PhanThanhNhaDoNoiThat.FrQLTH" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
        }
        .auto-style6 {
            width: 480px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style5">
        <tr>
            <td colspan="2">
                <asp:Label ID="lblTitle" runat="server" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN LÝ NHÀ SẢN XUẤT" Font-Bold="True" ForeColor="#FF6600"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnThem" runat="server" OnClick="btnThem_Click" Text="Thêm Nhà Sản Xuất" Width="182px" />
                <asp:Label ID="lblmaNSX" runat="server" Text="Mã NSX: " Visible="False"></asp:Label>
                <asp:TextBox ID="txtmaNSX" runat="server" Visible="False" Width="68px"></asp:TextBox>
                <asp:Label ID="lbltenNSX" runat="server" Text="Tên NSX:" Visible="False"></asp:Label>
                <asp:TextBox ID="txttenNSX" runat="server" Visible="False" Width="88px"></asp:TextBox>
                <asp:Button ID="btnHuy" runat="server" Text="Hủy" Visible="False" Width="103px" OnClick="btnHuy_Click" />
                </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewNSX" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="math" DataSourceID="SqlDataSourceTH" ForeColor="Black" GridLines="Vertical" Width="281px">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="math" HeaderText="Mã NSX" ReadOnly="True" SortExpression="math" />
                        <asp:BoundField DataField="tenth" HeaderText="Tên NSX" SortExpression="tenth" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
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
                <asp:SqlDataSource ID="SqlDataSourceTH" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" DeleteCommand="DELETE FROM ThuongHieu WHERE (math = @math)" InsertCommand="INSERT INTO ThuongHieu(math, tenth) VALUES (@math, @tenth)" SelectCommand="SELECT * FROM [ThuongHieu]" UpdateCommand="UPDATE ThuongHieu SET tenth = @tenth WHERE (math = @math)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewNSX" Name="math" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtmaNSX" Name="math" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttenNSX" Name="tenth" PropertyName="Text" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewNSX" Name="tencm" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewNSX" Name="macm" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewSP" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" Caption="DANH SÁCH CÁC SẢN PHẨM ĐƯỢC SẢN XUẤT BỞI NHÀ SẢN XUẤT TRÊN" CellPadding="4" CellSpacing="2" DataKeyNames="masp" DataSourceID="SqlDataSourceSP" ForeColor="Black" PageSize="7">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masp" HeaderText="Mã SP" ReadOnly="True" SortExpression="masp" />
                        <asp:BoundField DataField="tensp" HeaderText="Tên SP" SortExpression="tensp" />
                        <asp:BoundField DataField="gia" HeaderText="Giá" SortExpression="gia" />
                        <asp:BoundField DataField="dvt" HeaderText="ĐVT" SortExpression="dvt" />
                        <asp:BoundField DataField="kichthuoc" HeaderText="Kích thước" SortExpression="kichthuoc" />
                        <asp:BoundField DataField="chatlieu" HeaderText="Chất liệu" SortExpression="chatlieu" />
                        <asp:BoundField DataField="mausac" HeaderText="Màu sắc" SortExpression="mausac" />
                        <asp:BoundField DataField="ngaysx" HeaderText="Ngày SX" SortExpression="ngaysx" />
                        <asp:BoundField DataField="tuoithotb" HeaderText="Tuổi thọ TB" SortExpression="tuoithotb" />
                        <asp:BoundField DataField="baohanh" HeaderText="Bảo hành" SortExpression="baohanh" />
                        <asp:BoundField DataField="tinhtrang" HeaderText="Tình trạng" SortExpression="tinhtrang" />
                        <asp:BoundField DataField="mota" HeaderText="Mô tả" SortExpression="mota" />
                        <asp:TemplateField HeaderText="Hình" SortExpression="hinh">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("hinh") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("hinh") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="maloai" HeaderText="Mã loại" SortExpression="maloai" />
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
                <asp:SqlDataSource ID="SqlDataSourceSP" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [DMSPNoiThat] WHERE ([math] = @math)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewNSX" Name="math" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:GridView ID="GridViewHT" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" Caption="SẢN PHẨM ĐANG CHỌN CÒN TỒN VỚI SỐ LƯỢNG NHƯ SAU" CellPadding="3" DataKeyNames="masp,makho" DataSourceID="SqlDataSourceSLT" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masp" HeaderText="Mã SP" ReadOnly="True" SortExpression="masp" />
                        <asp:BoundField DataField="makho" HeaderText="Mã kho" ReadOnly="True" SortExpression="makho" />
                        <asp:BoundField DataField="slton" HeaderText="Số lượng tồn" SortExpression="slton" />
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
                <asp:SqlDataSource ID="SqlDataSourceSLT" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [HangTon] WHERE ([masp] = @masp)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewSP" Name="masp" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:GridView ID="GridViewCTDH" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" Caption="SẢN PHẨM ĐANG CHỌN HIỆN ĐANG ĐƯỢC KHÁCH ĐẶT MUA VỚI THÔNG TIN NHƯ SAU" CellPadding="3" DataKeyNames="madh,masp" DataSourceID="SqlDataSourceCTDH" ForeColor="Black" GridLines="Vertical" Width="386px">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="madh" HeaderText="Mã đơn hàng" ReadOnly="True" SortExpression="madh" />
                        <asp:BoundField DataField="masp" HeaderText="Mã SP" ReadOnly="True" SortExpression="masp" />
                        <asp:BoundField DataField="sl" HeaderText="Số lượng" SortExpression="sl" />
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
                <asp:SqlDataSource ID="SqlDataSourceCTDH" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" DeleteCommand="DELETE FROM CTDH WHERE (masp = @masp) AND (madh = @madh)" SelectCommand="SELECT * FROM [CTDH] WHERE ([masp] = @masp)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewCTDH" Name="madh" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewSP" Name="masp" PropertyName="SelectedValue[2]" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewSP" Name="masp" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnQLC" runat="server" OnClick="btnQLC_Click" Text="Về trang quản lí chung" />
            </td>
        </tr>
    </table>
</asp:Content>
