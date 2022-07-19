using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G216PhanThanhNhaDoNoiThat
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        //chạy khi trang web tải lên trình duyệt
        protected void Page_Load(object sender, EventArgs e)
        {
            LoginNV.Visible = false;
        }

        /// <summary>
        /// chạy khi nhân viên click vào mục chọn trên menu
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e">lưu giữ mục chọn mà nv đã chọn</param>
        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            if(e.Item.Value== "LH" || e.Item.Value== "DN")//nv chọn mũ quản lí hoặc đăng nhập
            {
                LoginNV.Visible = true;// để thực hiện đăng nhập
            }
            else //nv chọn các mục khác trong menu
            {
                LoginNV.Visible = false;
            }
        
        }//menumain

        /// <summary>
        /// thủ tục ktra dăng nhập của loginnv
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"> để xác thực đăng nhập có success hay ko?</param>
        protected void LoginNV_Authenticate(object sender, AuthenticateEventArgs e)
        { //nếu nsd đăng nhập vs Admin và mk admin@vn hoặc...
            if ((LoginNV.UserName == "Admin" && LoginNV.Password == "admin@vn") ||
               (LoginNV.UserName == "Guest" && LoginNV.Password == "guest@vn"))
            {
                e.Authenticated = true;//success chuyển đến page quản lí
                Session["LH"] = LoginNV.UserName as string;//gửi tên account vào trang quản lí
            }
            else
            {
                e.Authenticated = false;//
            }
        }//login authenticate

    }//class MasterPage
}