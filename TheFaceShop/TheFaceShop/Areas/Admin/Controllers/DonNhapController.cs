using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheFaceShop.Models;

namespace TheFaceShop.Areas.Admin.Controllers
{
    [Authorize(Roles = "QuanTri")]
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

        [HttpGet]
        public ActionResult TaoDonNhap()
        {
            ViewBag.MASP = new SelectList(db.SANPHAMs, "MASP", "TENSP");
            return View();
        }

        [HttpPost]
        public ActionResult TaoDonNhap(DONNHAP dn, string chuoiTenSP, string chuoiSoLuong)
        {
            NHANVIEN nv = Session["user"] as NHANVIEN;
            dn.MADN = "DN000";
            var obj = new ObjectParameter("id", typeof(string));
            db.pc_TimMaTiepTheo("DONNHAP", obj);
            dn.MANV = nv.MANV;
            dn.NGAYLAP = DateTime.Now;
            //dn.TONGTIEN = float.Parse(Request.Form["tongTien"]);
            dn.TRANGTHAI = "Đã đặt";
            db.DONNHAPs.Add(dn);
            db.SaveChanges();

            var donNhap = db.DONNHAPs.FirstOrDefault(s => s.MADN == obj.Value.ToString());

            if (!string.IsNullOrEmpty(chuoiTenSP) && !string.IsNullOrEmpty(chuoiSoLuong))
            {
                
                string[] tenSPs= chuoiTenSP.Split(';');
                string[] soLuongs = chuoiSoLuong.Split(';');

                for (int i = 0; i < tenSPs.Length; i++)
                {
                    CTDN ct = new CTDN();
                    ct.MADN = obj.Value.ToString();

                    string currentTenSP = tenSPs[i]; // Lưu trữ giá trị tạm thời

                    // Tìm sản phẩm dựa trên tên
                    SANPHAM sp = db.SANPHAMs.FirstOrDefault(s => s.TENSP == currentTenSP);

                    if (sp != null && int.TryParse(soLuongs[i], out int quantity))
                    {
                        ct.MASP = sp.MASP; // Gán MASP của sản phẩm
                        ct.SOLUONG = quantity;
                        donNhap.CTDNs.Add(ct);
                    }
                    db.SaveChanges();
                }                                  
            }
            return RedirectToAction("DanhSachDonNhap");
        }       
    }
}