USE QL_THEFACESHOP

-- insert khách hàng
exec sp_InsertKhachHang N'Nguyễn Ngọc Mai', '0123456789'
exec sp_InsertKhachHang N'Nguyễn Kiều Quỳnh Trang', '0397661332'
exec sp_InsertKhachHang N'Nguyễn Quốc Thái', '0759632584'
exec sp_InsertKhachHang N'Nguyễn Văn A', '0778892253'
exec sp_InsertKhachHang N'Nguyễn Trí Tuấn', '0575896253'
exec sp_InsertKhachHang N'Cao Tấn Công', '0589635574'
exec sp_InsertKhachHang N'Dương Duy Anh', '0996335884'
exec sp_InsertKhachHang N'Phạm Ngọc Đào', '1234518936'
exec sp_InsertKhachHang N'Trần Lê Kim Ngân', '0372264805'
exec sp_InsertKhachHang N'Trần Anh Thảo', '0896325114'
exec sp_InsertKhachHang N'Nguyễn Thị Thanh Thảo', '0932075838'
exec sp_InsertKhachHang N'Nguyễn Thị Kiều Diễm', '0377882435'
exec sp_InsertKhachHang N'Lê Nguyễn Thúy An', '0708054432'
go
--insert QUYEN
insert into QUYEN
values ('KhachHang', N'Khách hàng'),
	   ('QuanTri', N'Quản trị')

--insert QUYENKHACHHANG
insert into QUYENKHACHHANG
values ('KH001', 'KhachHang'),
	   ('KH002', 'KhachHang'),
	   ('KH003', 'KhachHang'),
	   ('KH004', 'KhachHang'),
	   ('KH005', 'KhachHang'),
	   ('KH006', 'KhachHang'),
	   ('KH007', 'KhachHang'),
	   ('KH008', 'KhachHang'),
	   ('KH009', 'KhachHang'),
	   ('KH010', 'KhachHang'),
	   ('KH011', 'KhachHang'),
	   ('KH012', 'KhachHang'),
	   ('KH013', 'KhachHang')
go
-- insert GIOHANG
exec sp_InsertGioHang 'KH001'
exec sp_InsertGioHang 'KH002'
exec sp_InsertGioHang 'KH003'
exec sp_InsertGioHang 'KH004'
exec sp_InsertGioHang 'KH005'
exec sp_InsertGioHang 'KH006'
exec sp_InsertGioHang 'KH007'
exec sp_InsertGioHang 'KH008'
exec sp_InsertGioHang 'KH009'
exec sp_InsertGioHang 'KH010'
exec sp_InsertGioHang 'KH011'
exec sp_InsertGioHang 'KH012'
exec sp_InsertGioHang 'KH013'

-- insert nhân viên
exec sp_InsertNhanVien N'Nguyễn Quốc Thái', N'Nam', '0236598725', '123'
exec sp_InsertNhanVien N'Cù Đức Trường', N'Nam', '0125369875', '123'
exec sp_InsertNhanVien N'Nguyễn Phương Bảo Ngân', N'Nữ', '0369978845', '123'
exec sp_InsertNhanVien N'Bùi Phan Bảo Ngọc', N'Nữ', '0853690015', '123'
exec sp_InsertNhanVien N'Nguyễn Phan Như Quỳnh', N'Nữ', '0889663558', '123'
exec sp_InsertNhanVien N'Võ Thị Thanh Trúc', N'Nữ', '0903024857', '123'
go
-- insert QUYENNHANVIEN
insert into QUYENNHANVIEN
values ('NV001', 'QuanTri'),
	   ('NV002', 'QuanTri'),
	   ('NV003', 'QuanTri'),
	   ('NV004', 'QuanTri')
