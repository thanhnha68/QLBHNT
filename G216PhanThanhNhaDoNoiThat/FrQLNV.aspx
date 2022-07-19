<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FrQLNV.aspx.cs" Inherits="G216PhanThanhNhaDoNoiThat.FrQLNV" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
        }
        .auto-style6 {
            width: 207px;
        }
        .auto-style7 {
            height: 23px;
        }
        .auto-style8 {
            width: 128px;
        }
        .auto-style9 {
            width: 213px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style5">
        <tr>
            <td colspan="4">
                <asp:Label ID="Label1" runat="server" Text="CHÀO MỪNG... TỚI TRANG QUẢN LÍ NHÂN VIÊN CỦA NỘI THẤT NHÀ XINH, G2.16 PTNHA" Font-Bold="True" ForeColor="#FF6600"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="lblKV" runat="server" Text="Chọn KHU VỰC làm việc của NV:"></asp:Label>
                <asp:DropDownList ID="DropDownListKV" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceKV" DataTextField="tenkv" DataValueField="makv" OnSelectedIndexChanged="DropDownListKV_SelectedIndexChanged">
                    <asp:ListItem Value="*">Tất cả</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceKV" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [KhuVuc]"></asp:SqlDataSource>
            </td>
            <td class="auto-style8">
                <asp:Label ID="Label3" runat="server" Text="Mã KV: "></asp:Label>
                <asp:Label ID="lblmakv" runat="server"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:Label ID="lblcm" runat="server" Text="Chọn chuyên môn của NV:"></asp:Label>
                <asp:DropDownList ID="DropDownListCM" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceCM" DataTextField="tencm" DataValueField="macm" OnSelectedIndexChanged="DropDownListKV_SelectedIndexChanged">
                    <asp:ListItem Value="*">Tất cả</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceCM" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [ChuyenMon]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Mã CM:  "></asp:Label>
                <asp:Label ID="lblmacm" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style7" colspan="4">
                <asp:Label ID="lbldan" runat="server" Text="Danh sách nhân viên thuộc KV:.....với CM:...."></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Button ID="btnThem" runat="server" Text="Tuyển dụng NV mới" OnClick="btnThem_Click" />
                <asp:Label ID="lblmanv" runat="server" Text="Mã NV:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmanv" runat="server" Visible="False"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbltennv" runat="server" Text="Tên NV:" Visible="False"></asp:Label>
                <asp:TextBox ID="txttennv" runat="server" Visible="False"></asp:TextBox>
&nbsp;
                <asp:Label ID="lblsex" runat="server" Text="Giới tính:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtsex" runat="server" Visible="False"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbldiachi" runat="server" Text="Địa chỉ:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtdiachi" runat="server" Visible="False"></asp:TextBox>
&nbsp;
                <asp:Label ID="lblsdt" runat="server" Text="SĐT:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtsdt" runat="server" Visible="False"></asp:TextBox>
&nbsp;
                <asp:Label ID="lblemail" runat="server" Text="Email:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtemail" runat="server" Visible="False"></asp:TextBox>
&nbsp;
                <asp:Label ID="lblngaysinh" runat="server" Text="Ngày sinh:" Visible="False"></asp:Label>
                <asp:Calendar ID="CalendarNS" runat="server" Visible="False"></asp:Calendar>
                <asp:Button ID="btnHuyThem" runat="server" Text="Hủy" Visible="False" OnClick="btnHuyThem_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridViewNV" runat="server" AutoGenerateColumns="False" DataKeyNames="manv" DataSourceID="SqlDataSourceNV" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="manv" HeaderText="Mã NV" ReadOnly="True" SortExpression="manv" />
                        <asp:BoundField DataField="tennv" HeaderText="Họ tên" SortExpression="tennv" />
                        <asp:TemplateField HeaderText="Ngày sinh" SortExpression="ngaysinh">
                            <EditItemTemplate>
                                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" SelectedDate='<%# Bind("ngaysinh") %>' Width="350px">
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                    <TodayDayStyle BackColor="#CCCCCC" />
                                </asp:Calendar>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ngaysinh") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="gioitinh" HeaderText="Giới tính" SortExpression="gioitinh" />
                        <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" SortExpression="diachi" />
                        <asp:BoundField DataField="sdt" HeaderText="Số ĐT" SortExpression="sdt" />
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField DeleteText="Giải quyết thôi việc" ShowDeleteButton="True" />
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
            <td colspan="4">
                <asp:SqlDataSource ID="SqlDataSourceNV" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM NhanVien WHERE (makv = @makv) AND (macm = @macm)" DeleteCommand="DELETE FROM NhanVien WHERE (manv = @manv)" InsertCommand="INSERT INTO NhanVien(manv, tennv, ngaysinh, gioitinh, diachi, sdt, email, makv, macm) VALUES (@manv, @tennv, @ngaysinh, @gioitinh, @diachi, @sdt, @email, @makv, @macm)" UpdateCommand="UPDATE NhanVien SET tennv = @tennv, ngaysinh = @ngaysinh, gioitinh = @gioitinh, diachi = @diachi, sdt = @sdt, email = @email WHERE (manv = @manv)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewNV" Name="manv" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtmanv" Name="manv" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttennv" Name="tennv" PropertyName="Text" />
                        <asp:ControlParameter ControlID="CalendarNS" DbType="Date" Name="ngaysinh" PropertyName="SelectedDate" />
                        <asp:ControlParameter ControlID="txtsex" Name="gioitinh" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtdiachi" Name="diachi" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtsdt" Name="sdt" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtemail" Name="email" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownListKV" Name="makv" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListCM" Name="macm" PropertyName="SelectedValue" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListKV" Name="makv" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="DropDownListCM" Name="macm" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewNV" Name="tennv" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="GridViewNV" DbType="Date" Name="ngaysinh" PropertyName="SelectedValue[3]" />
                        <asp:ControlParameter ControlID="GridViewNV" Name="gioitinh" PropertyName="SelectedValue[4]" />
                        <asp:ControlParameter ControlID="GridViewNV" Name="diachi" PropertyName="SelectedValue[5]" />
                        <asp:ControlParameter ControlID="GridViewNV" Name="sdt" PropertyName="SelectedValue[6]" />
                        <asp:ControlParameter ControlID="GridViewNV" Name="email" PropertyName="SelectedValue[7]" />
                        <asp:ControlParameter ControlID="GridViewNV" Name="manv" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Label ID="lblNVnhanBG" runat="server" Text="Chọn NV tiếp nhận bàn giao: " Visible="False"></asp:Label>
                <asp:DropDownList ID="DropDownListNVnhanBG" runat="server" DataSourceID="SqlDataSourceNVBG" DataTextField="tennv" DataValueField="manv" Visible="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceNVBG" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [NhanVien] WHERE ([manv] &lt;&gt; @manv)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewNV" Name="manv" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridViewDDH" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" Caption="DANH SÁCH CÁC ĐƠN HÀNG ĐANG PHÂN CÔNG CHO NHÂN VIÊN ĐƯỢC CHỌN TRONG DANH SÁCH TRÊN" CellPadding="3" DataKeyNames="madh" DataSourceID="SqlDataSourceDDH" ForeColor="Black" GridLines="Vertical" OnRowEditing="GridViewDDH_RowEditing" OnRowUpdated="GridViewDDH_RowUpdated">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="madh" HeaderText="Mã đơn" ReadOnly="True" SortExpression="madh" />
                        <asp:BoundField DataField="ngaylap" HeaderText="Ngày lập" ReadOnly="True" SortExpression="ngaylap" />
                        <asp:BoundField DataField="makh" HeaderText="Mã KH" ReadOnly="True" SortExpression="makh" />
                        <asp:BoundField DataField="diachigiao" HeaderText="Địa chỉ giao" ReadOnly="True" SortExpression="diachigiao" />
                        <asp:BoundField DataField="nguoinhan" HeaderText="Người nhận" ReadOnly="True" SortExpression="nguoinhan" />
                        <asp:BoundField DataField="tinhtrang" HeaderText="Tình trạng" ReadOnly="True" SortExpression="tinhtrang" />
                        <asp:BoundField DataField="manv" HeaderText="Mã NV" ReadOnly="True" SortExpression="manv" />
                        <asp:BoundField DataField="makv" HeaderText="Mã KV" ReadOnly="True" SortExpression="makv" />
                        <asp:BoundField DataField="thoihan" HeaderText="Thời hạn" ReadOnly="True" SortExpression="thoihan" />
                        <asp:BoundField DataField="sdtnhan" HeaderText="SĐT nhận" ReadOnly="True" SortExpression="sdtnhan" />
                        <asp:BoundField DataField="ghichu" HeaderText="Ghi chú" SortExpression="ghichu" />
                        <asp:CommandField CancelText="Hủy" EditText="Bàn giao" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField DeleteText="Hủy đơn" ShowDeleteButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSourceDDH" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" DeleteCommand="DELETE FROM DonHang WHERE (madh = @madh)" SelectCommand="SELECT * FROM [DonHang] WHERE ([manv] = @manv)" UpdateCommand="UPDATE DonHang SET manv = @manv, ghichu = @ghichu WHERE (madh = @madh)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewDDH" Name="madh" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewNV" Name="manv" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="DropDownListNVnhanBG" Name="manv" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridViewDDH" Name="ghichu" PropertyName="SelectedValue[11]" />
                        <asp:ControlParameter ControlID="GridViewDDH" Name="madh" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridViewCTDH" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" Caption="DANH SÁCH CHI TIẾT CÁC MẶT HÀNG CỦA ĐƠN HÀNG ĐƯỢC CHỌN Ở TRÊN" CellPadding="3" DataKeyNames="madh,masp" DataSourceID="SqlDataSourceCTDH" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="madh" HeaderText="Mã đơn" ReadOnly="True" SortExpression="madh" />
                        <asp:BoundField DataField="masp" HeaderText="Mã SP" ReadOnly="True" SortExpression="masp" />
                        <asp:BoundField DataField="sl" HeaderText="Số lượng" SortExpression="sl" />
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
                        <asp:ControlParameter ControlID="GridViewDDH" Name="madh" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Button ID="btnQLC" runat="server" OnClick="btnQLC_Click" Text="Về trang quản lí chung" />
            </td>
        </tr>
    </table>
</asp:Content>
