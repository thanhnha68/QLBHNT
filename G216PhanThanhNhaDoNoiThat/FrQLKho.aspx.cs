using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G216PhanThanhNhaDoNoiThat
{
    public partial class FrKho : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownListKV_SelectedIndexChanged(sender, e);
        }

        protected void DropDownListKV_SelectedIndexChanged(object sender, EventArgs e)
        {
            //[1] Xử lí. chọn all
            if (DropDownListKV.SelectedValue == "*")//nsd chọn 'Tất cả'
            {
                SqlDataSourceKho.SelectCommand = "SELECT*FROM [Kho]";//VIẾT LẠI LỆNH SELECT
                btnThem.Enabled = false; //ko them moi khi chon all
                btnThem.ToolTip = DropDownListKV.ToolTip = "Phải chọn khu vực cụ thể trước khi thêm mới";//nhắc nhở

            }
            else //nsd đã chọn 1 nhóm cụ thể
            {
                btnThem.Enabled = true;//thêm mới được
                btnThem.ToolTip = DropDownListKV.ToolTip = "";//ko nhắc nhở
            }
            //[2] hiển thị mã số nhóm
            lblmakv.Text = DropDownListKV.SelectedValue.Trim();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            //B1: hiện ẩn các txt,... nhập infor kho ms cần thêm
            lblmaKho.Visible = !lblmaKho.Visible;
            lbltenKho.Visible = !lbltenKho.Visible;
            lblDiachi.Visible = !lblDiachi.Visible;
            lblSDT.Visible = !lblSDT.Visible;
            lblSucchua.Visible = !lblSucchua.Visible;
            lblControng.Visible = !lblControng.Visible;
            

            txtmaKho.Visible = !txtmaKho.Visible;
            txttenKho.Visible = !txttenKho.Visible;
            txtDiaChi.Visible = !txtDiaChi.Visible;
            txtSDT.Visible = !txtSDT.Visible;
            txtSucchua.Visible = !txtSucchua.Visible;
            txtControng.Visible = !txtControng.Visible;

            btnHuy.Visible = !btnHuy.Visible;
            //THÊM_LƯU
            if (btnThem.Text.Trim() == "Thêm kho mới")//chuẩn bị thêm mới
            {
                //xóa trống all các txt để prepare cho nsd nhập infor sp ms
                txtmaKho.Text = "000"; txtmaKho.ToolTip = "KHÔNG ĐỂ TRỐNG MÃ KHO, KHÔNG NHẬP TRÙNG MÃ KHO ĐÃ CÓ!";
                // SV phải tự cho mã sp tự tăng (theo năm, quý, stt); ko nên để nsd nhập
                txttenKho.Text = "";
                txtDiaChi.Text = ""; 
                txtSDT.Text = "";
                txtSucchua.Text = "";
                txtControng.Text = "";
                

                //Đổi nhãn btnThem: thêm->Lưu
                btnThem.Text = "Lưu kho mới";
            }
            else //lưu kho mới vào DB
            {
                try
                {
                    SqlDataSourceKho.Insert();//thêm kho mới vào db=lệnh QUAN TRỌNG 1
                    GridViewKho.DataBind();//tải ds nv sau khi thêm nv mới
                    this.Title = "Thêm Kho mới thành công";//thông báo thêm nv ok
                }
                catch (System.Exception ex) { this.Title = "Lỗi thêm Kho mới =" + ex.Message; }
                //đổi nhãn 
                btnThem.Text = "Thêm kho mới";


            }//else if btnthem
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            //B1:  ẩn các txt,... nhập infor sp ms
            lblmaKho.Visible = false;
            lbltenKho.Visible = false;
            lblDiachi.Visible = false;
            lblSDT.Visible = false;
            lblSucchua.Visible = false;
            lblControng.Visible = false;

            txtmaKho.Visible = false;
            txttenKho.Visible = false;
            txtDiaChi.Visible = false;
            txtSDT.Visible = false;
            txtSucchua.Visible = false;
            txtControng.Visible = false;

            //ẩn btn hủy
            btnHuy.Visible = false;

            //đổi nhãn btn Them như ban dầu
            btnThem.Text = "Thêm kho mới";//chuẩn bị thêm mới
        }

        protected void btnQLC_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrManagements.aspx");
        }


        protected void btnChuyenKho_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrChuyenNhom.aspx");
        }
    }
}