go
-- INSERT DONNHAP
EXEC sp_InsertDonNhap 'NV001', '2023-05-05', N'Đã đặt'
EXEC sp_InsertDonNhap 'NV001', '2023-06-06', N'Đã đặt'
EXEC sp_InsertDonNhap 'NV002', '2023-07-07', N'Đã đặt'
EXEC sp_InsertDonNhap 'NV003', '2023-08-08', N'Đã đặt'
EXEC sp_InsertDonNhap 'NV004', '2023-09-09', N'Đã đặt'
EXEC sp_InsertDonNhap 'NV005', '2023-10-10', N'Đã đặt'
EXEC sp_InsertDonNhap 'NV006', '2023-11-11', N'Đã đặt'
EXEC sp_InsertDonNhap 'NV004', '2023-07-12', N'Đã đặt'

-- insert CTDN
EXEC sp_InsertCTDN 'DN001', 'SP001', 145
EXEC sp_InsertCTDN 'DN001', 'SP002', 123
EXEC sp_InsertCTDN 'DN001', 'SP003', 356
EXEC sp_InsertCTDN 'DN001', 'SP004', 243
EXEC sp_InsertCTDN 'DN002', 'SP005', 124
EXEC sp_InsertCTDN 'DN002', 'SP006', 132
EXEC sp_InsertCTDN 'DN002', 'SP007', 167
EXEC sp_InsertCTDN 'DN002', 'SP008', 176
EXEC sp_InsertCTDN 'DN003', 'SP009', 221
EXEC sp_InsertCTDN 'DN003', 'SP010', 101
EXEC sp_InsertCTDN 'DN003', 'SP011', 102
EXEC sp_InsertCTDN 'DN003', 'SP012', 201
EXEC sp_InsertCTDN 'DN004', 'SP013', 132
EXEC sp_InsertCTDN 'DN004', 'SP014', 184
EXEC sp_InsertCTDN 'DN004', 'SP015', 144
EXEC sp_InsertCTDN 'DN004', 'SP016', 193
EXEC sp_InsertCTDN 'DN005', 'SP017', 199
EXEC sp_InsertCTDN 'DN005', 'SP018', 223
EXEC sp_InsertCTDN 'DN005', 'SP019', 213
EXEC sp_InsertCTDN 'DN005', 'SP020', 221
EXEC sp_InsertCTDN 'DN006', 'SP021', 122
EXEC sp_InsertCTDN 'DN006', 'SP022', 112
EXEC sp_InsertCTDN 'DN006', 'SP023', 121
EXEC sp_InsertCTDN 'DN006', 'SP024', 113
EXEC sp_InsertCTDN 'DN007', 'SP025', 153
EXEC sp_InsertCTDN 'DN007', 'SP026', 124
EXEC sp_InsertCTDN 'DN007', 'SP027', 143
EXEC sp_InsertCTDN 'DN007', 'SP028', 201
EXEC sp_InsertCTDN 'DN008', 'SP029', 121
EXEC sp_InsertCTDN 'DN008', 'SP030', 123
EXEC sp_InsertCTDN 'DN008', 'SP031', 132
EXEC sp_InsertCTDN 'DN008', 'SP032', 184

