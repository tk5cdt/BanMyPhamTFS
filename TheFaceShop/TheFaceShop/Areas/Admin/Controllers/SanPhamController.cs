using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheFaceShop.Models;

namespace TheFaceShop.Areas.Admin.Controllers
{
    public class SanPhamController : Controller
    {
        QL_THEFACESHOPEntities db = new QL_THEFACESHOPEntities();
        public ActionResult ShowProduct()
        {
            return View(db.SANPHAMs.ToList());
        }
        // GET: Admin/SanPham
        public ActionResult CreateProduct()
        {
            return View();
        }
    }
}