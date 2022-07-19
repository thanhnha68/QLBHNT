<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FrQLNhapXuat.aspx.cs" Inherits="G216PhanThanhNhaDoNoiThat.FrQLNhapXuat" %>
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
                <asp:Label ID="lblTitle" runat="server" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN LÝ NHẬP XUẤT TỒN KHO" Font-Bold="True" Font-Size="Medium" ForeColor="#FF6600"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblKho" runat="server" Text="Chọn KHO: "></asp:Label>
                <asp:DropDownList ID="DropDownListKho" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceKho" DataTextField="tenkho" DataValueField="makho" OnSelectedIndexChanged="DropDownListKho_SelectedIndexChanged">
                    <asp:ListItem Value="*">Tất cả</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceKho" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [Kho]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Label ID="lblSP" runat="server" Text="Chọn SP:"></asp:Label>
                <asp:DropDownList ID="DropDownListSP" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceSP" DataTextField="tensp" DataValueField="masp">
                    <asp:ListItem Value="*">Tất cả</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceSP" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [DMSPNoiThat]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label1" runat="server" Text="DANH SÁCH HÀNG TỒN SẢN PHẨM Ở KHO ĐÃ CHỌN"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnThem" runat="server" Text="Thêm TỒN mới" OnClick="btnThem_Click" />
                <asp:Label ID="lblsl" runat="server" Text="Số lượng: "></asp:Label>
                <asp:TextBox ID="txtsl" runat="server"></asp:TextBox>
                <asp:Button ID="btnHuy" runat="server" Text="Hủy" OnClick="btnHuy_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewHT" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="masp,makho" DataSourceID="SqlDataSourceHT" ForeColor="Black">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masp" HeaderText="Mã SP" ReadOnly="True" SortExpression="masp" />
                        <asp:BoundField DataField="makho" HeaderText="Mã Kho" ReadOnly="True" SortExpression="makho" />
                        <asp:BoundField DataField="slton" HeaderText="Số lượng tồn" SortExpression="slton" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField DeleteText="Xuất" ShowDeleteButton="True" />
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
                <asp:Button ID="btnChuyenKho" runat="server" OnClick="btnChuyenKho_Click" Text="Chuyển SP tồn sang Kho khác" />
                <asp:SqlDataSource ID="SqlDataSourceHT" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" DeleteCommand="DELETE FROM HangTon WHERE (makho = @makho) AND (masp = @masp)" InsertCommand="INSERT INTO HangTon(masp, makho, slton) VALUES (@masp, @makho, @slton)" SelectCommand="SELECT * FROM [HangTon] WHERE (([makho] = @makho) AND ([masp] = @masp))" UpdateCommand="UPDATE HangTon SET slton = @slton WHERE (masp = @masp) AND (makho = @makho)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewHT" Name="masp" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewHT" Name="makho" PropertyName="SelectedValue[2]" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="DropDownListSP" Name="masp" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="DropDownListKho" Name="makho" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="txtsl" Name="slton" PropertyName="Text" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListKho" Name="makho" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="DropDownListSP" Name="masp" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewHT" DbType="Int32" Name="slton" PropertyName="SelectedValue[3]" />
                        <asp:ControlParameter ControlID="GridViewHT" Name="masp" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewHT" Name="makho" PropertyName="SelectedValue[2]" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
