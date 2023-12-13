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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class QL_THEFACESHOPEntities : DbContext
    {
        public QL_THEFACESHOPEntities()
            : base("name=QL_THEFACESHOPEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<CACMIEN> CACMIENs { get; set; }
        public virtual DbSet<CHITIETGIOHANG> CHITIETGIOHANGs { get; set; }
        public virtual DbSet<CHITIETLOAI> CHITIETLOAIs { get; set; }
        public virtual DbSet<CHITIETLOAISP> CHITIETLOAISPs { get; set; }
        public virtual DbSet<CTDG> CTDGs { get; set; }
        public virtual DbSet<CTDN> CTDNs { get; set; }
        public virtual DbSet<DANGBAOCHE> DANGBAOCHEs { get; set; }
        public virtual DbSet<DONGIAO> DONGIAOs { get; set; }
        public virtual DbSet<DONNHAP> DONNHAPs { get; set; }
        public virtual DbSet<DONVIHANHCHINH> DONVIHANHCHINHs { get; set; }
        public virtual DbSet<GIOHANG> GIOHANGs { get; set; }
        public virtual DbSet<HINHANHSP> HINHANHSPs { get; set; }
        public virtual DbSet<KHACHHANG> KHACHHANGs { get; set; }
        public virtual DbSet<LOAI> LOAIs { get; set; }
        public virtual DbSet<NHANVIEN> NHANVIENs { get; set; }
        public virtual DbSet<PHUONGXA> PHUONGXAs { get; set; }
        public virtual DbSet<QUANHUYEN> QUANHUYENs { get; set; }
        public virtual DbSet<QUYCACHDONGGOI> QUYCACHDONGGOIs { get; set; }
        public virtual DbSet<QUYEN> QUYENs { get; set; }
        public virtual DbSet<SANPHAM> SANPHAMs { get; set; }
        public virtual DbSet<TINHTHANH> TINHTHANHs { get; set; }
    
        [DbFunction("QL_THEFACESHOPEntities", "ChiNgay")]
        public virtual IQueryable<Nullable<double>> ChiNgay(Nullable<System.DateTime> ngayBatDau, Nullable<System.DateTime> ngayKetThuc)
        {
            var ngayBatDauParameter = ngayBatDau.HasValue ?
                new ObjectParameter("NgayBatDau", ngayBatDau) :
                new ObjectParameter("NgayBatDau", typeof(System.DateTime));
    
            var ngayKetThucParameter = ngayKetThuc.HasValue ?
                new ObjectParameter("NgayKetThuc", ngayKetThuc) :
                new ObjectParameter("NgayKetThuc", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<Nullable<double>>("[QL_THEFACESHOPEntities].[ChiNgay](@NgayBatDau, @NgayKetThuc)", ngayBatDauParameter, ngayKetThucParameter);
        }
    
        [DbFunction("QL_THEFACESHOPEntities", "ChiTrongQuy")]
        public virtual IQueryable<Nullable<double>> ChiTrongQuy(Nullable<int> quy)
        {
            var quyParameter = quy.HasValue ?
                new ObjectParameter("Quy", quy) :
                new ObjectParameter("Quy", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<Nullable<double>>("[QL_THEFACESHOPEntities].[ChiTrongQuy](@Quy)", quyParameter);
        }
    
        [DbFunction("QL_THEFACESHOPEntities", "ChiTungThang")]
        public virtual IQueryable<ChiTungThang_Result1> ChiTungThang()
        {
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<ChiTungThang_Result1>("[QL_THEFACESHOPEntities].[ChiTungThang]()");
        }
    
        [DbFunction("QL_THEFACESHOPEntities", "DoanhThuCacQuy")]
        public virtual IQueryable<DoanhThuCacQuy_Result1> DoanhThuCacQuy()
        {
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<DoanhThuCacQuy_Result1>("[QL_THEFACESHOPEntities].[DoanhThuCacQuy]()");
        }
    
        [DbFunction("QL_THEFACESHOPEntities", "DoanhThuTrongQuy")]
        public virtual IQueryable<Nullable<double>> DoanhThuTrongQuy(Nullable<int> quy)
        {
            var quyParameter = quy.HasValue ?
                new ObjectParameter("Quy", quy) :
                new ObjectParameter("Quy", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<Nullable<double>>("[QL_THEFACESHOPEntities].[DoanhThuTrongQuy](@Quy)", quyParameter);
        }
    
        [DbFunction("QL_THEFACESHOPEntities", "DoanhThuTungNgay")]
        public virtual IQueryable<Nullable<double>> DoanhThuTungNgay(Nullable<System.DateTime> ngayBatDau, Nullable<System.DateTime> ngayKetThuc)
        {
            var ngayBatDauParameter = ngayBatDau.HasValue ?
                new ObjectParameter("NgayBatDau", ngayBatDau) :
                new ObjectParameter("NgayBatDau", typeof(System.DateTime));
    
            var ngayKetThucParameter = ngayKetThuc.HasValue ?
                new ObjectParameter("NgayKetThuc", ngayKetThuc) :
                new ObjectParameter("NgayKetThuc", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<Nullable<double>>("[QL_THEFACESHOPEntities].[DoanhThuTungNgay](@NgayBatDau, @NgayKetThuc)", ngayBatDauParameter, ngayKetThucParameter);
        }
    
        [DbFunction("QL_THEFACESHOPEntities", "DoanhThuTungThang")]
        public virtual IQueryable<DoanhThuTungThang_Result1> DoanhThuTungThang()
        {
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<DoanhThuTungThang_Result1>("[QL_THEFACESHOPEntities].[DoanhThuTungThang]()");
        }
    
        [DbFunction("QL_THEFACESHOPEntities", "LocSanPhamTheoGia")]
        public virtual IQueryable<LocSanPhamTheoGia_Result1> LocSanPhamTheoGia(Nullable<int> giaDau, Nullable<int> giaCuoi)
        {
            var giaDauParameter = giaDau.HasValue ?
                new ObjectParameter("giaDau", giaDau) :
                new ObjectParameter("giaDau", typeof(int));
    
            var giaCuoiParameter = giaCuoi.HasValue ?
                new ObjectParameter("giaCuoi", giaCuoi) :
                new ObjectParameter("giaCuoi", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<LocSanPhamTheoGia_Result1>("[QL_THEFACESHOPEntities].[LocSanPhamTheoGia](@giaDau, @giaCuoi)", giaDauParameter, giaCuoiParameter);
        }
    
        [DbFunction("QL_THEFACESHOPEntities", "LoiNhuanTungNgay")]
        public virtual IQueryable<LoiNhuanTungNgay_Result1> LoiNhuanTungNgay(Nullable<System.DateTime> ngayBatDau, Nullable<System.DateTime> ngayKetThuc)
        {
            var ngayBatDauParameter = ngayBatDau.HasValue ?
                new ObjectParameter("NgayBatDau", ngayBatDau) :
                new ObjectParameter("NgayBatDau", typeof(System.DateTime));
    
            var ngayKetThucParameter = ngayKetThuc.HasValue ?
                new ObjectParameter("NgayKetThuc", ngayKetThuc) :
                new ObjectParameter("NgayKetThuc", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<LoiNhuanTungNgay_Result1>("[QL_THEFACESHOPEntities].[LoiNhuanTungNgay](@NgayBatDau, @NgayKetThuc)", ngayBatDauParameter, ngayKetThucParameter);
        }
    
        [DbFunction("QL_THEFACESHOPEntities", "LoiNhuanTungThang")]
        public virtual IQueryable<LoiNhuanTungThang_Result1> LoiNhuanTungThang()
        {
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<LoiNhuanTungThang_Result1>("[QL_THEFACESHOPEntities].[LoiNhuanTungThang]()");
        }
    
        public virtual int pc_InsertSanPham(string tensp, string loai, Nullable<int> giaban, Nullable<int> gianhap, string dangbaoche, string qcdonggoi, string anhdaidien, string noidung, string congdung, Nullable<int> tonkho, string thanhphan, string dungtich)
        {
            var tenspParameter = tensp != null ?
                new ObjectParameter("tensp", tensp) :
                new ObjectParameter("tensp", typeof(string));
    
            var loaiParameter = loai != null ?
                new ObjectParameter("loai", loai) :
                new ObjectParameter("loai", typeof(string));
    
            var giabanParameter = giaban.HasValue ?
                new ObjectParameter("giaban", giaban) :
                new ObjectParameter("giaban", typeof(int));
    
            var gianhapParameter = gianhap.HasValue ?
                new ObjectParameter("gianhap", gianhap) :
                new ObjectParameter("gianhap", typeof(int));
    
            var dangbaocheParameter = dangbaoche != null ?
                new ObjectParameter("dangbaoche", dangbaoche) :
                new ObjectParameter("dangbaoche", typeof(string));
    
            var qcdonggoiParameter = qcdonggoi != null ?
                new ObjectParameter("qcdonggoi", qcdonggoi) :
                new ObjectParameter("qcdonggoi", typeof(string));
    
            var anhdaidienParameter = anhdaidien != null ?
                new ObjectParameter("anhdaidien", anhdaidien) :
                new ObjectParameter("anhdaidien", typeof(string));
    
            var noidungParameter = noidung != null ?
                new ObjectParameter("noidung", noidung) :
                new ObjectParameter("noidung", typeof(string));
    
            var congdungParameter = congdung != null ?
                new ObjectParameter("congdung", congdung) :
                new ObjectParameter("congdung", typeof(string));
    
            var tonkhoParameter = tonkho.HasValue ?
                new ObjectParameter("tonkho", tonkho) :
                new ObjectParameter("tonkho", typeof(int));
    
            var thanhphanParameter = thanhphan != null ?
                new ObjectParameter("thanhphan", thanhphan) :
                new ObjectParameter("thanhphan", typeof(string));
    
            var dungtichParameter = dungtich != null ?
                new ObjectParameter("dungtich", dungtich) :
                new ObjectParameter("dungtich", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("pc_InsertSanPham", tenspParameter, loaiParameter, giabanParameter, gianhapParameter, dangbaocheParameter, qcdonggoiParameter, anhdaidienParameter, noidungParameter, congdungParameter, tonkhoParameter, thanhphanParameter, dungtichParameter);
        }
    
        public virtual int pc_TimMaTiepTheo(string table, ObjectParameter id)
        {
            var tableParameter = table != null ?
                new ObjectParameter("table", table) :
                new ObjectParameter("table", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("pc_TimMaTiepTheo", tableParameter, id);
        }
    
        public virtual int sp_InsertChiTietLoai(string tenctloai, string maloai)
        {
            var tenctloaiParameter = tenctloai != null ?
                new ObjectParameter("tenctloai", tenctloai) :
                new ObjectParameter("tenctloai", typeof(string));
    
            var maloaiParameter = maloai != null ?
                new ObjectParameter("maloai", maloai) :
                new ObjectParameter("maloai", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_InsertChiTietLoai", tenctloaiParameter, maloaiParameter);
        }
    
        public virtual int sp_InsertChiTietLoaiSP(string tenctlsp, string mactloai)
        {
            var tenctlspParameter = tenctlsp != null ?
                new ObjectParameter("tenctlsp", tenctlsp) :
                new ObjectParameter("tenctlsp", typeof(string));
    
            var mactloaiParameter = mactloai != null ?
                new ObjectParameter("mactloai", mactloai) :
                new ObjectParameter("mactloai", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_InsertChiTietLoaiSP", tenctlspParameter, mactloaiParameter);
        }
    
        public virtual int sp_InsertCTDG(string madg, string masp, Nullable<int> soluong, Nullable<double> mucdodg, Nullable<System.DateTime> ngaybl, string binhluan)
        {
            var madgParameter = madg != null ?
                new ObjectParameter("madg", madg) :
                new ObjectParameter("madg", typeof(string));
    
            var maspParameter = masp != null ?
                new ObjectParameter("masp", masp) :
                new ObjectParameter("masp", typeof(string));
    
            var soluongParameter = soluong.HasValue ?
                new ObjectParameter("soluong", soluong) :
                new ObjectParameter("soluong", typeof(int));
    
            var mucdodgParameter = mucdodg.HasValue ?
                new ObjectParameter("mucdodg", mucdodg) :
                new ObjectParameter("mucdodg", typeof(double));
    
            var ngayblParameter = ngaybl.HasValue ?
                new ObjectParameter("ngaybl", ngaybl) :
                new ObjectParameter("ngaybl", typeof(System.DateTime));
    
            var binhluanParameter = binhluan != null ?
                new ObjectParameter("binhluan", binhluan) :
                new ObjectParameter("binhluan", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_InsertCTDG", madgParameter, maspParameter, soluongParameter, mucdodgParameter, ngayblParameter, binhluanParameter);
        }
    
        public virtual int sp_InsertCTDN(string madn, string masp, Nullable<int> soluong)
        {
            var madnParameter = madn != null ?
                new ObjectParameter("madn", madn) :
                new ObjectParameter("madn", typeof(string));
    
            var maspParameter = masp != null ?
                new ObjectParameter("masp", masp) :
                new ObjectParameter("masp", typeof(string));
    
            var soluongParameter = soluong.HasValue ?
                new ObjectParameter("soluong", soluong) :
                new ObjectParameter("soluong", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_InsertCTDN", madnParameter, maspParameter, soluongParameter);
        }
    
        public virtual int sp_InsertDonGiao(Nullable<System.DateTime> ngaylap, string makh, string nguoinhan, string sdt, string sonha, string phuongxa)
        {
            var ngaylapParameter = ngaylap.HasValue ?
                new ObjectParameter("ngaylap", ngaylap) :
                new ObjectParameter("ngaylap", typeof(System.DateTime));
    
            var makhParameter = makh != null ?
                new ObjectParameter("makh", makh) :
                new ObjectParameter("makh", typeof(string));
    
            var nguoinhanParameter = nguoinhan != null ?
                new ObjectParameter("nguoinhan", nguoinhan) :
                new ObjectParameter("nguoinhan", typeof(string));
    
            var sdtParameter = sdt != null ?
                new ObjectParameter("sdt", sdt) :
                new ObjectParameter("sdt", typeof(string));
    
            var sonhaParameter = sonha != null ?
                new ObjectParameter("sonha", sonha) :
                new ObjectParameter("sonha", typeof(string));
    
            var phuongxaParameter = phuongxa != null ?
                new ObjectParameter("phuongxa", phuongxa) :
                new ObjectParameter("phuongxa", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_InsertDonGiao", ngaylapParameter, makhParameter, nguoinhanParameter, sdtParameter, sonhaParameter, phuongxaParameter);
        }
    
        public virtual int sp_InsertDonNhap(string manv, Nullable<System.DateTime> ngaylap, string trangthai)
        {
            var manvParameter = manv != null ?
                new ObjectParameter("manv", manv) :
                new ObjectParameter("manv", typeof(string));
    
            var ngaylapParameter = ngaylap.HasValue ?
                new ObjectParameter("ngaylap", ngaylap) :
                new ObjectParameter("ngaylap", typeof(System.DateTime));
    
            var trangthaiParameter = trangthai != null ?
                new ObjectParameter("trangthai", trangthai) :
                new ObjectParameter("trangthai", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_InsertDonNhap", manvParameter, ngaylapParameter, trangthaiParameter);
        }
    
        public virtual int sp_InsertGioHang(string makh)
        {
            var makhParameter = makh != null ?
                new ObjectParameter("makh", makh) :
                new ObjectParameter("makh", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_InsertGioHang", makhParameter);
        }
    
        public virtual int sp_InsertKhachHang(string ten, string sdt)
        {
            var tenParameter = ten != null ?
                new ObjectParameter("ten", ten) :
                new ObjectParameter("ten", typeof(string));
    
            var sdtParameter = sdt != null ?
                new ObjectParameter("sdt", sdt) :
                new ObjectParameter("sdt", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_InsertKhachHang", tenParameter, sdtParameter);
        }
    
        public virtual int sp_InsertLoai(string tenloai)
        {
            var tenloaiParameter = tenloai != null ?
                new ObjectParameter("tenloai", tenloai) :
                new ObjectParameter("tenloai", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_InsertLoai", tenloaiParameter);
        }
    
        public virtual int sp_InsertNhanVien(string ten, string gioitinh, string sdt, string mk)
        {
            var tenParameter = ten != null ?
                new ObjectParameter("ten", ten) :
                new ObjectParameter("ten", typeof(string));
    
            var gioitinhParameter = gioitinh != null ?
                new ObjectParameter("gioitinh", gioitinh) :
                new ObjectParameter("gioitinh", typeof(string));
    
            var sdtParameter = sdt != null ?
                new ObjectParameter("sdt", sdt) :
                new ObjectParameter("sdt", typeof(string));
    
            var mkParameter = mk != null ?
                new ObjectParameter("mk", mk) :
                new ObjectParameter("mk", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_InsertNhanVien", tenParameter, gioitinhParameter, sdtParameter, mkParameter);
        }
    
        [DbFunction("QL_THEFACESHOPEntities", "ChiCacQuy")]
        public virtual IQueryable<ChiCacQuy_Result> ChiCacQuy()
        {
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<ChiCacQuy_Result>("[QL_THEFACESHOPEntities].[ChiCacQuy]()");
        }
    }
}
