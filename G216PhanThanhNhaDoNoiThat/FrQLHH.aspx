<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FrQLHH.aspx.cs" Inherits="G216PhanThanhNhaDoNoiThat.FrQLHH" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style7 {
            width: 73px;
        }
        .auto-style8 {
        text-align: center;
    }
    .auto-style10 {
        margin-top: 15px;
    }
    .auto-style11 {
        margin-top: 0px;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td colspan="2" class="auto-style8">
                <asp:Label ID="lblTittle" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#FF6600" Text="CHÀO ĐÓN ... ĐẾN VỚI TRANG QUẢN LÝ DANH MỤC SẢN PHẨM NỘI THẤT NHÀ XINH"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="lblChonNhom" runat="server" Text="Chọn nhóm SP:"></asp:Label>
                <asp:DropDownList ID="DropDownListNhom" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceNhomMH" DataTextField="tenloai" DataValueField="maloai" AppendDataBoundItems="True" OnSelectedIndexChanged="DropDownListNhom_SelectedIndexChanged" Height="16px" Width="134px">
                    <asp:ListItem Value="*">Tất cả</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceNhomMH" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT [tenloai], [maloai] FROM [LoaiSP]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Mã nhóm:"></asp:Label>
                <asp:Label ID="lblMsNhom" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblDMSP" runat="server" Text="Danh mục các sản phẩm nội thất thuộc Nhóm: "></asp:Label>
&nbsp;
                <asp:CheckBox ID="ckbHinh" runat="server" AutoPostBack="True" OnCheckedChanged="ckbHinh_CheckedChanged" Text="Hiển hoặc ẩn hình mẫu" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnThem" runat="server" OnClick="btnThem_Click" Text="Thêm sản phẩm mới" Width="141px" />
&nbsp;
                <asp:Label ID="lblmasp" runat="server" Text="Mã sp:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmasp" runat="server" Visible="False" Width="68px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbltensp" runat="server" Text="Tên sp:" Visible="False"></asp:Label>
                <asp:TextBox ID="txttensp" runat="server" Visible="False" Width="88px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lblgia" runat="server" Text="Giá:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtgia" runat="server" Visible="False" Width="51px"></asp:TextBox>
                <asp:Label ID="lbldvt" runat="server" Text="/" Visible="False"></asp:Label>
                <asp:TextBox ID="txtdvt" runat="server" Visible="False" Width="36px"></asp:TextBox>
&nbsp;&nbsp;
                <asp:Label ID="lblkichthuoc" runat="server" Text="Kích thước:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtkichthuoc" runat="server" Visible="False" Width="90px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblchatlieu" runat="server" Text="Chất liệu:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtchatlieu" runat="server" Visible="False" Width="94px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lblmausac" runat="server" Text="Màu sắc:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmausac" runat="server" Visible="False" Width="46px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbltuoitho" runat="server" Text="Tuổi thọ tb:" Visible="False"></asp:Label>
                <asp:TextBox ID="txttuoitho" runat="server" Visible="False" Width="56px"></asp:TextBox>
&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblbaohanh" runat="server" Text="Bảo hành:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtbaohanh" runat="server" Visible="False" Width="49px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbltinhtrang" runat="server" Text="Tình trạng:" Visible="False"></asp:Label>
                <asp:TextBox ID="txttinhtrang" runat="server" Visible="False" Width="70px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lblmota" runat="server" Text="Mô tả:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmota" runat="server" Visible="False" Width="88px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lblnsx" runat="server" Text="Nhà SX:" Visible="False"></asp:Label>
                &nbsp;<asp:DropDownList ID="DropDownListNSX" runat="server" DataSourceID="SqlDataSourceNSX" DataTextField="tenth" DataValueField="math" Visible="False" Height="16px" Width="113px">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblhinh" runat="server" Text="Hình:" Visible="False"></asp:Label>
                <asp:FileUpload ID="FileUploadHinh" runat="server" Visible="False" />
                &nbsp;
                <asp:SqlDataSource ID="SqlDataSourceNSX" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [ThuongHieu]"></asp:SqlDataSource>
&nbsp;<br />
                <asp:Label ID="lblngaysx" runat="server" Text="Ngày SX:" Visible="False"></asp:Label>
&nbsp;<asp:Calendar ID="CalendarNgaySX" runat="server" BackColor="White" BorderColor="White" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" Visible="False" Width="350px" BorderWidth="1px" NextPrevFormat="FullMonth">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <NextPrevStyle VerticalAlign="Bottom" Font-Bold="True" Font-Size="8pt" ForeColor="#333333" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="White" BorderColor="Black" Font-Bold="True" BorderWidth="4px" Font-Size="12pt" ForeColor="#333399" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar>
                <asp:Button ID="btnHuy" runat="server" OnClick="btnHuy_Click" Text="Hủy" Visible="False" Width="103px" />
                <div class="auto-style8">
                <asp:GridView ID="GridViewMH1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="masp" DataSourceID="SqlDataSourceNT" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" ForeColor="Black" PageSize="7" Width="1190px" CellSpacing="2" OnRowCommand="GridViewMH1_RowCommand" OnRowEditing="GridViewMH1_RowEditing">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masp" HeaderText="Mã SP" ReadOnly="True" SortExpression="masp" />
                        <asp:BoundField DataField="tensp" HeaderText="Tên SP" SortExpression="tensp" />
                        <asp:BoundField DataField="gia" HeaderText="Giá" SortExpression="gia" />
                        <asp:BoundField DataField="dvt" HeaderText="ĐVT" SortExpression="dvt" />
                        <asp:BoundField DataField="kichthuoc" HeaderText="Kích thước" SortExpression="kichthuoc" />
                        <asp:BoundField DataField="chatlieu" HeaderText="Chất liệu" SortExpression="chatlieu" />
                        <asp:BoundField DataField="mausac" HeaderText="Màu sắc" SortExpression="mausac" />
                        <asp:TemplateField HeaderText="Ngày SX" SortExpression="ngaysx">
                            <EditItemTemplate>
                                <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="White" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" SelectedDate='<%# Bind("ngaysx") %>' Width="350px" BorderWidth="1px" NextPrevFormat="FullMonth">
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                    <NextPrevStyle VerticalAlign="Bottom" Font-Bold="True" Font-Size="8pt" ForeColor="#333333" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                    <TitleStyle BackColor="White" BorderColor="Black" Font-Bold="True" BorderWidth="4px" Font-Size="12pt" ForeColor="#333399" />
                                    <TodayDayStyle BackColor="#CCCCCC" />
                                </asp:Calendar>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ngaysx") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="tuoithotb" HeaderText="Tuổi thọ tb" SortExpression="tuoithotb" />
                        <asp:BoundField DataField="baohanh" HeaderText="Bảo hành" SortExpression="baohanh" />
                        <asp:BoundField DataField="tinhtrang" HeaderText="Tình trạng" SortExpression="tinhtrang" />
                        <asp:TemplateField HeaderText="Mã NSX" SortExpression="math">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSourceSuaNSX" DataTextField="tenth" DataValueField="math" SelectedValue='<%# Bind("math") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceSuaNSX" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [ThuongHieu]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("math") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="mota" HeaderText="Mô tả" SortExpression="mota" />
                        <asp:TemplateField HeaderText="Hình" SortExpression="hinh" Visible="False">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("hinh") %>'></asp:TextBox>
                                <asp:Button ID="Button1" runat="server" CommandName="chon" Text="Chọn" />
                                <br />
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("hinh") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerSettings Mode="NumericFirstLast" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                </div>
&nbsp;
                &nbsp;<asp:SqlDataSource ID="SqlDataSourceNT" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" DeleteCommand="DELETE FROM DMSPNoiThat WHERE (masp = @masp)" InsertCommand="INSERT INTO DMSPNoiThat(masp, tensp, gia, dvt, kichthuoc, chatlieu, mausac, ngaysx, tuoithotb, baohanh, tinhtrang, math, mota, hinh, maloai) VALUES (@masp, @tensp, @gia, @dvt, @kichthuoc, @chatlieu, @mausac, @ngaysx, @tuoithotb, @baohanh, @tinhtrang, @math, @mota, @hinh, @maloai)" SelectCommand="SELECT * FROM [DMSPNoiThat] WHERE ([maloai] = @maloai)" UpdateCommand="UPDATE DMSPNoiThat SET tensp = @tensp, gia = @gia, dvt = @dvt, kichthuoc = @kichthuoc, chatlieu = @chatlieu, mausac = @mausac, ngaysx = @ngaysx, tuoithotb = @tuoithotb, baohanh = @baohanh, tinhtrang = @tinhtrang, math = @math, mota = @mota, hinh = @hinh WHERE (masp = @masp)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewMH1" Name="masp" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListNhom" Name="maloai" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewMH1" Name="tensp" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="GridViewMH1" DbType="Int32" Name="gia" PropertyName="SelectedValue[3]" />
                        <asp:ControlParameter ControlID="GridViewMH1" Name="dvt" PropertyName="SelectedValue[4]" />
                        <asp:ControlParameter ControlID="GridViewMH1" Name="kichthuoc" PropertyName="SelectedValue[5]" />
                        <asp:ControlParameter ControlID="GridViewMH1" Name="chatlieu" PropertyName="SelectedValue[6]" />
                        <asp:ControlParameter ControlID="GridViewMH1" Name="mausac" PropertyName="SelectedValue[7]" />
                        <asp:ControlParameter ControlID="GridViewMH1" DbType="Date" Name="ngaysx" PropertyName="SelectedValue[8]" />
                        <asp:ControlParameter ControlID="GridViewMH1" Name="tuoithotb" PropertyName="SelectedValue[9]" />
                        <asp:ControlParameter ControlID="GridViewMH1" Name="baohanh" PropertyName="SelectedValue[10]" />
                        <asp:ControlParameter ControlID="GridViewMH1" Name="tinhtrang" PropertyName="SelectedValue[11]" />
                        <asp:ControlParameter ControlID="GridViewMH1" Name="math" PropertyName="SelectedValue[12]" />
                        <asp:ControlParameter ControlID="GridViewMH1" Name="mota" PropertyName="SelectedValue[13]" />
                        <asp:ControlParameter ControlID="GridViewMH1" Name="hinh" PropertyName="SelectedValue[14]" />
                        <asp:ControlParameter ControlID="GridViewMH1" Name="masp" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <div class="auto-style8">
                <asp:GridView ID="GridViewTonKho" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" Caption="SẢN PHẨM TỒN TẠI CÁC KHO VỚI SỐ LƯỢNG NHƯ SAU" CellPadding="4" DataKeyNames="masp,makho" DataSourceID="SqlDataSourceTonKho" ForeColor="Black" OnSelectedIndexChanged="GridViewTonKho_SelectedIndexChanged" Width="486px" BorderStyle="None" Height="183px" GridLines="Horizontal" CssClass="auto-style10">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="makho" HeaderText="Mã kho" ReadOnly="True" SortExpression="makho" />
                        <asp:BoundField DataField="masp" HeaderText="Mã sản phẩm" ReadOnly="True" SortExpression="masp" />
                        <asp:BoundField DataField="slton" HeaderText="Số tồn" SortExpression="slton" />
                        <asp:CommandField DeleteText="Thanh lý" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                </div>
                <asp:SqlDataSource ID="SqlDataSourceTonKho" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" DeleteCommand="DELETE FROM HangTon WHERE (makho = @makho) AND (masp = @masp)" SelectCommand="SELECT * FROM [HangTon] WHERE ([masp] = @masp)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewTonKho" Name="makho" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewTonKho" Name="masp" PropertyName="SelectedValue[2]" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewMH1" Name="masp" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <div class="auto-style8">
                <asp:GridView ID="GridViewCTDH" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" Caption="SẢN PHẨM ĐANG CHỌN CÒN ĐẶT MUA TRÊN CÁC ĐƠN HÀNG" CellPadding="4" DataKeyNames="madh,masp" DataSourceID="SqlDataSourceCTDH" ForeColor="Black" BorderStyle="None" Height="99px" Width="464px" GridLines="Horizontal" CssClass="auto-style11">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="madh" HeaderText="Mã đơn" ReadOnly="True" SortExpression="madh" />
                        <asp:TemplateField HeaderText="Mã sản phẩm" SortExpression="masp">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceRBTVMH" DataTextField="tensp" DataValueField="masp" SelectedValue='<%# Bind("masp") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceRBTVMH" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT [masp], [tensp] FROM [DMSPNoiThat] WHERE ([masp] = @masp)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="GridViewCTDH" Name="masp" PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("masp") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="sl" HeaderText="Số lượng" SortExpression="sl" />
                        <asp:CommandField CancelText="Hủy" EditText="Đổi hàng" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField DeleteText="Hủy chi tiết" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                </div>
                <asp:SqlDataSource ID="SqlDataSourceCTDH" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" DeleteCommand="DELETE FROM CTDH WHERE (madh = @madh) AND (masp = @masp)" SelectCommand="SELECT * FROM [CTDH] WHERE ([masp] = @masp)" UpdateCommand="UPDATE CTDH SET masp = @masp_new, sl = @sl WHERE (madh = @madh) AND (masp = @masp)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewCTDH" Name="madh" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewCTDH" Name="masp" PropertyName="SelectedValue[2]" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewMH1" Name="masp" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewCTDH" Name="madh" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewMH1" Name="masp" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridViewCTDH" Name="masp_new" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="GridViewCTDH" DbType="Int32" Name="sl" PropertyName="SelectedValue[3]" />
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
            <td colspan="2">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
