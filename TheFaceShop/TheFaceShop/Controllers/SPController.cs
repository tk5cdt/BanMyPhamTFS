using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheFaceShop.Models;

namespace TheFaceShop.Controllers
{
    public class SPController : Controller
    {
        QL_THEFACESHOPEntities db = new QL_THEFACESHOPEntities();
        // GET: SanPham
        public ActionResult ChiTietSanPham(string id = "SP001")
        {
            try
            {
                var sp = db.SANPHAMs.SingleOrDefault(s => s.MASP == id);
                if (sp == null)
                {
                       return HttpNotFound();
                }
                ViewBag.SPLQ = db.SANPHAMs.Where(n => n.MACTL_SP == sp.MACTL_SP);
                return View(sp);
            }    
            catch
            {
                return HttpNotFound();
            }
        }
        [HttpPost]
        public ActionResult BinhLuan(string masp, string bl = "", int mddg = 0)
        {
            var sp = db.SANPHAMs.SingleOrDefault(n => n.MASP == masp);
            ViewBag.SPLQ = db.SANPHAMs.Where(n => n.MACTL_SP == sp.MACTL_SP);
            var kh = Session["user"] as KHACHHANG;
            var dg = db.DONGIAOs.Where(n => n.CTDGs.Any(m => m.MASP == masp) && n.KHACHHANG.MAKH == kh.MAKH);

            if (dg.Count() > 0)
            {
                foreach (var item in dg)
                {
                    var ctdg = item.CTDGs.FirstOrDefault(n => n.MASP == masp);
                    if (ctdg.BINHLUAN == null && ctdg.MUCDODG == null)
                    {
                        ctdg.BINHLUAN = bl;
                        ctdg.MUCDODG = mddg;
                        db.SaveChanges();
                        ViewBag.TB = "Đánh giá thành công!";
                        return View("ChiTietSanPham", sp);
                    }
                }
                ViewBag.TB = "Bạn đã đánh giá sản phẩm này rồi!";
            }
            else
            {
                ViewBag.TB = "Bạn cần phải mua sản phẩm để đánh giá";
            }
            return View("ChiTietSanPham", sp);
        }
    }
}