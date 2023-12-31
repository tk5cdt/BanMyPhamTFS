using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheFaceShop.Models;

namespace TheFaceShop.Controllers
{
    public class MuaNgayController : Controller
    {
        QL_THEFACESHOPEntities db = new QL_THEFACESHOPEntities();
        // GET: MuaNgay

        public ActionResult ChuaDangNhap()
        {
            return View();
        }      

        public ActionResult ThanhToan(string id)
        {
            SANPHAM pro = db.SANPHAMs.SingleOrDefault(s => s.MASP == id);  
            if (Session["user"] != null)
            {
                ViewBag.TinhThanh = new SelectList(db.TINHTHANHs.OrderBy(n => n.full_name), "code", "full_name");
                return View(pro);
            }
            return RedirectToAction("ChuaDangNhap", "MuaNgay");
        }

        [HttpPost]
        public ActionResult ThanhToan(FormCollection form, string id_Pro, int Quantity)
        {
            DONGIAO dg = new DONGIAO();
            var kh = Session["user"] as KHACHHANG;
            dg.MADG = "DG000";
            var obj = new ObjectParameter("id", typeof(string));
            db.pc_TimMaTiepTheo("DONGIAO", obj).ToString();
            dg.MAKH = kh.MAKH;
            dg.NGAYLAP = DateTime.Now;
            dg.NGUOINHAN = form["ht"].ToString();
            dg.SDT = form["sdt"].ToString();
            dg.SONHA = form["sonha"].ToString();
            var codePhuong = form["px"].ToString();
            dg.PHUONGXA = codePhuong.ToString();
            dg.NGAYLAP = DateTime.Now;
            dg.TRIGIA = 0;
            dg.TRANGTHAI = "Đang chuẩn bị";
            db.DONGIAOs.Add(dg);
            db.SaveChanges();            

            var donGiao = db.DONGIAOs.FirstOrDefault(t => t.MADG == obj.Value.ToString());
            CTDG ct = new CTDG();
            ct.MADG = obj.Value.ToString();
            ct.MASP = id_Pro;
            ct.SOLUONG = Quantity;
            donGiao.CTDGs.Add(ct);
            db.SaveChanges();

            return RedirectToAction("TraCuuDH", "DonHang");
        }
    }
}