-- insert DONGIAO
EXEC sp_InsertDonGiao '2023-05-05', 'KH001', N'Nguyễn Ngọc Mai', '0123456789', N'123 Nguyễn Văn Cừ', '27325'
EXEC sp_InsertDonGiao '2023-06-06', 'KH002', N'Nguyễn Kiều Quỳnh Trang', '0397661332', N'112 Lê Trọng Tấn', '27013'
EXEC sp_InsertDonGiao '2023-07-07', 'KH003', N'Nguyễn Quốc Thái', '0759632584', N'46/1 Đỗ Nhuận', '27013'
EXEC sp_InsertDonGiao '2023-08-08', 'KH004', N'Nguyễn Văn A', '0778892253', N'100 Lê Văn Sỹ', '26983'
EXEC sp_InsertDonGiao '2023-09-09', 'KH005', N'Nguyễn Trí Tuấn', '0575896253', N'193 Đường Số 6', '27442'
EXEC sp_InsertDonGiao '2023-10-10', 'KH006', N'Cao Tấn Công', '0589635574', N'159 Phan Huy Ích', '27007'
EXEC sp_InsertDonGiao '2023-11-11', 'KH007', N'Dương Duy Anh', '0996335884', N'18 Dương Đức Hiền', '27013'
EXEC sp_InsertDonGiao '2023-07-12', 'KH008', N'Phạm Ngọc Đào', '1234518936', N'250 Nguyễn Thị Tú', '27442'
EXEC sp_InsertDonGiao '2023-05-05', 'KH009', N'Trần Lê Kim Ngân', '0372264805', N'160 Nguyễn Sơn', '27025'
EXEC sp_InsertDonGiao '2023-06-06', 'KH010', N'Trần Anh Thảo', '0896325114', N'142 Cộng Hòa', '26968'
EXEC sp_InsertDonGiao '2023-07-07', 'KH011', N'Nguyễn Thị Thanh Thảo', '0932075838', N'47 Trương Công Định', '27004'
EXEC sp_InsertDonGiao '2023-08-08', 'KH012', N'Nguyễn Thị Kiều Diễm', '0377882435', N'320 Nguyễn Tri Phương', '27199'
EXEC sp_InsertDonGiao '2023-09-09', 'KH013', N'Lê Nguyễn Thúy An', '0708054432', N'318 Thoại Ngọc Hầu', '27025'
EXEC sp_InsertDonGiao '2023-10-10', 'KH001', N'Nguyễn Ngọc Mai', '0123456789', N'123 Nguyễn Văn Cừ', '27325'
EXEC sp_InsertDonGiao '2023-11-11', 'KH002', N'Nguyễn Kiều Quỳnh Trang', '0397661332', N'112 Lê Trọng Tấn', '27013'
EXEC sp_InsertDonGiao '2023-07-12', 'KH003', N'Nguyễn Quốc Thái', '0759632584', N'46/1 Đỗ Nhuận', '27013'
EXEC sp_InsertDonGiao '2023-05-05', 'KH004', N'Nguyễn Văn A', '0778892253', N'100 Lê Văn Sỹ', '26983'
EXEC sp_InsertDonGiao '2023-06-06', 'KH005', N'Nguyễn Trí Tuấn', '0575896253', N'193 Đường Số 6', '27442'
EXEC sp_InsertDonGiao '2023-07-07', 'KH006', N'Cao Tấn Công', '0589635574', N'159 Phan Huy Ích', '27007'


