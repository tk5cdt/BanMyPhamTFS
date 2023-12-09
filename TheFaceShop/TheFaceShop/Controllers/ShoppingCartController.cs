using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Razor.Text;
using TheFaceShop.Models;
using static System.Net.Mime.MediaTypeNames;

namespace TheFaceShop.Areas.Admin.Controllers
{
    public class ShoppingCartController : Controller
    {
        QL_THEFACESHOPEntities db = new QL_THEFACESHOPEntities();
        // GET: ShoppingCart
        public Cart GetCart()
        {
            Cart cart = Session["Cart"] as Cart;
            if (cart == null || Session["Cart"] == null)
            {
                cart = new Cart();
                Session["Cart"] = cart;
            }
            return cart;
        }
        [HttpPost]
        public ActionResult AddtoCart(string id)
        {
            var pro = db.SANPHAMs.SingleOrDefault(s => s.MASP == id);
            if (Session["user"] != null)
            {
                var kh = Session["user"] as KHACHHANG;
                if (pro != null)
                {
                    GetCart().Add(pro);
                }
                string maKH = kh.MAKH;
                var gh = db.GIOHANGs.FirstOrDefault(t => t.MAKH == maKH);
                string maGH = gh.MAGH;

                var ctgh = db.CHITIETGIOHANGs.FirstOrDefault(t => t.MASP == pro.MASP && t.MAGH == maGH);

                if (ctgh == null)
                {
                    int soLuong = 1;


                    CHITIETGIOHANG gioHang = new CHITIETGIOHANG()
                    {

                        MAGH = maGH,
                        MASP = pro.MASP,
                        SOLUONG = soLuong
                    };
                    db.CHITIETGIOHANGs.Add(gioHang);
                    db.SaveChanges();
                }
                else
                {
                    int a = (int)ctgh.SOLUONG;
                    int soLuong = a + 1;

                    CHITIETGIOHANG gioHang = new CHITIETGIOHANG()
                    {

                        MAGH = maGH,
                        MASP = pro.MASP,
                        SOLUONG = soLuong
                    };
                    db.CHITIETGIOHANGs.AddOrUpdate(gioHang);
                    db.SaveChanges();
                }

                return RedirectToAction("ShowToCart", "ShoppingCart");
            }
            else
            {
                GetCart().Add(pro);
            }
            return RedirectToAction("ShowToCart", "ShoppingCart");
        }

