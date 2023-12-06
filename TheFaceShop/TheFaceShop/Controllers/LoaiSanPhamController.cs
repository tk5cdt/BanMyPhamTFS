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

        public ActionResult DanhMuc(string categoryId, string subCategoryId, string subCateProId, string sortOrder)
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
                    var cateProducts = db.CHITIETLOAISPs.Where(ct => ct.MACTLOAI == subCategoryId).ToList();

                    ViewBag.SubCategory = subCategory;
                    ViewBag.cateProduct = cateProducts;

                    if (!string.IsNullOrEmpty(subCateProId))
                    {
                        var cateProduct2 = db.CHITIETLOAISPs.FirstOrDefault(ct => ct.MACTL_SP == subCateProId);
                        var products = db.SANPHAMs.Where(sp => sp.MACTL_SP == subCateProId).ToList();

                        ViewBag.cateProduct2 = cateProduct2;
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

                        ViewBag.Product = products;
                    }
                }
            }
            return View(categories);
        }
    }
}