using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheFaceShop.Models;

namespace TheFaceShop.Controllers
{
    public class DonHangController : Controller
    {
        // GET: DonHang
        QL_THEFACESHOPEntities db = new QL_THEFACESHOPEntities();
        public ActionResult DonHang()
        {
            return View(db.DONGIAOs.ToList());
        }

        public ActionResult ChuaDangNhap()
        {
            return View();
        }

        public ActionResult TraCuuDH()
        {
            // Kiểm tra xem người dùng đã đăng nhập chưa
            if (Session["user"] == null)
            {
                // Nếu chưa đăng nhập, chuyển hướng hoặc hiển thị thông báo đăng nhập
                return RedirectToAction("ChuaDangNhap", "DonHang");
            }
            else
            {
                // Đã đăng nhập, lấy thông tin người dùng từ session
                var currentUser = Session["user"] as KHACHHANG;
                // Tìm kiếm đơn hàng của người dùng hiện tại từ cơ sở dữ liệu hoặc bất kỳ nguồn dữ liệu nào bạn đang sử dụng // Thay 'UserID' bằng thuộc tính ID của người dùng trong cơ sở dữ liệu của bạn
                var userOrders = db.DONGIAOs.Where(s => s.MAKH == currentUser.MAKH);
                // Trả về view hiển thị đơn hàng của người dùng
                return RedirectToAction("DonHang", "DonHang");
            }
        }

        public ActionResult ChiTietDonHang(string MADG)
        {
            DONGIAO dg = db.DONGIAOs.SingleOrDefault(n => n.MADG == MADG);
            if (dg == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            ViewBag.DonHang = dg;
            return View(dg.CTDGs);
        }
    }
}