<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FrQLLNT.aspx.cs" Inherits="G216PhanThanhNhaDoNoiThat.QLLNT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
        }
        .auto-style7 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style5">
        <tr>
            <td>
                <asp:Label ID="lblTittle" runat="server" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN LÍ LOẠI NỘI THẤT" Font-Bold="True" Font-Size="Medium" ForeColor="#FF6600"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnThem" runat="server" OnClick="btnThem_Click" Text="Thêm loại Nội Thất" Width="141px" />
                <asp:Label ID="lblmaL" runat="server" Text="Mã loại:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmaL" runat="server" Visible="False" Width="68px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbltenL" runat="server" Text="Tên loại: " Visible="False"></asp:Label>
                <asp:TextBox ID="txttenL" runat="server" Visible="False" Width="88px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lblmota" runat="server" Text="Mô tả:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmota" runat="server" Visible="False" Width="88px"></asp:TextBox>
&nbsp;
                <asp:Button ID="btnHuy" runat="server" Text="Hủy" Visible="False" Width="103px" OnClick="btnHuy_Click" />
                </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:GridView ID="GridViewLoaiNT" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="maloai" DataSourceID="SqlDataSourceLoaiNT" ForeColor="Black" GridLines="Horizontal">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="maloai" HeaderText="Mã loại" ReadOnly="True" SortExpression="maloai" />
                        <asp:BoundField DataField="tenloai" HeaderText="Tên loại" SortExpression="tenloai" />
                        <asp:BoundField DataField="mota" HeaderText="Mô tả" SortExpression="mota" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <asp:Button ID="btnChuyennhom" runat="server" OnClick="btnChuyennhom_Click" Text="Chuyển nhóm" />
                <asp:SqlDataSource ID="SqlDataSourceLoaiNT" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [LoaiSP]" DeleteCommand="DELETE FROM LoaiSP WHERE (maloai = @maloai)" InsertCommand="INSERT INTO LoaiSP(maloai, tenloai, mota) VALUES (@maloai, @tenloai, @mota)" UpdateCommand="UPDATE LoaiSP SET tenloai = @tenloai, mota = @mota WHERE (maloai = @maloai)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewLoaiNT" Name="maloai" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtmaL" Name="maloai" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttenL" Name="tenloai" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtmota" Name="mota" PropertyName="Text" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewLoaiNT" Name="tenloai" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewLoaiNT" Name="mota" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="GridViewLoaiNT" Name="maloai" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:GridView ID="GridViewSP" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" Caption="DANH SÁCH SẢN PHẨM THUỘC LOẠI NỘI THẤT ĐÃ CHỌN TRÊN" CellPadding="4" CellSpacing="2" DataKeyNames="masp" DataSourceID="SqlDataSourceSP" ForeColor="Black">
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
                                <asp:Image ID="Image1" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="math" HeaderText="Mã NSX" SortExpression="math" />
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
                <asp:SqlDataSource ID="SqlDataSourceSP" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [DMSPNoiThat] WHERE ([maloai] = @maloai)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewLoaiNT" Name="maloai" PropertyName="SelectedValue" Type="String" />
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
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
