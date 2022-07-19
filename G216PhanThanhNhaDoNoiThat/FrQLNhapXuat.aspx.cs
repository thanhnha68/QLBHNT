using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G216PhanThanhNhaDoNoiThat
{
    public partial class FrQLNhapXuat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownListKho_SelectedIndexChanged(sender, e);

        }

        protected void DropDownListKho_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnThem.Enabled = true;//bắt đầu coi như thêm nv đc
            btnThem.ToolTip = DropDownListKho.ToolTip = DropDownListSP.ToolTip = "";

            //xử lý các TH lựa chọn 'Tất cả' trên KV or CM
            if (DropDownListSP.SelectedValue.Trim() == "*" && DropDownListKho.SelectedValue.Trim() == "*")// all kv và cm
            {
                SqlDataSourceHT.SelectCommand = "SELECT * FROM HangTon";
                btnThem.Enabled = false;
                btnThem.ToolTip = DropDownListKho.ToolTip = DropDownListSP.ToolTip = "PHẢI CHỌN KHO VÀ SP CỤ THỂ MỚI THÊM NV MỚI ";
            }
            if (DropDownListSP.SelectedValue.Trim() == "*" && DropDownListKho.SelectedValue.Trim() != "*")// all kv (CM cụ thể)
            {
                SqlDataSourceHT.SelectCommand = "SELECT * FROM HangTon WHERE (makho = @makho)";
                btnThem.Enabled = false;
                btnThem.ToolTip = DropDownListKho.ToolTip = DropDownListSP.ToolTip = "PHẢI CHỌN KHO VÀ SP CỤ THỂ MỚI THÊM NV MỚI ";
            }
            if (DropDownListSP.SelectedValue.Trim() != "*" && DropDownListKho.SelectedValue.Trim() == "*")// all cm (kv cụ thể)
            {
                SqlDataSourceHT.SelectCommand = "SELECT * FROM HangTon WHERE (masp = @masp)";
                btnThem.Enabled = false;
                btnThem.ToolTip = DropDownListKho.ToolTip = DropDownListSP.ToolTip = "PHẢI CHỌN KHO VÀ SP CỤ THỂ MỚI THÊM NV MỚI ";
            }
            
        }
        static TextBox slton;
        protected void btnThem_Click(object sender, EventArgs e)
        {
            slton = txtsl;
            lblsl.Visible = !lblsl.Visible;
            txtsl.Visible = !txtsl.Visible;

            btnHuy.Visible = !btnHuy.Visible;
            if(btnThem.Text.Trim()== "Thêm TỒN mới")
            {
                txtsl.Text = "";
                btnThem.Text = "Lưu TỒN mới";
            }
            else
            {
                //if(GridViewHT.Rows.Count==1)
                //{
                    try
                    {
                        SqlDataSourceHT.InsertParameters.Add("masp", DropDownListSP.SelectedValue.ToString());
                        SqlDataSourceHT.InsertParameters.Add("makho", DropDownListKho.SelectedValue.ToString());
                        SqlDataSourceHT.UpdateParameters.Add("slton", System.Data.DbType.Int32,txtsl.Text.Trim());
                       // SqlDataSourceCTDH.InsertParameters.Add("sl", DbType.Int32, r["sl"].ToString().Trim())
                        SqlDataSourceHT.Update();
                        GridViewHT.DataBind();
                        this.Title = "Đã thêm xong";
                        btnThem.Text = "Thêm TỒN mới";

                    }catch(Exception ex) { this.Title = ex.Message; }
                }

            }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            lblsl.Visible = false;
            

            txtsl.Visible = false;
            

            //ẩn btn hủy
            btnHuy.Visible = false;

            //đổi nhãn btn Them như ban dầu
            btnThem.Text = "Thêm TỒN mới";//chuẩn bị thêm mới
        }

        protected void btnChuyenKho_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrChuyenNhom.aspx");
        }
    }
}