CREATE FUNCTION dbo.DoanhThuThang(@Thang INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @DoanhThu FLOAT;
    SELECT @DoanhThu = SUM(TRIGIA)
    FROM DONGIAO
    WHERE MONTH(NGAYLAP) = @Thang and YEAR(NGAYLAP) = YEAR(GETDATE());
    RETURN @DoanhThu;
END;
go

CREATE FUNCTION dbo.DoanhThuNam()
RETURNS FLOAT
AS
BEGIN
    DECLARE @DoanhThu FLOAT;
    SELECT @DoanhThu = SUM(TRIGIA)
    FROM DONGIAO
    WHERE YEAR(NGAYLAP) = YEAR(GETDATE());
    RETURN @DoanhThu;
END;
go