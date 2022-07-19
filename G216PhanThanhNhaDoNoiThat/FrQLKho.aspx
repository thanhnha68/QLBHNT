<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FrQLKho.aspx.cs" Inherits="G216PhanThanhNhaDoNoiThat.FrKho" %>
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
                <asp:Label ID="lblTitle" runat="server" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN LÝ KHO" Font-Bold="True" Font-Size="Medium" ForeColor="#FF6600"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblKV" runat="server" Text="Chọn KHU VỰC của KHO:"></asp:Label>
                <asp:DropDownList ID="DropDownListKV" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceKhuVuc" DataTextField="tenkv" DataValueField="makv" OnSelectedIndexChanged="DropDownListKV_SelectedIndexChanged">
                    <asp:ListItem Value="*">Tất cả</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceKhuVuc" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [KhuVuc]"></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" Text="Mã KV: "></asp:Label>
                <asp:Label ID="lblmakv" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnThem" runat="server" OnClick="btnThem_Click" Text="Tổ chức kinh doanh mới" Width="182px" />
                <asp:Label ID="lblmaKho" runat="server" Text="Mã Kho: " Visible="False"></asp:Label>
                <asp:TextBox ID="txtmaKho" runat="server" Visible="False" Width="68px"></asp:TextBox>
                <asp:Label ID="lbltenKho" runat="server" Text="Tên Kho:" Visible="False"></asp:Label>
                <asp:TextBox ID="txttenKho" runat="server" Visible="False" Width="88px"></asp:TextBox>
                <asp:Label ID="lblDiachi" runat="server" Text="Địa chỉ:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtDiaChi" runat="server" Visible="False" Width="88px"></asp:TextBox>
                <asp:Label ID="lblSDT" runat="server" Text="SĐT:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtSDT" runat="server" Visible="False" Width="88px"></asp:TextBox>
                <asp:Label ID="lblSucchua" runat="server" Text="Sức chứa:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtSucchua" runat="server" Visible="False" Width="88px"></asp:TextBox>
                <asp:Label ID="lblControng" runat="server" Text="Còn trống:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtControng" runat="server" Visible="False" Width="88px"></asp:TextBox>
                <asp:Button ID="btnHuy" runat="server" Text="Hủy" Visible="False" Width="103px" OnClick="btnHuy_Click" />
                </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewKho" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="makho" DataSourceID="SqlDataSourceKho" ForeColor="Black">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="makho" HeaderText="Mã kho" ReadOnly="True" SortExpression="makho" />
                        <asp:BoundField DataField="tenkho" HeaderText="Tên kho" SortExpression="tenkho" />
                        <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" SortExpression="diachi" />
                        <asp:BoundField DataField="sdt" HeaderText="SĐT" SortExpression="sdt" />
                        <asp:BoundField DataField="succhua" HeaderText="Sức chứa" SortExpression="succhua" />
                        <asp:BoundField DataField="controng" HeaderText="Còn trống" SortExpression="controng" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField DeleteText="Trả kho" ShowDeleteButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSourceKho" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" DeleteCommand="DELETE FROM Kho WHERE (makho = @makho)" InsertCommand="INSERT INTO Kho(makho, tenkho, diachi, sdt, succhua, controng, makv) VALUES (@makho, @tenkho, @diachi, @sdt, @succhua, @controng, @makv)" SelectCommand="SELECT * FROM [Kho] WHERE ([makv] = @makv)" UpdateCommand="UPDATE Kho SET tenkho = @tenkho, diachi = @diachi, sdt = @sdt, succhua = @succhua, controng = @controng WHERE (makho = @makho)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewKho" Name="makho" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtmaKho" Name="makho" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttenKho" Name="tenkho" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtDiaChi" Name="diachi" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtSDT" Name="sdt" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtSucchua" Name="succhua" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtControng" Name="controng" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownListKV" Name="makv" PropertyName="SelectedValue" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListKV" Name="makv" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewKho" Name="tenkho" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="GridViewKho" Name="diachi" PropertyName="SelectedValue[3]" />
                        <asp:ControlParameter ControlID="GridViewKho" Name="sdt" PropertyName="SelectedValue[4]" />
                        <asp:ControlParameter ControlID="GridViewKho" Name="succhua" PropertyName="SelectedValue[5]" />
                        <asp:ControlParameter ControlID="GridViewKho" Name="controng" PropertyName="SelectedValue[6]" />
                        <asp:ControlParameter ControlID="GridViewKho" Name="makho" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewHT" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" Caption="KHO ĐANG CHỌN CÒN TỒN CÁC SẢN PHẨM VỚI SỐ LƯỢNG NHƯ SAU" CellPadding="3" DataKeyNames="masp,makho" DataSourceID="SqlDataSourceHT" ForeColor="Black" GridLines="Vertical" Width="357px" AllowPaging="True" PageSize="7">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:BoundField DataField="masp" HeaderText="Mã SP" ReadOnly="True" SortExpression="masp" />
                        <asp:BoundField DataField="makho" HeaderText="Mã Kho" ReadOnly="True" SortExpression="makho" />
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
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnChuyenKho" runat="server" OnClick="btnChuyenKho_Click" Text="Chuyển SP sang Kho khác" />
                <asp:SqlDataSource ID="SqlDataSourceHT" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" DeleteCommand="DELETE FROM HangTon WHERE (makho = @makho)" SelectCommand="SELECT * FROM [HangTon] WHERE ([makho] = @makho)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewKho" Name="makho" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewKho" Name="makho" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Button ID="btnQLC" runat="server" OnClick="btnQLC_Click" Text="Về trang quản lí chung" />
            </td>
        </tr>
    </table>
</asp:Content>
