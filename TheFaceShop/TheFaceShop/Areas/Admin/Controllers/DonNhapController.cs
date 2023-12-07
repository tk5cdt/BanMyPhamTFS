using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheFaceShop.Models;

namespace TheFaceShop.Areas.Admin.Controllers
{
    public class DonNhapController : Controller
    {
        QL_THEFACESHOPEntities db = new QL_THEFACESHOPEntities();
        // GET: Admin/DonNhap

        public ActionResult DanhSachDonNhap()
        {
            return View(db.DONNHAPs);
        }

        public ActionResult TrangThaiDonNhap(string MADN, string TrangThai)
        {
            DONNHAP dg = db.DONNHAPs.SingleOrDefault(n => n.MADN == MADN);
            if (dg == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            dg.TRANGTHAI = TrangThai;
            db.SaveChanges();
            return RedirectToAction("DanhSachDonNhap");
        }

        public ActionResult XemChiTietDonNhap(string ma)
        {
            DONNHAP dn = db.DONNHAPs.Single(s => s.MADN == ma);
            if (dn == null)
            {
                return HttpNotFound();
            }
            return View(dn.CTDNs);
        }

        public ActionResult TaoDonNhap()
        {
            ViewBag.MASP = new SelectList(db.SANPHAMs, "MASP", "TENSP");
            return View();
        }

        [HttpPost]
        public ActionResult TaoDonNHap(DONNHAP dn)
        {
            NHANVIEN nv = Session["user"] as NHANVIEN;
            dn.MADN = "DN000";
            dn.MANV = nv.MANV;
            dn.NGAYLAP=DateTime.Now;
            dn.TONGTIEN = float.Parse(Request.Form["tongTien"]);
            dn.TRANGTHAI = "Đã đặt";


            return View ("DanhSachDonNhap");
        }

        //[HttpPost]
        //public ActionResult TaoDonNhap(FormCollection f)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        NHANVIEN nv = Session["user"] as NHANVIEN;
        //        // Tạo đơn nhập mới
        //        DONNHAP dn = new DONNHAP();
        //        dn.MADN = "DN000";// Bạn có thể tạo mã đơn nhập theo quy tắc nào đó
        //        dn.MANV = nv.MANV;
        //        dn.NGAYLAP = DateTime.Now;
        //        dn.TONGTIEN = float.Parse(f["tongTien"]);
        //        dn.TRANGTHAI = "Đã đặt";

        //        // Thêm đơn nhập vào cơ sở dữ liệu
        //        db.DONNHAPs.Add(dn);
        //        db.SaveChanges();
        //        return View("DanhSachDonNhap");
        //    }
        //    return View();
        //}

        //[HttpPost]
        //public ActionResult TaoDonNhap(List<CTDN> chiTietDonNhapList)
        //{
        //    if (chiTietDonNhapList != null && chiTietDonNhapList.Any())
        //    {
        //        NHANVIEN nv = Session["user"] as NHANVIEN;
        //        DONNHAP dn = new DONNHAP();
        //        dn.MADN = "DN000"; // Có thể tạo mã đơn nhập theo quy tắc nào đó
        //        dn.MANV = nv.MANV;
        //        dn.NGAYLAP = DateTime.Now;
        //        dn.TONGTIEN = float.Parse(Request.Form["tongTien"]); // Lấy tổng tiền từ form
        //        dn.TRANGTHAI = "Đã đặt";

        //        db.DONNHAPs.Add(dn);
        //        db.SaveChanges();

        //        foreach (var item in chiTietDonNhapList)
        //        {
        //            // Tìm mã sản phẩm dựa trên tên sản phẩm
        //            string maSP = db.SANPHAMs.FirstOrDefault(sp => sp.TENSP == item.MASP).MASP;

        //            if (maSP != null)
        //            {
        //                // Tạo chi tiết đơn nhập và lưu vào cơ sở dữ liệu
        //                CTDN chiTietDN = new CTDN
        //                {
        //                    MADN = dn.MADN,
        //                    MASP = maSP,
        //                    SOLUONG = item.SOLUONG,
        //                    THANHTIEN = item.THANHTIEN
        //                };

        //                db.CTDNs.Add(chiTietDN);
        //            }
        //        }

        //        db.SaveChanges();

        //        return Json(new { success = true });
        //    }
        //    return Json(new { success = false });
        //}
    }             
}