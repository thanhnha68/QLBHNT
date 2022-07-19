using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G216PhanThanhNhaDoNoiThat
{
    public partial class FrPhanCong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void chkAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkAll = (CheckBox)GridViewDDH.HeaderRow.FindControl("chkAll");
            foreach (GridViewRow row in GridViewDDH.Rows)
            {
                CheckBox chkrow = (CheckBox)row.FindControl("chkChon");
                if (chkAll.Checked == true)
                {
                    chkrow.Checked = true;
                }
                else
                {
                    chkrow.Checked = false;
                }
            }
        }

        protected void rdoAll_CheckedChanged(object sender, EventArgs e)
        {
            lbName.Text = "DANH SÁCH TẤT CẢ CÁC ĐƠN ĐẶT HÀNG";
            SqlDataSourceDDH.SelectCommand = "SELECT * FROM DonHang";
            btnPhanCong.Visible = false;
        }

        protected void rdoDaPhanCong_CheckedChanged(object sender, EventArgs e)
        {
            lbName.Text = "DANH SÁCH TẤT CẢ CÁC ĐƠN ĐẶT HÀNG ĐÃ PHÂN CÔNG";
            SqlDataSourceDDH.SelectCommand = "SELECT * FROM DonHang WHERE manv IS NOT NULL AND makv IS NOT NULL";
            btnPhanCong.Visible = false;
        }

        protected void rdoChuaPhanCong_CheckedChanged(object sender, EventArgs e)
        {
            lbName.Text = "DANH SÁCH TẤT CẢ CÁC ĐƠN ĐẶT HÀNG CHƯA PHÂN CÔNG";
            SqlDataSourceDDH.SelectCommand = "SELECT * FROM DonHang WHERE manv IS NULL AND makv IS NULL";
            btnPhanCong.Visible = true;
        }

        protected void btnPhanCong_Click(object sender, EventArgs e)
        {
            //B1: ẨN|HIỆN CÁC LABEL, DROPDOWNLIST ... ĐỂ NSD(NV) CHUẨN BỊ PHÂN CÔNG GIAO HÀNG
            lbNV.Visible = !lbNV.Visible;
            lbKV.Visible = !lbKV.Visible;

            DropDownListNV.Visible = !DropDownListNV.Visible;
            DropDownListKV.Visible = !DropDownListKV.Visible;

            btnHuy.Visible = !btnHuy.Visible;
            //GridViewDDH.Columns[0].Visible = !GridViewDDH.Columns[0].Visible;

            //CHỌN TẤT CẢ ĐƠN HÀNG
            if (rdoAll.Checked)
            {
                lbName.Text = "DANH SÁCH TẤT CẢ CÁC ĐƠN ĐẶT HÀNG";
                SqlDataSourceDDH.SelectCommand = "SELECT * FROM DonHang";
            }
            else
            {
                try
                {
                    for (int i = 0; i < GridViewDDH.Rows.Count; i++)
                    {
                        CheckBox chk = (CheckBox)GridViewDDH.Rows[i].Cells[0].FindControl("chkChon");
                        if (chk.Checked)
                        {
                            SqlDataSourceDDH.UpdateCommand = "UPDATE DonHang SET manv = @manv, makv = @makv WHERE (madh = @madh)";

                            //VIẾT LẠI LỆNH UPDATE...KHÔNG WHERE
                            SqlDataSourceDDH.UpdateParameters.Clear();//xóa các tham số cũ
                            SqlDataSourceDDH.UpdateParameters.Add("madh", GridViewDDH.Rows[i].Cells[1].Text);

                            //KHAI BÁO LẠI THAM SỐ CHO UPDATE...
                            SqlDataSourceDDH.UpdateParameters.Add("manv", DropDownListNV.SelectedValue.Trim());
                            SqlDataSourceDDH.UpdateParameters.Add("makv", DropDownListKV.SelectedValue.Trim());

                            //CHẠY LỆNH SQL UPDATE VỚI CÁC THAM SỐ NÊU TRÊN
                            SqlDataSourceDDH.Update();

                            //TẢI DỮ LIỆU LÊN GRIDVIEW
                            GridViewDDH.DataBind();
                            this.Title = "PHÂN CÔNG GIAO HÀNG THÀNH CÔNG!";
                        }
                    }
                }
                catch (System.Exception ex)
                {
                    this.Title = "LỖI PHÂN CÔNG GIAO HÀNG!" + ex.Message;
                }
                btnPhanCong.Text = "Lưu phân công giao hàng";
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            //B1: ẨN CÁC LABEL, DROPDOWNLIST
            lbNV.Visible = false;
            lbKV.Visible = false;

            DropDownListNV.Visible = false;
            DropDownListKV.Visible = false;

            //B2: ẨN NÚT HỦY
            btnHuy.Visible = false;

            //B3: ẨN CHECKBOX
            GridViewDDH.Columns[0].Visible = false;

            //ĐỔI NHÃN BUTTON "LƯU..." => "PHÂN CÔNG..."
            btnPhanCong.Text = "Phân công giao hàng";
        }
    }
}