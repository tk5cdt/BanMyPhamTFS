using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheFaceShop.Models;

namespace TheFaceShop.Controllers
{
    public class PartialController : Controller
    {
        QL_THEFACESHOPEntities db = new QL_THEFACESHOPEntities();
        // GET: Partial
        public ActionResult SanPhamNoiBat_Home()
        {
            var sanPhams = db.SANPHAMs.ToList();
            return View(sanPhams);
        }
        public ActionResult DanhMucLoaiSP_Home()
        {
            var sanPhams = db.SANPHAMs.Where(sp => sp.CHITIETLOAISP.CHITIETLOAI.MACTLOAI == "CTL006");
            return View(sanPhams);
        }
    }
}