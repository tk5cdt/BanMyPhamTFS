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
    
    public partial class NHANVIEN
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NHANVIEN()
        {
            this.DONNHAPs = new HashSet<DONNHAP>();
            this.QUYENs = new HashSet<QUYEN>();
        }
    
        public string MANV { get; set; }
        public string TENNV { get; set; }
        public string GIOITINH { get; set; }
        public string SDT { get; set; }
        public string MATKHAU { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DONNHAP> DONNHAPs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QUYEN> QUYENs { get; set; }
    }
}