-- insert CTDG
EXEC sp_InsertCTDG 'DG001', 'SP001', 1, 5, '2023-05-05', N'Rất tốt'
EXEC sp_InsertCTDG 'DG001', 'SP002', 1, 4.5, '2023-05-05', N'Sản phẩm khá tốt'
EXEC sp_InsertCTDG 'DG001', 'SP003', 1, 5, '2023-05-05', N'Amazing, sản phẩm quá tốt'
EXEC sp_InsertCTDG 'DG001', 'SP004', 1, 4.5, '2023-05-05', N'Sản phẩm tốt, xài được'
EXEC sp_InsertCTDG 'DG002', 'SP005', 1, 5, '2023-06-06', N'Dùng tốt lắm nha, nên mua mọi người ơi'
EXEC sp_InsertCTDG 'DG002', 'SP001', 2, 4.5, '2023-06-06', N'Mới nhận hàng, chưa xài nên chưa biết'
EXEC sp_InsertCTDG 'DG002', 'SP006', 1, 4.5, '2023-06-06', N'Mới nhận hàng, chưa xài nên chưa biết'
EXEC sp_InsertCTDG 'DG002', 'SP007', 1, 5, '2023-06-06', N'Mới dùng thử chưa biết kết quả như thế nào'
EXEC sp_InsertCTDG 'DG002', 'SP008', 1, 4.5, '2023-06-06', N'Rất tốt'
EXEC sp_InsertCTDG 'DG003', 'SP009', 1, 5, '2023-07-07', N'Trời ơi ưng quá trời luôn áaaaaa'
EXEC sp_InsertCTDG 'DG003', 'SP010', 1, 5, '2023-07-07', N'Xài mà nó mát lòng mát dạ'
EXEC sp_InsertCTDG 'DG003', 'SP002', 1, 5, '2023-07-07', N'Không uổng tiền khi mua nha mọi người'
EXEC sp_InsertCTDG 'DG003', 'SP012', 1, 5, '2023-07-07', N'Sản phẩm tốt lắm nha mọi người'
EXEC sp_InsertCTDG 'DG004', 'SP013', 1, 4.5, '2023-08-08', N'Rất tốt'
EXEC sp_InsertCTDG 'DG004', 'SP014', 1, 4, '2023-08-08', N'Mới mua chưa biết có hiệu quả hay không'
EXEC sp_InsertCTDG 'DG004', 'SP015', 2, 4.5, '2023-08-08', N'Mua rất đáng tiền nha mọi người'
EXEC sp_InsertCTDG 'DG004', 'SP016', 1, 4.5, '2023-08-08', N'Rất tốt'
EXEC sp_InsertCTDG 'DG005', 'SP017', 4, 5, '2023-09-09', N'Mới đầu cũng hơi lo mà mua về dùng thử r mới thấy quá xứng đáng'
EXEC sp_InsertCTDG 'DG005', 'SP018', 1, 4.5, '2023-09-09', N'Rất tốt'
EXEC sp_InsertCTDG 'DG005', 'SP019', 1, 5, '2023-09-09', N'Nên mua nha, sản phẩm dùng quá ok luôn'
EXEC sp_InsertCTDG 'DG005', 'SP020', 1, 5, '2023-09-09', N'Không uổng tiền khi mua nha mọi người'
EXEC sp_InsertCTDG 'DG006', 'SP021', 1, 5, '2023-10-10', N'Nên mua mọi người ơi, sản phẩm ok lắm á'
EXEC sp_InsertCTDG 'DG006', 'SP022', 1, 5, '2023-10-10', N'10 điểm'
EXEC sp_InsertCTDG 'DG006', 'SP023', 1, 4.5, '2023-10-10', N'Rất tốt'
EXEC sp_InsertCTDG 'DG006', 'SP024', 2, 4.5, '2023-10-10', N'Mua xài thử đi mng, đáng tiền lắm'
EXEC sp_InsertCTDG 'DG007', 'SP025', 1, 3, '2023-11-11', N'Sản phẩm không tốt như review'
EXEC sp_InsertCTDG 'DG007', 'SP026', 2, 4.5, '2023-11-11', N'Mới mua, đợi sử dụng xong quay lại review'
EXEC sp_InsertCTDG 'DG007', 'SP027', 1, 4.5, '2023-11-11', N'Sản phẩm khá tốt'
EXEC sp_InsertCTDG 'DG007', 'SP028', 1, 4.5, '2023-11-11', N'Mua rất đáng tiền nha mọi người'
EXEC sp_InsertCTDG 'DG008', 'SP029', 1, 5, '2023-07-12', N'Không uổng tiền khi mua nha mọi người'
EXEC sp_InsertCTDG 'DG008', 'SP030', 1, 4.5, '2023-07-12', N'Rất tốt'
EXEC sp_InsertCTDG 'DG008', 'SP031', 1, 4.5, '2023-07-12', N'Trải nghiệm khá tốt'
EXEC sp_InsertCTDG 'DG008', 'SP032', 1, 4.5, '2023-07-12', N'Rất tốt'
EXEC sp_InsertCTDG 'DG009', 'SP011', 1, 5, '2023-05-05', N'Rất tốt'
EXEC sp_InsertCTDG 'DG009', 'SP012', 1, 4.5, '2023-05-05', N'Sản phẩm khá tốt'
EXEC sp_InsertCTDG 'DG009', 'SP024', 1, 5, '2023-05-05', N'Mới xài được bạn khen ưng lắm mấy bà ơi'
EXEC sp_InsertCTDG 'DG010', 'SP013', 1, 5, '2023-05-05', N'Amazing, sản phẩm quá tốt'
EXEC sp_InsertCTDG 'DG010', 'SP014', 3, 4.5, '2023-05-05', N'Sản phẩm tốt, xài được'
EXEC sp_InsertCTDG 'DG010', 'SP004', 1, 5, '2023-05-05', N'Rất tốt'
EXEC sp_InsertCTDG 'DG011', 'SP003', 1, 5, '2023-06-06', N'Dùng tốt lắm nha, nên mua mọi người ơi'
EXEC sp_InsertCTDG 'DG011', 'SP006', 1, 4.5, '2023-06-06', N'Mới dùng thử chưa biết kết quả như thế nào'
EXEC sp_InsertCTDG 'DG011', 'SP005', 1, 5, '2023-06-06', N'Mới nhận hàng, chưa xài nên chưa biết'
EXEC sp_InsertCTDG 'DG012', 'SP007', 1, 4.5, '2023-06-06', N'Mới nhận hàng, chưa xài nên chưa biết'
EXEC sp_InsertCTDG 'DG012', 'SP008', 1, 5, '2023-06-06', N'Mới nhận hàng, chưa xài nên chưa biết'
EXEC sp_InsertCTDG 'DG012', 'SP009', 1, 4.5, '2023-06-06', N'Rất tốt'
EXEC sp_InsertCTDG 'DG013', 'SP020', 2, 5, '2023-07-07', N'Trời ơi ưng quá trời luôn áaaaaa'
EXEC sp_InsertCTDG 'DG013', 'SP030', 1, 5, '2023-07-07', N'Xài mà nó mát lòng mát dạ'
EXEC sp_InsertCTDG 'DG013', 'SP015', 1, 5, '2023-07-07', N'Không uổng tiền khi mua nha mọi người'
EXEC sp_InsertCTDG 'DG014', 'SP010', 1, 5, '2023-08-08', N'Sản phẩm tốt lắm nha mọi người'
EXEC sp_InsertCTDG 'DG014', 'SP011', 1, 5, '2023-08-08', N'Rất tốt'
EXEC sp_InsertCTDG 'DG014', 'SP016', 1, 5, '2023-08-08', N'Mới mua chưa biết có hiệu quả hay không'
EXEC sp_InsertCTDG 'DG015', 'SP017', 1, 5, '2023-09-09', N'Rất tốt'
EXEC sp_InsertCTDG 'DG015', 'SP018', 1, 5, '2023-09-09', N'Nên mua nha, sản phẩm dùng quá ok luôn'
EXEC sp_InsertCTDG 'DG015', 'SP019', 1, 5, '2023-09-09', N'10 điểm'
EXEC sp_InsertCTDG 'DG016', 'SP021', 1, 5, '2023-10-10', N'Nên mua mọi người ơi, sản phẩm ok lắm á'
EXEC sp_InsertCTDG 'DG016', 'SP022', 1, 5, '2023-10-10', N'Không uổng tiền khi mua nha mọi người'
EXEC sp_InsertCTDG 'DG016', 'SP023', 1, 4, '2023-10-10', N'Khá tốt'
EXEC sp_InsertCTDG 'DG017', 'SP025', 1, 5, '2023-10-10', N'Mua xài thử đi mng, đáng tiền lắm'
EXEC sp_InsertCTDG 'DG017', 'SP026', 1, 5, '2023-10-10', N'Nên mua mọi người ơi, sản phẩm ok lắm á'
EXEC sp_InsertCTDG 'DG017', 'SP027', 1, 5, '2023-10-10', N'10 điểm'
EXEC sp_InsertCTDG 'DG018', 'SP028', 1, 5, '2023-11-11', N'Nên mua mọi người ơi, sản phẩm ok lắm á'
EXEC sp_InsertCTDG 'DG018', 'SP029', 1, 5, '2023-11-11', N'Không uổng tiền khi mua nha mọi người'
EXEC sp_InsertCTDG 'DG018', 'SP031', 1, 4, '2023-11-11', N'Tạm được'
EXEC sp_InsertCTDG 'DG019', 'SP032', 1, 5, '2023-07-12', N'Nên mua mọi người ơi, sản phẩm ok lắm á'


