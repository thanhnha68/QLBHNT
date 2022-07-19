<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FrOrder.aspx.cs" Inherits="G216PhanThanhNhaDoNoiThat.FrOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
        }
        .auto-style6 {
            height: 23px;
        }
        .auto-style7 {
            height: 243px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style5">
        <tr>
            <td>
                <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#FF6600" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG ĐẶT HÀNG CỦA NỘI THẤT NHÀ XINH G216 PTNHA UFM!"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTTKH" runat="server" Font-Bold="True" Font-Size="Medium" Text="[1] THÔNG TIN KHÁCH HÀNG"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="lbltimKH" runat="server" Text="Nhập mã/ họ tên/ địa chỉ/ SĐT của KH cần tìm: "></asp:Label>
                <asp:TextBox ID="txttimKH" runat="server"></asp:TextBox>
                <asp:Button ID="btntimKH" runat="server" OnClick="btntimKH_Click" Text="Tìm KH" />
                <asp:Button ID="btnHuyTimKH" runat="server" OnClick="btnHuyTimKH_Click" Text="Hủy" Visible="False" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewKH" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" Caption="CHỌN KHÁCH HÀNG" CellPadding="3" DataKeyNames="makh" DataSourceID="SqlDataSourceKH" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridViewKH_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="makh" HeaderText="Mã KH" ReadOnly="True" SortExpression="makh" />
                        <asp:BoundField DataField="tenkh" HeaderText="Tên KH" SortExpression="tenkh" />
                        <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" SortExpression="diachi" />
                        <asp:BoundField DataField="sdt" HeaderText="SĐT" SortExpression="sdt" />
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                        <asp:BoundField DataField="diem" HeaderText="Điểm tích lũy" SortExpression="diem" />
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
                <asp:SqlDataSource ID="SqlDataSourceKH" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" InsertCommand="INSERT INTO KhachHang(makh, tenkh, diachi, sdt, email, diem) VALUES (@makh, @tenkh, @diachi, @sdt, @email, @diem)" SelectCommand="SELECT makh, tenkh, diachi, sdt, email, diem FROM KhachHang WHERE (makh = @makh) OR (tenkh = @tenkh) OR (diachi = @diachi) OR (sdt = @sdt) OR (email = @email)">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtmakh" Name="makh" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttenkh" Name="tenkh" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtdiachi" Name="diachi" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtsdt" Name="sdt" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtemail" Name="email" PropertyName="Text" />
                        <asp:Parameter DefaultValue="0" Name="diem" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txttimKH" Name="makh" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txttimKH" Name="tenkh" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttimKH" Name="diachi" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttimKH" Name="sdt" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttimKH" Name="email" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTTKHM" runat="server" Font-Bold="True" Font-Size="Medium" Text="NHẬP THÔNG TIN KHÁCH HÀNG MỚI" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="lblmakh" runat="server" Text=" Mã KH: " Visible="False"></asp:Label>
                <asp:TextBox ID="txtmakh" runat="server" Visible="False" Width="65px"></asp:TextBox>
                <asp:Label ID="lbltenkh" runat="server" Text="Tên KH: " Visible="False"></asp:Label>
                <asp:TextBox ID="txttenkh" runat="server" Visible="False" Width="65px"></asp:TextBox>
                <asp:Label ID="lbldiachi" runat="server" Text="Địa chỉ:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtdiachi" runat="server" Visible="False" Width="65px"></asp:TextBox>
                <asp:Label ID="lblsdt" runat="server" Text="SĐT: " Visible="False"></asp:Label>
                <asp:TextBox ID="txtsdt" runat="server" Visible="False" Width="65px"></asp:TextBox>
                <asp:Label ID="lblemail" runat="server" Text="Email:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtemail" runat="server" Visible="False" Width="65px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTTDDH" runat="server" Font-Bold="True" Font-Size="Medium" Text="[2] THÔNG TIN ĐƠN ĐẶT HÀNG" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTBmadh" runat="server" Text="Mã đơn: " Visible="False"></asp:Label>
                <asp:Label ID="lblmadh" runat="server" Font-Bold="True" ForeColor="#CC3300" Visible="False"></asp:Label>
&nbsp;
                <asp:Label ID="lblTBngaylap" runat="server" Text="Ngày lập: " Visible="False"></asp:Label>
                <asp:Label ID="lblngaylap" runat="server" Font-Bold="True" ForeColor="#CC3300" Visible="False"></asp:Label>
&nbsp;
                <asp:Label ID="lblTBdiachigiao" runat="server" Text="Địa chỉ giao: " Visible="False"></asp:Label>
                <asp:TextBox ID="txtdiachigiao" runat="server" Visible="False"></asp:TextBox>
&nbsp;
                <asp:Label ID="lblTBnguoinhan" runat="server" Text="Người nhận: " Visible="False"></asp:Label>
                <asp:TextBox ID="txtnguoinhan" runat="server" Visible="False"></asp:TextBox>
&nbsp;
                <asp:Label ID="lblTBsdtnhanhang" runat="server" Text="SĐT nhận: " Visible="False"></asp:Label>
                <asp:TextBox ID="txtsdtnhanhang" runat="server" Visible="False"></asp:TextBox>
&nbsp;
                <asp:Label ID="lblTBghichu" runat="server" Text="Ghi chú: " Visible="False"></asp:Label>
                <asp:TextBox ID="txtghichu" runat="server" Visible="False"></asp:TextBox>
&nbsp;
                <asp:Label ID="lblTBhangiaohang" runat="server" Text="Hạn giao hàng: " Visible="False"></asp:Label>
                <asp:Calendar ID="CalendarHangiao" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Visible="False" Width="350px">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnAccept" runat="server" Text="CHẤP NHẬN ĐƠN HÀNG" OnClick="btnAccept_Click" Visible="False" />
&nbsp;<asp:Button ID="btnhuyAccept" runat="server" Text="HỦY ĐƠN HÀNG" Visible="False" OnClick="btnhuyAccept_Click" />
                <asp:SqlDataSource ID="SqlDataSourceDH" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" InsertCommand="INSERT INTO DonHang(madh, ngaylap, makh, diachigiao, nguoinhan, sdtnhan, ghichu, thoihan, tinhtrang) VALUES (@madh, @ngaylap, @makh, @diachigiao, @nguoinhan, @sdtnhan, @ghichu, @thoihan, @tinhtrang)" ProviderName="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString.ProviderName %>" DeleteCommand="DELETE FROM DonHang WHERE (madh = @madh)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="lblmadh" Name="madh" PropertyName="Text" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="lblmadh" Name="madh" PropertyName="Text" />
                        <asp:ControlParameter ControlID="lblngaylap" Name="ngaylap" PropertyName="Text" DbType="Date" />
                        <asp:ControlParameter ControlID="txttimKH" Name="makh" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtdiachigiao" Name="diachigiao" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtnguoinhan" Name="nguoinhan" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtsdtnhanhang" Name="sdtnhan" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtghichu" Name="ghichu" PropertyName="Text" />
                        <asp:ControlParameter ControlID="CalendarHangiao" DbType="Date" Name="thoihan" PropertyName="SelectedDate" />
                        <asp:Parameter DefaultValue="0" Name="tinhtrang" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTTCTDH" runat="server" Font-Bold="True" Font-Size="Medium" Text="[3] THÔNG TIN CHI TIẾT ĐƠN HÀNG (CART)" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:GridView ID="GridViewCart" runat="server" CellPadding="4" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" Visible="False" CellSpacing="2" ForeColor="Black">
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
                <asp:SqlDataSource ID="SqlDataSourceCTDH" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" InsertCommand="INSERT INTO CTDH(madh, masp, sl) VALUES (@madh, @masp, @sl)" ProviderName="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString.ProviderName %>" DeleteCommand="DELETE FROM CTDH WHERE (madh = @madh)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="lblmadh" Name="madh" PropertyName="Text" />
                    </DeleteParameters>
                </asp:SqlDataSource>
                <asp:Label ID="lblSum" runat="server" Font-Bold="True" ForeColor="#3333CC" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
