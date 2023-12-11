using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheFaceShop.Models;

namespace TheFaceShop.Areas.Admin.Controllers
{
    [Authorize(Roles = "QuanTri")]
    public class AdminController : Controller
    {
        QL_THEFACESHOPEntities db = new QL_THEFACESHOPEntities();
        // GET: Admin/Admin       
        public ActionResult Index()
        {
            ViewBag.SLSP = db.SANPHAMs.Count();
            ViewBag.Shipped = db.DONGIAOs.Where(n => n.TRANGTHAI == "Đã giao").Count();
            ViewBag.Pending = db.DONGIAOs.Where(n => n.TRANGTHAI != "Đã giao" && n.TRANGTHAI != "Đã huỷ").Count();
            ViewBag.DonHang = db.DONGIAOs.Count();
            ViewBag.KhachHang = db.KHACHHANGs.Count();
            double[] a = new double[12];
            var kq = db.DoanhThuTungThang();
            var kq1 = db.ChiTungThang();
            foreach(var item in kq)
            {
                if(item.DoanhThu == null)
                {
                    item.DoanhThu = 0;
                }
                a[item.Thang - 1] = item.DoanhThu.Value;
            }
            double[] b = new double[12];
            foreach(var item in kq1)
            {
                if(item.Chi == null)
                {
                    item.Chi = 0;
                }
                b[item.Thang - 1] = item.Chi.Value;
            }
            ViewBag.Thang = a;
            ViewBag.Chi = b;
            var dt = db.DONGIAOs.Where(n => n.TRANGTHAI == "Đã giao").Sum(n => n.TRIGIA);
            if(dt > 0)
            {
                ViewBag.DoanhThu = dt;
            }
            else
            {
                ViewBag.DoanhThu = 0;
            }
            var dtt = db.DONGIAOs.Where(n => n.TRANGTHAI == "Đã giao" && n.NGAYLAP.Value.Month == DateTime.Now.Month).Sum(n => n.TRIGIA);
            if(dtt > 0)
            {
                ViewBag.DoanhThuThang = dtt;
            }
            else
            {
                ViewBag.DoanhThuThang = 0;
            }
            var dtn = db.DONGIAOs.Where(n => n.TRANGTHAI == "Đã giao" && n.NGAYLAP.Value.Year == DateTime.Now.Year).Sum(n => n.TRIGIA);
            if (dtn > 0)
            {
                ViewBag.DoanhThuNam = dtn;
            }
            else
            {
                ViewBag.DoanhThuNam = 0;
            }
            //list doanh thu theo tháng
            
            return View();
        }



        protected override void HandleUnknownAction(string actionName)
        {
            if (HttpContext.Response.StatusCode == 401 &&
                HttpContext.Session["user"] == null)
            {
                RedirectToAction("DangNhap", "Account");
            }
        }
    }
}