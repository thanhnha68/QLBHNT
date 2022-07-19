using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G216PhanThanhNhaDoNoiThat
{
    public partial class FrQLHH : System.Web.UI.Page
    {
        static string us = "CHƯA BIẾT TÊN";//biến toàn cũ static lưu tên của acc đã login success
                                           //tự động chạy khi trang ql chung này đc tải lên trình duyệt web
                                           //tự động chạy khi trang ql sp nội thất được tải lên trình duyệt
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["LH"] != null) us = Session["LH"] as string; //gán tên acc dn success vào tittle 
            lblTittle.Text = "CHÀO MỪNG " + us + " ĐẾN VỚI TRANG QUẢN LÝ DANH MỤC SẢN PHẨM NỘI THẤT NHÀ XINH";

            //[1] Xử lí. chọn all + [2] hiển thị mã số nhóm
            DropDownListNhom_SelectedIndexChanged(sender, e);

        }//pageload

        //thủ tục ẩn hoặc hiện hình mẫu khi (nv ql) thay đổi chọn checkbox=ckbHinh
        protected void ckbHinh_CheckedChanged(object sender, EventArgs e)
        {
            GridViewMH1.Columns[14].Visible = !GridViewMH1.Columns[14].Visible;//đảo trạng thái ẩn||hiện cột hình
            //CHÚ Ý: nếu sau này GridViewMH có bổ sung thêm hoặc bỏ bớt các cột DL thì phải điều chỉnh chỉ số cột (14) này thành chỉ số tương ứng theo...
        }//checkboxHInh_cCheckChanged

        //thủ tục này chjay khi nsd thay đổi lựa chọn trong dropdownlist
        protected void DropDownListNhom_SelectedIndexChanged(object sender, EventArgs e)
        {
            //[1] Xử lí. chọn all
            if (DropDownListNhom.SelectedValue == "*")//nsd chọn 'Tất cả'
            {
                SqlDataSourceNT.SelectCommand = "SELECT*FROM [DMSPNoiThat]";//VIẾT LẠI LỆNH SELECT
                btnThem.Enabled = false; //ko theem moi khi chon all
                btnThem.ToolTip = DropDownListNhom.ToolTip = "Phải chọn một nhóm cụ thể trước khi thêm mới";//nhắc nhở

            }
            else //nsd đã chọn 1 nhóm cụ thể
            {
                btnThem.Enabled = true;//thêm mới được
                btnThem.ToolTip = DropDownListNhom.ToolTip = "";//ko nhắc nhở
            }
            //[2] hiển thị mã số nhóm
            lblMsNhom.Text = DropDownListNhom.SelectedValue.Trim();
        }//dropdownlistNhom_selectindexchanged

        /// <summary>
        /// thêm sp mới
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnThem_Click(object sender, EventArgs e)
        {
            //B1: hiện ẩn các txt,... nhập infor sp ms cần thêm
            lblmasp.Visible = !lblmasp.Visible;
            lbltensp.Visible = !lbltensp.Visible;
            lblgia.Visible = !lblgia.Visible;
            lbldvt.Visible = !lbldvt.Visible;
            lblkichthuoc.Visible = !lblkichthuoc.Visible;
            lblchatlieu.Visible = !lblchatlieu.Visible;
            lblmausac.Visible = !lblmausac.Visible;
            lblngaysx.Visible = !lblngaysx.Visible;
            lbltuoitho.Visible = !lbltuoitho.Visible;
            lblbaohanh.Visible = !lblbaohanh.Visible;
            lbltinhtrang.Visible = !lbltinhtrang.Visible;
            lblnsx.Visible = !lblnsx.Visible;
            lblmota.Visible = !lblmota.Visible;
            lblhinh.Visible = !lblhinh.Visible;

            txtmasp.Visible = !txtmasp.Visible;
            txttensp.Visible = !txttensp.Visible;
            txtgia.Visible = !txtgia.Visible;
            txtdvt.Visible = !txtdvt.Visible;
            txtkichthuoc.Visible = !txtkichthuoc.Visible;
            txtchatlieu.Visible = !txtchatlieu.Visible;
            txtmausac.Visible = !txtmausac.Visible;
            CalendarNgaySX.Visible = !CalendarNgaySX.Visible;
            txttuoitho.Visible = !txttuoitho.Visible;
            txtbaohanh.Visible = !txtbaohanh.Visible;
            txttinhtrang.Visible = !txttinhtrang.Visible;
            DropDownListNSX.Visible = !DropDownListNSX.Visible;
            txtmota.Visible = !txtmota.Visible;
            FileUploadHinh.Visible = !FileUploadHinh.Visible;

            btnHuy.Visible = !btnHuy.Visible;
            //THÊM_LƯU
            if (btnThem.Text.Trim() == "Thêm sản phẩm mới")//chuẩn bị thêm mới
            {
                //xóa trống all các txt để prepare cho nsd nhập infor sp ms
                txtmasp.Text = "000"; txtmasp.ToolTip = "KHÔNG ĐỂ TRỐNG MÃ SP, KHÔNG NHẬP TRÙNG MÃ SP ĐÃ CÓ!";
                // SV phải tự cho mã sp tự tăng (theo năm, quý, stt); ko nên để nsd nhập
                txttensp.Text = "";
                txtgia.Text = "1"; txtgia.ToolTip = "GIÁ PHẢI >0";
                txtdvt.Text = "";
                txtkichthuoc.Text = "";
                txtchatlieu.Text = "";
                txtmausac.Text = "";
                txttuoitho.Text = "";
                txtbaohanh.Text = "";
                txttinhtrang.Text = "";
                txtmota.Text = "";

                //Đổi nhãn btnThem: thêm->Lưu
                btnThem.Text = "Lưu SP mới";
            }
            else //lưu sp mới vào DB
            {
                try
                {
                    //1.định nghĩa tham số parameters cho InsertCommand: tham số cho field hình có dạng ~\\Images\\tên file hình đc upload.file
                    SqlDataSourceNT.InsertParameters.Clear();
                    SqlDataSourceNT.InsertParameters.Add("masp", txtmasp.Text.Trim());
                    SqlDataSourceNT.InsertParameters.Add("tensp", txttensp.Text);
                    SqlDataSourceNT.InsertParameters.Add("gia", System.Data.DbType.Int32, txtgia.Text.Trim());
                    SqlDataSourceNT.InsertParameters.Add("dvt", txtdvt.Text);
                    SqlDataSourceNT.InsertParameters.Add("kichthuoc", txtkichthuoc.Text);
                    SqlDataSourceNT.InsertParameters.Add("chatlieu", txtchatlieu.Text);
                    SqlDataSourceNT.InsertParameters.Add("mausac", txtmausac.Text);
                    SqlDataSourceNT.InsertParameters.Add("ngaysx", System.Data.DbType.Date, CalendarNgaySX.SelectedDate.ToShortDateString());
                    SqlDataSourceNT.InsertParameters.Add("tuoithotb", txttuoitho.Text);
                    SqlDataSourceNT.InsertParameters.Add("baohanh", txtbaohanh.Text);
                    SqlDataSourceNT.InsertParameters.Add("tinhtrang", txttinhtrang.Text);
                    SqlDataSourceNT.InsertParameters.Add("math", DropDownListNSX.SelectedValue.Trim());
                    SqlDataSourceNT.InsertParameters.Add("mota", txtmota.Text);
                    //SqlDataSourceNT.InsertParameters.Add("hinh", "~\\Media\\" + FileUploadHinh.FileName);//add path của file hình vào db;
                    SqlDataSourceNT.InsertParameters.Add("hinh", "~\\" + FileUploadHinh.FileName);//add path của file hình vào db;

                    SqlDataSourceNT.InsertParameters.Add("maloai", DropDownListNhom.SelectedValue.Trim());

                    //2. chạy lên insert để lưu infor sp mới vào db
                    SqlDataSourceNT.Insert();
                    //3. lưu(copy) hình vừa đc  nsd upload vào thư mục ~\\Images\\của app

                    //offline

                    //FileUploadHinh.SaveAs("D:\\G216PhanThanhNhaDoNoiThat\\G216PhanThanhNhaDoNoiThat\\Media\\" + FileUploadHinh.FileName.Trim());
                    FileUploadHinh.SaveAs("D:\\G216PhanThanhNhaDoNoiThat\\G216PhanThanhNhaDoNoiThat\\" + FileUploadHinh.FileName.Trim());

                    //khi app này đc copy đi nơi khác => thì update lại path này

                    //online
                    //FileUploadHinh.SaveAs("d:\\DZHosts\\LocalUser\\gtwopthnha\\www.furnitureg216ptn.somee.com\\" + FileUploadHinh.FileName.Trim());





                }
                catch (System.Exception ex) { this.Title = "CÓ LỖI THÊM SP MỚI =" + ex.Message; }

                //tải infor mới thêm lên gridview trên web
                GridViewMH1.DataBind();

                //đổi nhãn nút Lưu
                btnThem.Text = "Thêm sản phẩm mới";


            }//else if btnthem
        }//btnThem

        /// <summary>
        /// hủy thêm sp mới
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnHuy_Click(object sender, EventArgs e)
        {//B1:  ẩn các txt,... nhập infor sp ms
            lblmasp.Visible = false;
            lbltensp.Visible = false;
            lblgia.Visible = false;
            lbldvt.Visible = false;
            lblkichthuoc.Visible = false;
            lblchatlieu.Visible = false;
            lblmausac.Visible = false;
            lblngaysx.Visible = false;
            lbltuoitho.Visible = false;
            lblbaohanh.Visible = false;
            lbltinhtrang.Visible = false;
            lblnsx.Visible = false;
            lblmota.Visible = false;
            lblhinh.Visible = false;

            txtmasp.Visible = false;
            txttensp.Visible = false;
            txtgia.Visible = false;
            txtdvt.Visible = false;
            txtkichthuoc.Visible = false;
            txtchatlieu.Visible = false;
            txtmausac.Visible = false;
            CalendarNgaySX.Visible = false;
            txttuoitho.Visible = false;
            txtbaohanh.Visible = false;
            txttinhtrang.Visible = false;
            DropDownListNSX.Visible = false;
            txtmota.Visible = false;
            FileUploadHinh.Visible = false;

            //ẩn btn hủy
            btnHuy.Visible = false;

            //đổi nhãn btn Them như ban dầu
            btnThem.Text = "Thêm sản phẩm mới";//chuẩn bị thêm mới

        }//btnHuy_Click

        static string masp = null;
        protected void GridViewTonKho_SelectedIndexChanged(object sender, EventArgs e)
        {
            masp = GridViewMH1.SelectedRow.Cells[1].Text.Trim();
            Session["masp"] = masp;
            this.Title = masp;
        }

        static int pi = 0;
        protected void GridViewMH1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            pi = e.NewEditIndex;
        }

        protected void GridViewMH1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "chon") // bấm nút chọn trên dòng đang chọn hình từ fileUpload
            {
                string p = ((FileUpload)GridViewMH1.Rows[pi].FindControl("FileUpload1")).FileName.Trim(); // Giữ FileName của hình mà nhân viên vừa chọn
                if (((FileUpload)GridViewMH1.Rows[pi].FindControl("FileUpload1")).FileName.Trim() != "") //NSD (NV) đã chọn file hình, tránh bị mất file hình cũ khi NSD ko chọn hình mới
                {
                    ((TextBox)GridViewMH1.Rows[pi].FindControl("TextBox1")).Text = "~\\\\Media\\\\" + p;
                    ((FileUpload)GridViewMH1.Rows[pi].FindControl("FileUpload1")).SaveAs(MapPath("~\\Media\\" + p));
                    ((FileUpload)GridViewMH1.Rows[pi].FindControl("FileUpload1")).Visible = false; // Ẩn FileUpload
                    ((Button)GridViewMH1.Rows[pi].FindControl("Button1")).Text = "Chọn hình khác";
                }
            }
        }

        protected void btnQLC_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrManagements.aspx");
        }
    }
}