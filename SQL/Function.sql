---------Thu
CREATE FUNCTION f_DoanhThuTungNgay(@NgayBatDau date, @NgayKetThuc date)
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

CREATE FUNCTION f_DoanhThuThang(@Thang INT)
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

CREATE FUNCTION f_DoanhThuTrongNam()
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

CREATE FUNCTION f_DoanhThuTungThang()
RETURNS TABLE
AS
RETURN (
    SELECT Thang, f_DoanhThuThang(Thang) AS DoanhThu
    FROM (
        VALUES (1), (2), (3), (4), (5), (6),
               (7), (8), (9), (10), (11), (12)
    ) AS Thang(Thang)
);
go

CREATE FUNCTION f_DoanhThuTrongQuy(@Quy int)
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

CREATE FUNCTION f_TongDoanhThuTrongQuy(@Quy int)
RETURNS Float
AS
BEGIN
    declare @Tong int = 0
	select @Tong = sum(DoanhThu) from f_DoanhThuTrongQuy(@Quy)
	return @Tong;
END
go

CREATE FUNCTION f_DoanhThuCacQuy()
RETURNS TABLE
AS
RETURN (
    SELECT Quy, f_TongDoanhThuTrongQuy(Quy) AS DoanhThu
    FROM (
        VALUES (1), (2), (3), (4)
    ) AS Quy(Quy)
);
go

--------Chi
CREATE FUNCTION f_ChiNgay(@NgayBatDau date, @NgayKetThuc date)
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

CREATE FUNCTION f_ChiTrongNam()
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

CREATE FUNCTION f_ChiTrongThang(@Thang INT)
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


CREATE FUNCTION f_ChiTungThang()
RETURNS TABLE
AS
RETURN (
    SELECT Thang, f_ChiTrongThang(Thang) AS Chi
    FROM (
        VALUES (1), (2), (3), (4), (5), (6),
               (7), (8), (9), (10), (11), (12)
    ) AS Thang(Thang)
);
go

CREATE FUNCTION f_ChiTrongQuy(@Quy int)
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

CREATE FUNCTION f_TongChiTrongQuy(@Quy int)
RETURNS Float
AS
BEGIN
    declare @Tong int = 0
	select @Tong = sum(Chi) from f_ChiTrongQuy(@Quy)
	return @Tong;
END
go

CREATE FUNCTION f_ChiThuCacQuy()
RETURNS TABLE
AS
RETURN (
    SELECT Quy, f_TongDoanhThuTrongQuy(Quy) AS Chi
    FROM (
        VALUES (1), (2), (3), (4)
    ) AS Quy(Quy)
);
go

----------Lợi nhuận
CREATE FUNCTION f_LoiNhuanTungNgay(@NgayBatDau date, @NgayKetThuc date)
RETURNS TABLE
AS
RETURN (
    select format(convert(date, COALESCE(n.NGAYLAP, g.NGAYLAP)), 'dd-MM-yyyy') as Ngay, ISNULL(isnull(sum(TRIGIA), 0)-isnull(sum(TONGTIEN), 0), 0) as LoiNhuan
	from DONGIAO g full join DONNHAP n
	on g.NGAYLAP = n.NGAYLAP
	where (g.NGAYLAP >= @NgayBatDau and g.NGAYLAP <= @NgayKetThuc) or (n.NGAYLAP >= @NgayBatDau and n.NGAYLAP <= @NgayKetThuc)
	group by convert(date, COALESCE(g.NGAYLAP, n.NGAYLAP))
);
go

CREATE FUNCTION f_LoiNhuanTungThang()
RETURNS TABLE
AS
RETURN (
    SELECT Thang, ISNULL(f_DoanhThuTrongThang(Thang) - f_ChiTrongThang(Thang), 0) AS LOINHUAN
    FROM (
        VALUES (1), (2), (3), (4), (5), (6),
               (7), (8), (9), (10), (11), (12)
    ) AS Thang(Thang)
);
go