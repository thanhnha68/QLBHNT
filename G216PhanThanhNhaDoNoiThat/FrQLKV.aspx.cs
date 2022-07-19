using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G216PhanThanhNhaDoNoiThat
{
    public partial class FrQLKV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnQLC_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrManagements.aspx");
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            //ẩn hiện txt để nhập info loại NT mới
            lblmaKV.Visible = !lblmaKV.Visible;
            lbltenKV.Visible = !lbltenKV.Visible;
            


            txtmaKV.Visible = !txtmaKV.Visible;
            txttenKV.Visible = !txttenKV.Visible;
            

            btnHuy.Visible = !btnHuy.Visible;

            if (btnThem.Text.Trim() == "Thêm Khu Vực")
            {
                //xóa trống các txt cho nsd nhập
                txtmaKV.Text = ""; txtmaKV.ToolTip = "KHÔNG ĐỂ TRỐNG MÃ KHU VỰC, KHÔNG TRÙNG VỚI MÃ KHU VỰC ĐÃ CÓ";
                //tự cho manv tự động thêm= phân biệt(tự xđ quy luật->sử dụng các chức năng trên MS.SQL)
                txttenKV.Text = "";
                


                //đổi nhãn:thêm->lưu
                btnThem.Text = "Lưu thông tin KHU VỰC mới";
            }
            else
            {
                //thêm loaị NT mới vào db
                try
                {
                    SqlDataSourceKV.Insert();//thêm KV mới vào db=lệnh QUAN TRỌNG 1
                    GridViewKV.DataBind();//tải ds nv sau khi thêm nv mới
                    this.Title = "Thêm KHU VỰC thành công";//thông báo thêm nv ok
                }
                catch (System.Exception ex) { this.Title = "Lỗi thêm KHU VỰC mới =" + ex.Message; }
                //đổi nhãn 
                btnThem.Text = "Thêm Khu Vực";
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            //B1:  ẩn các txt,... nhập infor LOẠI NT ms
            lblmaKV.Visible = false;
            lbltenKV.Visible = false;
            

            txtmaKV.Visible = false;
            txttenKV.Visible = false;
            

            //ẩn btn hủy
            btnHuy.Visible = false;

            //đổi nhãn btn Them như ban dầu
            btnThem.Text = "Thêm Khu Vực";//chuẩn bị thêm mới
        }

        protected void btnChuyenNV_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrChuyenNhom.aspx");
        }
    }
}