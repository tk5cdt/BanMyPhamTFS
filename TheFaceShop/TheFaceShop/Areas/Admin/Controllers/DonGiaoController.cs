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
        [Authorize(Roles = "QuanTri")]
        public ActionResult DanhSachDonGiao()
        {
            return View(db.DONGIAOs);
        }
    }
}