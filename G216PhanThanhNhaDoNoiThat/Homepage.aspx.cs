using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace G216PhanThanhNhaDoNoiThat
{
    public partial class Homepage : System.Web.UI.Page
    {
        static DataTable cart = new DataTable();
        /// <summary>
        /// thu tuc tu dong chay moi khi page tai len trinh duyet
        /// nhiem vu : thiet lap/ khoi tao dinh nghia bien gio hang moi
        /// neu co thi lay xuong, chua thi tao moi
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)// chi thiet lap gio moi khi homepage dc thietlap lan dau, cac lan postback sau ko thiet lap lai
            {
                if (Session["cart"] != null) // đã có giỏ hàng
                {
                    cart = Session["cart"] as DataTable;//ep kieu c#
                                                        //lay sess xuong luu vao bien cart de dung
                }
                else //chua" gio hang" => khoi tao gio hang moi
                {
                    cart.Rows.Clear(); //xoa all dong rac neu co trong bien cart luu "gio hang"
                    cart.Columns.Clear(); // xoa all cot rac
                                          //NOTE: cart ko nam tren sql nam tren bo nho 
                                          //dinh nghia cac cot du lieu can ql trong gio hang
                    cart.Columns.Add("masp", typeof(string));
                    cart.Columns.Add("tensp", typeof(string));
                    cart.Columns.Add("gia", typeof(int));
                    cart.Columns.Add("dvt", typeof(string));
                    cart.Columns.Add("kichthuoc", typeof(string));
                    cart.Columns.Add("chatlieu", typeof(string));
                    cart.Columns.Add("mausac", typeof(string));
                    cart.Columns.Add("baohanh", typeof(string));
                    cart.Columns.Add("tinhtrang", typeof(string));
                    cart.Columns.Add("sl", typeof(int));
                    cart.Columns.Add("thanhtien", typeof(int), "gia*sl");// tu tinh theo cthuc => ko dc nhap



                }
            }//dong page load
        }// if not ispostback
        //protected void btnmua_Click(object sender, EventArgs e)
        //{

        //}

        /// <summary>
        /// thủ tục=bỏ hàng vào giỏ= khi kh chọn mua
        /// thu tuc
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>// luu giu thong tin basic kh da chon
        protected void DataListSPNT_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName== "mua")// kh bam nut "chonmua"
            {
                //1. lay infor sp kh chon mua
                string masp = DataListSPNT.DataKeys[e.Item.ItemIndex].ToString().Trim();
                //string masp = ((Label)e.Item.FindControl("tenspLabel")).Text.Trim();

                string tensp = ((Label)e.Item.FindControl("tenspLabel")).Text;
                int gia= Int32.Parse(((Label)e.Item.FindControl("giaLabel")).Text.Trim());
                string dvt = ((Label)e.Item.FindControl("dvtLabel")).Text;
                string kichthuoc= ((Label)e.Item.FindControl("kichthuocLabel")).Text;
                string chatlieu= ((Label)e.Item.FindControl("chatlieuLabel")).Text;
                string mausac = ((Label)e.Item.FindControl("mausacLabel")).Text;
                string baohanh = ((Label)e.Item.FindControl("baohanhLabel")).Text;
                string tinhtrang = ((Label)e.Item.FindControl("tinhtrangLabel")).Text;


                int soluong =int.Parse(((TextBox)e.Item.FindControl("txtsl")).Text.Trim());

              

                //2. ktra sp co trong gio chua? neu co thi tang sl
                foreach(DataRow r in cart.Rows) //do tung dong hang r co trong gio cart.Rows
                {
                    if(masp == (string)r["masp"]) //sp ma kh da chon co trong gio
                    {
                        r["sl"] = (int)r["sl"] + soluong; //tang sl len
                        goto kt;
                    }
                }// neu het foreach ma if ko chay => chua co trong gio

                //3. them sp moi vao gio thi them sp vao gio hang
                cart.Rows.Add(masp, tensp, gia, dvt, kichthuoc, chatlieu, mausac, baohanh, tinhtrang, soluong); // dung thu tu theo tren
                //4. gui  gio hang cart len sess de chuyen sang cac trang khac sd( sau khi da them hang vao gio)
                kt:
                Session["cart"] = cart;
                //5. thong bao kq
                lblsum.Text = "Giỏ hàng của quý vị hiện có:" + cart.Compute("Count(masp)", "").ToString() + " sản phẩm, TỔNG TIỀN=" + cart.Compute("Sum(thanhtien)", "").ToString() + "Đồng";
            }//end commandname "mua"
        }//end datalist

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrCart.aspx");
        }



        //protected void txtsl_TextChanged(object sender, EventArgs e)
        //{

        //}
    }
}