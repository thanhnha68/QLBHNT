using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G216PhanThanhNhaDoNoiThat
{
    public partial class FrQLNV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //gọi proc SelectIndextchange kv, => mở page lên 2 bên ddl đều lên tất cả
            DropDownListKV_SelectedIndexChanged(sender, e);
        }//page_load

        //thay đổi lựa chọn cm , kv
        protected void DropDownListKV_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnThem.Enabled = true;//bắt đầu coi như thêm nv đc
            btnThem.ToolTip=DropDownListKV.ToolTip = DropDownListCM.ToolTip = "";
            
            //xử lý các TH lựa chọn 'Tất cả' trên KV or CM
            if(DropDownListKV.SelectedValue.Trim()== "*" && DropDownListCM.SelectedValue.Trim()=="*")// all kv và cm
            {
                SqlDataSourceNV.SelectCommand = "SELECT * FROM NhanVien";
                btnThem.Enabled = false;
                btnThem.ToolTip = DropDownListKV.ToolTip = DropDownListCM.ToolTip = "PHẢI CHỌN KV VÀ CM CỤ THỂ MỚI THÊM NV MỚI ";
            }
            if (DropDownListKV.SelectedValue.Trim() != "*" && DropDownListCM.SelectedValue.Trim() == "*")// all kv (CM cụ thể)
            {
                SqlDataSourceNV.SelectCommand = "SELECT * FROM NhanVien WHERE (macm = @macm)";
                btnThem.Enabled = false;
                btnThem.ToolTip = DropDownListKV.ToolTip = DropDownListCM.ToolTip = "PHẢI CHỌN KV VÀ CM CỤ THỂ MỚI THÊM NV MỚI ";
            }
            if (DropDownListKV.SelectedValue.Trim() == "*" && DropDownListCM.SelectedValue.Trim() != "*")// all cm (kv cụ thể)
            {
                SqlDataSourceNV.SelectCommand = "SELECT * FROM NhanVien WHERE (makv = @makv)";
                btnThem.Enabled = false;
                btnThem.ToolTip = DropDownListKV.ToolTip = DropDownListCM.ToolTip = "PHẢI CHỌN KV VÀ CM CỤ THỂ MỚI THÊM NV MỚI ";
            }
            //hiển thị makv và macm ở kế bên các ddlist
            lblmakv.Text = DropDownListKV.SelectedValue.Trim();
            lblmacm.Text = DropDownListCM.SelectedValue.Trim();
            //loi dan cho ds nv
            lbldan.Text = "Danh sách nhân viên thuộc KV:" + DropDownListKV.SelectedItem.Text + " với CM: " + DropDownListCM.SelectedItem.Text;

        }//DropDownListKV

        protected void btnThem_Click(object sender, EventArgs e)
        {
            //ẩn hiện txt để nhập info nv ms
            lblmanv.Visible = !lblmanv.Visible;
            lbltennv.Visible = !lbltennv.Visible;
            lblngaysinh.Visible = !lblngaysinh.Visible;
            lblsex.Visible = !lblsex.Visible;
            lbldiachi.Visible =! lbldiachi.Visible;
            lblsdt.Visible = !lblsdt.Visible;
            lblemail.Visible = !lblemail.Visible;

            txtmanv.Visible = !txtmanv.Visible;
            txttennv.Visible = !txttennv.Visible;
            CalendarNS.Visible = !CalendarNS.Visible;
            txtsex.Visible = !txtsex.Visible;
            txtdiachi.Visible = !txtdiachi.Visible;
            txtsdt.Visible = !txtsdt.Visible;
            txtemail.Visible = !txtemail.Visible;

            btnHuyThem.Visible = !btnHuyThem.Visible;

            if(btnThem.Text.Trim()== "Tuyển dụng NV mới")
            {
               
                //xóa trống các txt cho nsd nhập
                txtmanv.Text = ""; txtmanv.ToolTip = "KHÔNG ĐỂ TRỐNG MÃ NV, KHÔNG TRÙNG VỚI MÃ NV ĐÃ CÓ";
                //tự cho manv tự động thêm= phân biệt(tự xđ quy luật->sử dụng các chức năng trên MS.SQL)
                txttennv.Text = "";
                
                txtsex.Text = "";
                txtdiachi.Text = "";
                txtsdt.Text = "";
                txtemail.Text = "";

                //đổi nhãn:thêm->lưu
                btnThem.Text = "Lưu thông tin NV mới";
            }
            else
            {
                //thêm nv mới vào db
                try
                {
                    SqlDataSourceNV.Insert();//thêm nv mới vào db=lệnh QUAN TRỌNG 1
                    GridViewNV.DataBind();//tải ds nv sau khi thêm nv mới
                    this.Title = "Thêm NV thành công";//thông báo thêm nv ok
                }catch(System.Exception ex) { this.Title = "Lỗi thêm NV mới =" + ex.Message; }
                //đổi nhãn 
                btnThem.Text = "Tuyển dụng NV mới";
            }
        }//them btnthem nv

        // bắt đầu bàn giao DH CHO NV KHÁC
        protected void GridViewDDH_RowEditing(object sender, GridViewEditEventArgs e)
        {
            lblNVnhanBG.Visible = true;
            DropDownListNVnhanBG.Visible = true;
        }

        protected void GridViewDDH_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            lblNVnhanBG.Visible = false;
            DropDownListNVnhanBG.Visible = false;
        }

        protected void btnHuyThem_Click(object sender, EventArgs e)
        {
            //B1:  ẩn các txt,... nhập infor NV ms
            lblmanv.Visible = false;
            lbltennv.Visible = false;
            lblngaysinh.Visible = false;
            lblsex.Visible = false;
            lbldiachi.Visible = false;
            lblsdt.Visible = false;
            lblemail.Visible = false;

            txtmanv.Visible = false;
            txttennv.Visible = false;
            CalendarNS.Visible = false;
            txtsex.Visible = false;
            txtdiachi.Visible = false;
            txtsdt.Visible = false;
            txtemail.Visible = false;

            //ẩn btn hủy
            btnHuyThem.Visible = false;

            //đổi nhãn btn Them như ban dầu
            btnThem.Text = "Tuyển dụng NV mới";//chuẩn bị thêm mới
        }

        protected void btnQLC_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrManagements.aspx");
        }
    }
}