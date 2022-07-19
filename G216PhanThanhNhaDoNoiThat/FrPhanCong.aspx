<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FrPhanCong.aspx.cs" Inherits="G216PhanThanhNhaDoNoiThat.FrPhanCong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
        }

        .auto-style9 {
            height: 143px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style5">
        <tr>
            <td>
                <table class="auto-style1">
                    <tr>
                        <td>
                <asp:Label ID="lblTitle" runat="server" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN LÝ PHÂN CÔNG NHÂN VIÊN" Font-Bold="True" Font-Size="Medium" ForeColor="#FF6600"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbName" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="X-Large" ForeColor="#CC0000" Text="DANH SÁCH CÁC ĐƠN ĐẶT HÀNG"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButton ID="rdoAll" runat="server" AutoPostBack="True" GroupName="Chon" OnCheckedChanged="rdoAll_CheckedChanged" Text="Tất cả các đơn hàng" />
                            &nbsp;
                            <asp:RadioButton ID="rdoDaPhanCong" runat="server" AutoPostBack="True" GroupName="Chon" OnCheckedChanged="rdoDaPhanCong_CheckedChanged" Text="Đơn hàng đã phân công" />
                            &nbsp;
                            <asp:RadioButton ID="rdoChuaPhanCong" runat="server" AutoPostBack="True" GroupName="Chon" OnCheckedChanged="rdoChuaPhanCong_CheckedChanged" Text="Đơn hàng chưa phân công" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">
                            <asp:Button ID="btnPhanCong" runat="server" BackColor="#99CCFF" Font-Bold="True" Font-Names="Tahoma" ForeColor="#333300" Height="43px" OnClick="btnPhanCong_Click" Text="PHÂN CÔNG GIAO HÀNG" Visible="False" Width="275px" />
                            &nbsp;<asp:Button ID="btnHuy" runat="server" BackColor="#99CCFF" Font-Bold="True" ForeColor="Black" Height="43px" OnClick="btnHuy_Click" Text="HỦY" Visible="False" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lbNV" runat="server" Text="Nhân viên phụ trách:" Visible="False"></asp:Label>
                            &nbsp; &nbsp; &nbsp;<asp:DropDownList ID="DropDownListNV" runat="server" DataSourceID="SqlDataSourceNV" DataTextField="tennv" DataValueField="manv" Visible="False">
                            </asp:DropDownList>
                            &nbsp;&nbsp;<asp:SqlDataSource ID="SqlDataSourceNV" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [NhanVien]"></asp:SqlDataSource>
                            &nbsp;<asp:Label ID="lbKV" runat="server" Text="Khu vực:" Visible="False"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                            <asp:DropDownList ID="DropDownListKV" runat="server" DataSourceID="SqlDataSourceKV" DataTextField="tenkv" DataValueField="makv" Visible="False">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceKV" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [KhuVuc]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridViewDDH" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="madh" DataSourceID="SqlDataSourceDDH" ForeColor="Black">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkChon" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="madh" HeaderText="Mã đơn hàng" ReadOnly="True" SortExpression="madh" />
                                    <asp:BoundField DataField="ngaylap" HeaderText="Ngày lập" ReadOnly="True" SortExpression="ngaylap" />
                                    <asp:BoundField DataField="makh" HeaderText="Mã KH" ReadOnly="True" SortExpression="makh" />
                                    <asp:BoundField DataField="diachigiao" HeaderText="Địa chỉ giao" ReadOnly="True" SortExpression="diachigiao" />
                                    <asp:BoundField DataField="nguoinhan" HeaderText="Người nhận" ReadOnly="True" SortExpression="nguoinhan" />
                                    <asp:BoundField DataField="sdtnhan" HeaderText="SĐT nhận" ReadOnly="True" SortExpression="sdtnhan" />
                                    <asp:BoundField DataField="ghichu" HeaderText="Ghi chú" ReadOnly="True" SortExpression="ghichu" />
                                    <asp:BoundField DataField="thoihan" HeaderText="Thời hạn" ReadOnly="True" SortExpression="thoihan" />
                                    <asp:BoundField DataField="tinhtrang" HeaderText="Tình trạng" ReadOnly="True" SortExpression="tinhtrang" />
                                    <asp:BoundField DataField="manv" HeaderText="Mã NV" SortExpression="manv" />
                                    <asp:BoundField DataField="makv" HeaderText="Mã KV" SortExpression="makv" />
                                </Columns>
                                <FooterStyle BackColor="#CCCCCC" />
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                <RowStyle BackColor="White" />
                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="Gray" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#383838" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceDDH" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" DeleteCommand="DELETE FROM DonHang WHERE (madh = @madh)" SelectCommand="SELECT * FROM [DonHang]" UpdateCommand="UPDATE DonHang SET manv = @manv, makv = @makv WHERE (madh = @madh)">
                                <DeleteParameters>
                                    <asp:ControlParameter ControlID="GridViewDDH" Name="madh" PropertyName="SelectedValue" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="GridViewDDH" Name="manv" PropertyName="SelectedValue[10]" />
                                    <asp:ControlParameter ControlID="GridViewDDH" Name="makv" PropertyName="SelectedValue[11]" />
                                    <asp:ControlParameter ControlID="GridViewDDH" Name="madh" PropertyName="SelectedValue" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
