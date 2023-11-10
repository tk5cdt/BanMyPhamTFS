use master
DROP DATABASE QL_THEFACESHOP
GO

------------------------------------------------------------------------------------------------------------------

CREATE DATABASE QL_THEFACESHOP
GO

USE QL_THEFACESHOP

SET DATEFORMAT YMD

------------------------------------------------------------------------------------------------------------------

CREATE TABLE SANPHAM
(
	MASP        VARCHAR(8) NOT NULL DEFAULT 'SP000',
	TENSP       NVARCHAR(100) UNIQUE,
	LOAI        NVARCHAR(30) NOT NULL,
	GIABAN      MONEY DEFAULT 0,
    GIANHAP     MONEY DEFAULT 0,
	DANGBAOCHE  NVARCHAR(10),
	QCDONGGOI   NVARCHAR(20),
    ANHDAIDIEN  VARCHAR(100),
    TONGDANHGIA FLOAT DEFAULT 0,
	TONKHO      INT DEFAULT 0,
    TRANGTHAI   NVARCHAR(20) DEFAULT N'Đang bán'

	CONSTRAINT PK_SANPHAM PRIMARY KEY(MASP) 
)

CREATE TABLE THANHPHAN
(
    MASP        VARCHAR(8) NOT NULL,
    THANHPHAN   NVARCHAR(30),
    HAMLUONG    NVARCHAR(10)

    CONSTRAINT PK_THANHPHAN PRIMARY KEY(MASP, THANHPHAN) 
)

CREATE TABLE DONNHAP
(
	MADN        VARCHAR(8) NOT NULL DEFAULT 'DN000',
	NGAYLAP     DATE DEFAULT GETDATE(),
	TONGTIEN    MONEY DEFAULT 0,
    TRANGTHAI   NVARCHAR(30) DEFAULT N'Đã đặt'

	CONSTRAINT PK_DONNHAP PRIMARY KEY(MADN)
)
CREATE TABLE CTDN
(
	MADN        VARCHAR(8) NOT NULL,
	MASP        VARCHAR(8) NOT NULL,
	SOLUONG     INT DEFAULT 1,
    THANHTIEN   MONEY

	CONSTRAINT PK_CTDN PRIMARY KEY(MADN,MASP)
)

CREATE TABLE TAIKHOAN
(
	TENTK       VARCHAR(50),
    EMAIL       VARCHAR(50),
	MATKHAU     NVARCHAR(40),
    QUANTRI     BIT DEFAULT 0

	CONSTRAINT PK_TAIKHOAN PRIMARY KEY(TENTK)
)

CREATE TABLE DONXUAT
(
	MADX        VARCHAR(8) NOT NULL DEFAULT 'DX000',
    TENTK       VARCHAR(50) NOT NULL,
	NGAYLAP     DATE DEFAULT GETDATE(),
    DIACHIGIAO  NVARCHAR(100) NOT NULL,
    SDT         VARCHAR(11) NOT NULL,
	TRIGIA      MONEY DEFAULT 0,
	TRANGTHAI   NVARCHAR(30) DEFAULT N'Đang chuẩn bị'

	CONSTRAINT PK_DONXUAT PRIMARY KEY(MADX)
)

CREATE TABLE CTDX
(
	MADX        VARCHAR(8) NOT NULL,
	MASP        VARCHAR(8) NOT NULL,
	SOLUONG     INT DEFAULT 1,
	THANHTIEN   MONEY

	CONSTRAINT PK_CTDX PRIMARY KEY(MADX,MASP)
)

CREATE TABLE GIOHANG
(
	MASP        VARCHAR(8) NOT NULL,
	TENTK       VARCHAR(50) NOT NULL,
	SOLUONG     INT DEFAULT 1

	CONSTRAINT PK_GIOHANG PRIMARY KEY(MASP,TENTK)
)

CREATE TABLE ALBUM
(
	MASP        VARCHAR(8) NOT NULL,
	HINHANH     VARCHAR(100)

	CONSTRAINT PK_ALBUM PRIMARY KEY(MASP, HINHANH)
)
GO

CREATE TABLE DANHGIA
(
    MASP        VARCHAR(8) NOT NULL,
    TENTK       VARCHAR(50) NOT NULL,
    MUCDODG     FLOAT,
    NGAYBL      DATE,
    BINHLUAN    NVARCHAR(500) DEFAULT NULL

    CONSTRAINT PK_DANHGIA PRIMARY KEY(MASP,TENTK)
)
GO

------------------------------------------------------------------------------------------------------------------

ALTER TABLE THANHPHAN
ADD CONSTRAINT FK_THANHPHAN_SANPHAM FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)
GO

ALTER TABLE CTDN
ADD CONSTRAINT FK_CTDN_DONNHAP FOREIGN KEY(MADN) REFERENCES DONNHAP(MADN),
	CONSTRAINT FK_CTDN_SANPHAM FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)
GO

ALTER TABLE DONXUAT
ADD CONSTRAINT FK_DONXUAT_TAIKHOAN FOREIGN KEY(TENTK) REFERENCES TAIKHOAN(TENTK)
GO

ALTER TABLE CTDX
ADD CONSTRAINT FK_CTDX_DONXUAT FOREIGN KEY(MADX) REFERENCES DONXUAT(MADX),
	CONSTRAINT FK_CTDX_SANPHAM FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)
GO

ALTER TABLE ALBUM
ADD CONSTRAINT FK_ALBUM_SANPHAM FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)
GO

ALTER TABLE GIOHANG
ADD CONSTRAINT FK_GIOHANG_TAIKHOAN FOREIGN KEY(TENTK) REFERENCES TAIKHOAN(TENTK),
	CONSTRAINT FK_GIOHANG_SANPHAM FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)
GO

ALTER TABLE DANHGIA
ADD CONSTRAINT FK_DANHGIA_TAIKHOAN FOREIGN KEY(TENTK) REFERENCES TAIKHOAN(TENTK),
	CONSTRAINT FK_DANHGIA_SANPHAM FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)
GO

------------------------------------------------------------------------------------------------------------------

