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
        public ActionResult ChiTietSanPham(string id)
        {
            var sp = db.SANPHAMs.SingleOrDefault(s => s.MASP == id);
            ViewBag.SPLQ = db.SANPHAMs.Where(n => n.MACTL_SP == sp.MACTL_SP);
            return View(sp);
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