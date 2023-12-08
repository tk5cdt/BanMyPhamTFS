using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheFaceShop.Models;

namespace TheFaceShop.Areas.Admin.Controllers
{
    public class NhanVienController : Controller
    {
        // GET: Admin/NhanVien
        QL_THEFACESHOPEntities db = new QL_THEFACESHOPEntities();
        public ActionResult DanhSachNhanVien()
        {
            return View(db.NHANVIENs);
        }

        public ActionResult ThemNhanVien()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ThemNhanVien(NHANVIEN nv)
        {
            if (ModelState.IsValid)
            {
                if (db.NHANVIENs.Any(d => d.SDT == nv.SDT))
                {
                    ViewBag.TB = "Số điện thoại này đã có!";
                    return View(nv);
                }
                else
                {
                    nv.MANV = "NV000";
                    db.NHANVIENs.Add(nv);
                    db.SaveChanges();
                    return RedirectToAction("DanhSachNhanVien");
                }
            }
            return View(nv);          
        }
        
        public ActionResult CapNhatNhanVien(string ma)
        {
            NHANVIEN nv = db.NHANVIENs.Single(d => d.MANV == ma);
            if (nv == null)
            {
                return HttpNotFound();
            }          
            return View(nv);
        }

        [HttpPost]
        public ActionResult CapNhatNhanVien(NHANVIEN nv)
        {
            if (ModelState.IsValid)
            {
                // Lấy nhân viên từ database để cập nhật
                NHANVIEN nhanVien = db.NHANVIENs.FirstOrDefault(s => s.MANV == nv.MANV);

                if (nhanVien == null)
                {
                    return HttpNotFound();
                }

                if(nv.SDT != nhanVien.SDT && db.NHANVIENs.FirstOrDefault(s=>s.SDT == nv.SDT) != null)
                {
                    ViewBag.TB = "Số điện thoại này không hợp lệ!";
                    return View();
                }    
                // Cập nhật thông tin của nhân viên
                nhanVien.TENNV = nv.TENNV;
                nhanVien.GIOITINH = nv.GIOITINH;
                nhanVien.SDT = nv.SDT;
                nhanVien.MATKHAU = nv.MATKHAU;

                db.NHANVIENs.Add(nhanVien);
                db.SaveChanges();
                return RedirectToAction("DanhSachNhanVien");
            }
            return View(nv);
        }          
    }
}