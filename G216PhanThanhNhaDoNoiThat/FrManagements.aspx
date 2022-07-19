<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FrManagements.aspx.cs" Inherits="G216PhanThanhNhaDoNoiThat.FrManagements" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#FF3300" Text="CHÀO MỪNG ... ĐẾN VỚI TRANG TẬP HỢP CÁC CHỨC NĂNG QUẢN LÝ CỦA HỆ THỐNG NỘI THẤT NHÀ XINH, 19DTH3, G2"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblBan" runat="server" Font-Bold="True" ForeColor="Blue" Text="I. CÁC CHỨC NĂNG QUẢN LÝ: BÊN BÁN"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnMH" runat="server" Text="Quản lý đồ nội thất" OnClick="btnMH_Click" />
                &nbsp;
                <asp:Button ID="btnThuongHieu" runat="server" Text="Quản lý Nhà Sản Xuất" OnClick="btnThuongHieu_Click" />
                &nbsp;
                <asp:Button ID="btnNV" runat="server" Text="Quản lý Nhân Viên" OnClick="btnNV_Click" />
                &nbsp;
                <asp:Button ID="btnKho" runat="server" Text="Quản lý Kho" OnClick="btnKho_Click" />
&nbsp;
                <asp:Button ID="btnKV" runat="server" Text="Quản lý Khu vực" OnClick="btnKV_Click" />
&nbsp;
                <asp:Button ID="btnNhapXuat" runat="server" Text="Quản lý Nhập Xuất" OnClick="btnNhapXuat_Click" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:Button ID="btnNhomMH" runat="server" Text="Quản lý loại nội thất" OnClick="btnNhomMH_Click" />
                &nbsp;
                <asp:Button ID="btnChuyennhom" runat="server" Text="Quản lý Chuyển nhóm" OnClick="btnChuyennhom_Click" />
                &nbsp;
                <asp:Button ID="btnCM" runat="server" Text="Quản lý Chuyên môn" OnClick="btnCM_Click" />
&nbsp;
                <asp:Button ID="btnPhanCongGH" runat="server" Text="Quản lý Phân Công giao hàng" OnClick="btnPhanCongGH_Click" />
&nbsp;
                </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMua" runat="server" Font-Bold="True" ForeColor="Blue" Text="II. CÁC CHỨC NĂNG QUẢN LÝ: BÊN MUA"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnKH" runat="server" Text="Quản lý Khách Hàng" OnClick="btnKH_Click" />
&nbsp;
                &nbsp;<asp:Button ID="btnDDH" runat="server" Text="Quản lý đơn đặt hàng" OnClick="btnDDH_Click" />
&nbsp;
                <asp:Button ID="btnCTDDH" runat="server" Text="Quản lý Chi tiết Đơn đặt hàng" OnClick="btnCTDDH_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTongHopTK" runat="server" Font-Bold="True" ForeColor="Blue" Text="III. CÁC CHỨC NĂNG THỐNG KÊ, TỔNG HỢP, BÁO CÁO"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblBaoCao" runat="server" Font-Bold="True" ForeColor="#990000" Text="1. Báo Cáo"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnDS" runat="server" Text="Báo Cáo Doanh số" />
&nbsp;
                <asp:Button ID="btnDT" runat="server" Text="Báo Cáo Doanh thu" />
&nbsp;
                <asp:Button ID="btnLaiLo" runat="server" Text="Báo Cáo Lãi || Lỗ" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTraCuu" runat="server" Font-Bold="True" ForeColor="#990000" Text="2. Tra cứu &amp; Tìm kiếm"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnFindBenBan" runat="server" Text="Tra cứu - Tìm kiếm: Bên Bán" />
&nbsp;
                <asp:Button ID="btnFindBenMua" runat="server" Text="Tra cứu - Tìm kiếm: Bên Mua" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblKPDL" runat="server" Font-Bold="True" ForeColor="#990000" Text="3. Khai phá dữ liệu"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnHDHangNhap" runat="server" Text="Hoạch định phân bổ hàng nhập" />
&nbsp;
                <asp:Button ID="btnHDNhanLuc" runat="server" Text="Hoạch định bố trí nhân lực" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblKeToanHH" runat="server" Font-Bold="True" ForeColor="#990000" Text="3. Kế toán hàng hóa"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnCongNo" runat="server" Text="Quản lý công nợ" />
&nbsp;
                <asp:Button ID="btnThanhToan" runat="server" Text="Quản lý thanh toán" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblGiaoHang" runat="server" Font-Bold="True" ForeColor="Blue" Text="IV. CÁC CHỨC NĂNG GIAO HÀNG (thường là PhoneApp)"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnInforGH" runat="server" Text="Cập nhật thông tin giao hàng" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblHeThong" runat="server" Font-Bold="True" ForeColor="Blue" Text="V. CÁC CHỨC NĂNG HỆ THỐNG"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnHome" runat="server" Text="Về trang chủ" />
&nbsp;
                <asp:Button ID="btnDangXuat" runat="server" Text="Đăng Xuất" />
            </td>
        </tr>
    </table>
</asp:Content>