ALTER TABLE SANPHAM
ADD CONSTRAINT CK_GIANHAP CHECK (GIANHAP >= 0),
    CONSTRAINT CK_GIABAN CHECK (GIABAN >= GIANHAP),
    CONSTRAINT CK_TONKHO CHECK (TONKHO >= 0),
    CONSTRAINT CK_TONGDG CHECK (TONGDANHGIA >= 0 AND TONGDANHGIA <=5),
    CONSTRAINT CK_TRANGTHAI_SANPHAM CHECK (TRANGTHAI IN (N'Đang bán', N'Tạm ngưng'))
GO

ALTER TABLE DONNHAP
ADD CONSTRAINT CK_NGAYLAP_DONNHAP CHECK (NGAYLAP <= GETDATE()),
    CONSTRAINT CK_TONGTIEN CHECK (TONGTIEN >= 0),
    CONSTRAINT CK_TRANGTHAI_DONNHAP CHECK (TRANGTHAI IN (N'Đã đặt', N'Đang giao', N'Đã nhận', N'Đã hủy'))
GO

ALTER TABLE CTDN
ADD CONSTRAINT CK_SOLUONG_CTDN CHECK (SOLUONG >= 1),
    CONSTRAINT CK_THANHTIEN_CTDN CHECK (THANHTIEN > 0)
GO

ALTER TABLE DONXUAT
ADD CONSTRAINT CK_NGAYLAP_DONXUAT CHECK (NGAYLAP <= GETDATE()),
    CONSTRAINT CK_TRIGIA CHECK (TRIGIA >= 0),
    CONSTRAINT CK_TRANGTHAI_DONXUAT CHECK (TRANGTHAI IN (N'Đang chuẩn bị', N'Đang giao', N'Đã giao', N'Đã hủy'))
GO

ALTER TABLE CTDX
ADD CONSTRAINT CK_SOLUONG_CTDX CHECK (SOLUONG >= 1),
    CONSTRAINT CK_THANHTIEN_CTDX CHECK (THANHTIEN > 0)
GO

ALTER TABLE GIOHANG
ADD CONSTRAINT CK_SOLUONG_GIOHANG CHECK (SOLUONG >= 1)
GO

ALTER TABLE DANHGIA
ADD CONSTRAINT CK_MUCDODG CHECK (MUCDODG >= 1 AND MUCDODG <= 5),
    CONSTRAINT CK_NGAYBINHLUAN CHECK (NGAYBL <= GETDATE())
GO
------------------------------------------------------------------------------------------------------------------

CREATE PROC pc_TimMaTiepTheo
    @table VARCHAR(20),
    @id VARCHAR(10) OUT
AS
BEGIN
    DECLARE @index INT
    SET @index = 1
    IF @table = 'SANPHAM'
        BEGIN 
        SET @id = 'SP001'
        
        WHILE EXISTS(SELECT MASP FROM SANPHAM WHERE MASP = @id)
        BEGIN
            SET @index = @index + 1
            SET @id = 'SP' + REPLICATE('0',3 - LEN(CAST(@index AS VARCHAR))) + CAST(@index AS VARCHAR)
        END
    END

    ELSE IF @table = 'DONNHAP'
    BEGIN
        SET @id = 'DN001'
        
        WHILE EXISTS(SELECT MADN FROM DONNHAP WHERE MADN = @id)
        BEGIN
            SET @index = @index + 1
            SET @id = 'DN' + REPLICATE('0',3 - LEN(CAST(@index AS VARCHAR))) + CAST(@index AS VARCHAR)
        END
    END

    ELSE IF @table = 'DONXUAT'
    BEGIN
        SET @id = 'DX001'
        
        WHILE EXISTS(SELECT MADX FROM DONXUAT WHERE MADX = @id)
        BEGIN
            SET @index = @index + 1
            SET @id = 'DX' + REPLICATE('0',3 - LEN(CAST(@index AS VARCHAR))) + CAST(@index AS VARCHAR)
        END
    END
END
GO


CREATE PROC pc_InsertSanPham
	@tensp       NVARCHAR(100),
	@loai        NVARCHAR(30),
	@giaban      MONEY,
    @gianhap     MONEY,
	@dangbaoche  NVARCHAR(10),
	@qcdonggoi   NVARCHAR(20)
AS 
BEGIN
    INSERT INTO SANPHAM(TENSP, LOAI, GIABAN, GIANHAP, DANGBAOCHE, QCDONGGOI)
    VALUES(@tensp, @loai, @giaban, @gianhap, @dangbaoche, @qcdonggoi)
END
GO

CREATE PROC pc_TinhTongDanhGia
    @Masp       VARCHAR(8),
    @mucdodg    FLOAT OUT
AS
BEGIN
    SET @mucdodg = (SELECT AVG(MUCDODG) FROM DANHGIA WHERE MASP = @Masp)
END
GO
------------------------------------------------------------------------------------------------------------------


CREATE TRIGGER TRG_INSERT_SANPHAM
      ON SANPHAM
      FOR INSERT
AS
BEGIN
    DECLARE @result VARCHAR(10) 
    EXEC pc_TimMaTiepTheo 'SANPHAM', @result OUT

    UPDATE SANPHAM
    SET MASP = @result
    FROM SANPHAM JOIN inserted
    ON SANPHAM.MASP = inserted.MASP

    IF (SELECT TONGDANHGIA FROM inserted) != 0
      BEGIN
            PRINT N'This data will be imported automatically'
            UPDATE SANPHAM
            SET TONGDANHGIA = 0
            FROM inserted
            WHERE SANPHAM.MASP = inserted.MASP
      END

    IF (SELECT TONKHO FROM inserted) != 0
      BEGIN
            PRINT N'This data will be imported automatically'
            UPDATE SANPHAM
            SET TONKHO = 0
            FROM inserted
            WHERE SANPHAM.MASP = inserted.MASP
      END
END
GO


CREATE TRIGGER TRG_INSERT_DONNHAP
    ON DONNHAP
    FOR INSERT
