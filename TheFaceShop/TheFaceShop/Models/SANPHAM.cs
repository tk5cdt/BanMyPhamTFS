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

    public partial class SANPHAM
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SANPHAM()
        {
            this.CHITIETGIOHANGs = new HashSet<CHITIETGIOHANG>();
            this.CTDGs = new HashSet<CTDG>();
            this.CTDNs = new HashSet<CTDN>();
            this.HINHANHSPs = new HashSet<HINHANHSP>();
        }
    
        public string MASP { get; set; }
        [Display(Name ="Tên sản phẩm")]
        public string TENSP { get; set; }
        public string MACTL_SP { get; set; }
        [Display(Name = "Giá bán")]
        public Nullable<double> GIABAN { get; set; }
        [Display(Name = "Giá nhập")]
        public Nullable<double> GIANHAP { get; set; }
        public string MADBC { get; set; }
        public string MAQCDG { get; set; }
        public string ANHDAIDIEN { get; set; }
        public string NOIDUNG { get; set; }
        [Display(Name = "Công dụng")]
        public string CONGDUNG { get; set; }
        public Nullable<double> TONGDANHGIA { get; set; }
        [Display(Name = "Tồn kho")]
        public Nullable<int> TONKHO { get; set; }
        public string THANHPHAN { get; set; }
        public string DUNGTICH { get; set; }
        [Display(Name = "Trạng thái")]
        public string TRANGTHAI { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CHITIETGIOHANG> CHITIETGIOHANGs { get; set; }
        public virtual CHITIETLOAISP CHITIETLOAISP { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTDG> CTDGs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTDN> CTDNs { get; set; }
        public virtual DANGBAOCHE DANGBAOCHE { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HINHANHSP> HINHANHSPs { get; set; }
        public virtual QUYCACHDONGGOI QUYCACHDONGGOI { get; set; }
    }
}
