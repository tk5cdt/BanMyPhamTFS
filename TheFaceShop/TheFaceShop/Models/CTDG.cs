//------------------------------------------------------------------------------
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
    
    public partial class CTDG
    {
        public string MADG { get; set; }
        public string MASP { get; set; }
        public Nullable<int> SOLUONG { get; set; }
        public Nullable<double> THANHTIEN { get; set; }
        public Nullable<double> MUCDODG { get; set; }
        public Nullable<System.DateTime> NGAYBL { get; set; }
        public string BINHLUAN { get; set; }
    
        public virtual DONGIAO DONGIAO { get; set; }
        public virtual SANPHAM SANPHAM { get; set; }
    }
}