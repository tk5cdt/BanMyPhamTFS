using System;
using System.Collections.Generic;
using System.IO;
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
       
        public ActionResult XemChiTietSP(string ma)
        {
            SANPHAM sp = db.SANPHAMs.Single(s => s.MASP == ma);
            if(sp == null)
            {
                return HttpNotFound();
            }    
            return View(sp);
        }
        // GET: Admin/SanPham
        public ActionResult CreateProduct()
        {
            //Lấy dữ liệu cho dropdown list
            ViewBag.MACTL_SP = new SelectList(db.CHITIETLOAISPs, "MACTL_SP", "TENCTL_SP");
            ViewBag.MAQCDG = new SelectList(db.QUYCACHDONGGOIs, "MAQCDG", "TENQCDG");
            ViewBag.MADBC = new SelectList(db.DANGBAOCHEs, "MADBC", "TENDANG");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateProduct(SANPHAM sp, HttpPostedFileBase f)
        {
            if (ModelState.IsValid)
            {
                if (db.SANPHAMs.Any(d => d.TENSP == sp.TENSP))
                {
                    ViewBag.TB = "Trùng tên sản phẩm!";
                    return View();
                }
                else
                {
                    sp.MASP = "SP000";
                    string fname = Path.GetFileName(f.FileName);
                    string fpath = Path.Combine(Server.MapPath("~/HinhAnhSP"), fname);
                    f.SaveAs(fpath);
                    sp.ANHDAIDIEN = fname;  
                    db.SANPHAMs.Add(sp);
                    db.SaveChanges();
                    return RedirectToAction("ShowProduct");
                }
            }
            return View(sp);
        }

        public ActionResult UpdateProduct(string ma)
        {
            SANPHAM sp = db.SANPHAMs.Single(d => d.MASP == ma);
            if (sp == null)
            {
                return HttpNotFound();
            }
            return View(sp);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult UpdateProduct(SANPHAM sp)
        {
            if (ModelState.IsValid)
            {
                if (db.SANPHAMs.Any(d => d.TENSP == sp.TENSP))
                {
                    ViewBag.TB = "Trùng tên sản phẩm!";
                    return View();
                }
                else
                {
                    db.SANPHAMs.Attach(sp);
                    db.Entry(sp).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("ShowProduct");
                }
            }
            return View(sp);
        }

        [HttpGet]
        public ActionResult GetPrice(string maSP)
        {
            // Tìm sản phẩm trong database và trả về giá nhập
            var sp = db.SANPHAMs.FirstOrDefault(s => s.MASP == maSP);
        return Json(sp.GIANHAP, JsonRequestBehavior.AllowGet);
        }
    }
}