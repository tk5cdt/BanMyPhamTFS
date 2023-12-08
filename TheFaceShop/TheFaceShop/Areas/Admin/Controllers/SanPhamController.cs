using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Entity;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;
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

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateProduct(SANPHAM sp, HttpPostedFileBase f, string selectedImages)
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
                    // Lưu ảnh đại diện vào thư mục và tên file vào cơ sở dữ liệu
                    string fname = Path.GetFileName(f.FileName);
                    string fpath = Path.Combine(Server.MapPath("~/HinhAnhSP"), fname);
                    f.SaveAs(fpath);
                    sp.ANHDAIDIEN = fname;

                    sp.TONKHO = 0;
                    sp.TRANGTHAI = "Đang bán";
                    db.SANPHAMs.Add(sp);
                    db.SaveChanges();
                    // Lưu đường dẫn của ảnh từ CKFinder vào cơ sở dữ liệu
                    if (!string.IsNullOrEmpty(selectedImages))
                    {
                        string[] imagePaths = selectedImages.Split(';');
                        foreach (string imagePath in imagePaths)
                        {
                            // Tạo đối tượng HINHANHSP và lưu đường dẫn ảnh vào cơ sở dữ liệu
                            HINHANHSP image = new HINHANHSP();
                            image.MASP = db.SANPHAMs.FirstOrDefault(s => s.TENSP == sp.TENSP).MASP; // Gán MASP của sản phẩm vừa tạo cho ảnh
                            image.HINHANH = imagePath; // Lưu đường dẫn ảnh vào thuộc tính HINHANH của đối tượng HINHANHSP
                            db.HINHANHSPs.Add(image);

                            string imageName = Path.GetFileName(imagePath);
                            string imgPath = Path.Combine(Server.MapPath("~/HinhAnhSP"), imageName);

                            string imgPath2 = Path.Combine(Server.MapPath("~/DATA/Images"), imagePath);
                            // Copy file từ đường dẫn ảnh trong CSDL xuống thư mục ~/HinhAnhSP
                            System.IO.File.Copy(imgPath2, imgPath);
                        }

                        db.SaveChanges();
                    }

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
            //Lấy dữ liệu cho dropdown list
            ViewBag.MACTL_SP = db.CHITIETLOAISPs;
            ViewBag.MAQCDG = db.QUYCACHDONGGOIs;
            ViewBag.MADBC = db.DANGBAOCHEs;
            return View(sp);
        }        

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult UpdateProduct(SANPHAM sp, HttpPostedFileBase f, string anhDaiDien, string[] hinhAnhItem)
        {
            if (ModelState.IsValid)
            {
                sp.MASP = db.SANPHAMs.FirstOrDefault(s => s.TENSP == sp.TENSP).MASP;
                // Lấy sản phẩm từ database để cập nhật
                var sanPham = db.SANPHAMs.Include("HINHANHSPs").FirstOrDefault(s => s.MASP == sp.MASP);

                if (sanPham == null)
                {
                    return HttpNotFound();
                }

                if (sp.TENSP != sanPham.TENSP && db.SANPHAMs.FirstOrDefault(s => s.TENSP == sp.TENSP) != null)
                {
                    ViewBag.TB = "Số điện thoại này không hợp lệ!";
                    return View();
                }

                // Cập nhật thông tin của sản phẩm
                sanPham.TENSP = sp.TENSP;
                sanPham.GIABAN = sp.GIABAN;
                sanPham.GIANHAP = sp.GIANHAP;
                sanPham.THANHPHAN = sp.THANHPHAN;
                sanPham.MACTL_SP = sp.MACTL_SP;
                sanPham.MAQCDG = sp.MAQCDG;
                sanPham.MADBC = sp.MADBC;
                sanPham.CONGDUNG = sp.CONGDUNG;
                sanPham.NOIDUNG = sp.NOIDUNG;
                if (f != null && f.ContentLength > 0)
                {
                    string fname = Path.GetFileName(f.FileName);
                    string fpath = Path.Combine(Server.MapPath("~/HinhAnhSP"), anhDaiDien);
                    f.SaveAs(fpath);
                    sanPham.ANHDAIDIEN=fname;
                }   
                else
                {
                    sanPham.ANHDAIDIEN = anhDaiDien;
                }

                foreach (var dbImage in sanPham.HINHANHSPs.ToList())
                {
                    // Kiểm tra xem ảnh từ cơ sở dữ liệu có tồn tại trong hinhAnhItem hay không
                    if (!hinhAnhItem.Contains(dbImage.HINHANH))
                    {
                        // Nếu không tìm thấy, xóa khỏi cơ sở dữ liệu
                        db.HINHANHSPs.Remove(dbImage);

                        // Xóa khỏi thư mục HinhAnhSP
                        string imagePath = Path.Combine(Server.MapPath("~/HinhAnhSP"), dbImage.HINHANH);
                        if (System.IO.File.Exists(imagePath))
                        {
                            System.IO.File.Delete(imagePath);
                        }
                    }
                }

                foreach (var item in hinhAnhItem)
                {
                    string imagePath = Path.Combine(Server.MapPath("~/HinhAnhSP"), item);

                    if(!System.IO.File.Exists(imagePath))
                    {
                        HINHANHSP ha = new HINHANHSP();
                        ha.MASP = sanPham.MASP;
                        ha.HINHANH = item;
                        sanPham.HINHANHSPs.Add(ha);

                        string imgPath = Path.Combine(Server.MapPath("~/DATA/Images"), item);
                        string imgPath1 = Path.Combine(Server.MapPath("~/HinhAnhSP"), item);

                        // Di chuyển hoặc sao chép tệp ảnh vào thư mục HinhAnhSP
                        System.IO.File.Copy(imgPath, imgPath1);
                    }                       
                }    

                db.SaveChanges();
                return RedirectToAction("ShowProduct");
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