AS
BEGIN
    DECLARE @result VARCHAR(10) 
    EXEC pc_TimMaTiepTheo 'DONNHAP', @result OUT

    UPDATE DONNHAP
    SET MADN = @result
    FROM DONNHAP JOIN inserted
    ON DONNHAP.MADN = inserted.MADN

    IF (SELECT TONGTIEN FROM inserted) != 0
    BEGIN
        PRINT N'This data will be imported automatically'
        UPDATE DONNHAP
        SET TONGTIEN = 0
        FROM inserted
        WHERE DONNHAP.MADN = inserted.MADN
    END

    IF(SELECT TRANGTHAI FROM inserted) = N'Đã hủy'
    BEGIN
        PRINT N'the addition failed!'
        ROLLBACK TRAN
    END
END
GO

CREATE TRIGGER TRG_INSERT_CTDN
    ON CTDN
    FOR INSERT
AS
BEGIN
    IF (SELECT THANHTIEN FROM inserted) != 0
    BEGIN
        PRINT N'This data will be imported automatically'
    END

    UPDATE CTDN
    SET THANHTIEN = inserted.SOLUONG * GIANHAP
    FROM CTDN C, SANPHAM S, inserted 
    WHERE C.MADN = inserted.MADN
    AND C.MASP = inserted.MASP
    AND C.MASP = S.MASP

    UPDATE DONNHAP
    SET TONGTIEN = TONGTIEN + inserted.THANHTIEN
    FROM DONNHAP P, inserted
    WHERE P.MADN = inserted.MADN

    IF(SELECT TRANGTHAI FROM inserted JOIN DONNHAP ON DONNHAP.MADN = inserted.MADN) = N'Đã nhận'
    BEGIN
        UPDATE SANPHAM 
        SET TONKHO = TONKHO + inserted.SOLUONG
        FROM SANPHAM S, inserted
        WHERE S.MASP = inserted.MASP
    END
END
GO


CREATE TRIGGER TRG_INSERT_DONXUAT
    ON DONXUAT
    FOR INSERT
AS
BEGIN    
    DECLARE @result VARCHAR(10) 
    EXEC pc_TimMaTiepTheo 'DONXUAT', @result OUT

    UPDATE DONXUAT
    SET MADX = @result
    FROM DONXUAT JOIN inserted
    ON DONXUAT.MADX = inserted.MADX

    IF(SELECT QUANTRI FROM TAIKHOAN, inserted
    WHERE TAIKHOAN.TENTK = inserted.TENTK) = 1
    BEGIN
        PRINT N'This is an admin account!'
        ROLLBACK TRAN
    END

    IF(SELECT TRANGTHAI FROM inserted) = 'Đã hủy'
    BEGIN
        PRINT N'the addition failed!'
        ROLLBACK TRAN
    END

    IF (SELECT TRIGIA FROM inserted) != 0
    BEGIN
        PRINT N'This data will be imported automatically'
        UPDATE DONXUAT
        SET TRIGIA = 0
        FROM inserted
        WHERE DONXUAT.MADX = inserted.MADX
    END
END
GO

CREATE TRIGGER TRG_INSERT_CTDX
    ON CTDX
    FOR INSERT
AS
BEGIN
    IF(SELECT SANPHAM.TRANGTHAI FROM SANPHAM JOIN inserted ON SANPHAM.MASP = inserted.MASP) = N'Tạm ngưng'
    BEGIN
        PRINT N'Invalid product'
        ROLLBACK TRAN
    END

    IF (SELECT TONKHO FROM inserted JOIN SANPHAM ON inserted.MASP = SANPHAM.MASP) < (SELECT SOLUONG FROM inserted)
    BEGIN
        PRINT N'Insufficient quantity of inventory exists'
        ROLLBACK TRAN
    END

    IF (SELECT THANHTIEN FROM inserted) != 0
    BEGIN
        PRINT N'This data will be imported automatically'
    END
    
    UPDATE CTDX
    SET THANHTIEN = inserted.SOLUONG * GIABAN
    FROM CTDX C, SANPHAM S, inserted
    WHERE C.MADX = inserted.MADX
    AND C.MASP = inserted.MASP
    AND C.MASP = S.MASP

    UPDATE DONXUAT
    SET TRIGIA = TRIGIA + inserted.THANHTIEN
    FROM DONXUAT P, inserted
    WHERE P.MADX = inserted.MADX

    UPDATE SANPHAM 
    SET TONKHO = TONKHO - C.SOLUONG
    FROM SANPHAM S JOIN CTDX C
    ON S.MASP = C.MASP
    JOIN inserted
    ON C.MADX = inserted.MADX
END
GO

CREATE TRIGGER TRG_INSERT_GIOHANG
    ON GIOHANG
    FOR INSERT, UPDATE
AS
BEGIN
    IF(SELECT QUANTRI FROM TAIKHOAN, inserted
    WHERE TAIKHOAN.TENTK = inserted.TENTK) = 1
    BEGIN
        PRINT N'This is an admin account!'
        ROLLBACK TRAN
    END

    IF(SELECT SANPHAM.TRANGTHAI FROM SANPHAM JOIN inserted ON SANPHAM.MASP = inserted.MASP) = N'Tạm ngưng'
    BEGIN
        PRINT N'Invalid product'
        ROLLBACK TRAN
    END
END
GO

CREATE TRIGGER TRG_INSERT_DANHGIA
    ON DANHGIA
    FOR INSERT
AS
BEGIN
    IF(SELECT QUANTRI FROM TAIKHOAN, inserted
    WHERE TAIKHOAN.TENTK = inserted.TENTK) = 1
    BEGIN
        PRINT N'This is an admin account!'
        ROLLBACK TRAN
    END

    IF EXISTS(
        SELECT * FROM inserted, DONXUAT, CTDX
        WHERE inserted.TENTK = DONXUAT.TENTK
        AND inserted.MASP = CTDX.MASP
        AND CTDX.MADX = DONXUAT.MADX
        )
    BEGIN
        DECLARE @result FLOAT 
        DECLARE @ma VARCHAR(8)
        SET @ma = (SELECT MASP FROM inserted)
        EXEC pc_TinhTongDanhGia @ma, @result OUT

        UPDATE SANPHAM
        SET TONGDANHGIA = @result
        WHERE SANPHAM.MASP = @ma
    END
    ELSE
    BEGIN
        ROLLBACK TRAN
    END
END
GO

