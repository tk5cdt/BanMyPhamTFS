﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheFaceShop.Models;

namespace TheFaceShop.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        QL_THEFACESHOPEntities db = new QL_THEFACESHOPEntities();
        // GET: Admin/Admin
        //[Authorize(Roles = "QuanTri")]
        public ActionResult Index()
        {
            ViewBag.SLSP = db.SANPHAMs.Count();
            ViewBag.Shipped = db.DONGIAOs.Where(n => n.TRANGTHAI == "Đã giao").Count();
            ViewBag.Pending = db.DONGIAOs.Where(n => n.TRANGTHAI != "Đã giao" && n.TRANGTHAI != "Đã huỷ").Count();
            ViewBag.DonHang = db.DONGIAOs.Count();
            ViewBag.KhachHang = db.KHACHHANGs.Count();
            var dt = db.DONGIAOs.Where(n => n.TRANGTHAI == "Đã giao").Sum(n => n.TRIGIA);
            if(dt > 0)
            {
                ViewBag.DoanhThu = dt;
            }
            else
            {
                ViewBag.DoanhThu = 0;
            }
            var dtt = db.DONGIAOs.Where(n => n.TRANGTHAI == "Đã giao" && n.NGAYLAP.Value.Month == DateTime.Now.Month).Sum(n => n.TRIGIA);
            if(dtt > 0)
            {
                ViewBag.DoanhThuThang = dtt;
            }
            else
            {
                ViewBag.DoanhThuThang = 0;
            }
            var dtn = db.DONGIAOs.Where(n => n.TRANGTHAI == "Đã giao" && n.NGAYLAP.Value.Year == DateTime.Now.Year).Sum(n => n.TRIGIA);
            if (dtn > 0)
            {
                ViewBag.DoanhThuNam = dtn;
            }
            else
            {
                ViewBag.DoanhThuNam = 0;
            }
            //list doanh thu theo tháng
            
            return View();
        }
        
        public ActionResult DoanhThuTungThang()
        {
            return Json(db.DONGIAOs.Where(n => n.TRANGTHAI == "Đã giao").GroupBy(n => n.NGAYLAP.Value.Month).Select(n => new { thang = n.Key, doanhthu = n.Sum(m => m.TRIGIA) }).ToList(), JsonRequestBehavior.AllowGet);
        }
    }
}