-- INSERT LOẠI
EXEC sp_InsertLoai N'Trang điểm'
EXEC sp_InsertLoai N'Dưỡng da'
EXEC sp_InsertLoai N'Chăm sóc cơ thể'

-- insert CHITIETLOAI
EXEC sp_InsertChiTietLoai N'Trang điểm mặt','L001'
EXEC sp_InsertChiTietLoai N'Trang điểm môi','L001'
EXEC sp_InsertChiTietLoai N'Trang điểm mắt','L001'
EXEC sp_InsertChiTietLoai N'Phụ kiện trang điểm','L001'

EXEC sp_InsertChiTietLoai N'Dưỡng da mặt','L002'
EXEC sp_InsertChiTietLoai N'Làm sạch','L002'
EXEC sp_InsertChiTietLoai N'Mặt nạ','L002'
EXEC sp_InsertChiTietLoai N'Chống Nắng','L002'
EXEC sp_InsertChiTietLoai N'Dưỡng Da Giành Cho Nam','L002'
EXEC sp_InsertChiTietLoai N'Phụ kiện chăm sóc da','L002'

EXEC sp_InsertChiTietLoai N'Chăm sóc body','L003'
EXEC sp_InsertChiTietLoai N'Chăm sóc tóc','L003'
EXEC sp_InsertChiTietLoai N'Chăm sóc tay/chân','L003'

