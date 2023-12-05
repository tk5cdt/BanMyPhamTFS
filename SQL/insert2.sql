USE QL_THEFACESHOP

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

