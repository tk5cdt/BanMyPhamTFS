using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
            if (!string.IsNullOrEmpty(categoryId))
            {
                var sanPhams = db.SANPHAMs.Where(sp => sp.CHITIETLOAISP.CHITIETLOAI.LOAI.MALOAI == categoryId);
                return View(sanPhams);
            }
            else if(!string.IsNullOrEmpty(subCategoryId))
            {
                var sanPhams = db.SANPHAMs.Where(sp => sp.CHITIETLOAISP.CHITIETLOAI.MACTLOAI == subCategoryId);
                return View(sanPhams);
            }
            else
            {
                var sanPhams = db.SANPHAMs.Where(sp => sp.CHITIETLOAISP.MACTL_SP == subCateProId);
                return View(sanPhams);
            }

        }

        public ActionResult ShowSanPham()
        {
            var sanPhams = db.SANPHAMs.ToList();
            return View(sanPhams);
        }

        public ActionResult FilterByPrice(List<string> prices)
        {
            // Xử lí yêu cầu lọc sản phẩm dựa trên giá
            // Ở đây, bạn có thể phân tích các giá trị và lọc sản phẩm dựa trên khoảng giá
            // Ví dụ:
            var filteredProducts = new List<SANPHAM>();

            foreach (var priceRange in prices)
            {
                switch (priceRange)
                {
                    case "Dưới 500.000đ":
                        // Lọc các sản phẩm dưới 500,000 VND
                        filteredProducts.AddRange(db.SANPHAMs.Where(sp => sp.GIABAN < 500000));
                        break;
                    case "500.000đ - 1.000.000đ":
                        // Lọc các sản phẩm từ 500,000 đến 1,000,000 VND
                        filteredProducts.AddRange(db.SANPHAMs.Where(sp => sp.GIABAN >= 500000 && sp.GIABAN <= 1000000));
                        break;
                    case "1.000.000đ - 1.500.000đ":
                        filteredProducts.AddRange(db.SANPHAMs.Where(sp => sp.GIABAN >= 1000000 && sp.GIABAN <= 1500000));
                        break;
                    case "1.500.000đ - 2.000.000đ":
                        filteredProducts.AddRange(db.SANPHAMs.Where(sp => sp.GIABAN >= 1500000 && sp.GIABAN <= 2000000));
                        break;
                    case "Trên 2.000.000đ":
                        filteredProducts.AddRange(db.SANPHAMs.Where(sp => sp.GIABAN >= 2000000));
                        break;
                }
            }

            //// Loại bỏ các sản phẩm trùng lặp
            //var uniqueFilteredProducts = filteredProducts.Distinct().ToList();

            return PartialView("ShowSanPham", /*uniqueFilteredProducts*/ filteredProducts);
        }

        public ActionResult FilterBySubcategory(string subcategoryId)
        {
            // Lọc sản phẩm dựa trên loại sản phẩm con
            var filteredProducts = db.SANPHAMs.Where(p => p.MACTL_SP == subcategoryId).ToList();
            return PartialView("ShowSanPham", filteredProducts);
        }
    }
}