-- insert CHITIETLOAISP
EXEC sp_InsertChiTietLoaiSP N'Kem Nền','CTL001'
EXEC sp_InsertChiTietLoaiSP N'Kem Lót','CTL001'
EXEC sp_InsertChiTietLoaiSP N'Che Khuyết Điểm','CTL001'
EXEC sp_InsertChiTietLoaiSP N'Phấn Má Hồng','CTL001'
EXEC sp_InsertChiTietLoaiSP N'Phấn Nước Cushion','CTL001'
EXEC sp_InsertChiTietLoaiSP N'Phấn Phủ','CTL001'
EXEC sp_InsertChiTietLoaiSP N'Tạo Khối - Highlighter','CTL001'
EXEC sp_InsertChiTietLoaiSP N'Kem Nền bb / cc Cream','CTL001'

EXEC sp_InsertChiTietLoaiSP N'Son Thỏi','CTL002'
EXEC sp_InsertChiTietLoaiSP N'Son Tint | Son Kem','CTL002'
EXEC sp_InsertChiTietLoaiSP N'Son Bóng','CTL002'
EXEC sp_InsertChiTietLoaiSP N'Son Dưỡng Môi','CTL002'

EXEC sp_InsertChiTietLoaiSP N'Mascara','CTL003'
EXEC sp_InsertChiTietLoaiSP N'Kẻ Chân Mày','CTL003'
EXEC sp_InsertChiTietLoaiSP N'Phấn Mắt','CTL003'
EXEC sp_InsertChiTietLoaiSP N'Kẻ Viền Mắt','CTL003'

