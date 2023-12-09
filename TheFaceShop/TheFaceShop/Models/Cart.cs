﻿
using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TheFaceShop.Models
{

    public class CartItem
    {
        public SANPHAM _shopping_product { get; set; }
        public int _shopping_quantity { get; set; }
    }
    public class Cart
    {
        List<CartItem> items = new List<CartItem>();

        public string sMaSP { get; set; }
        public string sMaGH { get; set; }
        public int iSoLuong { get; set; }

        public IEnumerable<CartItem> Items
        {
            get { return items; }
        }
        public Cart()
        {

        }

        public Cart(string id)
        {

        }
        public void Add(SANPHAM _pro, int _quantity = 1)
        {
            var item = items.FirstOrDefault(s => s._shopping_product.MASP == _pro.MASP);
            if (item == null)
            {
                items.Add(new CartItem
                {
                    _shopping_product = _pro,
                    _shopping_quantity = _quantity
                });
            }
            else
            {
                item._shopping_quantity += _quantity;
            }
        }
        public void Update_Quantity_Shopping(string id, int _quantity)
        {
            var item = items.Find(s => s._shopping_product.MASP == id);
            //if(item != null)
            //{
            //if(items.Find( s => s._shopping_quantity > _quantity)!=null)
            item._shopping_quantity = _quantity;
            //}
            //else
            //{
            //item._shopping_quantity = 1;
            //}    
        }
        public double Total_Money()
        {
            var total = items.Sum(s => s._shopping_product.GIABAN * s._shopping_quantity);
            return (double)total;
        }
        public void Remove_CartItem(string id)
        {
            items.RemoveAll(s => s._shopping_product.MASP == id);
        }

        public int Total_Quantity()
        {
            return items.Sum(s => s._shopping_quantity);
        }
        public void ClearCart()
        {
            items.Clear();
        }
    }
}
