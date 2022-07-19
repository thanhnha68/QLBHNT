using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G216PhanThanhNhaDoNoiThat
{
    public partial class FrQLCTHD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnQLC_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrManagements.aspx");
        }

        protected void DropDownListDH_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnThem.Enabled = true;//bắt đầu coi như thêm nv đc
            btnThem.ToolTip = DropDownListDH.ToolTip = "";

            //xử lý các TH lựa chọn 'Tất cả' trên KV or CM
            if (DropDownListDH.SelectedValue.Trim() == "*")// all kv và cm
            {
                SqlDataSourceCTHD.SelectCommand = "SELECT * FROM CTDH";
                btnThem.Enabled = false;
                btnThem.ToolTip = DropDownListDH.ToolTip = "PHẢI CHỌN DH VÀ SP CỤ THỂ MỚI THÊM TỒN MỚI ";
            }
            
            
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            //ẩn hiện txt để nhập info nv ms
            lblsl.Visible = !lblsl.Visible;

            txtsl.Visible = !txtsl.Visible;

            

            btnHuy.Visible = !btnHuy.Visible;

            if (btnThem.Text.Trim() == "Thêm CTDH mới")
            {
                //xóa trống các txt cho nsd nhập
                txtsl.Text = ""; 

                //đổi nhãn:thêm->lưu
                btnThem.Text = "Lưu thông tin CTDH mới";
            }
            else
            {
                //thêm nv mới vào db
                try
                {
                    SqlDataSourceCTHD.Insert();//thêm nv mới vào db=lệnh QUAN TRỌNG 1
                    GridViewCTDH.DataBind();//tải ds nv sau khi thêm nv mới
                    this.Title = "Thêm CTDH mới";//thông báo thêm nv ok
                }
                catch (System.Exception ex) { this.Title = "Lỗi thêm CTDH mới =" + ex.Message; }
                //đổi nhãn 
                btnThem.Text = "Thêm CTDH mới";
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            //B1:  ẩn các txt,... nhập infor NV ms
            lblsl.Visible = false;

            txtsl.Visible = false;

            //ẩn btn hủy
            btnHuy.Visible = false;

            //đổi nhãn btn Them như ban dầu
            btnThem.Text = "Thêm CTDH mới";//chuẩn bị thêm mới
        }
    }
}