EXEC sp_InsertChiTietLoaiSP N'Cọ Trang điểm','CTL004'
EXEC sp_InsertChiTietLoaiSP N'Bông Mút Trang Điểm','CTL004'
EXEC sp_InsertChiTietLoaiSP N'Bông Cotton','CTL004'
EXEC sp_InsertChiTietLoaiSP N'Phụ kiện trang điểm khác','CTL004'

EXEC sp_InsertChiTietLoaiSP N'Nước Cân Bằng','CTL005'
EXEC sp_InsertChiTietLoaiSP N'Xịt Khoáng','CTL005'
EXEC sp_InsertChiTietLoaiSP N'Sữa Dưỡng','CTL005'
EXEC sp_InsertChiTietLoaiSP N'Tinh Chất Dưỡng','CTL005'
EXEC sp_InsertChiTietLoaiSP N'Kem Dưỡng Mắt','CTL005'
EXEC sp_InsertChiTietLoaiSP N'Kem Dưỡng Da Mặt','CTL005'
EXEC sp_InsertChiTietLoaiSP N'Bộ Dưỡng Chăm Sóc Da','CTL005'

EXEC sp_InsertChiTietLoaiSP N'Sữa Rửa Mặt','CTL006'
EXEC sp_InsertChiTietLoaiSP N'Tẩy Trang Da Mặt','CTL006'
EXEC sp_InsertChiTietLoaiSP N'Tẩy Trang Mắt Và Môi','CTL006'
EXEC sp_InsertChiTietLoaiSP N'Tẩy Tế Bào Chết Mặt','CTL006'
EXEC sp_InsertChiTietLoaiSP N'Phụ Kiện Làm Sạch','CTL006'

EXEC sp_InsertChiTietLoaiSP N'Mặt Nạ Giấy','CTL007'
EXEC sp_InsertChiTietLoaiSP N'Mặt Nạ Dưỡng','CTL007'
EXEC sp_InsertChiTietLoaiSP N'Mặt Nạ Mắt/Môi','CTL007'
EXEC sp_InsertChiTietLoaiSP N'Mặt Nạ Tay Chân','CTL007'

EXEC sp_InsertChiTietLoaiSP N'Kem Chống Nắng','CTL008'
EXEC sp_InsertChiTietLoaiSP N'Sáp Chống Nắng','CTL008'
EXEC sp_InsertChiTietLoaiSP N'Sữa / Gel Chống Nắng','CTL008'

EXEC sp_InsertChiTietLoaiSP N'Giấy Thấm Dầu','CTL010'
EXEC sp_InsertChiTietLoaiSP N'Bông Cotton','CTL010'
EXEC sp_InsertChiTietLoaiSP N'Miếng Dán Mụn/Miếng Lột Mụn Đầu Đen','CTL010'
EXEC sp_InsertChiTietLoaiSP N'Dụng Cụ Chăm Sóc Da Mặt','CTL010'

EXEC sp_InsertChiTietLoaiSP N'Sữa Tắm','CTL011'
EXEC sp_InsertChiTietLoaiSP N'Dưỡng Thể','CTL011'
EXEC sp_InsertChiTietLoaiSP N'Làm Sạch Tế Bào Chết Cơ Thể','CTL011'
EXEC sp_InsertChiTietLoaiSP N'Phụ Kiện Chăm Sóc Cơ Thể','CTL011'
EXEC sp_InsertChiTietLoaiSP N'Nước Hoa/Xịt Thơm Body','CTL011'

EXEC sp_InsertChiTietLoaiSP N'Dầu Gội - Dầu Xả','CTL012'
EXEC sp_InsertChiTietLoaiSP N'Dưỡng Tóc','CTL012'
EXEC sp_InsertChiTietLoaiSP N'Tạo Kiểu Tóc','CTL012'

EXEC sp_InsertChiTietLoaiSP N'Kem Dưỡng Tay/Chân','CTL013'
EXEC sp_InsertChiTietLoaiSP N'Mặt Nạ Tay/Chân','CTL013'
