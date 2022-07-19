using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G216PhanThanhNhaDoNoiThat
{
    public partial class FrChuyenNhom : System.Web.UI.Page
    {
        static string us = "CHƯA BIẾT TÊN";//biến toàn cục(static) lưu tên account đã login thành công
        /// TỰ ĐỘNG CHẠY KHI TRANG QUẢN LÝ DANH MỤC XE MÁY NÀY ĐƯỢC TẢI LÊ CÁC TRÌNH DUYÊT WEB
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["dn"] != null) us = Session["dn"] as string;//gán tên acc đã đăng nhập thành công (nếu có)
            lblTitle.Text = "WELCOME " + us + "ĐẾN VỚI TRANG QUẢN LÝ CHUYỂN NHÓM LOẠI NỘI THẤT NHÀ XINH";//lỜI CHÀO

            DropDownListLoaiNguon_SelectedIndexChanged(sender, e);
        }
        /// <summary>
        /// CHUYỂN SP SANG LOẠI KHÁC
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DropDownListLoaiNguon_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListLoaiNguon.SelectedValue.Trim() == DropDownListLoaiDich.SelectedValue.Trim())
            // 2 Bên đã chọn giống nhau
            {
                btnLR.Enabled = false;
                btnRL.Enabled = false;
                btnLAR.Enabled = false;
                btnRAL.Enabled = false;
                DropDownListLoaiNguon.ToolTip = DropDownListLoaiDich.ToolTip = "2 Bên phải chọn KHÁC nhau thì mới CHUYỂN được";

            }
            else
            {
                btnLR.Enabled = true;
                btnRL.Enabled = true;
                btnLAR.Enabled = true;
                btnRAL.Enabled = true;
                DropDownListLoaiNguon.ToolTip = DropDownListLoaiDich.ToolTip = "";

            }
        }

        protected void btnLR_Click(object sender, EventArgs e)
        {
            SqlDataSourceSPN.Update();
            ListBoxLoaiNguon.DataBind();
            ListBoxLoaiDich.DataBind();
        }

        protected void btnRL_Click(object sender, EventArgs e)
        {
            SqlDataSourceSPD.Update();
            ListBoxLoaiNguon.DataBind();
            ListBoxLoaiDich.DataBind();
        }

        protected void btnLAR_Click(object sender, EventArgs e)
        {
            SqlDataSourceSPN.UpdateCommand = "UPDATE DMSPNoiThat SET maloai = @maloai WHERE (maloai = @maloain)";
            //Viết lại lệnh Update....không Where..
            SqlDataSourceSPN.UpdateParameters.Clear();  //Xóa các tham số cũ
            SqlDataSourceSPN.UpdateParameters.Add("maloai", DropDownListLoaiDich.SelectedValue.Trim());
            //Khai báo lại tham số cho Update... 
            SqlDataSourceSPN.UpdateParameters.Add("maloain", DropDownListLoaiNguon.SelectedValue.Trim());
            SqlDataSourceSPN.Update(); // gọi Update() bên Nguồn (N) đề chuyển 
            ListBoxLoaiNguon.DataBind();//Tải DL sau Update lên Source        
            ListBoxLoaiDich.DataBind();//Tải DL sau Update lên Destination
        }

        protected void btnRAL_Click(object sender, EventArgs e)
        {
            SqlDataSourceSPD.UpdateCommand = "UPDATE DMSPNoiThat SET maloai = @maloai WHERE (maloai = @maloaid)";
            //Viết lại lệnh Update....không Where..
            SqlDataSourceSPD.UpdateParameters.Clear();  //Xóa các tham số cũ
            SqlDataSourceSPD.UpdateParameters.Add("maloai", DropDownListLoaiNguon.SelectedValue.Trim());
            //Khai báo lại tham số cho Update... 
            SqlDataSourceSPD.UpdateParameters.Add("maloaid", DropDownListLoaiDich.SelectedValue.Trim());
            SqlDataSourceSPD.Update(); // gọi Update() bên Nguồn (N) đề chuyển 
            ListBoxLoaiNguon.DataBind();//Tải DL sau Update lên Source        
            ListBoxLoaiDich.DataBind();//Tải DL sau Update lên Destination
        }

        protected void btnQuayLai_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrQLLNT.aspx");
        }

        protected void btnQLCHUNG_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrManagements.aspx");
        }


        /// <summary>
        /// CHUYỂN NHÂN VIÊN SANG CHUYÊN MÔN KHÁC
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DropDownListCMNguon_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListCMNguon.SelectedValue.Trim() == DropDownListCMDich.SelectedValue.Trim())
            // 2 Bên đã chọn giống nhau
            {
                btnLR0.Enabled = false;
                btnRL0.Enabled = false;
                btnLAR0.Enabled = false;
                btnRAL0.Enabled = false;
                DropDownListCMNguon.ToolTip = DropDownListCMDich.ToolTip = "2 Bên phải chọn KHÁC nhau thì mới CHUYỂN được";

            }
            else
            {
                btnLR0.Enabled = true;
                btnRL0.Enabled = true;
                btnLAR0.Enabled = true;
                btnRAL0.Enabled = true;
                DropDownListCMNguon.ToolTip = DropDownListCMDich.ToolTip = "";

            }
        }

        protected void DropDownListCMDich_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnLR0_Click(object sender, EventArgs e)
        {
            SqlDataSourceNVNguon.Update();
            DropDownListCMNguon.DataBind();
            DropDownListCMDich.DataBind();
        }

        protected void btnRL0_Click(object sender, EventArgs e)
        {
            SqlDataSourceNVDich.Update();
            DropDownListCMNguon.DataBind();
            DropDownListCMDich.DataBind();
        }

        protected void btnLAR0_Click(object sender, EventArgs e)
        {
            SqlDataSourceNVNguon.UpdateCommand = "UPDATE NhanVien SET macm = @macm WHERE (macm = @macmn)";
            //Viết lại lệnh Update....không Where..
            SqlDataSourceNVNguon.UpdateParameters.Clear();  //Xóa các tham số cũ
            SqlDataSourceNVNguon.UpdateParameters.Add("macm", DropDownListLoaiDich.SelectedValue.Trim());
            //Khai báo lại tham số cho Update... 
            SqlDataSourceNVNguon.UpdateParameters.Add("macmn", DropDownListLoaiNguon.SelectedValue.Trim());
            SqlDataSourceNVNguon.Update(); // gọi Update() bên Nguồn (N) đề chuyển 
            ListBoxNVNguon.DataBind();//Tải DL sau Update lên Source        
            ListBoxNVDich.DataBind();//Tải DL sau Update lên Destination
        }

        protected void btnRAL0_Click(object sender, EventArgs e)
        {
            SqlDataSourceNVDich.UpdateCommand = "UPDATE NhanVien SET macm = @macm WHERE (macm = @macmd)";
            //Viết lại lệnh Update....không Where..
            SqlDataSourceNVDich.UpdateParameters.Clear();  //Xóa các tham số cũ
            SqlDataSourceNVDich.UpdateParameters.Add("macm", DropDownListLoaiNguon.SelectedValue.Trim());
            //Khai báo lại tham số cho Update... 
            SqlDataSourceNVDich.UpdateParameters.Add("macmd", DropDownListLoaiDich.SelectedValue.Trim());
            SqlDataSourceNVDich.Update(); // gọi Update() bên Nguồn (N) đề chuyển 
            ListBoxNVNguon.DataBind();//Tải DL sau Update lên Source        
            ListBoxNVDich.DataBind();//Tải DL sau Update lên Destination
        }

        protected void btnQuayLaiCM_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrQLCM.aspx");
        }

        protected void DropDownListKhoNguon_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListKhoNguon.SelectedValue.Trim() == DropDownListKhoDich.SelectedValue.Trim())
            // 2 Bên đã chọn giống nhau
            {
                btnLR1.Enabled = false;
                btnRL1.Enabled = false;
                btnLAR1.Enabled = false;
                btnRAL1.Enabled = false;
                DropDownListKhoNguon.ToolTip = DropDownListKhoDich.ToolTip = "2 Bên phải chọn KHÁC nhau thì mới CHUYỂN được";

            }
            else
            {
                btnLR1.Enabled = true;
                btnRL1.Enabled = true;
                btnLAR1.Enabled = true;
                btnRAL1.Enabled = true;
                DropDownListKhoNguon.ToolTip = DropDownListKhoDich.ToolTip = "";

            }
        }

        protected void btnLR1_Click(object sender, EventArgs e)
        {
            SqlDataSourceSPKhoN.Update();
            ListBoxSPKhoN.DataBind();
            ListBoxSPKhoD.DataBind();
        }

        protected void btnRL1_Click(object sender, EventArgs e)
        {
            SqlDataSourceSPKhoD.Update();
            ListBoxSPKhoN.DataBind();
            ListBoxSPKhoD.DataBind();
        }

        protected void btnLAR1_Click(object sender, EventArgs e)
        {
            SqlDataSourceSPKhoN.UpdateCommand = "UPDATE HangTon SET makho = @makho WHERE (makho = @makhon)";
            //Viết lại lệnh Update....không Where..
            SqlDataSourceSPKhoN.UpdateParameters.Clear();  //Xóa các tham số cũ
            SqlDataSourceSPKhoN.UpdateParameters.Add("makho", DropDownListLoaiDich.SelectedValue.Trim());
            //Khai báo lại tham số cho Update... 
            SqlDataSourceSPKhoN.UpdateParameters.Add("makhon", DropDownListLoaiNguon.SelectedValue.Trim());
            SqlDataSourceSPKhoN.Update(); // gọi Update() bên Nguồn (N) đề chuyển 
            ListBoxSPKhoN.DataBind();//Tải DL sau Update lên Source        
            ListBoxSPKhoD.DataBind();//Tải DL sau Update lên Destination
        }
        protected void btnRAL1_Click(object sender, EventArgs e)
        {
            SqlDataSourceSPKhoD.UpdateCommand = "UPDATE HangTon SET makho = @makho WHERE (makho = @makhod)";
            //Viết lại lệnh Update....không Where..
            SqlDataSourceSPKhoD.UpdateParameters.Clear();  //Xóa các tham số cũ
            SqlDataSourceSPKhoD.UpdateParameters.Add("makho", DropDownListLoaiNguon.SelectedValue.Trim());
            //Khai báo lại tham số cho Update... 
            SqlDataSourceSPKhoD.UpdateParameters.Add("makhod", DropDownListLoaiDich.SelectedValue.Trim());
            SqlDataSourceSPKhoD.Update(); // gọi Update() bên Nguồn (N) đề chuyển 
            ListBoxSPKhoN.DataBind();//Tải DL sau Update lên Source        
            ListBoxSPKhoD.DataBind();//Tải DL sau Update lên Destination
        }

        protected void btnQuayLaiCM0_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrQLKho.aspx");
        }

        protected void btnChuyenLoai_Click(object sender, EventArgs e)
        {
            //hiện lbl, txt chuyển loại
            lblTitleLNT.Visible = true;
            lblloainguon.Visible = true;
            lblloaidich.Visible = true;
            DropDownListLoaiNguon.Visible = true;
            DropDownListLoaiDich.Visible = true;
            lblloainguon0.Visible = true;
            lblloainguon1.Visible = true;
            ListBoxLoaiNguon.Visible = true;
            ListBoxLoaiDich.Visible = true;
            btnQuayLai.Visible = true;
            btnLR.Visible = true;
            btnRL.Visible = true;
            btnLAR.Visible = true;
            btnRAL.Visible = true;
            
        }

        protected void btnChuyenCM_Click(object sender, EventArgs e)
        {
            //hiện lbl, txt chuyển loại
            lblTitleLNT0.Visible = true;
            lblCMN.Visible = true;
            lblCMD.Visible = true;
            DropDownListCMNguon.Visible = true;
            DropDownListCMDich.Visible = true;
            lblNVnguon.Visible = true;
            lblNVdich.Visible = true;
            ListBoxNVNguon.Visible = true;
            ListBoxNVDich.Visible = true;
            btnQuayLaiCM.Visible = true;
            btnLR0.Visible = true;
            btnRL0.Visible = true;
            btnLAR0.Visible = true;
            btnRAL0.Visible = true;
        }

        protected void btnChuyenKho_Click(object sender, EventArgs e)
        {
            //hiện lbl, txt chuyển loại
            lblTitleLNT1.Visible = true;
            lblKhoN.Visible = true;
            lblKhoĐ.Visible = true;
            DropDownListKhoNguon.Visible = true;
            DropDownListKhoDich.Visible = true;
            lblSPKhoN.Visible = true;
            lblKhoĐ.Visible = true;
            ListBoxSPKhoN.Visible = true;
            ListBoxSPKhoD.Visible = true;
            btnQuayLaiKho.Visible = true;
            btnLR1.Visible = true;
            btnRL1.Visible = true;
            btnLAR1.Visible = true;
            btnRAL1.Visible = true;
        }
    }
}