<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FrChuyenNhom.aspx.cs" Inherits="G216PhanThanhNhaDoNoiThat.FrChuyenNhom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
        }
        .auto-style6 {
            width: 445px;
        }
        .auto-style7 {
            width: 99px;
            text-align: center;
        }
        .auto-style8 {
            width: 445px;
            height: 90px;
        }
        .auto-style9 {
            width: 99px;
            height: 90px;
            text-align: center;
        }
        .auto-style10 {
            height: 90px;
        }
        .auto-style11 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style5">
        <tr>
            <td colspan="3">
                <asp:Label ID="lblTitle" runat="server" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN LÝ CHUYỂN NHÓM SẢN PHẨM" Font-Bold="True" Font-Size="Medium" ForeColor="#FF6600"></asp:Label>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="btnChuyenLoai" runat="server" OnClick="btnChuyenLoai_Click" Text="Chuyển loại SP" />
&nbsp;
                <asp:Button ID="btnChuyenCM" runat="server" OnClick="btnChuyenCM_Click" Text="Chuyển Chuyên môn của NV" />
&nbsp;
                <asp:Button ID="btnChuyenKho" runat="server" OnClick="btnChuyenKho_Click" Text="Chuyển Kho" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblTitleLNT" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#666666" Text="CHUYỂN SẢN PHẨM TỪ LOẠI NÀY SANG LOẠI KHÁC" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:Label ID="lblloainguon" runat="server" Text="Chọn loại nguồn:" Visible="False"></asp:Label>
                <asp:DropDownList ID="DropDownListLoaiNguon" runat="server" DataSourceID="SqlDataSourceLoaiNguon" DataTextField="tenloai" DataValueField="maloai" OnSelectedIndexChanged="DropDownListLoaiNguon_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True" Visible="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceLoaiNguon" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [LoaiSP]"></asp:SqlDataSource>
            </td>
            <td class="auto-style9">
                <asp:Button ID="btnLR" runat="server" OnClick="btnLR_Click" Text="&gt;" Visible="False" Width="28px" />
                <br />
                <asp:Button ID="btnRL" runat="server" OnClick="btnRL_Click" Text="&lt;" Visible="False" Width="28px" />
            </td>
            <td class="auto-style10">
                <asp:Label ID="lblloaidich" runat="server" Text="Chọn loại đích:" Visible="False"></asp:Label>
                <asp:DropDownList ID="DropDownListLoaiDich" runat="server" DataSourceID="SqlDataSourceLoaiDich" DataTextField="tenloai" DataValueField="maloai" OnSelectedIndexChanged="DropDownListLoaiNguon_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True" Visible="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceLoaiDich" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [LoaiSP]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="lblloainguon0" runat="server" Text="Chọn loại nguồn:" Visible="False"></asp:Label>
                <br />
                <asp:ListBox ID="ListBoxLoaiNguon" runat="server" DataSourceID="SqlDataSourceSPN" DataTextField="tensp" DataValueField="masp" AutoPostBack="True" Visible="False"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSourceSPN" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT masp, tensp, gia, dvt, kichthuoc, chatlieu, mausac, ngaysx, tuoithotb, baohanh, tinhtrang, mota, hinh, maloai, math FROM DMSPNoiThat WHERE (maloai = @maloai)" UpdateCommand="UPDATE DMSPNoiThat SET maloai = @maloai WHERE (masp = @masp)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListLoaiNguon" Name="maloai" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="DropDownListLoaiDich" Name="maloai" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListBoxLoaiNguon" Name="masp" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td class="auto-style7">
                <asp:Button ID="btnLAR" runat="server" OnClick="btnLAR_Click" Text="&gt;&gt;" Visible="False" />
                <br />
                <asp:Button ID="btnRAL" runat="server" OnClick="btnRAL_Click" Text="&lt;&lt;" Visible="False" />
            </td>
            <td>
                <asp:Label ID="lblloainguon1" runat="server" Text="Chọn loại đích:" Visible="False"></asp:Label>
                <br />
                <asp:ListBox ID="ListBoxLoaiDich" runat="server" DataSourceID="SqlDataSourceSPD" DataTextField="tensp" DataValueField="masp" AutoPostBack="True" Visible="False"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSourceSPD" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [DMSPNoiThat] WHERE ([maloai] = @maloai)" UpdateCommand="UPDATE DMSPNoiThat SET maloai = @maloai WHERE (masp = @masp)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListLoaiDich" Name="maloai" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="DropDownListLoaiNguon" Name="maloai" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListBoxLoaiDich" Name="masp" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="btnQuayLai" runat="server" OnClick="btnQuayLai_Click" Text="Quay Lại QL Loại SP" Visible="False" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblTitleLNT0" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#666666" Text="CHUYỂN NHÂN VIÊN CÓ CHUYÊN MÔN NÀY SANG CHUYÊN MÔN KHÁC" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCMN" runat="server" Text="Chọn chuyên môn nguồn:" Visible="False"></asp:Label>
                <asp:DropDownList ID="DropDownListCMNguon" runat="server" DataSourceID="SqlDataSourceCMNguon" DataTextField="tencm" DataValueField="macm" OnSelectedIndexChanged="DropDownListCMNguon_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True" Visible="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceCMNguon" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [ChuyenMon]"></asp:SqlDataSource>
            </td>
            <td class="auto-style11">
                <asp:Button ID="btnLR0" runat="server" OnClick="btnLR0_Click" Text="&gt;" Visible="False" Width="28px" />
                <br />
                <asp:Button ID="btnRL0" runat="server" OnClick="btnRL0_Click" Text="&lt;" Visible="False" Width="28px" />
            </td>
            <td>
                <asp:Label ID="lblCMD" runat="server" Text="Chọn chuyên môn đích:" Visible="False"></asp:Label>
                <asp:DropDownList ID="DropDownListCMDich" runat="server" DataSourceID="SqlDataSourceCMDich" DataTextField="tencm" DataValueField="macm" OnSelectedIndexChanged="DropDownListCMNguon_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True" Visible="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceCMDich" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [ChuyenMon]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblNVnguon" runat="server" Text="Nhân Viên thuộc Chuyên môn nguồn:" Visible="False"></asp:Label>
                <br />
                <asp:ListBox ID="ListBoxNVNguon" runat="server" DataSourceID="SqlDataSourceNVNguon" DataTextField="tennv" DataValueField="manv" AutoPostBack="True" Visible="False"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSourceNVNguon" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [NhanVien] WHERE ([macm] = @macm)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListCMNguon" Name="macm" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="auto-style11">
                <asp:Button ID="btnLAR0" runat="server" OnClick="btnLAR0_Click" Text="&gt;&gt;" Visible="False" />
                <br />
                <asp:Button ID="btnRAL0" runat="server" OnClick="btnRAL0_Click" Text="&lt;&lt;" Visible="False" />
            </td>
            <td>
                <asp:Label ID="lblNVdich" runat="server" Text="Nhân viên thuộc Chuyên môn đích:" Visible="False"></asp:Label>
                <br />
                <asp:ListBox ID="ListBoxNVDich" runat="server" DataSourceID="SqlDataSourceNVDich" DataTextField="tennv" DataValueField="manv" AutoPostBack="True" Visible="False"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSourceNVDich" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [NhanVien] WHERE ([macm] = @macm)" UpdateCommand="UPDATE NhanVien SET macm = @macm WHERE (manv = @manv)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListCMDich" Name="macm" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="DropDownListCMNguon" Name="macm" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListBoxNVDich" Name="manv" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="btnQuayLaiCM" runat="server" OnClick="btnQuayLaiCM_Click" Text="Quay Lại QL Chuyên môn" Visible="False" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblTitleLNT1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#666666" Text="CHUYỂN SẢN PHẨM TỪ KHO NÀY SANG KHO KHÁC" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblKhoN" runat="server" Text="Chọn Kho nguồn:" Visible="False"></asp:Label>
                <asp:DropDownList ID="DropDownListKhoNguon" runat="server" DataSourceID="SqlDataSourceKhoNguon" DataTextField="tenkho" DataValueField="makho" OnSelectedIndexChanged="DropDownListKhoNguon_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True" Visible="False" Width="86px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceKhoNguon" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [Kho]"></asp:SqlDataSource>
            </td>
            <td class="auto-style11">
                <asp:Button ID="btnLR1" runat="server" OnClick="btnLR1_Click" Text="&gt;" Visible="False" Width="28px" />
                <br />
                <asp:Button ID="btnRL1" runat="server" OnClick="btnRL1_Click" Text="&lt;" Visible="False" Width="28px" />
            </td>
            <td>
                <asp:Label ID="lblKhoĐ" runat="server" Text="Chọn Kho đích:" Visible="False"></asp:Label>
                <asp:DropDownList ID="DropDownListKhoDich" runat="server" DataSourceID="SqlDataSourceKhoDich" DataTextField="tenkho" DataValueField="makho" OnSelectedIndexChanged="DropDownListKhoNguon_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True" Visible="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceKhoDich" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [Kho]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSPKhoN" runat="server" Text="Sản phẩm thuộc Kho nguồn:" Visible="False"></asp:Label>
                <br />
                <asp:ListBox ID="ListBoxSPKhoN" runat="server" DataSourceID="SqlDataSourceSPKhoN" DataTextField="masp" DataValueField="masp" AutoPostBack="True" Visible="False"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSourceSPKhoN" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [HangTon] WHERE ([makho] = @makho)" UpdateCommand="UPDATE HangTon SET makho = @makho WHERE (masp = @masp)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListKhoNguon" Name="makho" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="DropDownListKhoDich" Name="makho" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListBoxSPKhoN" Name="masp" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td class="auto-style11">
                <asp:Button ID="btnLAR1" runat="server" OnClick="btnLAR1_Click" Text="&gt;&gt;" Visible="False" />
                <br />
                <asp:Button ID="btnRAL1" runat="server" OnClick="btnRAL1_Click" Text="&lt;&lt;" Visible="False" />
            </td>
            <td>
                <asp:Label ID="lblSPKhoD" runat="server" Text="Sản phẩm thuộc Kho đích:" Visible="False"></asp:Label>
                <br />
                <asp:ListBox ID="ListBoxSPKhoD" runat="server" DataSourceID="SqlDataSourceSPKhoD" DataTextField="masp" DataValueField="masp" AutoPostBack="True" Visible="False"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSourceSPKhoD" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [HangTon] WHERE ([makho] = @makho)" UpdateCommand="UPDATE HangTon SET makho = @makho WHERE (masp = @masp)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListKhoDich" Name="makho" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="DropDownListKhoNguon" Name="makho" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListBoxSPKhoD" Name="masp" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="btnQuayLaiKho" runat="server" OnClick="btnQuayLaiCM0_Click" Text="Quay Lại QL Kho" Visible="False" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="btnQLCHUNG" runat="server" OnClick="btnQLCHUNG_Click" Text="Về trang quản lý chung" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
