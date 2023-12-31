﻿USE master
GO

---------------------------------------------------- CREATE LOGIN ----------------------------------------------------
CREATE LOGIN TFS_KHACH
	WITH PASSWORD = N'TPS_KHACH',
	CHECK_EXPIRATION = OFF,
	CHECK_POLICY = OFF,
	DEFAULT_DATABASE = QL_THEFACESHOP;
GO

CREATE LOGIN TFS_BACKUP
	WITH PASSWORD = N'TPS_BACKUP',
	CHECK_EXPIRATION = OFF,
	CHECK_POLICY = OFF,
	DEFAULT_DATABASE = QL_THEFACESHOP;
GO

CREATE LOGIN TFS_ADMIN
	WITH PASSWORD = N'TPS_ADMIN',
	CHECK_EXPIRATION = OFF,
	CHECK_POLICY = OFF,
	DEFAULT_DATABASE = QL_THEFACESHOP;
GO

USE QL_THEFACESHOP
GO

---------------------------------------------------- CREATE USER ----------------------------------------------------
CREATE USER TFS_KHACH
	FOR LOGIN TFS_KHACH
GO

CREATE USER TFS_BACKUP
	FOR LOGIN TFS_BACKUP
GO

CREATE USER TFS_ADMIN 
	FOR LOGIN TFS_ADMIN
GO

---------------------------------------------------- GRANT ----------------------------------------------------
---------------------------------------------------- 1. TFS_KHACH ---------------------------------------------
-- CẤP QUYỀN CHO NGƯỜI DÙNG XEM ĐƯỢC GIỎ HÀNG
GRANT SELECT
ON GIOHANG TO TFS_KHACH
GO
-- CẤP QUYỀN CHO NGƯỜI DÙNG CÓ THỂ XEM THÊM XOÁ HÀNG TRONG CHI TIẾT GIỎ HÀNG VÀ CẬP NHẬT SỐ LƯỢNG HÀNG ĐÃ ĐẶT
GRANT SELECT, INSERT, DELETE, UPDATE(SOLUONG)
ON CHITIETGIOHANG TO TFS_KHACH
GO
-- CẤP QUYỀN CHO NGƯỜI DÙNG CÓ THỂ CẬP NHẬT NGƯỜI NHẬN, SĐT, TRẠNG THÁI(VÍ DỤ NHƯ HUỶ ĐƠN)
GRANT UPDATE(NGUOINHAN, SDT, TRANGTHAI)
ON DONGIAO TO TFS_KHACH
GO
-- CẤP QUYỀN CHO NGƯỜI DÙNG XEM ĐƯỢC SẢN PHẨM
GRANT SELECT
ON SANPHAM TO TFS_KHACH
GO
-- CẤP QUYỀN CHO NGƯỜI DÙNG XEM ĐƯỢC THÀNH PHẦN
GRANT SELECT
ON THANHPHAN TO TFS_KHACH
GO
-- CẤP QUYỀN CHO NGƯỜI DÙNG XEM ĐƯỢC HÌNH SẢN PHẨM
GRANT SELECT
ON HINHANHSP TO TFS_KHACH
GO
-- CẤP QUYỀN CHO NGƯỜI DÙNG XEM ĐƯỢC LOẠI SẢN PHẨM
GRANT SELECT
ON LOAI TO TFS_KHACH
GO
-- CẤP QUYỀN CHO NGƯỜI DÙNG XEM ĐƯỢC PHƯỜNG XÃ, QUẬN HUYỆN, TỈNH THÀNH, CÁC MIỀN
GRANT SELECT
ON PHUONGXA TO TFS_KHACH
GO

GRANT SELECT
ON QUANHUYEN TO TFS_KHACH
GO

GRANT SELECT
ON TINHTHANH TO TFS_KHACH
GO

GRANT SELECT
ON CACMIEN TO TFS_KHACH
GO
---------------------------------------------------- 2. TFS_BACKUP ---------------------------------------------
GRANT BACKUP DATABASE TO TFS_BACKUP;
GO
---------------------------------------------------- 3. TFS_ADMIN ----------------------------------------------
-- CẤP TẤT CẢ QUYỀN CHO ADMIN
GRANT ALL PRIVILEGES TO TFS_ADMIN;
GO
-- DENY ĐỂ TỪ CHỐI QUYỀN TRUY CẬP VÀO GIỎ HÀNG VÀ THÔNG TIN CÁ NHÂN CỦA KHÁCH HÀNG
DENY INSERT, UPDATE, DELETE ON gio_hang TO TFS_ADMIN;
DENY INSERT, UPDATE, DELETE ON thong_tin_khach_hang TO TFS_ADMIN;

---------------------------------------------------- REVOKE ----------------------------------------------------
-- 1. TFS_KHACH
REVOKE SELECT
ON GIOHANG FROM TFS_KHACH
GO
-- THU HỒI QUYỀN CHO NGƯỜI DÙNG CÓ THỂ XEM THÊM XOÁ HÀNG TRONG CHI TIẾT GIỎ HÀNG VÀ CẬP NHẬT SỐ LƯỢNG HÀNG ĐÃ ĐẶT
REVOKE SELECT, INSERT, DELETE, UPDATE(SOLUONG)
ON CHITIETGIOHANG FROM TFS_KHACH
GO
-- THU HỒI QUYỀN CHO NGƯỜI DÙNG CÓ THỂ CẬP NHẬT NGƯỜI NHẬN, SĐT, TRẠNG THÁI(VÍ DỤ NHƯ HUỶ ĐƠN)
REVOKE UPDATE(NGUOINHAN, SDT, TRANGTHAI)
ON DONGIAO FROM TFS_KHACH
GO
-- THU HỒI QUYỀN CHO NGƯỜI DÙNG XEM ĐƯỢC SẢN PHẨM
REVOKE SELECT
ON SANPHAM FROM TFS_KHACH
GO
-- THU HỒI QUYỀN CHO NGƯỜI DÙNG XEM ĐƯỢC THÀNH PHẦN
REVOKE SELECT
ON THANHPHAN FROM TFS_KHACH
GO
-- THU HỒI QUYỀN CHO NGƯỜI DÙNG XEM ĐƯỢC HÌNH SẢN PHẨM
REVOKE SELECT
ON HINHANHSP FROM TFS_KHACH
GO
-- THU HỒI QUYỀN CHO NGƯỜI DÙNG XEM ĐƯỢC LOẠI SẢN PHẨM
REVOKE SELECT
ON LOAI FROM TFS_KHACH
GO
-- THU HỒI QUYỀN CHO NGƯỜI DÙNG XEM ĐƯỢC PHƯỜNG XÃ, QUẬN HUYỆN, TỈNH THÀNH, CÁC MIỀN
REVOKE SELECT
ON PHUONGXA FROM TFS_KHACH
GO

REVOKE SELECT
ON QUANHUYEN FROM TFS_KHACH
GO

REVOKE SELECT
ON TINHTHANH FROM TFS_KHACH
GO

REVOKE SELECT
ON CACMIEN FROM TFS_KHACH
GO