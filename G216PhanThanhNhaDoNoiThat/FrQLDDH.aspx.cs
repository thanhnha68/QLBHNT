using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G216PhanThanhNhaDoNoiThat
{
    public partial class FrQLDDH : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownListKH_SelectedIndexChanged(sender, e);
        }

        protected void DropDownListKH_SelectedIndexChanged(object sender, EventArgs e)
        {
            //xử lý các TH lựa chọn 'Tất cả' trên KV or CM
            if (DropDownListKV.SelectedValue.Trim() == "*" && DropDownListNV.SelectedValue.Trim() == "*" && DropDownListKV.SelectedValue.Trim() == "*")// all kv và cm
            {
                SqlDataSourceNV.SelectCommand = "SELECT * FROM DonHang";
                DropDownListKV.ToolTip = DropDownListNV.ToolTip = DropDownListKH.ToolTip = "PHẢI CHỌN KH, NV VÀ KV CỤ THỂ XỬ LÝ DỮ LIỆU ";
            }
            if (DropDownListKV.SelectedValue.Trim() != "*" && DropDownListKH.SelectedValue.Trim() == "*" && DropDownListKV.SelectedValue.Trim() == "*")// all kv (CM cụ thể)
            {
                SqlDataSourceNV.SelectCommand = "SELECT * FROM DonHang WHERE (makv = @makv)";
                DropDownListKV.ToolTip = DropDownListNV.ToolTip = DropDownListKH.ToolTip = "PHẢI CHỌN KH, NV VÀ KV CỤ THỂ XỬ LÝ DỮ LIỆU ";
            }
            if (DropDownListKV.SelectedValue.Trim() == "*" && DropDownListKH.SelectedValue.Trim() != "*" && DropDownListKV.SelectedValue.Trim() == "*")// all cm (kv cụ thể)
            {
                SqlDataSourceNV.SelectCommand = "SELECT * FROM DonHang WHERE (makh = @makh)";
                DropDownListKV.ToolTip = DropDownListNV.ToolTip = DropDownListKH.ToolTip = "PHẢI CHỌN KH, NV VÀ KV CỤ THỂ XỬ LÝ DỮ LIỆU ";
            }
            if (DropDownListKV.SelectedValue.Trim() == "*" && DropDownListKH.SelectedValue.Trim() == "*" && DropDownListKV.SelectedValue.Trim() != "*")// all cm (kv cụ thể)
            {
                SqlDataSourceNV.SelectCommand = "SELECT * FROM DonHang WHERE (manv = @manv)";
                DropDownListKV.ToolTip = DropDownListNV.ToolTip = DropDownListKH.ToolTip = "PHẢI CHỌN KH, NV VÀ KV CỤ THỂ XỬ LÝ DỮ LIỆU ";
            }
            //hiển thị makv và manv makh ở kế bên các ddlist
            lblmaKV.Text = DropDownListKV.SelectedValue.Trim();
            lblmaNV.Text = DropDownListNV.SelectedValue.Trim();
            lblmaKH.Text = DropDownListKH.SelectedValue.Trim();

        }

        protected void btnQLC_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrManagements.aspx");
        }
    }
}