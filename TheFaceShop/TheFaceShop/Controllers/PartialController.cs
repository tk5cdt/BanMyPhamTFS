using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.Mvc;
using TheFaceShop.Models;

namespace TheFaceShop.Controllers
{
    public class PartialController : Controller
    {
        QL_THEFACESHOPEntities db = new QL_THEFACESHOPEntities();
        // GET: Partial
        public ActionResult SanPhamNoiBat_Home()
        {
            var sanPhams = db.SANPHAMs.ToList();
            return View(sanPhams);
        }
        public ActionResult DanhMucLoaiSP_Home()
        {
            var sanPhams = db.SANPHAMs.Where(sp => sp.CHITIETLOAISP.CHITIETLOAI.MACTLOAI == "CTL006");
            return View(sanPhams);
        }

        public ActionResult DanhMucLoaiSP(string categoryId, string subCategoryId, string subCateProId)
        {
            var sanPhams = db.SANPHAMs.ToList();
            if (!string.IsNullOrEmpty(categoryId))
            {
                var sanPham1 = db.SANPHAMs.Where(sp => sp.CHITIETLOAISP.CHITIETLOAI.LOAI.MALOAI == categoryId);

                if (!string.IsNullOrEmpty(subCategoryId))
                {

                    var sanPham2 = db.SANPHAMs.Where(sp => sp.CHITIETLOAISP.CHITIETLOAI.MACTLOAI == subCategoryId);

                    if (!string.IsNullOrEmpty(subCateProId))
                    {
                        var sanPham3 = db.SANPHAMs.Where(sp => sp.CHITIETLOAISP.MACTL_SP == subCateProId);
                        return View(sanPham3);
                    }

                    return View(sanPham2);
                }

                return View(sanPham1);
            }
            return View(sanPhams);
        }

        public ActionResult ShowSanPham(int pageNumber = 1, int pageSize = 10)
        {
            ViewBag.PageNumber = pageNumber;
            ViewBag.PageSize = pageSize;
            ViewBag.TotalPages = Math.Ceiling((double)db.SANPHAMs.Count() / pageSize);
            var sanPhams = db.SANPHAMs.ToList().Skip((pageNumber - 1) * pageSize).Take(pageSize);
            return View(sanPhams);
        }

        public ActionResult Search(string searchTerm)
        {
            var sanPhams = db.SANPHAMs
                        .Where(p => p.TENSP.ToLower().Contains(searchTerm.ToLower()) || p.THANHPHAN.ToLower().Contains(searchTerm.ToLower()) || p.CONGDUNG.ToLower().Contains(searchTerm.ToLower()));

            return View(sanPhams);
        }

        public ActionResult FilterBySubcategory(string subcategoryId)
        {
            // Lọc sản phẩm dựa trên loại sản phẩm con
            var filteredProducts = db.SANPHAMs.Where(p => p.MACTL_SP == subcategoryId).ToList();
            return PartialView("DanhMucLoaiSP", filteredProducts);
        }





       


    }
}