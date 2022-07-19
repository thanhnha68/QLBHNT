<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="G216PhanThanhNhaDoNoiThat.Homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            background-color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td>
            <asp:Label ID="lbTittle" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="Medium" Text="Mời bạn chọn nội thất cần trang trí cho căn nhà của mình"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblsum" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="#FF9900"></asp:Label>
            <asp:Button ID="btnCart" runat="server" OnClick="btnCart_Click" Text="Xem giỏ hàng" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:DataList ID="DataListSPNT" runat="server" CellPadding="4" DataKeyField="masp" DataSourceID="SqlDataSourceSPNT" RepeatColumns="3" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" GridLines="Both" ForeColor="Black" OnItemCommand="DataListSPNT_ItemCommand">
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="White" />
                <ItemTemplate>
                    <span class="auto-style5">Mã sản phẩm </span>:
                    <asp:Label ID="maspLabel" runat="server" Text='<%# Eval("masp") %>' />
                    <br />
                    <span class="auto-style5">Tên sản phẩm</span>:
                    <asp:Label ID="tenspLabel" runat="server" Text='<%# Eval("tensp") %>' />
                    <br />
                    <span class="auto-style5">Giá</span>:
                    <asp:Label ID="giaLabel" runat="server" Text='<%# Eval("gia") %>' />
                    <span class="auto-style5">/</span> <asp:Label ID="dvtLabel" runat="server" Text='<%# Eval("dvt") %>' />
                    <br />
                    <span class="auto-style5">Kích thước</span>:
                    <asp:Label ID="kichthuocLabel" runat="server" Text='<%# Eval("kichthuoc") %>' />
                    <br />
                    <span class="auto-style5">Chất liệu</span>:
                    <asp:Label ID="chatlieuLabel" runat="server" Text='<%# Eval("chatlieu") %>' />
                    <br />
                    <span class="auto-style5">Màu sắc</span>:
                    <asp:Label ID="mausacLabel" runat="server" Text='<%# Eval("mausac") %>' />
                    <br />
                    <span class="auto-style5">Bảo hành</span>:
                    <asp:Label ID="baohanhLabel" runat="server" Text='<%# Eval("baohanh") %>' />
                    <br />
                    <span class="auto-style5">Tình trạng</span>:
                    <asp:Label ID="tinhtrangLabel" runat="server" Text='<%# Eval("tinhtrang") %>' />
                    <br />
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("hinh") %>' />
                    <br />
                    Số lượng:<asp:TextBox ID="txtsl" runat="server" Height="16px" Width="21px">1</asp:TextBox>
                    <asp:Button ID="btnmua" runat="server" CommandName="mua" Text="Chọn mua" />
                    <br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSourceSPNT" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [DMSPNoiThat]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
