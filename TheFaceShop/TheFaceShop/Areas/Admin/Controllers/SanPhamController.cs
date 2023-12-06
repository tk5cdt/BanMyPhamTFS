using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TheFaceShop.Models;

namespace TheFaceShop.Areas.Admin.Controllers
{
    [Authorize(Roles = "QuanTri")]
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
            ViewBag.MACTL_SP = db.CHITIETLOAISPs;
            ViewBag.MAQCDG = db.QUYCACHDONGGOIs;
            ViewBag.MADBC = db.DANGBAOCHEs;
            return View();
        }

        //public ActionResult UploadImage(string imageUrl)
        //{
        //    try
        //    {
        //        string imageName = Path.GetFileName(imageUrl);
        //        string imagePath = Path.Combine(Server.MapPath("~/HinhAnhSP"), imageName);

        //        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(imageUrl);
        //        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        //        using (Stream stream = response.GetResponseStream())
        //        {
        //            using (Image image = Image.FromStream(stream))
        //            {
        //                image.Save(imagePath);
        //            }
        //        }

        //        return Json(new { success = true, imageUrl = imageUrl });
        //    }
        //    catch (Exception ex)
        //    {
        //        return Json(new { success = false, error = ex.Message });
        //    }
        //}

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateProduct(SANPHAM sp, HttpPostedFileBase f) //, List<HttpPostedFileBase> listImage
        {       
            if (ModelState.IsValid)
            {               
                if (db.SANPHAMs.Any(d => d.TENSP == sp.TENSP))
                {
                    ViewBag.TB = "Sản phẩm này đã có, vui lòng nhập lại!";
                    ViewBag.MACTL_SP = db.CHITIETLOAISPs;
                    ViewBag.MAQCDG = db.QUYCACHDONGGOIs;
                    ViewBag.MADBC = db.DANGBAOCHEs;
                    return View(sp);
                }
                else
                {
                    sp.MASP = "SP000";
                    string fname = Path.GetFileName(f.FileName);
                    string fpath = Path.Combine(Server.MapPath("~/HinhAnhSP"), fname);
                    f.SaveAs(fpath);
                    sp.ANHDAIDIEN = fname;
                    sp.TONKHO = 0;
                    sp.TRANGTHAI = "Đang bán";
                    db.SANPHAMs.Add(sp);
                    db.SaveChanges();
              
                    // Lưu các ảnh còn lại
                    //List<string> imageNames = new List<string>();
                    //foreach (HttpPostedFileBase image in listImage)
                    //{
                    //    if (image != null && image.ContentLength > 0)
                    //    {
                    //        string imageName = Path.GetFileName(image.FileName);
                    //        string imagePath = Path.Combine(Server.MapPath("~/HinhAnhSP"), imageName);
                    //        image.SaveAs(imagePath);
                    //        imageNames.Add(imageName);
                    //    }
                    //}

                    //foreach (string imageName in imageNames)
                    //{
                    //    HINHANHSP image = new HINHANHSP();
                    //    image.MASP = sp.MASP;
                    //    image.HINHANH = imageName;
                    //    db.HINHANHSPs.Add(image);
                    //}

                    //db.SaveChanges();
                    return RedirectToAction("ShowProduct");
                }
            }
            return View(sp);
        }

        public ActionResult ProductCarousel(string MASP)
        {
            var images = db.HINHANHSPs.Where(h => h.MASP == MASP).ToList();

            return View(images);
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