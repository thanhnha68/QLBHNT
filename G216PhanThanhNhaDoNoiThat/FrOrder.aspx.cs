using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace G216PhanThanhNhaDoNoiThat
{
    public partial class FrOrder : System.Web.UI.Page
    {
        static DataTable cart = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }//Page_Load

        //chọn KH trong dskh tìm thấy
        static int vt = 0; //vị trí chọn kh nếu ko chọn = mặc định là vị trí KH đầu tiên : vt=0
        protected void GridViewKH_SelectedIndexChanged(object sender, EventArgs e)
        {
            vt = GridViewKH.SelectedIndex;//xác định vị trí KH đc chọn trong biến toàn cục vt
            

        }
        /// <summary>
        /// [1] tìm KH+ [2] nếu chưa có thì thêm KH mới + [3] lưu info KH mới + [4] chọn KH
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>

        protected void btntimKH_Click(object sender, EventArgs e)
        {
            btnHuyTimKH.Visible = true; //cho phép hủy tìm lại( bất cứ lúc nào) mặc định visible = false

            if(btntimKH.Text.Trim() == "Tìm KH")//[1] TÌM KH
            {
                GridViewKH.DataBind();//tải dl kh lên theo dk/ select...
                if(GridViewKH.Rows.Count<1)//ko tìm thấy KH như txttimKH nhập => thêm kh mới
                {
                    btntimKH.Text = "Thêm KH mới";
                }
                else //tìm thấy ít nhất 1 kh có khả năng từ 2 KH trở lên => chọn kh
                {
                    btntimKH.Text = "Chọn KH";//đc chọn = xử lí ở dưới
                   // txttimKH.Text = GridViewKH.Rows[0].Cells[1].Text.Trim();//tạm gán kh đầu tiên tìm thấy rows[0] vào txtmaKH mới; cột: mã kh=> phòng khi NSD ko chọn KH trong ds 
                }///else..iff rows<0
            }
            else if(btntimKH.Text.Trim()== "Thêm KH mới")//[2] Nhập KH mới
            {
                //2.1hiển thị các ô nhập info kh ms
                lblTTKHM.Visible = true;
                lblmakh.Visible = true;
                lbltenkh.Visible = true;
                lbldiachi.Visible = true;
                lblsdt.Visible = true;
                lblemail.Visible = true;

                txtmakh.Visible = true;
                txttenkh.Visible = true;
                txtdiachi.Visible = true;
                txtsdt.Visible = true;
                txtemail.Visible = true;

                //2.2 xóa trống các txt để nhập kh mới
                txtmakh.Text = txttimKH.Text.Trim();//info tim KH notfind => ko trùng maKH
                txtmakh.ToolTip = "KHÔNG ĐỂ TRỐNG MÃ KH, KHÔNG NHẬP TRÙNG"; //THÊM THUỘC TÍNH TỰ ĐỘNG KO NEN NHẬP
                txttenkh.Text = "";
                txtdiachi.Text = "";
                txtsdt.Text = "";
                txtemail.Text = "";

                //2.3 ĐỔI NHÃN -> LƯU
                btntimKH.Text = "Lưu thông tin KH";
            
            }
            else if(btntimKH.Text.Trim() == "Lưu thông tin KH")
            {
                //3.1 lưu info kh ms
                try
                {
                    SqlDataSourceKH.Insert();//thủ tục QUAN TRỌNG THÊM INFO KH MS VÀO DB THEO INSERTQUERY parametter
                    //3.2 tải dữ liệu lên 
                    txttimKH.Text = txtmakh.Text.Trim();
                    GridViewKH.DataBind();
                    this.Title = "THÊM KH MỚI THÀNH CÔNG";

                    
                    

                    //3.3 đổi nhãn => chọn kh
                    btntimKH.Text = "Chọn KH";//có 2 TH chọn= khi tìm thấy KH hoặc khi nhập mới KH, tại đây ( thêm đc mới chọn)

                }
                catch(System.Exception ex) { this.Title = "LỖI THÊM KH MỚI= " + ex.Message;
                    btntimKH.Text= "Tìm KH"; // thêm KH ms ko đc => tìm lại KH khác
                }
                //3.4 ẨN ALL Ô NHẬP INFO MỚI ( thêm đc hay ko cx phải ẩn)
                lblTTKHM.Visible = false;
                lblmakh.Visible = false;
                lbltenkh.Visible = false;
                lbldiachi.Visible = false;
                lblsdt.Visible = false;
                lblemail.Visible = false;

                txtmakh.Visible = false;
                txttenkh.Visible = false;
                txtdiachi.Visible = false;
                txtsdt.Visible = false;
                txtemail.Visible = false;
            }else if(btntimKH.Text.Trim() == "Chọn KH")//[4] chọn KH trong gridview tìm thấy( tại vị trí đã chọn trên gridview
            {
                //4.1 tải dl lên đúng 1 KH  vì theo makh do đã gám mã KH đang chọn vào ô TextBox tìm ( thống nhất chọn 1 KH)
                txttimKH.Text = GridViewKH.Rows[vt].Cells[1].Text.Trim(); //lấy mã KH tại cị trí chọn GÁN vào txttimKH
                GridViewKH.DataBind();
                //4.2 khóa ko cho chọn lại
                btntimKH.Enabled = false;

                //4.3 XỬ lí info đơn hàng
                //4.3.1 hiển thị info đơn hàng
                lblTTDDH.Visible = true;
                lblTBmadh.Visible = true;
                lblTBngaylap.Visible = true;
                lblTBdiachigiao.Visible = true;
                lblTBnguoinhan.Visible = true;
                lblTBsdtnhanhang.Visible = true;
                lblTBghichu.Visible = true;
                lblTBhangiaohang.Visible = true;

                txtdiachigiao.Visible = true;// gán đc giao vào đây = mặc định ddcgiao là dc của KH ( gridview.rows[vt].cells[3].text.trim())
                txtnguoinhan.Visible = true;//gán tên kh vào đây = mặc định người nhận là kh
                txtsdtnhanhang.Visible = true;//gán dt kh vào đây= mặc định dt giao hàng là dt của kh
                txtghichu.Visible = true;
                CalendarHangiao.Visible = true;

                //lấy time hiện tại (now)=> mã đơn và ngày lập
                DateTime t = System.DateTime.Now;
                lblmadh.Visible = true;
                ///madh = tăng theo quy luật=năm_quý_...yymmddhhmmss
                lblmadh.Text = txttimKH.Text.Trim() + t.Year.ToString().Substring(2, 2) + t.Month.ToString().Trim() + t.Day.ToString().Trim() + t.Hour.ToString().Trim() + t.Minute.ToString().Trim() + t.Second.ToString().Trim();
                //cùng 1 KH đặt 2 đơn hàng phải cách nhau ít nhất 1s
                lblngaylap.Visible = true;
                lblngaylap.Text = t.ToShortDateString().Trim();// ngày lập =ngày hiện tại => sv cho KH đổi = calendar
                //hiển thị 2 nút lệnh đặt hàng
                btnAccept.Visible = true;
                btnhuyAccept.Visible = true;

                //4.3.2 thông tin CTDH
                lblTTCTDH.Visible = true;
                cart = Session["cart"] as DataTable;
                GridViewCart.DataSource = cart;
                GridViewCart.DataBind();
                lblSum.Text = "GIỎ HÀNG HIỆN TẠI CỦA QUÝ VỊ: CÓ " + cart.Compute("Count(masp)", "").ToString() + "SẢN PHẨM, TỔNG TIỀN = " + cart.Compute("Sum(thanhtien)", "").ToString();
                GridViewCart.Visible = true;
                lblSum.Visible = true;
            }

        }

        /// <summary>
        /// hủy tìm KH = tìm lại KH khác
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnHuyTimKH_Click(object sender, EventArgs e)
        {
            //1. cho "tìm lại" = muốn tìm và chọn lại KH khác thì phải hủy tìm KH
            btntimKH.Enabled = true;
            btntimKH.Text = "Tìm KH";

            //2. ẩn các ô nhập info kh ms
            lblTTKHM.Visible = false;
            lblmakh.Visible = false;
            lbltenkh.Visible = false;
            lbldiachi.Visible = false;
            lblsdt.Visible = false;
            lblemail.Visible = false;

            txtmakh.Visible = false;
            txttenkh.Visible = false;
            txtdiachi.Visible = false;
            txtsdt.Visible = false;
            txtemail.Visible = false;

            //3. xóa trống txt nhập info tìm , để nhập lại
            txttimKH.Text = "";
            //4. nạp lại gridview ds KH, tránh trường hợp 
            GridViewKH.DataBind();
            //5. ẩn btnhuytim
            btnHuyTimKH.Visible = false;

            //6. hủy info đơn hàng ( đơn hàng chưa lập)
            //6.1 ẩn thông tin đơn hàng
            lblTTDDH.Visible = false;
            lblTBmadh.Visible = false;
            lblTBngaylap.Visible = false;
            lblTBdiachigiao.Visible = false;
            lblTBnguoinhan.Visible = false;
            lblTBsdtnhanhang.Visible = false;
            lblTBghichu.Visible = false;
            lblTBhangiaohang.Visible = false;

            txtdiachigiao.Visible = false;
            txtnguoinhan.Visible = false;
            txtsdtnhanhang.Visible = false;
            txtghichu.Visible = false ;
            CalendarHangiao.Visible = false;

            lblmadh.Text = "";

            lblngaylap.Visible = false;
            lblngaylap.Text ="";

            btnAccept.Visible = false;
            btnhuyAccept.Visible = false;

            //6.2 ẩn thông tin ctdh
            lblTTCTDH.Visible = false;

            lblSum.Text = "";
            GridViewCart.Visible = false;
            lblSum.Visible = false;

        }//btnHuyTimKH_Click

        /// <summary>
        /// LƯU ĐH &CTDH VÀO DB
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAccept_Click(object sender, EventArgs e)
        {
            //thêm đơn & ctdh vào db
            try
            {
                SqlDataSourceDH.Insert();
                foreach (DataRow r in cart.Rows) //lần lượt lưu các CTDH của DH nêu trên vào DB
                {
                    SqlDataSourceCTDH.InsertParameters.Clear();
                    SqlDataSourceCTDH.InsertParameters.Add("madh", lblmadh.Text.Trim());
                    SqlDataSourceCTDH.InsertParameters.Add("masp", r["masp"].ToString().Trim());
                    SqlDataSourceCTDH.InsertParameters.Add("sl", DbType.Int32, r["sl"].ToString().Trim());
                    SqlDataSourceCTDH.Insert();
                }
                this.Title = "Thêm ĐH và CTĐH thành công";
            }
            catch (System.Exception ex) { this.Title = "LỖI THÊM DH HOẶC CTDH" + ex.Message; }

            //KHÓA ĐƠN HÀNG LẠI KO CHO HỦY ĐƠN


            txtdiachigiao.Enabled = false;
            txtnguoinhan.Enabled = false;
            txtsdtnhanhang.Enabled = false;
            CalendarHangiao.Enabled = false;

            btnAccept.Enabled = false;

            //KO HỦY KH= chỉ HỦY ĐƠN HÀNG ( đã lưu DB) = Xóa trong DB
            btnHuyTimKH.Enabled = false;

            //6.2 ẩn thông tin ctdh
            lblTTCTDH.Visible = false;

        }// btnAccept_Click

        protected void btnhuyAccept_Click(object sender, EventArgs e)
        {
            //trình tự xóa đơn ngược lại vs thêm đơn: 
            //thêm đơn: insert() trc-> foreach insertCTDH
          //xóa đơn: ngược lại foreach deleteCTDH->deleteđơn hàng
          

            try { 
            foreach (DataRow r in cart.Rows)
            {
                SqlDataSourceCTDH.DeleteParameters.Clear();
                SqlDataSourceCTDH.DeleteParameters.Add("madh", lblmadh.Text.Trim());
                SqlDataSourceCTDH.DeleteParameters.Add("masp", r["masp"].ToString().Trim());
                SqlDataSourceCTDH.Delete();
                //Session["cart"] = null;

            }
            foreach (DataRow r in cart.Rows)
            {
                SqlDataSourceDH.DeleteParameters.Clear();
                SqlDataSourceDH.DeleteParameters.Add("madh", lblmadh.Text.Trim());
                // SqlDataSourceCTDH.DeleteParameters.Add("masp", r["masp"].ToString().Trim());
                SqlDataSourceDH.Delete();
                //Session["cart"] = null;



            }

            GridViewCart.Visible = false;
                lblSum.Visible = false;
                this.Title = "Xóa DH và CTDH thành công";
            Response.Redirect("~\\FrCart.aspx");
        }

            catch (System.Exception ex) { this.Title = "LỖI XÓA DH HOẶC CTDH" + ex.Message; }
        }
    }
}