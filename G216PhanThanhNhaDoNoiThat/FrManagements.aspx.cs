using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G216PhanThanhNhaDoNoiThat
{
    public partial class FrManagements : System.Web.UI.Page
    {
        static string us = "CHƯA BIẾT TÊN";//biến toàn cũ static lưu tên của acc đã login success
        //tự động chạy khi trang ql chung này đc tải lên trình duyệt web
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LH"] != null)
                us = Session["LH"] as string; //gán tên acc dn success vào tittle 
            lblTitle.Text = "CHÀO MỪNG " + us + " ĐẾN VỚI TRANG TẬP HỢP CÁC CHỨC NĂNG QUẢN LÝ CỦA HỆ THỐNG NỘI THẤT NHÀ XINH, 19DTH3, G2";
        }

        //gọi trang ql danh mục sp nội thất
        protected void btnMH_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrQLHH.aspx");
        }//btn gọi dmsp_click

        //goi trang qlnv
        protected void btnNV_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrQLNV.aspx");
        }//qlnv_click
    
        //goi trang qlloại nt
        protected void btnNhomMH_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrQLLNT.aspx");
        }//qlloaint

        protected void btnCM_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrQLCM.aspx");
        }//btnCM_Click

        protected void btnThuongHieu_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrQLNSX.aspx");
        }

        protected void btnChuyennhom_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrChuyenNhom.aspx");
        }

        protected void btnKho_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrQLKho.aspx");
        }

        protected void btnKH_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrQLKH.aspx");
        }

        protected void btnDonHang_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrQLDDH.aspx");
        }


        protected void btnDDH_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrQLDDH.aspx");
        }

        protected void btnCTDDH_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrQLCTHD.aspx");
        }

        protected void btnNhapXuat_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrQLNhapXuat.aspx");
        }

        protected void btnKV_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrQLKV.aspx");
        }

        protected void btnPhanCongGH_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrPhanCong.aspx");
        }
    }
}