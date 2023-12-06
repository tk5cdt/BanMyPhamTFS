using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheFaceShop.Models;

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
        public ActionResult AddtoCart(string id)
        {
            var pro = db.SANPHAMs.SingleOrDefault(s => s.MASP == id);
            if (pro != null)
            {
                GetCart().Add(pro);
            }
            return RedirectToAction("ShowToCart", "ShoppingCart");
        }
        public ActionResult ShowToCart()
        {
            if (Session["Cart"] == null)
            {
                return View("EmptyCart");
            }
            Cart cart = Session["Cart"] as Cart;
            return View(cart);
        }
        public ActionResult Update_Quantity_Cart(FormCollection form)
        {
            Cart cart = Session["Cart"] as Cart;
            string id_pro = form["id_Pro"];
            int quantity = int.Parse(form["Quantity"]);
            cart.Update_Quantity_Shopping(id_pro, quantity);
            return RedirectToAction("ShowToCart", "ShoppingCart");
        }
        public ActionResult RemoveCart(string id)
        {
            Cart cart = Session["Cart"] as Cart;
            cart.Remove_CartItem(id);
            return RedirectToAction("ShowToCart", "ShoppingCart");
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

        public ActionResult CheckOut(FormCollection form)
        {
            try
            {
                //Chưa lấy được iduser từ session
                //Chưa xử lý dược _order_Detail
                Cart cart = Session["Cart"] as Cart;
                DONGIAO _order = new DONGIAO();
                _order.MAKH = form["iduser"];
                _order.NGUOINHAN = form["hovaten"];
                _order.SDT = form["sdt"];
                _order.SONHA = form["sonha"];
                _order.PHUONGXA = form["phuongxa"];
                _order.NGAYLAP = DateTime.Now;
                db.DONGIAOs.Add(_order);
                foreach (var item in cart.Items)
                {
                    CHITIETGIOHANG _order_Detail = new CHITIETGIOHANG();
                    _order_Detail.MAGH = _order.MADG;
                    _order_Detail.MASP = item._shopping_product.MASP;
                
                    _order_Detail.SOLUONG = item._shopping_quantity;
                    db.CHITIETGIOHANGs.Add(_order_Detail);
                }
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