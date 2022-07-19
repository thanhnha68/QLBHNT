<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FrQLCM.aspx.cs" Inherits="G216PhanThanhNhaDoNoiThat.FrQLCM" %>
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
            <td>
                <asp:Label ID="lblTitle" runat="server" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN LÝ CHUYÊN MÔN CỦA NHÂN VIÊN" Font-Bold="True" Font-Size="Medium" ForeColor="#FF6600"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnThem" runat="server" OnClick="btnThem_Click" Text="Thêm Chuyên Môn" Width="141px" />
                <asp:Label ID="lblmaCM" runat="server" Text="Mã CM: " Visible="False"></asp:Label>
                <asp:TextBox ID="txtmaCM" runat="server" Visible="False" Width="68px"></asp:TextBox>
                <asp:Label ID="lbltenCM" runat="server" Text="Tên CM:" Visible="False"></asp:Label>
                <asp:TextBox ID="txttenCM" runat="server" Visible="False" Width="88px"></asp:TextBox>
                <asp:Button ID="btnHuy" runat="server" Text="Hủy" Visible="False" Width="103px" OnClick="btnHuy_Click" />
                </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewCM" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="macm" DataSourceID="SqlDataSourceCM" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridViewCM_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="macm" HeaderText="Mã CM" ReadOnly="True" SortExpression="macm" />
                        <asp:BoundField DataField="tencm" HeaderText="Tên CM" SortExpression="tencm" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField DeleteText="Hủy CM" ShowDeleteButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSourceCM" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" DeleteCommand="DELETE FROM ChuyenMon WHERE (macm = @macm)" InsertCommand="INSERT INTO ChuyenMon(macm, tencm) VALUES (@macm, @tencm)" SelectCommand="SELECT * FROM [ChuyenMon]" UpdateCommand="UPDATE ChuyenMon SET tencm = @tencm WHERE (macm = @macm)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewCM" Name="macm" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtmaCM" Name="macm" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttenCM" Name="tencm" PropertyName="Text" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewCM" Name="tencm" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewCM" Name="macm" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewNV" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" Caption="DANH SÁCH NHÂN VIÊN CÓ CHUYÊN MÔN ĐƯỢC CHỌN TRÊN " CellPadding="4" CellSpacing="2" DataKeyNames="manv" DataSourceID="SqlDataSourceNV" ForeColor="Black">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="manv" HeaderText="Mã NV" ReadOnly="True" SortExpression="manv" />
                        <asp:BoundField DataField="tennv" HeaderText="Tên NV" SortExpression="tennv" ReadOnly="True" />
                        <asp:BoundField DataField="ngaysinh" HeaderText="Ngày sinh" SortExpression="ngaysinh" ReadOnly="True" />
                        <asp:BoundField DataField="gioitinh" HeaderText="Giới tính" SortExpression="gioitinh" ReadOnly="True" />
                        <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" SortExpression="diachi" ReadOnly="True" />
                        <asp:BoundField DataField="sdt" HeaderText="SĐT" SortExpression="sdt" ReadOnly="True" />
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" ReadOnly="True" />
                        <asp:BoundField DataField="macm" HeaderText="Mã CM" SortExpression="macm" ReadOnly="True" />
                        <asp:BoundField DataField="makv" HeaderText="Mã KV" ReadOnly="True" SortExpression="makv" />
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
                <asp:Button ID="btnchuyenCM" runat="server" OnClick="btnchuyenCM_Click" Text="Chuyển NV sang Chuyên môn khác" />
                <asp:SqlDataSource ID="SqlDataSourceNV" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [NhanVien] WHERE ([macm] = @macm)" UpdateCommand="UPDATE NhanVien SET macm = @macm WHERE (manv = @manv)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewCM" Name="macm" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="DropDownListCM" Name="macm" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridViewNV" Name="manv" PropertyName="SelectedValue" />
                    </UpdateParameters>
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
    </table>
</asp:Content>
