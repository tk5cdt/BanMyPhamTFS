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
    
    public partial class TINHTHANH
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TINHTHANH()
        {
            this.QUANHUYENs = new HashSet<QUANHUYEN>();
        }
    
        public string code { get; set; }
        public string name { get; set; }
        public string name_en { get; set; }
        public string full_name { get; set; }
        public string full_name_en { get; set; }
        public string code_name { get; set; }
        public Nullable<int> administrative_unit_id { get; set; }
        public Nullable<int> administrative_region_id { get; set; }
    
        public virtual CACMIEN CACMIEN { get; set; }
        public virtual DONVIHANHCHINH DONVIHANHCHINH { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QUANHUYEN> QUANHUYENs { get; set; }
    }
}
