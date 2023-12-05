using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheFaceShop.Models;

namespace TheFaceShop.Areas.Admin.Controllers
{
    public class DonGiaoController : Controller
    {

        // GET: Admin/DonGiao
        QL_THEFACESHOPEntities db = new QL_THEFACESHOPEntities();
        //[Authorize(Roles = "QuanTri")]
        public ActionResult DanhSachDonGiao()
        {
            return View(db.DONGIAOs);
        }

        public ActionResult TrangThaiDonGiao(string MADG, string TrangThai)
        {
            DONGIAO dg = db.DONGIAOs.SingleOrDefault(n => n.MADG == MADG);
            if (dg == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            dg.TRANGTHAI = TrangThai;
            db.SaveChanges();
            return RedirectToAction("DanhSachDonGiao");
        }
        public ActionResult ChiTietDonGiao(string MADG)
        {
            DONGIAO dg = db.DONGIAOs.SingleOrDefault(n => n.MADG == MADG);
            if (dg == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(dg.CTDGs);
        }
    }
}