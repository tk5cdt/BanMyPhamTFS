using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheFaceShop.Models;

namespace TheFaceShop.Controllers
{
    public class LoaiSanPhamController : Controller
    {
        private QL_THEFACESHOPEntities db = new QL_THEFACESHOPEntities();

        public ActionResult DanhMuc(string categoryId, string subCategoryId, string sortOrder)
        {
            var categories = db.LOAIs.ToList();

            if (!string.IsNullOrEmpty(categoryId))
            {
                var category = db.LOAIs.FirstOrDefault(ct => ct.MALOAI == categoryId);
                var subCategories = db.CHITIETLOAIs.Where(ct => ct.MALOAI == categoryId).ToList();

                ViewBag.Category = category;
                ViewBag.SubCategories = subCategories;

                if (!string.IsNullOrEmpty(subCategoryId))
                {
                    var subCategory = db.CHITIETLOAIs.FirstOrDefault(ct => ct.MACTLOAI == subCategoryId);
                    var products = db.SANPHAMs.Where(sp => sp.MACTL_SP == subCategoryId).ToList();

                    ViewBag.SubCategory = subCategory;

                    switch (sortOrder)
                    {
                        case "Giá tăng dần":
                            products = products.OrderBy(p => p.GIABAN).ToList();
                            break;
                        case "Giá giảm dần":
                            products = products.OrderByDescending(p => p.GIABAN).ToList();
                            break;
                        default:
                            break;
                    }

                    ViewBag.Products = products;
                }
            }
            return View(categories);
        }
    }
}