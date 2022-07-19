<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FrQLCTHD.aspx.cs" Inherits="G216PhanThanhNhaDoNoiThat.FrQLCTHD" %>
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
                <asp:Label ID="lblTitle" runat="server" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN LÝ CHI TIẾT ĐƠN ĐẶT HÀNG" Font-Bold="True" Font-Size="Medium" ForeColor="#FF6600"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Chọn mã đơn hàng: "></asp:Label>
                <asp:DropDownList ID="DropDownListDH" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceDH" DataTextField="madh" DataValueField="madh" OnSelectedIndexChanged="DropDownListDH_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceDH" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [DonHang]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Chọn sản phẩm: "></asp:Label>
                <asp:DropDownList ID="DropDownListSP" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceSP" DataTextField="tensp" DataValueField="masp">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceSP" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" SelectCommand="SELECT * FROM [DMSPNoiThat]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label3" runat="server" Text="DANH SÁCH CÁC CHI TIẾT ĐƠN ĐẶT HÀNG CỦA KHÁCH HÀNG"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnThem" runat="server" Text="Thêm SP khuyến mãi" OnClick="btnThem_Click" />
&nbsp;
                <asp:Label ID="lblsl" runat="server" Text="Số lượng: "></asp:Label>
                <asp:TextBox ID="txtsl" runat="server"></asp:TextBox>
&nbsp;
                <asp:Button ID="btnHuy" runat="server" Text="Hủy" OnClick="btnHuy_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewCTDH" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="madh,masp" DataSourceID="SqlDataSourceCTHD" ForeColor="Black" GridLines="Horizontal">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="madh" HeaderText="Mã đơn hàng" ReadOnly="True" SortExpression="madh" />
                        <asp:BoundField DataField="masp" HeaderText="Mã SP" ReadOnly="True" SortExpression="masp" />
                        <asp:BoundField DataField="sl" HeaderText="Số lượng" SortExpression="sl" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField DeleteText="Hủy CTDH" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceCTHD" runat="server" ConnectionString="<%$ ConnectionStrings:1G216PTNhaDoNoiThatOnlineConnectionString %>" DeleteCommand="DELETE FROM CTDH WHERE (madh = @madh) AND (masp = @masp)" InsertCommand="INSERT INTO CTDH(madh, masp, sl) VALUES (@madh, @masp, @sl)" SelectCommand="SELECT * FROM [CTDH] WHERE (([madh] = @madh) AND ([masp] = @masp))" UpdateCommand="UPDATE CTDH SET sl = @sl, masp = @masp WHERE (madh = @madh)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewCTDH" Name="madh" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewCTDH" Name="masp" PropertyName="SelectedValue[2]" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="DropDownListDH" Name="madh" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSP" Name="masp" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtsl" Name="sl" PropertyName="Text" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListDH" Name="madh" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="DropDownListSP" Name="masp" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewCTDH" DbType="Int32" Name="sl" PropertyName="SelectedValue[3]" />
                        <asp:ControlParameter ControlID="GridViewCTDH" Name="masp" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="GridViewCTDH" Name="madh" PropertyName="SelectedValue[1]" />
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
