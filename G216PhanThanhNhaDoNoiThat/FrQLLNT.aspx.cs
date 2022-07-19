using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G216PhanThanhNhaDoNoiThat
{
    public partial class QLLNT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            //ẩn hiện txt để nhập info loại NT mới
            lblmaL.Visible = !lblmaL.Visible;
            lbltenL.Visible = !lbltenL.Visible;
            lblmota.Visible = !lblmota.Visible;
            

            txtmaL.Visible = !txtmaL.Visible;
            txttenL.Visible = !txttenL.Visible;
            txtmota.Visible = !txtmota.Visible;

            btnHuy.Visible = !btnHuy.Visible;

            if (btnThem.Text.Trim() == "Thêm loại Nội Thất")
            {
                //xóa trống các txt cho nsd nhập
                txtmaL.Text = ""; txtmaL.ToolTip = "KHÔNG ĐỂ TRỐNG MÃ loại, KHÔNG TRÙNG VỚI MÃ loại ĐÃ CÓ";
                //tự cho manv tự động thêm= phân biệt(tự xđ quy luật->sử dụng các chức năng trên MS.SQL)
                txttenL.Text = "";
                txtmota.Text = "";
                

                //đổi nhãn:thêm->lưu
                btnThem.Text = "Lưu thông tin Loại NT mới";
            }
            else
            {
                //thêm loaị NT mới vào db
                try
                {
                    SqlDataSourceLoaiNT.Insert();//thêm nv mới vào db=lệnh QUAN TRỌNG 1
                    GridViewLoaiNT.DataBind();//tải ds nv sau khi thêm nv mới
                    this.Title = "Thêm Loại NT thành công";//thông báo thêm nv ok
                }
                catch (System.Exception ex) { this.Title = "Lỗi thêm Loại NT mới =" + ex.Message; }
                //đổi nhãn 
                btnThem.Text = "Thêm loại Nội Thất";
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            //B1:  ẩn các txt,... nhập infor LOẠI NT ms
            lblmaL.Visible = false;
            lbltenL.Visible = false;
            lblmota.Visible = false;

            txtmaL.Visible = false;
            txttenL.Visible = false;
            txtmota.Visible = false;

            //ẩn btn hủy
            btnHuy.Visible = false;

            //đổi nhãn btn Them như ban dầu
            btnThem.Text = "Thêm loại Nội Thất";//chuẩn bị thêm mới
        }

        protected void btnQLC_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrManagements.aspx");
        }


        protected void btnChuyennhom_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrChuyenNhom.aspx");
        }
    }
}