CREATE TRIGGER TRG_UPDATE_SANPHAM
    ON SANPHAM
    FOR UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * FROM inserted JOIN deleted
        ON inserted.TONGDANHGIA != deleted.TONGDANHGIA
        AND inserted.TONGDANHGIA != (
                SELECT AVG(MUCDODG) FROM DANHGIA
                WHERE DANHGIA.MASP = inserted.MASP
        ))
    BEGIN
        PRINT N'This data cannot be changed'
        ROLLBACK TRAN
    END
END
GO

CREATE TRIGGER TRG_UPDATE_DONNHAP
    ON DONNHAP
    FOR UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * FROM inserted JOIN deleted
        ON inserted.TONGTIEN != deleted.TONGTIEN
        AND inserted.TONGTIEN != (
                SELECT SUM(THANHTIEN) FROM CTDN
                WHERE CTDN.MADN = inserted.MADN
        ))
    BEGIN
        PRINT N'This data cannot be changed'
        ROLLBACK TRAN
    END

    IF (SELECT TRANGTHAI FROM deleted) != N'Đã đặt'
    BEGIN
        PRINT N'Update failed!'
        ROLLBACK TRAN
    END

    IF(SELECT inserted.TRANGTHAI FROM deleted, inserted WHERE inserted.TRANGTHAI != deleted.TRANGTHAI) = N'Đã nhận'
    BEGIN
        UPDATE SANPHAM 
        SET TONKHO = TONKHO + SOLUONG
        FROM inserted, CTDN
        WHERE CTDN.MADN = inserted.MADN
        AND CTDN.MASP = SANPHAM.MASP
    END
END
GO

CREATE TRIGGER TRG_UPDATE_CTDN
    ON CTDN
    FOR UPDATE
AS
BEGIN
    IF (SELECT TRANGTHAI FROM deleted JOIN DONNHAP ON DONNHAP.MADN = deleted.MADN) != N'Đã đặt'
    BEGIN
        PRINT N'Update failed!'
        ROLLBACK TRAN
    END

    IF EXISTS (
        SELECT * FROM inserted, deleted, SANPHAM
        WHERE inserted.THANHTIEN != deleted.THANHTIEN
        AND inserted.MASP = SANPHAM.MASP
        AND inserted.THANHTIEN != inserted.SOLUONG * GIANHAP)
    BEGIN
        PRINT N'This data cannot be changed'
        ROLLBACK TRAN
    END

    IF EXISTS (
        SELECT * FROM inserted, deleted
        WHERE inserted.SOLUONG != deleted.SOLUONG
        )
    BEGIN
        UPDATE CTDN
        SET THANHTIEN = inserted.SOLUONG * GIANHAP
        FROM SANPHAM, inserted
        WHERE CTDN.MASP = SANPHAM.MASP
        AND CTDN.MADN = inserted.MADN
        AND CTDN.MASP = inserted.MASP

        UPDATE DONNHAP
        SET TONGTIEN = TONGTIEN - deleted.THANHTIEN + inserted.THANHTIEN
        FROM inserted, deleted
    END
END
GO

CREATE TRIGGER TRG_UPDATE_TAIKHOAN
    ON  TAIKHOAN 
    AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * FROM inserted, deleted
        WHERE inserted.QUANTRI != deleted.QUANTRI
        )
    BEGIN
        PRINT N'This data cannot be changed'
        ROLLBACK TRAN
    END
END
GO

CREATE TRIGGER TRG_UPDATE_DONXUAT
    ON  DONXUAT 
    AFTER UPDATE
AS
BEGIN
    IF EXISTS (
            SELECT * FROM inserted JOIN deleted
            ON inserted.TRIGIA != deleted.TRIGIA
            AND inserted.TRIGIA != (
                  SELECT SUM(THANHTIEN) FROM CTDX
                  WHERE CTDX.MADX = inserted.MADX
            ))
    BEGIN
            PRINT N'This data cannot be changed'
            ROLLBACK TRAN
    END

    IF EXISTS (
        SELECT inserted.TRANGTHAI FROM deleted JOIN inserted 
        ON (deleted.TRANGTHAI = N'Đã hủy' AND inserted.TRANGTHAI != N'Đã hủy') 
        OR (deleted.TRANGTHAI = N'Đã giao' AND inserted.TRANGTHAI != N'Đã giao'))
    BEGIN
        PRINT N'This data cannot be changed'
        ROLLBACK TRAN
    END

    IF EXISTS (
        SELECT inserted.TRANGTHAI FROM deleted JOIN inserted 
        ON (deleted.TRANGTHAI != N'Đã hủy' AND inserted.TRANGTHAI = N'Đã hủy')
        )
    BEGIN
        UPDATE SANPHAM 
        SET TONKHO = TONKHO + SOLUONG
        FROM inserted, CTDX
        WHERE inserted.MADX = CTDX.MADX
        AND CTDX.MASP = SANPHAM.MASP
    END
END
GO

CREATE TRIGGER TRG_UPDATE_CTDX
    ON CTDX
    FOR UPDATE
AS
BEGIN
    IF (SELECT TRANGTHAI FROM deleted JOIN DONXUAT ON DONXUAT.MADX = deleted.MADX) != N'Đang chuẩn bị'
    BEGIN
        PRINT N'Update failed!'
        ROLLBACK TRAN
    END

    IF EXISTS (
        SELECT * FROM inserted JOIN deleted
        ON inserted.THANHTIEN != deleted.THANHTIEN
        JOIN SANPHAM
        ON inserted.MASP = SANPHAM.MASP
        AND inserted.THANHTIEN != inserted.SOLUONG * GIABAN)
    BEGIN
        PRINT N'This data cannot be changed'
        ROLLBACK TRAN
    END

    IF(SELECT SANPHAM.TRANGTHAI FROM SANPHAM JOIN inserted ON SANPHAM.MASP = inserted.MASP) = N'Tạm ngưng'
    BEGIN
        PRINT N'Invalid product'
        ROLLBACK TRAN
    END

    IF EXISTS (
        SELECT * FROM inserted, deleted
        WHERE inserted.SOLUONG != deleted.SOLUONG
        )
    BEGIN
        UPDATE CTDN
        SET THANHTIEN = SOLUONG * GIABAN
        FROM SANPHAM
        WHERE CTDN.MASP = SANPHAM.MASP

        UPDATE SANPHAM
        SET TONKHO = TONKHO - deleted.SOLUONG + inserted.SOLUONG
        FROM deleted, inserted, SANPHAM
        WHERE SANPHAM.MASP = inserted.MASP
    END
