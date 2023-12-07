using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheFaceShop.Models;
using System.Web.Security;

namespace TheFaceShop.Areas.Admin.Controllers
{
    public class AccountController : Controller
    {
        readonly QL_THEFACESHOPEntities db = new QL_THEFACESHOPEntities();
        // GET: Admin/Account
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(NHANVIEN nv)
        {
            if (ModelState.IsValid)
            {
                var user = db.NHANVIENs.SingleOrDefault(x => x.SDT == nv.SDT && x.MATKHAU == nv.MATKHAU);
                if (user != null)
                {
                    phanquyenNV(user);
                    Session["user"] = user;
                    Session["TENNV"] = user.TENNV;
                    return RedirectToAction("Index", "Admin");
                }
                else
                {
                    ViewBag.ThongBao = "Sai tài khoản hoặc mật khẩu";
                }
            }
            return View(nv);
        }

        public void phanquyenNV(NHANVIEN nv)
        {
            FormsAuthentication.Initialize();
            string quyen = "";
            foreach (var i in nv.QUYENs)
            {
                quyen += i.MAQUYEN + ",";
            }
            quyen = quyen.Substring(0, quyen.Length - 1);
            var ticket = new FormsAuthenticationTicket(1, nv.SDT, DateTime.Now, DateTime.Now.AddHours(3), false, quyen, FormsAuthentication.FormsCookiePath);
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
            Session["TENNV"] = null;
            return RedirectToAction("DangNhap", "Account");
        }
    }
}