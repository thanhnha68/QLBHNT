using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G216PhanThanhNhaDoNoiThat
{
    public partial class FrQLCM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            //ẩn hiện txt để nhập info loại NT mới
            lblmaCM.Visible = !lblmaCM.Visible;
            lbltenCM.Visible = !lbltenCM.Visible;
            


            txtmaCM.Visible = !txtmaCM.Visible;
            txttenCM.Visible = !txttenCM.Visible;
            

            btnHuy.Visible = !btnHuy.Visible;

            if (btnThem.Text.Trim() == "Thêm Chuyên Môn")
            {
                //xóa trống các txt cho nsd nhập
                txtmaCM.Text = ""; txtmaCM.ToolTip = "KHÔNG ĐỂ TRỐNG MÃ loại, KHÔNG TRÙNG VỚI MÃ loại ĐÃ CÓ";
                //tự cho manv tự động thêm= phân biệt(tự xđ quy luật->sử dụng các chức năng trên MS.SQL)
                txttenCM.Text = "";
               


                //đổi nhãn:thêm->lưu
                btnThem.Text = "Lưu thông tin Chuyên Môn mới";
            }
            else
            {
                //thêm loaị NT mới vào db
                try
                {
                    SqlDataSourceCM.Insert();//thêm nv mới vào db=lệnh QUAN TRỌNG 1
                    GridViewCM.DataBind();//tải ds nv sau khi thêm nv mới
                    this.Title = "Thêm Chuyên môn thành công";//thông báo thêm nv ok
                }
                catch (System.Exception ex) { this.Title = "Lỗi thêm Chuyên môn mới =" + ex.Message; }
                //đổi nhãn 
                btnThem.Text = "Thêm Chuyên Môn";
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            //B1:  ẩn các txt,... nhập infor CM ms
            lblmaCM.Visible = false;
            lbltenCM.Visible = false;

            txtmaCM.Visible = false;
            txttenCM.Visible = false;

            //ẩn btn hủy
            btnHuy.Visible = false;

            //đổi nhãn btn Them như ban dầu
            btnThem.Text = "Thêm Chuyên Môn";//chuẩn bị thêm mới
        }

        protected void btnQLC_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrManagements.aspx");
        }



        protected void GridViewCM_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnchuyenCM_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrChuyenNhom.aspx");
        }
    }
}