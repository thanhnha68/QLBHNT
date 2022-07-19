using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G216PhanThanhNhaDoNoiThat
{
    public partial class FrQLTH : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            //ẩn hiện txt để nhập info loại NT mới
            lblmaNSX.Visible = !lblmaNSX.Visible;
            lbltenNSX.Visible = !lbltenNSX.Visible;



            txtmaNSX.Visible = !txtmaNSX.Visible;
            txttenNSX.Visible = !txttenNSX.Visible;


            btnHuy.Visible = !btnHuy.Visible;

            if (btnThem.Text.Trim() == "Thêm Nhà Sản Xuất")
            {
                //xóa trống các txt cho nsd nhập
                txtmaNSX.Text = ""; txtmaNSX.ToolTip = "KHÔNG ĐỂ TRỐNG MÃ NSX, KHÔNG TRÙNG VỚI MÃ NSX ĐÃ CÓ";
                //tự cho manv tự động thêm= phân biệt(tự xđ quy luật->sử dụng các chức năng trên MS.SQL)
                txttenNSX.Text = "";



                //đổi nhãn:thêm->lưu
                btnThem.Text = "Lưu thông tin NSX mới";
            }
            else
            {
                //thêm NSX mới vào db
                try
                {
                    SqlDataSourceTH.Insert();//thêm NSX mới vào db=lệnh QUAN TRỌNG 1
                    GridViewNSX.DataBind();//tải ds NSX sau khi thêm NSX mới
                    this.Title = "Thêm NSX thành công";//thông báo thêm nv ok
                }
                catch (System.Exception ex) { this.Title = "Lỗi thêm NSX mới =" + ex.Message; }
                //đổi nhãn 
                btnThem.Text = "Thêm Nhà Sản Xuất";
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            //B1:  ẩn các txt,... nhập infor LOẠI NT ms
            lblmaNSX.Visible = false;
            lbltenNSX.Visible = false;

            txtmaNSX.Visible = false;
            txttenNSX.Visible = false;

            //ẩn btn hủy
            btnHuy.Visible = false;

            //đổi nhãn btn Them như ban dầu
            btnThem.Text = "Thêm Nhà Sản Xuất";//chuẩn bị thêm mới
        }

        protected void btnQLC_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrManagements.aspx");
        }
    }
}