END
GO

CREATE TRIGGER TRG_UPDATE_DANHGIA
    ON DANHGIA
    FOR UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * FROM inserted, deleted
        WHERE inserted.MUCDODG != deleted.MUCDODG
        )
    BEGIN
        DECLARE @result FLOAT 
        DECLARE @ma VARCHAR(8)
        SET @ma = (SELECT MASP FROM inserted)
        EXEC pc_TinhTongDanhGia @ma, @result OUT

        UPDATE SANPHAM
        SET TONGDANHGIA = @result
        WHERE SANPHAM.MASP = @ma
    END
END
GO

CREATE TRIGGER TRG_DELETE_SANPHAM
    ON SANPHAM
    INSTEAD OF DELETE
AS
BEGIN
    UPDATE SANPHAM 
    SET TRANGTHAI = N'Tạm ngưng'
    FROM inserted
    WHERE SANPHAM.MASP = inserted.MASP
END
GO

CREATE TRIGGER TRG_DELETE_DONNHAP
    ON DONNHAP
    INSTEAD OF DELETE
AS
BEGIN
    IF(SELECT TRANGTHAI FROM deleted) = N'Đã hủy'
    BEGIN
        IF EXISTS (SELECT * FROM deleted WHERE MADN IN (SELECT MADN FROM CTDN))
        BEGIN
            DELETE CTDN
            WHERE MADN = (SELECT MADN FROM deleted)
        END
        
        DELETE DONNHAP 
        WHERE MADN = (SELECT MADN FROM deleted)
    END
    ELSE
    BEGIN
        ROLLBACK TRAN
    END
END
GO

CREATE TRIGGER TRG_DELETE_CTDN
    ON CTDN
    FOR DELETE
AS
BEGIN
    IF(SELECT TRANGTHAI FROM DONNHAP, deleted WHERE DONNHAP.MADN = deleted.MADN)!= N'Đã đặt'
    BEGIN
        PRINT N'deletion failed'
        ROLLBACK TRAN
    END

    UPDATE DONNHAP
    SET TONGTIEN = TONGTIEN - deleted.THANHTIEN
    FROM DONNHAP JOIN deleted
    ON DONNHAP.MADN = deleted.MADN
END
GO

CREATE TRIGGER TRG_DELETE_DONXUAT
    ON DONXUAT
    INSTEAD OF DELETE
AS
BEGIN
    IF(SELECT TRANGTHAI FROM deleted) = N'Đã hủy'
    BEGIN
        IF EXISTS (SELECT * FROM deleted WHERE MADX IN (SELECT MADX FROM CTDX))
        BEGIN
            DELETE CTDX
            WHERE MADX = (SELECT MADX FROM deleted)
        END
        
        DELETE DONXUAT
        WHERE MADX = (SELECT MADX FROM deleted)
    END
    ELSE
    BEGIN
        ROLLBACK TRAN
    END
END
GO

CREATE TRIGGER TRG_DELETE_CTDX
    ON CTDX
    FOR DELETE
AS
BEGIN
    IF(SELECT TRANGTHAI FROM DONXUAT, deleted WHERE DONXUAT.MADX = deleted.MADX)!= N'Đang chuẩn bị'
    BEGIN
        PRINT N'deletion failed'
        ROLLBACK TRAN
    END

    UPDATE DONXUAT
    SET TRIGIA = TRIGIA - deleted.THANHTIEN
    FROM DONXUAT JOIN deleted
    ON DONXUAT.MADX = deleted.MADX

    UPDATE SANPHAM
    SET TONKHO = TONKHO + deleted.SOLUONG
    FROM SANPHAM JOIN deleted
    ON SANPHAM.MASP = deleted.MASP
END
GO

CREATE TRIGGER TRG_DELETE_DANHGIA
    ON DANHGIA
    AFTER DELETE
AS
BEGIN
    DECLARE @result FLOAT 
    DECLARE @ma VARCHAR(8)
    SET @ma = (SELECT MASP FROM inserted)
    EXEC pc_TinhTongDanhGia @ma, @result OUT

    UPDATE SANPHAM
    SET TONGDANHGIA = @result
    WHERE SANPHAM.MASP = @ma
END
GO

------------------------------------------------------------------------------------------------------------------