        public List<CHITIETGIOHANG> GetCartByMaKH(string maKH)
        {
            // Lấy danh sách các chi tiết giỏ hàng của khách hàng theo mã khách hàng

            var gh = db.GIOHANGs.FirstOrDefault(t => t.MAKH == maKH);
            string maGH = gh.MAGH;
            var chitietGioHangs = db.CHITIETGIOHANGs.Where(c => c.MAGH == maGH).ToList();

            // Trả về danh sách chi tiết giỏ hàng
            return chitietGioHangs;
        }
        public ActionResult ShowToCart()
        {
            if (Session["user"] != null)
            {
                var kh = Session["user"] as KHACHHANG;
                string maKH = kh.MAKH;
                List<CHITIETGIOHANG> chitietGioHangs = GetCartByMaKH(maKH);

                // Tạo một cart mới
                Cart cart = new Cart();

                // Thêm các sản phẩm vào cart
                foreach (var chitietGioHang in chitietGioHangs)
                {
                    // Lấy sản phẩm từ database
                    SANPHAM sanPham = db.SANPHAMs.SingleOrDefault(s => s.MASP == chitietGioHang.MASP);
                    // Thêm sản phẩm vào cart
                    cart.Add(sanPham, (int)chitietGioHang.SOLUONG);
                }
                Session["Cart"] = cart;

                if (Session["Cart"] == null)
                {
                    return View("EmptyCart");
                }
                else
                {
                    return View(cart);
                }
            }
            else
            {
                if (Session["Cart"] == null)
                {
                    return View("EmptyCart");
                }
                else
                {
                    Cart cart = Session["Cart"] as Cart;
                    return View(cart);
                }
            }

        }
        public ActionResult Update_Quantity_Cart(FormCollection form)
        {
            if (Session["user"] != null)
            {
                Cart cart = Session["Cart"] as Cart;
                string id_pro = form["id_Pro"];
                int quantity = int.Parse(form["Quantity"]);
                cart.Update_Quantity_Shopping(id_pro, quantity);
                //uPDATE DB
                var kh = Session["user"] as KHACHHANG;
                string maKH = kh.MAKH;
                var gh = db.GIOHANGs.FirstOrDefault(t => t.MAKH == maKH);
                string maGH = gh.MAGH;
                var ctgh = db.CHITIETGIOHANGs.FirstOrDefault(t => t.MASP == id_pro && t.MAGH == maGH);
                int soLuong = quantity;
                CHITIETGIOHANG gioHang = new CHITIETGIOHANG()
                {
                    MAGH = maGH,
                    MASP = id_pro,
                    SOLUONG = soLuong
                };

                db.CHITIETGIOHANGs.AddOrUpdate(gioHang);
                db.SaveChanges();

                return RedirectToAction("ShowToCart", "ShoppingCart");
            }
            else
            {
                Cart cart = Session["Cart"] as Cart;
                string id_pro = form["id_Pro"];
                int quantity = int.Parse(form["Quantity"]);
                cart.Update_Quantity_Shopping(id_pro, quantity);

                return RedirectToAction("ShowToCart", "ShoppingCart");
            }

        }
        public ActionResult RemoveCart(string id)
        {
            if (Session["user"] != null)
            {
                Cart cart = Session["Cart"] as Cart;
                cart.Remove_CartItem(id);
                //Xoa trong db

                var kh = Session["user"] as KHACHHANG;
                string maKH = kh.MAKH;
                var gh = db.GIOHANGs.FirstOrDefault(t => t.MAKH == maKH);
                string maGH = gh.MAGH;
                CHITIETGIOHANG ctgh = db.CHITIETGIOHANGs.FirstOrDefault(t => t.MASP == id && t.MAGH == maGH);

                db.CHITIETGIOHANGs.Remove(ctgh);
                db.SaveChanges();
                return RedirectToAction("ShowToCart", "ShoppingCart");
            }
            else
            {
                Cart cart = Session["Cart"] as Cart;
                cart.Remove_CartItem(id);
                return RedirectToAction("ShowToCart", "ShoppingCart");
            }
        }


        public PartialViewResult BagCart()
        {
            int _t_item = 0;
            Cart cart = Session["Cart"] as Cart;
            if (cart != null)
            {
                _t_item = cart.Total_Quantity();
            }
            ViewBag.infoCart = _t_item;
            return PartialView("BagCart");
        }

        private float TinhTongTien(List<CHITIETGIOHANG> g)
        {
            float kq = 0;
            foreach (var i in g)
            {
                SANPHAM s = db.SANPHAMs.Where(row => string.Compare(row.MASP, i.MASP) == 0).FirstOrDefault();
                kq += ((int)i.SOLUONG * (float)s.GIABAN);
            }
            return kq;
        }


        [Authorize(Roles = "KhachHang")]

        [HttpPost]
        public ActionResult CheckOut(FormCollection form)
        {
            try
            {

                Cart cart = Session["Cart"] as Cart;
                var kh = Session["user"] as KHACHHANG;
                var gh = db.GIOHANGs.FirstOrDefault(t => t.MAKH == kh.MAKH);
                string maGH = gh.MAGH;
                List<CHITIETGIOHANG> g = db.CHITIETGIOHANGs.Where(row => string.Compare(row.MAGH, maGH) == 0).ToList();
                DONGIAO _order = new DONGIAO();
                _order.MADG = "DG000";
                var obj = new ObjectParameter("id", typeof(string));
                db.pc_TimMaTiepTheo("DONGIAO", obj);
                _order.NGAYLAP = DateTime.Now;
                _order.MAKH = kh.MAKH;
                _order.NGUOINHAN = kh.TENKH;
                _order.SDT = kh.SDT;
                _order.SONHA = form["sonha"];
                _order.PHUONGXA = form["phuongxa"];
                _order.TRIGIA = TinhTongTien(g);
                _order.NGAYLAP = DateTime.Now;
                _order.TRANGTHAI = "Đang chuẩn bị";
                db.DONGIAOs.Add(_order);


                db.SaveChanges();
                cart.ClearCart();
                return RedirectToAction("Shopping_Success", "ShoppingCart");
            }
            catch
            {
                return Content("Bạn đã đặt hàng thành công!!!!!");
            }
        }

        public ActionResult Shopping_Success()
        {
            return View();
        }
    }
}