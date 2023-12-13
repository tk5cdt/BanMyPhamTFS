using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using TheFaceShop.Models;

namespace TheFaceShop.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        QL_THEFACESHOPEntities db = new QL_THEFACESHOPEntities();
        public ActionResult TrangChu()
        {
            return View();
        }

        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(KHACHHANG kh)
        {
            if (ModelState.IsValid)
            {
                var user = db.KHACHHANGs.SingleOrDefault(n => n.SDT == kh.SDT);
                if (user != null)
                {
                    phanquyen(user);
                    Session["user"] = user;
                    Session["TENKH"] = user.TENKH;
                    return RedirectToAction("TrangChu");
                }
                else
                {
                    return RedirectToAction("DangKy", new { sdt = kh.SDT });
                }
            }
            else
            {
                return View();
            }
        }
        [HttpGet]
        public ActionResult DangKy(string sdt)
        {
            ViewBag.SDT = sdt;
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(KHACHHANG kh)
        {
            if (db.KHACHHANGs.SingleOrDefault(n => n.SDT == kh.SDT) != null)
            {
                phanquyen(kh);
                Session["user"] = kh;
                ViewBag.TENKH = kh.TENKH;
                return RedirectToAction("TrangChu");
            }
            if (ModelState.IsValid)
            {
                kh.MAKH = "KH000";
                db.KHACHHANGs.Add(kh);
                db.SaveChanges();
                var user = db.KHACHHANGs.SingleOrDefault(n => n.SDT == kh.SDT);
                db.QUYENs.FirstOrDefault(n => n.MAQUYEN == "KhachHang").KHACHHANGs.Add(user);
                db.SaveChanges();
                phanquyen(user);
                Session["user"] = user;
                ViewBag.TENKH = kh.TENKH;
                return RedirectToAction("TrangChu");
            }
            return RedirectToAction("DangNhap");
        }
        public void phanquyen(KHACHHANG kh)
        {
            FormsAuthentication.Initialize();
            string quyen = "";
            foreach (var i in kh.QUYENs)
            {
                quyen += i.MAQUYEN + ",";
            }
            quyen = quyen.Substring(0, quyen.Length - 1);
            var ticket = new FormsAuthenticationTicket(1, kh.SDT, DateTime.Now, DateTime.Now.AddHours(3), false, quyen, FormsAuthentication.FormsCookiePath);
            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(ticket));
            if (ticket.IsPersistent)
            {
                cookie.Expires = ticket.Expiration;
            }
            Response.Cookies.Add(cookie);
        }

        public ActionResult DangXuat()
        {
            FormsAuthentication.SignOut();
            Session["user"] = null;
            Session["TENKH"] = null;
            Session["Cart"] = null;
            return RedirectToAction("TrangChu");
        }
    }
}