EXEC pc_InsertSanPham N'Kem Lót Air Cotton Make Up Base The Face Shop', N'Kem lót', 599000, 550000, N'Kem', N'Chai 35ml'
EXEC pc_InsertSanPham N'Kem Mát Xa Làm Sáng Da The Face Shop', N'Kem lót', 599000, 550000, N'Kem', N'Hộp'
EXEC pc_InsertSanPham N'Mặt Nạ Giấy Cung Cấp Nước THE FACE SHOP Real Nature', N'Kem lót', 429000, 380000, N'Rắn', N'Hộp 10 cái'
EXEC pc_InsertSanPham N'Kem chống nắng đa năng TheFaceShop Natural SunEco Power LongLasting Sun CreamSPF50+', N'Kem lót', 599000, 550000, N'Kem', N'Tuýp 50g'
EXEC pc_InsertSanPham N'Sản Phẩm Làm Sạch Da TheFaceShop Yehwadam Body Peeling', N'Kem lót', 269000, 230000, N'Gel', N'Lọ 30g'
EXEC pc_InsertSanPham N'Tinh Chất Chống Lão Hóa Thefaceshop Energy Seed Antioxidant Hydro Serum', N'Kem lót', 599000, 550000, N'Dung dịch', N'Chai 35ml'
EXEC pc_InsertSanPham N'Phấn Phủ Thefaceshop Oil Clear Smooth&Bright Pact Spf30 Pa++', N'Kem lót', 349000, 300000, N'Rắn', N'Hộp'
EXEC pc_InsertSanPham N'Sữa Dưỡng Thể Hương Nước Hoa PERFUME SEED VELVET BODY MILK', N'Kem lót', 1290000, 1180000, N'Lotion', N'Chai 100ml'
EXEC pc_InsertSanPham N'Sữa Rửa Mặt Làm Sáng Da THE FACE SHOP Rice Water Bright Cleansing Foam', N'Kem lót', 539000, 490000, N'Lotion', N'Tuýp 50g'
EXEC pc_InsertSanPham N'Chì Chân Mày TheFaceShop Designing Eyebrow Pencil', N'Kem lót', 899000, 840000, N'Rắn', N'Hộp 1 cây'
EXEC pc_InsertSanPham N'Sữa Dưỡng Giúp Da Săn Mịn TheFaceShop Pomegranate And Collagen Volume Lifting Emulsion', N'Kem lót', 599000, 550000, N'Lotion', N'Chai 35ml'
EXEC pc_InsertSanPham N'Kem Dưỡng Ẩm Thuần Chay THE FACE SHOP The Therapy Vegan Moisture Blending Cream', N'Kem lót', 129000, 80000, N'Kem', N'Chai 35ml'
EXEC pc_InsertSanPham N'Kem nâng tông tự nhiên SPF50+++', N'Kem lót', 299000, 250000, N'Kem', N'Tuýp 30g'
EXEC pc_InsertSanPham N'Kem dưỡng ẩm tay Thuần chay Hương tự nhiên', N'Kem lót', 399000, 350000, N'Kem', N'Lọ 35ml'
EXEC pc_InsertSanPham N'Dầu Tẩy Trang Làm Sáng Da Thefaceshop Rice Water Bright Light Facial Cleansing Oil', N'Kem lót', 389000, 340000, N'Lỏng', N'Chai 75ml'
EXEC pc_InsertSanPham N'Phấn Nước Trang Điểm Lâu Trôi TheFaceShop Ink Lasting Cushion', N'Kem lót', 189000, 140000, N'Hổn dịch', N'Hộp 30g'
EXEC pc_InsertSanPham N'Tẩy Tế Bào Chết Mềm Mịn Da Hoa Gạo', N'Kem lót', 679000, 630000, N'Hổn dịch', N'Hộp 60g'
EXEC pc_InsertSanPham N'Sản Phẩm Kem Dưỡng Da TheFaceShop Yehwadam Hwansaenggo Rejuvenating Radiance Cream', N'Kem lót', 729000, 680000, N'Kem', N'Lọ 65ml'
EXEC pc_InsertSanPham N'Phấn Nước Hiệu Ứng Căng Bóng TheFaceShop Ink Lasting Cushion Glow SPF 35 PA++', N'Kem lót', 729000, 680000, N'Hỗn dịch', N'Hộp 30g'
EXEC pc_InsertSanPham N'Nước Rửa Tay Làm Sáng Da Thefaceshop Rice Water Bright Light Facial Cleansing Oil', N'Kem lót', 359000, 310000, N'Gel', N'Chai 25ml'
EXEC pc_InsertSanPham N'Kem Dưỡng Thuần Chay Chống Lão Hóa THE FACE SHOP The Therapy Vegan Blending Cream', N'Kem lót', 599000, 500000, N'Kem', N'Lọ 30g'
EXEC pc_InsertSanPham N'Chì Kẻ Chân Mày Siêu Mảnh 1.5Mm Thefaceshop Brow Master Slim Pencil', N'Kem lót', 499000, 450000, N'Rắn', N'Hộp 1 cây'
EXEC pc_InsertSanPham N'Sữa Dưỡng Da Chống Lão Hóa Thefaceshop Yehwadam Hwansaenggo Rejuvenating Radiance Emulsion', N'Kem lót', 699000, 650000, N'Gel', N'Lọ 100g'
EXEC pc_InsertSanPham N'Sữa Dưỡng Sáng Trắng Da Thefaceshop Yehwadam Jeju Magnolia Pure Brightening Emulsion', N'Kem lót', 549000, 500000, N'Lotion', N'Lọ 50g'
EXEC pc_InsertSanPham N'Má Hồng Sáng Da TheFaceShop Marble Beam Blush', N'Kem lót', 349000, 300000, N'Rắn', N'Hộp'
EXEC pc_InsertSanPham N'Tinh Chất Dưỡng Thể Sáng Da VitaminC', N'Kem lót', 399000, 350000, N'Lỏng', N'Hộp 1 serum'
EXEC pc_InsertSanPham N'Mặt Nạ Real Nature THE FACE SHOP', N'Kem lót', 399000, 350000, N'Gel', N'Hộp 10 cái'
EXEC pc_InsertSanPham N'Màu Mắt Hiệu Ứng Tự Nhiên The Faceshop Mono Cube Eyeshadow (Matte)', N'Kem lót', 199000, 150000, N'Rắn', N'Hộp'
EXEC pc_InsertSanPham N'Dưỡng ẩm làm dịu da chống lão hóa oxy hóa vitamin The Face Shop Yehwadam Artemisia Soothing', N'Kem lót', 399000, 350000, N'Kem', N'Chai 35ml'
EXEC pc_InsertSanPham N'Tinh Chất Dưỡng Ẩm Thefaceshop', N'Kem lót', 629000, 580000, N'Gel', N'Chai 55ml'

INSERT INTO TAIKHOAN VALUES ('ouoctiiai', '12345678', 'luphi2612@gmail.com', 0)
INSERT INTO TAIKHOAN VALUES ('huukhanh2k3', '78787878', 'khanh2121@gmail.com', 1)
INSERT INTO TAIKHOAN VALUES ('idolTruong', '987654321', 'ductruong@gmail.com', 0)
INSERT INTO TAIKHOAN VALUES ('anhhoang', 'lamgicomatkhau', 'cogaibebong@gmail.com', 0)
INSERT INTO TAIKHOAN VALUES ('baongocc', 'bahoangjavascript', 'bpbn@gmail.com', 1)

