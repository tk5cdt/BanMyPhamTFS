using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheFaceShop.Models;

namespace TheFaceShop.Areas.Admin.Controllers
{
    [Authorize(Roles = "QuanTri")]
    public class DonNhapController : Controller
    {
        QL_THEFACESHOPEntities db = new QL_THEFACESHOPEntities();
        // GET: Admin/DonNhap
        public ActionResult TaoDonNhap()
        {
            ViewBag.MASP = new SelectList(db.SANPHAMs, "MASP", "TENSP");
            return View();
        }

        public ActionResult XoaSanPham(string ms)
        {
            List<SANPHAM> list = new List<SANPHAM>();
            SANPHAM sp = list.Single(s => s.MASP == ms);

            if (sp != null)
            {
                list.RemoveAll(s => s.MASP == ms);
                return RedirectToAction("TaoDonNhap", "DonNhap");
            }
            return RedirectToAction("TaoDonNhap", "DonNhap");
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