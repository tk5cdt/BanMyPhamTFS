---------Thu
USE QL_THEFACESHOP
go

CREATE FUNCTION dbo.DoanhThuTungNgay(@NgayBatDau date, @NgayKetThuc date)
RETURNS TABLE
AS
RETURN
(
	SELECT SUM(TRIGIA) as DoanhThu
	FROM DONGIAO
	WHERE NGAYLAP >= @NgayBatDau and NGAYLAP <= @NgayKetThuc and TrangThai = N'Đã giao'
	GROUP BY NGAYLAP
)
go

CREATE FUNCTION dbo.DoanhThuThang(@Thang INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @DoanhThu FLOAT;
    SELECT @DoanhThu = SUM(TRIGIA)
    FROM DONGIAO
    WHERE MONTH(NGAYLAP) = @Thang and YEAR(NGAYLAP) = YEAR(GETDATE()) and TrangThai = N'Đã giao'
    RETURN @DoanhThu;
END;
go

CREATE FUNCTION dbo.DoanhThuTrongNam()
RETURNS FLOAT
AS
BEGIN
    DECLARE @DoanhThu FLOAT;
    SELECT @DoanhThu = SUM(TRIGIA)
    FROM DONGIAO
    WHERE YEAR(NGAYLAP) = YEAR(GETDATE()) and TrangThai = N'Đã giao';
    RETURN @DoanhThu;
END;
go

CREATE FUNCTION dbo.DoanhThuTungThang()
RETURNS TABLE
AS
RETURN (
    SELECT Thang, dbo.DoanhThuThang(Thang) AS DoanhThu
    FROM (
        VALUES (1), (2), (3), (4), (5), (6),
               (7), (8), (9), (10), (11), (12)
    ) AS Thang(Thang)
);
go

CREATE FUNCTION dbo.DoanhThuTrongQuy(@Quy int)
RETURNS TABLE
AS
RETURN (
    SELECT SUM(TRIGIA) AS DoanhThu
	FROM DONGIAO
	WHERE YEAR(NGAYLAP) = year(getdate())
	AND Datepart(QUARTER, NGAYLAP) = @Quy or Datepart(QUARTER, NGAYLAP) = @Quy
	group by MONTH(NGAYLAP)
);
go

CREATE FUNCTION dbo.TongDoanhThuTrongQuy(@Quy int)
RETURNS Float
AS
BEGIN
    declare @Tong int = 0
	select @Tong = sum(DoanhThu) from dbo.DoanhThuTrongQuy(@Quy)
	return @Tong;
END
go

CREATE FUNCTION dbo.DoanhThuCacQuy()
RETURNS TABLE
AS
RETURN (
    SELECT Quy, dbo.TongDoanhThuTrongQuy(Quy) AS DoanhThu
    FROM (
        VALUES (1), (2), (3), (4)
    ) AS Quy(Quy)
);
go

--------Chi
CREATE FUNCTION dbo.ChiNgay(@NgayBatDau date, @NgayKetThuc date)
RETURNS TABLE
AS
RETURN
(
	SELECT SUM(TONGTIEN) as Chi
	FROM DONNHAP
	WHERE NGAYLAP >= @NgayBatDau and NGAYLAP <= @NgayKetThuc and TrangThai = N'Đã nhận'
	GROUP BY NGAYLAP
)
go

CREATE FUNCTION dbo.ChiTrongNam()
RETURNS FLOAT
AS
BEGIN
    DECLARE @DoanhThu FLOAT;
    SELECT @DoanhThu = SUM(TongTien)
    FROM DONNHAP
    WHERE YEAR(NGAYLAP) = YEAR(GETDATE()) and TrangThai = N'Đã nhận';
    RETURN @DoanhThu;
END;
go

CREATE FUNCTION dbo.ChiTrongThang(@Thang INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @Chi FLOAT;
    SELECT @Chi = SUM(TongTien)
    FROM DONNHAP
    WHERE MONTH(NgayLap) = @Thang and YEAR(NgayLap) = YEAR(GETDATE()) and TrangThai = N'Đã nhận';
    RETURN @Chi;
END;
go


CREATE FUNCTION dbo.ChiTungThang()
RETURNS TABLE
AS
RETURN (
    SELECT Thang, dbo.ChiTrongThang(Thang) AS Chi
    FROM (
        VALUES (1), (2), (3), (4), (5), (6),
               (7), (8), (9), (10), (11), (12)
    ) AS Thang(Thang)
);
go

CREATE FUNCTION dbo.ChiTrongQuy(@Quy int)
RETURNS TABLE
AS
RETURN (
    SELECT SUM(TONGTIEN) AS Chi
	FROM DONNHAP
	WHERE YEAR(NGAYLAP) = year(getdate())
	AND Datepart(QUARTER, NGAYLAP) = @Quy or Datepart(QUARTER, NGAYLAP) = @Quy
	group by MONTH(NGAYLAP)
);
go

CREATE FUNCTION dbo.TongChiTrongQuy(@Quy int)
RETURNS Float
AS
BEGIN
    declare @Tong int = 0
	select @Tong = sum(Chi) from dbo.ChiTrongQuy(@Quy)
	return @Tong;
END
go

CREATE FUNCTION dbo.ChiThuCacQuy()
RETURNS TABLE
AS
RETURN (
    SELECT Quy, dbo.TongDoanhThuTrongQuy(Quy) AS Chi
    FROM (
        VALUES (1), (2), (3), (4)
    ) AS Quy(Quy)
);
go

----------Lợi nhuận
CREATE FUNCTION dbo.LoiNhuanTungNgay(@NgayBatDau date, @NgayKetThuc date)
RETURNS TABLE
AS
RETURN (
    select COALESCE(n.NGAYLAP, g.NGAYLAP) as Ngay, isnull(sum(TRIGIA), 0) - isnull(sum(TONGTIEN), 0) as LoiNhuan
	from DONGIAO g full join DONNHAP n
	on g.NGAYLAP = n.NGAYLAP
	where (g.NGAYLAP >= @NgayBatDau and g.NGAYLAP <= @NgayKetThuc) or (n.NGAYLAP >= @NgayBatDau and n.NGAYLAP <= @NgayKetThuc)
	group by COALESCE(n.NGAYLAP, g.NGAYLAP)
);
go

CREATE FUNCTION dbo.LoiNhuanTungThang()
RETURNS TABLE
AS
RETURN (
    SELECT Thang, ISNULL(dbo.DoanhThuThang(Thang) - dbo.ChiTrongThang(Thang), 0) AS LOINHUAN
    FROM (
        VALUES (1), (2), (3), (4), (5), (6),
               (7), (8), (9), (10), (11), (12)
    ) AS Thang(Thang)
);
go

------------------Lọc giá sản phẩm--------------------
CREATE FUNCTION dbo.LocSanPhamTheoGia(@giaDau int, @giaCuoi int)
RETURNS TABLE
AS
	RETURN (SELECT * FROM SANPHAM
			WHERE GIABAN >= @giaDau AND GIABAN <= @giaCuoi)
GO