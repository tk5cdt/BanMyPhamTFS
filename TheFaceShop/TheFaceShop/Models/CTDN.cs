﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TheFaceShop.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class CTDN
    {
        public string MADN { get; set; }
        public string MASP { get; set; }
        [Display(Name = "Số lượng")]
        public Nullable<int> SOLUONG { get; set; }
        [Display(Name = "Thành tiền")]
        public Nullable<double> THANHTIEN { get; set; }

        public virtual DONNHAP DONNHAP { get; set; }
        public virtual SANPHAM SANPHAM { get; set; }
    }
}
