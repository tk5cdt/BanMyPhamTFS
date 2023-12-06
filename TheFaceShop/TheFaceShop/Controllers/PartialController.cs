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
                        // Thêm các trường hợp khác tương tự nếu cần
                }
            }

            // Loại bỏ các sản phẩm trùng lặp
            var uniqueFilteredProducts = filteredProducts.Distinct().ToList();

            return PartialView("ShowSanPham", uniqueFilteredProducts);
        }

        public ActionResult FilterBySubcategory(string subcategoryId)
        {
            // Lọc sản phẩm dựa trên loại sản phẩm con
            var filteredProducts = db.SANPHAMs.Where(p => p.MACTL_SP == subcategoryId).ToList();
            return PartialView("ShowSanPham", filteredProducts);
        }
    }
}