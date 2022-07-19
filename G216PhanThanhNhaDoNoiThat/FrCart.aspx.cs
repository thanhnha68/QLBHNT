using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace G216PhanThanhNhaDoNoiThat
{
    public partial class FrCart : System.Web.UI.Page
    {
        static DataTable cart = new DataTable();
        /// <summary>
        /// thủ tục tự động chạy mỗi khi page này đc tải lên trình duyệt= tải 'giỏ hàng' lên
        /// nhiệm vụ: nếu đã có giỏ hàng trong sesion thì lấy lên trang, nếu chưa inform rỗng
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cart"] == null)//inform GH rỗng
            {
                lblTitle.Text = "HIỆN TẠI, GIỎ HÀNG ĐANG TRỐNG, XIN MỜI SANG TRANG DANH MỤC NỘI THẤT ĐỂ CHỌN SẢN PHẨM";
                btnBuy.Text = "Chọn mua!";

                GridViewCart.DataSource = null;//xóa trống danh mục sp

                lblSum.Text = "";// xóa tính tiền
                btnOrder.Visible = false;
                btnCancel.Visible = false;
            }
            else //đã có trong session
            {
                lblTitle.Text = "GIỎ HÀNG HIỆN TẠI CỦA QUÝ VỊ NHƯ SAU:";
                btnBuy.Text = "Chọn mua tiếp!";

                //B1: lấy GH từ Session xuống
                cart = Session["cart"] as DataTable; // hoặc can ép kiểu

                //B2: gán GH vào gridviewCart
                GridViewCart.DataSource = cart;

                //B3: tải data lên
                GridViewCart.DataBind();
                //B4: tính toán: sluong + tien
                lblSum.Text = "GIỎ HÀNG HIỆN TẠI CỦA QUÝ VỊ: CÓ " + cart.Compute("Count(masp)", "").ToString() + "SẢN PHẨM, TỔNG TIỀN = " + cart.Compute("Sum(thanhtien)", "").ToString();
                btnOrder.Visible = true;
                btnCancel.Visible = true;
            }// else..if ktra Session rỗng hay ko
        }//page_load 
         //MUA TIẾP OR CHỌN MUA
        protected void btnBuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\Homepage.aspx");
        }

        //HỦY GIỎ HÀNG
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session["cart"] = null; // hủy GH trong session
            //Response.Redirect("~\\Homepage.aspx"); //về homepage C1
            btnBuy_Click(sender, e);// về homepage= gọi thủ tục sự kiện của btn mua tiếp (ID=btnBuy) C2
        }

        //đặt mua giỏ hàng= giỏ hàng ko rỗng
        protected void btnOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrOrder.aspx");
        }//btnOrder_Click
    }//class FrCar
}