INSERT INTO DONNHAP (NGAYLAP) VALUES ('2022-12-31')
INSERT INTO DONNHAP (NGAYLAP) VALUES ('2022-12-01')
INSERT INTO DONNHAP (NGAYLAP) VALUES ('2022-12-02')
INSERT INTO DONNHAP (NGAYLAP) VALUES ('2023-01-03')
INSERT INTO DONNHAP (NGAYLAP) VALUES ('2023-01-04')
INSERT INTO DONNHAP (NGAYLAP) VALUES ('2023-02-05')
INSERT INTO DONNHAP (NGAYLAP) VALUES ('2023-10-06')
INSERT INTO DONNHAP (NGAYLAP) VALUES ('2023-10-06')
INSERT INTO DONNHAP (NGAYLAP) VALUES ('2023-02-07')
INSERT INTO DONNHAP (NGAYLAP) VALUES ('2023-05-08')
INSERT INTO DONNHAP (NGAYLAP) VALUES ('2023-04-09')
INSERT INTO DONNHAP (NGAYLAP) VALUES ('2023-03-10')
INSERT INTO DONNHAP (NGAYLAP) VALUES ('2023-02-11')

INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN001', 'SP001', 145)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN001', 'SP002', 123)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN001', 'SP003', 356)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN001', 'SP004', 243)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN001', 'SP005', 124)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN001', 'SP006', 132)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN001', 'SP007', 167)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN001', 'SP008', 176)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN002', 'SP009', 221)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN002', 'SP010', 101)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN002', 'SP011', 102)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN002', 'SP012', 201)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN002', 'SP013', 132)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN002', 'SP014', 184)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN003', 'SP015', 144)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN003', 'SP016', 193)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN003', 'SP017', 199)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN003', 'SP018', 223)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN003', 'SP019', 213)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN003', 'SP020', 221)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN004', 'SP021', 122)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN004', 'SP022', 112)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN004', 'SP023', 121)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN004', 'SP024', 113)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN005', 'SP025', 153)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN005', 'SP026', 124)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN005', 'SP027', 143)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN005', 'SP028', 201)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN005', 'SP029', 121)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN005', 'SP030', 123)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN006', 'SP021', 32)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN006', 'SP012', 21)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN006', 'SP011', 43)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN007', 'SP022', 65)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN008', 'SP004', 76)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN008', 'SP006', 47)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN008', 'SP008', 87)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN009', 'SP009', 54)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN009', 'SP013', 43)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN009', 'SP017', 26)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN009', 'SP008', 65)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN010', 'SP003', 65)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN010', 'SP019', 87)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN010', 'SP029', 53)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN011', 'SP030', 23)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN012', 'SP030', 34)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN012', 'SP001', 56)
INSERT INTO CTDN (MADN, MASP, SOLUONG) VALUES ('DN013', 'SP002', 65)

UPDATE DONNHAP SET TRANGTHAI = N'Đã nhận' WHERE MADN = 'DN001'
UPDATE DONNHAP SET TRANGTHAI = N'Đã nhận' WHERE MADN = 'DN002'
UPDATE DONNHAP SET TRANGTHAI = N'Đã nhận' WHERE MADN = 'DN003'
UPDATE DONNHAP SET TRANGTHAI = N'Đã nhận' WHERE MADN = 'DN004'
UPDATE DONNHAP SET TRANGTHAI = N'Đã nhận' WHERE MADN = 'DN005'
UPDATE DONNHAP SET TRANGTHAI = N'Đã nhận' WHERE MADN = 'DN006'
UPDATE DONNHAP SET TRANGTHAI = N'Đã nhận' WHERE MADN = 'DN007'
UPDATE DONNHAP SET TRANGTHAI = N'Đã nhận' WHERE MADN = 'DN008'
UPDATE DONNHAP SET TRANGTHAI = N'Đã nhận' WHERE MADN = 'DN009'
UPDATE DONNHAP SET TRANGTHAI = N'Đã nhận' WHERE MADN = 'DN010'
UPDATE DONNHAP SET TRANGTHAI = N'Đã nhận' WHERE MADN = 'DN011'
UPDATE DONNHAP SET TRANGTHAI = N'Đã nhận' WHERE MADN = 'DN012'
UPDATE DONNHAP SET TRANGTHAI = N'Đã nhận' WHERE MADN = 'DN013'

INSERT INTO DONXUAT(NGAYLAP, TENTK, DIACHIGIAO, SDT) VALUES('2022-03-12', 'ouoctiiai', N'48/1 Đỗ Nhuận, Phường Sơn Kỳ, Quận Tân Phú, TP HCM', '0367512498')
INSERT INTO DONXUAT(NGAYLAP, TENTK, DIACHIGIAO, SDT) VALUES('2022-06-15', 'anhhoang', N'66/9 Trần Văn Quang, Phường 10, Quận Tân Bình, TP HCM', '0334275096')
INSERT INTO DONXUAT(NGAYLAP, TENTK, DIACHIGIAO, SDT) VALUES('2022-09-05', 'idolTruong', N'49/1 Tân Trụ, Phường 15, Quận Tân Bình, TP HCM','0367512498')
INSERT INTO DONXUAT(NGAYLAP, TENTK, DIACHIGIAO, SDT) VALUES('2022-10-20', 'ouoctiiai', N'48/1 Đỗ Nhuận, Phường Sơn Kỳ, Quận Tân Phú, TP HCM', '0379699529')
INSERT INTO DONXUAT(NGAYLAP, TENTK, DIACHIGIAO, SDT) VALUES('2023-04-07', 'anhhoang', N'30/1 TMT 13, Phường Trung Mỹ Tây, Quận 12, TP HCM', '0334275096')
INSERT INTO DONXUAT(NGAYLAP, TENTK, DIACHIGIAO, SDT) VALUES('2023-01-09', 'ouoctiiai', N'48/1 Đỗ Nhuận, Phường Sơn Kỳ, Quận Tân Phú, TP HCM', '0913630913')
INSERT INTO DONXUAT(NGAYLAP, TENTK, DIACHIGIAO, SDT) VALUES('2023-05-18', 'idolTruong', N'100 Lê Văn Sỹ, Phường 2, Quận Tân Bình, TP HCM', '0908655684')
INSERT INTO DONXUAT(NGAYLAP, TENTK, DIACHIGIAO, SDT) VALUES('2023-09-23', 'ouoctiiai', N'193/2/7 Đường Số 6, Phường Bình Hưng Hòa B, Quận Bình Tân, TP HCM','0913630913')
INSERT INTO DONXUAT(NGAYLAP, TENTK, DIACHIGIAO, SDT) VALUES('2023-02-11', 'idolTruong', N'18 Tân Thới Nhất 17, Phường Tân Thới Nhất, Quận 12, TP HCM', '0367512498')
INSERT INTO DONXUAT(NGAYLAP, TENTK, DIACHIGIAO, SDT) VALUES('2022-07-27', 'anhhoang', N'30/1 TMT 13, Phường Trung Mỹ Tây, Quận 12, TP HCM', '0334275096')

INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX001', 'SP001', 3)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX001', 'SP005', 4)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX001', 'SP006', 5)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX002', 'SP008', 4)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX002', 'SP012', 7)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX003', 'SP014', 8)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX003', 'SP020', 3)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX003', 'SP002', 8)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX003', 'SP009', 9)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX004', 'SP004', 2)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX004', 'SP016', 1)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX005', 'SP029', 7)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX005', 'SP027', 9)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX006', 'SP023', 6)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX007', 'SP017', 8)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX007', 'SP023', 5)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX008', 'SP013', 8)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX009', 'SP030', 9)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX009', 'SP029', 5)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX010', 'SP009', 6)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX010', 'SP001', 8)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX010', 'SP004', 9)
INSERT INTO CTDX(MADX, MASP, SOLUONG) VALUES ('DX010', 'SP007', 4)

INSERT INTO GIOHANG VALUES('SP002', 'ouoctiiai', 2)
INSERT INTO GIOHANG VALUES('SP001', 'anhhoang', 3)
INSERT INTO GIOHANG VALUES('SP004', 'ouoctiiai', 1)
INSERT INTO GIOHANG VALUES('SP012', 'idolTruong', 5)
INSERT INTO GIOHANG VALUES('SP023', 'anhhoang', 6)
INSERT INTO GIOHANG VALUES('SP014', 'ouoctiiai', 8)
INSERT INTO GIOHANG VALUES('SP026', 'idolTruong', 5)
INSERT INTO GIOHANG VALUES('SP018', 'anhhoang', 8)
INSERT INTO GIOHANG VALUES('SP007', 'idolTruong', 9)
INSERT INTO GIOHANG VALUES('SP005', 'ouoctiiai', 2)
INSERT INTO GIOHANG VALUES('SP015', 'anhhoang', 5)
INSERT INTO GIOHANG VALUES('SP029', 'idolTruong', 7)

INSERT INTO DANHGIA VALUES('SP001', 'ouoctiiai', 2, '2023-10-03', N'Amazing, sản phẩm quá tốt')
INSERT INTO DANHGIA VALUES('SP005', 'ouoctiiai', 3,  '2023-01-02', N'Sản phẩm tốt, xài được')
INSERT INTO DANHGIA VALUES('SP006', 'ouoctiiai', 4, '2023-10-11', N'Da cải thiện rất nhiều')
INSERT INTO DANHGIA VALUES('SP008', 'anhhoang', 5,  '2023-10-08', N'Sản phẩm quá tốt')
INSERT INTO DANHGIA VALUES('SP012', 'anhhoang', 1, '2023-10-12', N'Không uổng tiền khi mua')
INSERT INTO DANHGIA VALUES('SP014', 'idolTruong', 2, '2023-02-23', N'Mua rất đáng tiền nha mọi người')
INSERT INTO DANHGIA VALUES('SP020', 'idolTruong', 3, '2023-05-12', N'Nên mua nha, sản phẩm dùng quá ok luôn')
INSERT INTO DANHGIA VALUES('SP002', 'idolTruong', 5, '2023-02-14', N'10 điểm')
INSERT INTO DANHGIA VALUES('SP009', 'idolTruong', 5, '2023-08-24', N'Mới dùng thử chưa biết kết quả như thế nào')
INSERT INTO DANHGIA VALUES('SP004', 'ouoctiiai', 4, '2023-09-24', N'Sản phẩm quá tốt, nên mua nha mọi người')
INSERT INTO DANHGIA VALUES('SP016', 'ouoctiiai', 4, '2023-10-12', N'Dùng tốt lắm nha, nên mua mọi người ơi')
INSERT INTO DANHGIA VALUES('SP029', 'anhhoang', 4, '2023-04-02', N'Mới xài một tuần mà hiểu quả nổi bật luôn')
INSERT INTO DANHGIA VALUES('SP027', 'anhhoang', 5, '2023-04-07', N'Mới đầu cũng hơi lo mà mua về dùng thử r mới thấy quá xứng đáng')
INSERT INTO DANHGIA VALUES('SP023', 'ouoctiiai', 5, '2023-03-08', N'Sản phẩm tốt lắm nha mọi người')
INSERT INTO DANHGIA VALUES('SP017', 'idolTruong', 5, '2023-10-05', N'Giá hơi đắt mà thấy cũng ổn')
INSERT INTO DANHGIA VALUES('SP023', 'idolTruong', 4, '2023-10-04', N'Ok good job em')
INSERT INTO DANHGIA VALUES('SP013', 'ouoctiiai', 3, '2023-10-12', N'Trời ơi ưng quá trời luôn áaaaaa')
INSERT INTO DANHGIA VALUES('SP030', 'idolTruong', 5, '2023-10-11', N'Xài mà nó mát lòng mát dạ')
INSERT INTO DANHGIA VALUES('SP029', 'idolTruong', 3, '2023-10-08', N'Orrooooooo, ưng quá hàaaaa')
INSERT INTO DANHGIA VALUES('SP009', 'anhhoang', 5, '2023-09-30', N'Nên mua mọi người ơi')
INSERT INTO DANHGIA VALUES('SP001', 'anhhoang', 4, '2023-04-29', N'Mới xài một tuần mà hiểu quả nổi bật luôn')
INSERT INTO DANHGIA VALUES('SP004', 'anhhoang', 3,'2023-07-02', N'Không uổng tiền khi mua nha mọi người')
INSERT INTO DANHGIA VALUES('SP007', 'anhhoang', 4, '2023-06-07', N'Dùng tốt lắm nha, nên mua mọi người ơi')