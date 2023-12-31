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
    
    public partial class DONNHAP
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DONNHAP()
        {
            this.CTDNs = new HashSet<CTDN>();
        }
    
        [Display(Name = "Mã đơn nhập")]
        public string MADN { get; set; }
        [Display(Name = "Tên nhân viên")]
        public string MANV { get; set; }
        [Display(Name = "Ngày lập")]
        public Nullable<System.DateTime> NGAYLAP { get; set; }
        [Display(Name = "Tổng tiền")]
        public Nullable<double> TONGTIEN { get; set; }
        [Display(Name = "Trạng thái")]
        public string TRANGTHAI { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTDN> CTDNs { get; set; }
        public virtual NHANVIEN NHANVIEN { get; set; }
    }
}
