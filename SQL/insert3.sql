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
go

INSERT INTO DANGBAOCHE (MADBC, TENDANG) VALUES ('DBC001', N'Gel')
INSERT INTO DANGBAOCHE (MADBC, TENDANG) VALUES ('DBC002', N'Serum')
INSERT INTO DANGBAOCHE (MADBC, TENDANG) VALUES ('DBC003', N'Kem')
INSERT INTO DANGBAOCHE (MADBC, TENDANG) VALUES ('DBC004', N'Phấn')
INSERT INTO DANGBAOCHE (MADBC, TENDANG) VALUES ('DBC005', N'Sáp')
INSERT INTO DANGBAOCHE (MADBC, TENDANG) VALUES ('DBC006', N'Dầu')
INSERT INTO DANGBAOCHE (MADBC, TENDANG) VALUES ('DBC007', N'Dung dịch')
INSERT INTO DANGBAOCHE (MADBC, TENDANG) VALUES ('DBC008', N'Lotion')
INSERT INTO DANGBAOCHE (MADBC, TENDANG) VALUES ('DBC009', N'Tinh chất')
INSERT INTO DANGBAOCHE (MADBC, TENDANG) VALUES ('DBC010', N'Nước')
INSERT INTO DANGBAOCHE (MADBC, TENDANG) VALUES ('DBC011', N'Sữa')
INSERT INTO DANGBAOCHE (MADBC, TENDANG) VALUES ('DBC012', N'Bột')
INSERT INTO DANGBAOCHE (MADBC, TENDANG) VALUES ('DBC013', N'Khác')

INSERT INTO QUYCACHDONGGOI (MAQCDG, TENQCDG) VALUES ('QCDG001', N'Chai')
INSERT INTO QUYCACHDONGGOI (MAQCDG, TENQCDG) VALUES ('QCDG002', N'Lọ')
INSERT INTO QUYCACHDONGGOI (MAQCDG, TENQCDG) VALUES ('QCDG003', N'Miếng')
INSERT INTO QUYCACHDONGGOI (MAQCDG, TENQCDG) VALUES ('QCDG004', N'Hũ')
INSERT INTO QUYCACHDONGGOI (MAQCDG, TENQCDG) VALUES ('QCDG005', N'Tuýp')
INSERT INTO QUYCACHDONGGOI (MAQCDG, TENQCDG) VALUES ('QCDG006', N'Thỏi')
INSERT INTO QUYCACHDONGGOI (MAQCDG, TENQCDG) VALUES ('QCDG007', N'Hộp')
INSERT INTO QUYCACHDONGGOI (MAQCDG, TENQCDG) VALUES ('QCDG008', N'Cây')
go
EXEC pc_InsertSanPham N'Kem Lót Air Cotton Make Up Base The Face Shop', 'CTLSP002', 599000, 550000, 'DBC003', 'QCDG005',
N'Công dụng của Kem Lót TFS AIR COTTON MAKE UP BASE
Kem lót hỗ trợ khả năng chống nắng bảo vệ da, tạo 1 lớp nền bảo vệ cực mỏng, đồng thời hiệu chỉnh tông màu da giúp cho bạn sở hữu làn da sáng mịn như da em bé ngay sau khi trang điểm.
Màu Lavender: Sử dụng cho sắc da tái, thiếu sức sống.
Thành phần chính trong Kem Lót TFS
Thành phần chính của kem lót TFS là từ Cotton Seed - Một dạng hạt được sử dụng nhiều trong chế biến thực phẩm bởi hàm lượng dinh dưỡng rất cao. Ngoài ra Cotton seed tăng cường khả năng giữ nước và kiểm soát dầu cho da.
Hướng dẫn sử dụng TFS AIR COTTON MAKE UP BASE
Sử dụng sau các bước dưỡng da và kem chống nắng. Lấy một lượng kem vừa đủ và dàn trải đều khắp bề mặt da.
“Chúng tôi luôn khuyến khích bạn sử dụng thêm sản phẩm dưỡng da để nuôi dưỡng vẻ đẹp tự nhiên thừa hưởng từ bố mẹ"',
N'Làm lớp nền trang điểm, đều màu da', 50

EXEC pc_InsertSanPham N'Kem Nền Hiệu Ứng Căng Mướt THE FACE SHOP Aura Cc Cream Spf30 Pa++', 'CTLSP001', 811000, 750000, 'DBC003', 'QCDG002',
N'Trang điểm chính là vũ khí giúp phụ nữ trở nên xinh đẹp, thu hút hơn. Kem nền Aura CC Color Control Cream SPF30 PA++  mang đến giải pháp trang điểm nền tuyệt vời giúp phụ nữ tự tin, cuốn hút hơn với làn da căng mướt, sáng đều màu. Sản phẩm đa năng vừa make-up cho làn da thêm mướt mát, đều màu vừa cấp dưỡng ẩm, cải thiện tình trạng da thô sần, xỉn màu. Bên cạnh đó, CC cream với hiệu quả chống nắng SPF30 PA++ hỗ trợ che chắn, bảo vệ làn da không tổn thương trước tia UV.
Đây là kem nền có hiệu ứng nâng tông tự nhiên, hiệu chỉnh sắc diện da sáng sáng mịn, duy trì vẻ rạng rỡ cho gương mặt. Thay đổi làn da xỉn màu, có nếp nhăn li ti trở nên mịn mượt và tươi tắn hơn. Bên cạnh đó, kem nền Aura CC Color Control Cream sở hữu hệ thống cấp nước kép với thành phần hoa lily giúp tăng cường khả năng cấp khóa ẩm cho làn da mất nước, vừa cải thiện bề mặt da thô sần vừa làm dịu và tăng độ bám của kem nền. Ngoài ra, công thức hạt phấn được bao phủ bởi amino axit và có hình dạng mặt cầu sẽ tạo khả năng bám phấn cực tốt trên da, dễ dàn trải và tạo ra lớp kem nền mỏng mịn, lâu trôi mà không bị vón cục.
Điểm nổi bật của Kem nền Aura CC Color Control Cream SPF30 PA++
CC cream giúp cấp nước dưỡng ẩm, làm dịu da với thành phần nước hoa lily
Tạo hiệu ứng nâng tông làm sáng đều màu da, mang lại vẻ tươi sáng, trẻ trung suốt cả ngày cho làn da.
Hiệu quả chống nhăn, chống tia UV với chỉ số SPF30 PA++ hỗ trợ bảo vệ làn da trẻ hóa, đều màu
Aura CC Color Control Cream sở hữu hệ thống cấp nước kép, tăng cường khả năng dưỡng ẩm trên làn da, ngừa tình trạng da khô hoặc nứt phấn trong quá trình sử dụng
Công thức hạt phấn bao phủ bởi amino axit kết hợp công nghệ màng phim tối ưu giúp tăng cường khả năng lâu trôi sau nhiều giờ sử dụng
Cho lớp kem mịn, khô ráo trên bề mặt da, cố định nhanh lớp nền giúp giảm thiểu tình trạng lem trôi
Cấu trúc hạt phấn mặt cầu giúp CC cream dễ dàng dàn trải trên bề mặt da, tạo hiệu ứng bóng mượt mà không hề gây vón cục
Đặc biệt thích hợp cho làn da khô, xỉn màu và phụ nữ thích hiệu ứng kem nền căng mướt, nâng tông sáng da', N'Nâng tông, căng mướt da', 30

EXEC pc_InsertSanPham N'Thanh che khuyết điểm Fmgt Concealer Dual Veil V201', 'CTLSP003', 389000, 300000, 'DBC005', 'QCDG006',
N'Thanh che khuyết điểm CONCEALER DUAL VEIL dạng 2 đầu thiết kế hiện đại tiện dụng: Một đầu dạng thỏi son và một đầu dạng lỏng kèm đầu cọ.
Sản phẩm mang đến hiệu quả làm mờ các quầng thâm, đốm mụn, vùng da không đều màu. Ngoài ra sản phẩm còn có tác dụng làm lớp nền môi, che đi màu môi sẫm, thâm, giúp son lên màu một cách tươi tắn và đúng chuẩn nhất.
Những vết thâm nám, thâm sau mụn giờ đây sẽ không còn cản trở bạn có một lớp nền hoàn hảo vì đã được che phủ tuyệt vời với thanh che khuyết điểm. Sản phẩm chắc chắn sẽ giúp bạn tự tin hơn với lớp nền trang điểm của mình.', N'Che khuyết điểm', 23

EXEC pc_InsertSanPham N'Má Hồng Dạng Nước Fmgt Moisture Cushion Blush', 'CTLSP004', 369000, 299000, 'DBC010', 'QCDG007',
N'Con gái với đôi má ửng hồng tự nhiên vừa tạo nét đáng yêu vừa tràn đầy sức sống. Thay vì dùng các dạng phấn má hồng dạng bột dễ phai, nay THE FACE SHOP đã cho ta đời dòng má hồng dạng nước Moisture Cushion Blush.  Giúp tạo hiệu ứng ửng hồng đều màu tự nhiên cho đôi gò má, mang lại một gương mặt rạng rỡ và tươi trẻ hơn bao giờ hết.
MOISTURE CUSHION BLUSH là sản phẩm má hồng được thiết kế theo kiểu cushion.Nắp đậy giúp bảo quản chất kem tốt hơn, cùng với miếng đệm Microfoam siêu mịn cho lớp phấn mỏng nhẹ. Độ bám cao và bền màu. Trong thành phần hoạt động, Hydro cushion có chứa Hyaluronic Acid – phân tử ngậm nước, giúp lớp má hồng trong veo, mềm mịn. 
Tạo hiệu ứng ửng hồng tự nhiên. Ngoài ra với thiết kế nhỏ gọn, xinh xắn sẽ rất tiện lợi khi dặm lại ở bất cứ nơi nào.', N'Má hồng', 61


EXEC pc_InsertSanPham N'Phấn Nước Trang Điểm Lâu Trôi TheFaceShop Ink Lasting Cushion', 'CTLSP005', 189000, 140000, 'DBC010', 'QCDG007',
N'Chuẩn bị lớp nền bền vững, lâu trôi là cách giúp bước trang điểm của bạn thêm lung linh, hoàn hảo. Với Ink Lasting Cushion SPF 30 PA++, Phấn nước bền màu lâu trôi đến các chuyên gia trang điểm cũng yêu thích. Dùng cả ngày nhưng lớp make-up vẫn không xỉn màu, không bợt không vỡ và làm lộ khuyết điểm trên da.
Phấn Nước Ink Lasting Cushion SPF 30 PA++ có ba điểm nổi bật khiến nàng nào cũng thích. Đầu tiên là khả năng che phủ cao, giúp giấu đi mọi khuyết điểm trên mặt da. Đồng thời, Phấn nước cấp ẩm làm đầy các rãnh nhăn, góp phần tạo nên bề mặt da mềm mịn, đàn hồi tốt.
Sau đó, Ink Lasting Cushion có đặc tính lâu trôi và bền màu, tạo nên lớp nền mỏng mịn và hiệu ứng căng bóng da. Kết hợp với khả năng kiềm dầu giúp lớp trang điểm luôn tươi tắn, gương mặt rạng rỡ cả ngày dài năng động. Cuối cùng, đặc điểm khiến phái đẹp mê tít phấn nước lâu trôi Ink Lasting Cushion đó là khả năng chống nắng với chỉ số SPF 30, PA++. 
Với thông số này, Phấn nước có thể chống lại cả tia UVA và UVB từ ánh nắng, ngăn ngừa sự tổn thương và làm tối màu da của ánh nắng.',
N'Cushion cho lớp che phủ tốt, tạo hiệu ứng căng bóng, lấp lánh bởi các hạt phấn nano giúp làn da tươi sáng hơn', 56

EXEC pc_InsertSanPham N'Phấn Phủ Chống Nắng THE FACE SHOP Natural Sun Eco No Shine Sun Powder Spf30Pa++', 'CTLSP006', 789000, 700000, 'DBC012', 'QCDG007',
N'Natural Sun Eco No shine sun powder với những hạt phấn cực tơi mịn giúp cho da mềm mại tự nhiên hơn, nhẹ nhàng và khô thoáng. Hạt phấn không có màu nên phù hợp với mọi tông màu da, cho làn da đẹp mịn màng và tự nhiên nhất có thể. 
Phấn phủ Natural Sun Eco No shine sun powder  được đánh giá là rất “đáng đồng tiền bát gạo”. Là dạng phấn có cấu trúc siêu mỏng nhẹ, giúp che phủ lỗ chân lông và có tác dụng chống nắng, dưỡng ẩm cho da. Phấn có thể dùng được cả trước và sau khi trang điểm.
Khả năng kiềm dầu tốt, giúp làm giảm bóng dầu, giúp lớp nền được cố định, không bị trôi hay xuống màu. Có thể phủ phấn sau khi trang điểm giúp định hình lớp trang điểm hoặc trước khi trang điểm, trên mặt mộc đã được dưỡng ẩm giúp kiềm dầu.
Bạn chỉ cần dặm nhẹ một lớp phấn mỏng sau bước dưỡng ẩm hoặc phủ đều trên lớp makeup đã hoàn thiện là có thể tung tăng cả ngày dài mà không lo da bị đổ dầu hay lớp nền xuống tông',
N'Giúp cho da mềm mại tự nhiên hơn, nhẹ nhàng và khô thoáng', 87

EXEC pc_InsertSanPham N'Phấn Tạo Khối THE FACE SHOP Dual Contour', 'CTLSP007', 559000, 500000, 'DBC004', 'QCDG007',
N'Phấn Tạo Khối THEFACESHOP DUAL CONTOUR dùng tạo đường nét thon gọn cho gương mặt. Phấn tạo khối với 2 màu kết hợp giúp tạo sự cân đối và hài hòa trên gương mặt. Hạt phấn siêu mịn dễ tán và bắt sáng tốt. Phấn bám da lâu và rất tự nhiên, hoàn toàn không lộ dấu phấn',
N'Tạo khối, bắt sáng', 101

EXEC pc_InsertSanPham N'Kem Nền Đa Năng THE FACE SHOP Power Perfection Bb Cream Spf37 Pa++', 'CTLSP008', 484000, 404000, 'DBC008', 'QCDG005',
N'Công dụng của Kem Nền Đa Năng POWER PERFECTION BB CREAM
POWER PERFECTION BB CREAM SPF37 PA++ là sản phẩm trang điểm cao cấp của thương hiệu THEFACESHOP - Hàn Quốc. Chỉ cần nhắc đến thương hiệu là các nàng đều háo hức, mong chờ vì đã có quá nhiều sản phẩm của THEFACESHOP đến tay người tiêu dùng và chưa một lần làm họ thất vọng. được xem như liệu pháp tổng hợp cho làn da như:
Kem trang điểm 3 trong 1 (chống nhăn da, làm trắng, chống nắng) sẽ mang đến lớp phủ hoàn hảo.
Lớp trang điểm đẹp hơn (lớp phủ hoàn mỹ + độ bám tốt + lâu trôi) tạo cảm giác mịn màng, không bóng nhờn hay dày phấn.
Đặc biệt, Kem nền còn chứa lớp bột phủ trông giống như các tế bào da tạo nên độ bám tốt cho da bạn cảm giác thoải mái với lớp trang điểm mịn màng lâu trôi.
Với kết cấu thoáng khí kỳ diệu, cấu trúc nhẹ nhàng như không khí, nhanh chóng thẩm thấu vào da ngay sau khi thoa lên da. Vì thế bạn sẽ không phải lo lắng bận tâm cho làn da bị bít tắc lỗ chân lông khi trang điểm nhé.
Và điều quan trọng giúp các chị em Phụ Nữ yên tâm & tự tin làm đẹp với sản phẩm Kem nền đa năng POWER PERFECTION BB CREAM SPF37 PA++ vì đã được kiểm nghiệm lâm sàng
*Thí nghiệm lâm sàng kiểm tra mức độ săn chắc, tính giữ ẩm, độ phủ, và khả năng lâu trôi của sản phẩm', 
N'Làm sáng, đều màu da', 120

EXEC pc_InsertSanPham N'Son Thỏi Nhung Lì New Bold Velvet Lipstick','CTLSP009', 639000, 600000, 'DBC005', 'QCDG006',
N'Son thỏi nhung lì New Bold Velvet Lipstick có kết cấu hạt phấn siêu nhỏ, siêu mịn len lỏi làm đầy rãnh môi, tạo hiệu ứng đôi môi căng bóng, tràn đầy sức sống.
Chất son mềm mại, tan chảy bao bọc trọn vẹn đôi môi biến một ngày bình thường của bạn trở nên đặc biệt hơn bao giờ hết.',
N'Dưỡng, làm đầy vân môi, son', 34

EXEC pc_InsertSanPham N'Son Tint Hiệu Ứng Bóng Mượt Môi THE FACE SHOP Lip Glaze', 'CTLSP010', 439000, 400000, 'DBC005', 'QCDG006',
N'Son tint hiệu ứng bóng mượt môi Lip Glaze được thiết kế vỏ nhựa trong suốt, mang lại ấn tượng ngay từ ánh nhìn đầu tiên. Sản phẩm áp dụng công thức độc quyền Long-lasting có hiệu quả bám lâu trên môi, duy trì màu sắc mới như ban đầu.
Với chất son mỏng nhẹ, hương thơm thoang thoảng của trái cây tạo đôi môi căng mọng, cùng với cảm giác thư giãn mỗi khi sử dụng. Son gồm bảng màu đa dạng từ cam, hồng đến đỏ giúp bạn tha hồ theo đuổi phong cách mà bản thân yêu thích.',
N'Làm căng môi', 80

EXEC pc_InsertSanPham N'Son Thỏi Hiệu Ứng Bóng Mướt Rouge Shine Vivid', 'CTLSP011', 490000, 450000, 'DBC005', 'QCDG006',
N'Son tint hiệu ứng bóng mượt môi Lip Glaze được thiết kế vỏ nhựa trong suốt, mang lại ấn tượng ngay từ ánh nhìn đầu tiên. Sản phẩm áp dụng công thức độc quyền Long-lasting có hiệu quả bám lâu trên môi, duy trì màu sắc mới như ban đầu.
Với chất son mỏng nhẹ, hương thơm thoang thoảng của trái cây tạo đôi môi căng mọng, cùng với cảm giác thư giãn mỗi khi sử dụng. Son gồm bảng màu đa dạng từ cam, hồng đến đỏ giúp bạn tha hồ theo đuổi phong cách mà bản thân yêu thích.
Rouge Shine Vivid là một trong những lựa chọn tuyệt vời cho những đôi môi hay khô tróc, thiếu ẩm và môi mỏng. Với hiệu ứng bóng cùng khả năng cấp ẩm làm mượt môi, 
Rouge Shine Vivid mang lại bờ môi bóng mướt, cuốn hút với những sắc màu nổi bật.', N'Làm căng môi', 65

EXEC pc_InsertSanPham N'Son Dưỡng Môi Có Màu Dr.Belmeur Advanced Cica Touch Lip Balm', 'CTLSP012', 239000, 200000, 'DBC005', 'QCDG006',
N'Dr.Belmeur Advanced Cica Touch Lip Balm là dòng son dưỡng có màu đa năng với thành phần thiên nhiên cực kì lành tính. Son dưỡng có khả năng dưỡng ẩm, phục hồi tổn thương và chống lão hoá cho bờ môi.
Đồng thời giúp lấy lại độ mềm mượt, căng mướt cho những môi khô, bong tróc, nứt nẻ.
Công thức Hypoallergenic giúp son dưỡng môi có màu Dr.Belmeur Advanced Cica Touch Lip Balm cấp ẩm tuyệt đối nhưng không gây cảm giác nặng môi.
Mang lại sự thoải mái với màu sắc dưỡng nhẹ nhàng tự nhiên chỉ sau một lần chạm',
N'Dưỡng môi', 102

EXEC pc_InsertSanPham N'Mascara Làm Cong Mi THEFACESHOP 2 IN 1 CURLING MASCARA', 'CTLSP013', 369000, 360000, 'DBC010', 'QCDG006',
N'Mascara The Face Shop 2 trong 1 Curling Mascara với thiết kế 2 đầu cọ: cọ to chải thông thường tạo độ cong cho mi và đầu cọ nhỏ siêu mảnh 3.5mm tiện lợi cho những vùng khó chải như đầu và cuối chân mi, làn mi dưới.
Chất gel nhẹ, không gây nặng mi, giúp sợi mi được uốn cong và giữ nếp lâu dài.
Mascara làm cong mi tối ưu và giữ nếp đến 24h. Công nghệ polymer với hiệu ứng bền, bao phủ hàng mi giúp lớp mascara giữ lâu bền hơn.', 
N'Làm dài, cong mi', 79

EXEC pc_InsertSanPham N'Chì Kẻ Chân Mày Đa Năng Browlasting Waterproof Eyebrow Pencil 0.5G 02 Brown','CTLSP014', 169000, 160000, 'DBC005', 'QCDG008',
N'Một khuôn mặt đẹp hài hòa thì đôi chân mày đóng góp một phần rất quan trọng. Lông mày đẹp, được chải chuốt cẩn thận sẽ mang đến cho khuôn mặt sự tinh tế và hấp dẫn. 
Không phải ai cũng có đôi mày đều màu, đẹp tự nhiên, bởi đó chì kẻ chân mày chính là trợ thủ đắc lực cho bạn. Chì Kẻ Chân Mày Đa Năng Browlasting Waterproof Eyebrow Pencil dạng bút 2 đầu tiện dụng. 
Màu chuẩn mang đến cho bạn đôi mày đẹp tự nhiên nhất.
Browlasting Waterproof Eyebrow Pencil gồm 2 đầu: 1 đầu là chì kẻ dễ dàng tạo khuôn sắc nét, một đầu là cọ chải tán màu tự nhiên cho chân mày. Khả năng chống thấm nước cao, chịu được độ ẩm và mồ hôi. 
Đầu bút di chuyển mượt trên sợi lông mày, màu bám vài sợi mày không gây lem hay vón cục. Ngay cả với một người mới bắt đầu cũng có thể hoàn thành cách vẻ chân mày một cách dễ dàng.',
N'Kẻ chân mày', 13

EXEC pc_InsertSanPham N'Bảng Màu Mắt THE FACE SHOP Quad Eyeshadow Palette Oh! Splash Edition #01 Aurora Splash', 'CTLSP015', 569000, 560000, 'DBC004', 'QCDG007',
N'Điểm nổi bật của màu phấn mắt QUAD EYESHADOW PALETTE OH! SPLASH EDITION
Màu sắc thời thượng gồm 4 sắc màu trong mỗi bảng: là sự lựa chọn ấn tượng mang lại sắc thái mùa thu, nude tông cánh hồng dịu dàng
Bột phấn có kết cấu mềm mịn với nhiều loại phấn mắt khác nhau (tùy vào hiệu ứng) giúp dễ dàng pha trộn và tạo ra các màu sắc lấp lánh, cuốn hút và lâu trôi.
Chất nhũ lấp lánh đặc biệt để tạo kiểu trang điểm mắt phù hợp. Một bảng mắt gồm các sắc độ hồng và một ô nhũ đặc biệt giúp việt make-up trở nên thú vị và dễ dàng hơn
Kết cấu phấn mắt mềm mượt tan chảy trên đầu ngón tay, dễ sử dụng khi phối nhiều lớp với chất phấn mỏng, lì
Bảng màu
# 01 Aurora Splash: Sự kết hợp giữa nhũ hồng và nhũ cam đào kết hợp cùng tông màu nâu lì tạo điểm nhấn cuốn hút
# 02 Glow Splash: Nhẹ nhàng tinh tế bởi sự kết hợp của phấn nhũ lấp lánh màu vàng trắng và màu be nude tự nhiên.',
N'Trang điểm mắt',80

EXEC pc_InsertSanPham N'Bút Kẻ Mắt 2 Đầu Lâu Trôi Ink Proof 2-In-1 Liner', 'CTLSP016', 399000, 389000, 'DBC001', 'QCDG008',
N'Ưu điểm nổi bật
- Bút kẻ đa năng 2 đầu giúp tạo đường nét cho đôi mắt sắc sảo, to tròn.
- Chức năng chống nước, mực lâu trôi suốt một ngày dài.
- Đầu cọ mảnh dễ dàng vẽ, phù hợp với người mới tập tành trang điểm.
- Kết cấu dạng gel mềm mại, ra đều mực lướt nhẹ nhàng trên viền mi mắt, không gây tổn thương vùng da nhạy cảm.',
N'Tạo hiệu ứng mắt to tròn', 34

EXEC pc_InsertSanPham N'Cọ Trang Điểm Má Hồng THE FACE SHOP Cheek Brush', 'CTLSP017', 169000, 160000, 'DBC013', 'QCDG008',
N'Là sản phẩm cọ đánh má hồng hoặc đánh khối (có thể sử dụng được cho phấn phủ). Thiết kế với đầu cọ lớn, lông mềm mịn tạo cảm giác nhẹ nhàng khi chạm vào da. Có thể dùng cho cả phấn phủ dạng nén hoặc dạng bột hay phấn má hồng … Giúp cho lớp phấn được trải mịn, đều và mỏng lên gương mặt và làm tăng vẻ đẹp cho làn da mỗi khi trang điểm. Độ bền cao',
N'Tán phấn', 500

EXEC pc_InsertSanPham N'Bông Phấn Trang Điểm Daily Beauty Tools Large Round Caron Powder Puff', 'CTLSP018', 16900, 15000, 'DBC005', 'QCDG003',
N'Bông phấn trang điểm, dùng để dàn trải đều phấn trên bề mặt da. 
Phù hợp với phấn nén và phấn bột. Các sợi bông được thiết kế tỉ mỉ, mềm mại giúp lớp phấn được tán đều, mỏng mịn và bám chắc trên da hơn.
Thiết kế hình tròn phù hợp để thay thế vào các khuôn phấn.',
N'Tán phấn', 500

EXEC pc_InsertSanPham N'Bông Tẩy Trang THE FACE SHOP Multi 5 Layer Facial Pad', 'CTLSP019', 169000, 160000, 'DBC013', 'QCDG007',
N'Bông tẩy trang THEFACESHOP được làm từ chất liệu cotton tự nhiên với kết cấu 5 lớp giúp làm sạch tốt, an toàn cho da và tiết kiệm khi sử dụng.
Hộp bông tẩy trang Multi 5 Layer Facial Pad chứa đến 80 miếng bông cotton mềm mịn, có khả năng làm sạch nhanh và hiệu quả lớp trang điểm dày đặc trên da. 
Bề mặt bông mịn không làm da kích ứng, giúp nước tẩy trang thấm tốt vào da và cuốn đi các cặn bẩn sâu trong lỗ chân lông.
Sản phẩm chứa 5 lớp cotton vừa có độ dày chứa đựng được nhiều nước tẩy trang, vừa có cấu trúc sợi cotton bền, ít tơi ra khi bị thấm ướt.',
N'Tẩy trang', 67

EXEC pc_InsertSanPham N'Lô Uốn Tóc Daily Beauty Tools Hair Rollers', 'CTLSP020', 169000, 160000, 'DBC013', 'QCDG007', N'Tạo kiểu tóc xoăn nhẹ nhàng bồng bềnh chuẩn Hàn Quốc mang lại nét đẹp dịu dàng nhưng không kém phần sang trọng.', N'Uốn tóc', 84

EXEC pc_InsertSanPham N'Nước Cân Bằng Trắng Da THE FACE SHOP White Seed Brightening Toner', 'CTLSP021', 769000, 760000, 'DBC010', 'QCDG001',
N'Giới thiệu nước cân bằng WHITE SEED BRIGHTENING TONER
WHITE SEED BRIGHTENING TONER là sản phẩm nước cân bằng vừa cung cấp và duy trì độ ẩm cho da vừa bổ sung phức hợp làm trắng được chiết xuất từ các loại hoa, WHITE SEED BRIGHTENING TONER mang đến giải pháp dưỡng trắng da, giúp làn da trở nên đều màu, là bước dẫn xuất kích hoạt để quá trình hấp thụ các dưỡng chất ở bước kế tiếp trở nên dễ dàng và hiệu quả.
Bên cạnh áp dụng công nghệ GMO – free, WHITE SEED BRIGHTENING TONER còn sử dụng công thức 7 không của THEFACESHOP: không Paraben, không chất tạo màu, không chưa thành phần động vật, không Paraffin, không bột Taic, không Polyacrylamide
Tinh chất từ hạt mầm hoa Lupin giàu Niacinamide và Vitamin C giúp làn da trắng và ngày càng sáng bừng, rạng rỡ kết hợp cùng tinh dầu từ hoa cúc trắng giúp làm trắng và tái tạo tế bào da từ sâu bên trong nhờ khả năng kiểm soát melanin một cách hiệu quả, và cuối cùng không thể thiếu chiết xuất từ cây liễu giàu Salicylic Acid, WHITE SEED BRIGHTENING TONER thật sự là sản phẩm cần thiết và tiên quyết cho các cô nàng đang có làn da không đều màu, giúp cải thiện và mang lại một làn da mịn màng và không còn tối màu nữa.', 
N'Cân bằng da, Cấp ẩm', 56

EXEC pc_InsertSanPham N'Xịt Khoáng Dưỡng Ẩm Chia Seed Advanced Hydro Hydrating Mist', 'CTLSP022', 169000, 160000, 'DBC005', 'QCDG008', 
N'Xịt khoáng là công cụ cần thiết giúp bảo vệ da tức thì, tránh da khô ráp đồng thời làm dịu nhanh cảm giác châm chích, ngứa rát ở da do thiếu ẩm. Vì thế, Xịt khoáng dưỡng ẩm Chia Seed Hydrating Mist là sản phẩm cấp cứu cho da bất cứ khi nào gặp phải tình trạng mất ẩm, mang lại cảm giác dịu mát mềm mại cho da sau lớp màng khoáng sương sương tinh khiết.
Chia Seed Hydrating Mist đặc biệt phù hợp cho mọi làn da, nhất là da khô và nhạy cảm. Giúp cung cấp độ ẩm cần thiết cho lớp biểu bì, bù nước ở vùng da khô ráp với khả năng cấp nước gấp 15 lần của hạt chia. Đồng thời xịt khoáng dưỡng ẩm Chia Seed đưa da về trạng thái cân bằng, duy trì sự mềm mại và tươi tắn cho da.
Sản phẩm nằm trong dòng dưỡng da CHIA SEED Advanced của THEFACESHOP, sở hữu thành phần chính là hạt chia Mexico cùng vitamin B12 có tính năng cấp nước gấp 15 lần, dưỡng ẩm chuyên sâu và nuôi dưỡng da mềm mịn mỗi ngày.', 
N'Cấp ẩm', 34

EXEC pc_InsertSanPham N'Sữa Dưỡng Sáng Trắng Da Yehwadam Jeju Magnolia Pure Brightening Emulsion', 'CTLSP023', 869000, 760000, 'DBC008', 'QCDG001', 
N'Công dụng nổi bật: Sữa dưỡng dạng nhũ tương mịn màu trắng, ẩm mịn. Giúp cải thiện các vết nám hoặc tàn nhang để làm sáng đều màu da. Có tác dụng dưỡng ẩm tuyệt vời, lâu dài bằng cách hình thành hàng rào bảo vệ độ ẩm.
Thành phần chính: Chiết xuất từ ngọc trai, nhân sâm, hoa mộc lan
Loại da phù hợp nhất: Da có đốm nâu, xỉn màu và thiếu sức sống
*Hiệu quả sau khi sử dụng: Tạo hiệu ứng da sáng khỏe ngay lập tức', N'Dưỡng ẩm, sáng da', 45

EXEC pc_InsertSanPham N'Tinh Chất Làm Sáng Da Dr.Belmeur Vita Serine Tone Smoothing Serum', 'CTLSP024', 1569000, 1460000, 'DBC009', 'QCDG002', 
N'Một trong những nguyên nhân khiến làn da sạm màu chính là ánh nắng mặt trời. Tia UV có thể xuyên sâu vào lớp tế bào da, kích thích làm tăng sắc tố melanin từ đó hình thành các hắc tố đen trên bề mặt da hay còn gọi là đốm nâu. Ngoài ra ánh nắng cũng làm độ ẩm trong da bị thất thoát, lớp màng bảo vệ da bị phá vỡ khiến da trở nên khô ráp.
Và để bảo vệ làn da, bạn cần phải che chắn và chống nắng cho da, ngăn ngừa tia UV xâm nhập vào da. Đồng thời phải cân bằng độ ẩm giúp cân bằng và giữ vững lớp màng ẩm phản xạ lại ánh sáng giúp làn da sáng mịn và rạng rỡ.', 
N'Dưỡng trắng, sáng da', 92
go
--EXEC pc_InsertSanPham N'', 'CTLSP025', 169000, 160000, 'DBC005', 'QCDG008', N'', N'', 41
--EXEC pc_InsertSanPham N'', 'CTLSP026', 169000, 160000, 'DBC005', 'QCDG008', N'', N'', 120
--EXEC pc_InsertSanPham N'', 'CTLSP027', 169000, 160000, 'DBC005', 'QCDG008', N'', N'', 23
--EXEC pc_InsertSanPham N'', 'CTLSP028', 169000, 160000, 'DBC005', 'QCDG008', N'', N'', 54
--EXEC pc_InsertSanPham N'', 'CTLSP029', 169000, 160000, 'DBC005', 'QCDG008', N'', N'', 64
--EXEC pc_InsertSanPham N'', 'CTLSP030', 169000, 160000, 'DBC005', 'QCDG008', N'', N'', 34
--EXEC pc_InsertSanPham N'', 'CTLSP031', 169000, 160000, 'DBC005', 'QCDG008', N'', N'', 56
--EXEC pc_InsertSanPham N'', 'CTLSP032', 169000, 160000, 'DBC005', 'QCDG008', N'', N'', 32
--EXEC pc_InsertSanPham N'', 'CTLSP033', 169000, 160000, 'DBC005', 'QCDG008', N'', N'', 97
--EXEC pc_InsertSanPham N'', 'CTLSP034', 169000, 160000, 'DBC005', 'QCDG008', N'', N'', 56
--EXEC pc_InsertSanPham N'', 'CTLSP035', 169000, 160000, 'DBC005', 'QCDG008', N'', N'', 87
--EXEC pc_InsertSanPham N'', 'CTLSP036', 169000, 160000, 'DBC005', 'QCDG008', N'', N'', 45
--EXEC pc_InsertSanPham N'', 'CTLSP037', 169000, 160000, 'DBC005', 'QCDG008', N'', N'', 19
--EXEC pc_InsertSanPham N'', 'CTLSP038', 169000, 160000, 'DBC005', 'QCDG008', N'', N'', 56
--EXEC pc_InsertSanPham N'', 'CTLSP039', 169000, 160000, 'DBC005', 'QCDG008', N'', N'', 49
--EXEC pc_InsertSanPham N'', 'CTLSP040', 169000, 160000, 'DBC005', 'QCDG008', N'', N'', 26
--EXEC pc_InsertSanPham N'', 'CTLSP041', 169000, 160000, 'DBC005', 'QCDG008', N'', N'', 36


--EXEC pc_InsertSanPham N'Kem Mát Xa Làm Sáng Da The Face Shop', N'Kem lót', 599000, 550000, N'Kem', N'Hộp'
--EXEC pc_InsertSanPham N'Mặt Nạ Giấy Cung Cấp Nước THE FACE SHOP Real Nature', N'Kem lót', 429000, 380000, N'Rắn', N'Hộp 10 cái'
--EXEC pc_InsertSanPham N'Kem chống nắng đa năng TheFaceShop Natural SunEco Power LongLasting Sun CreamSPF50+', N'Kem lót', 599000, 550000, N'Kem', N'Tuýp 50g'
--EXEC pc_InsertSanPham N'Sản Phẩm Làm Sạch Da TheFaceShop Yehwadam Body Peeling', N'Kem lót', 269000, 230000, N'Gel', N'Lọ 30g'
--EXEC pc_InsertSanPham N'Tinh Chất Chống Lão Hóa Thefaceshop Energy Seed Antioxidant Hydro Serum', N'Kem lót', 599000, 550000, N'Dung dịch', N'Chai 35ml'
--EXEC pc_InsertSanPham N'Phấn Phủ Thefaceshop Oil Clear Smooth&Bright Pact Spf30 Pa++', N'Kem lót', 349000, 300000, N'Rắn', N'Hộp'
--EXEC pc_InsertSanPham N'Sữa Dưỡng Thể Hương Nước Hoa PERFUME SEED VELVET BODY MILK', N'Kem lót', 1290000, 1180000, N'Lotion', N'Chai 100ml'
--EXEC pc_InsertSanPham N'Sữa Rửa Mặt Làm Sáng Da THE FACE SHOP Rice Water Bright Cleansing Foam', N'Kem lót', 539000, 490000, N'Lotion', N'Tuýp 50g'
--EXEC pc_InsertSanPham N'Chì Chân Mày TheFaceShop Designing Eyebrow Pencil', N'Kem lót', 899000, 840000, N'Rắn', N'Hộp 1 cây'
--EXEC pc_InsertSanPham N'Sữa Dưỡng Giúp Da Săn Mịn TheFaceShop Pomegranate And Collagen Volume Lifting Emulsion', N'Kem lót', 599000, 550000, N'Lotion', N'Chai 35ml'
--EXEC pc_InsertSanPham N'Kem Dưỡng Ẩm Thuần Chay THE FACE SHOP The Therapy Vegan Moisture Blending Cream', N'Kem lót', 129000, 80000, N'Kem', N'Chai 35ml'
--EXEC pc_InsertSanPham N'Kem nâng tông tự nhiên SPF50+++', N'Kem lót', 299000, 250000, N'Kem', N'Tuýp 30g'
--EXEC pc_InsertSanPham N'Kem dưỡng ẩm tay Thuần chay Hương tự nhiên', N'Kem lót', 399000, 350000, N'Kem', N'Lọ 35ml'
--EXEC pc_InsertSanPham N'Dầu Tẩy Trang Làm Sáng Da Thefaceshop Rice Water Bright Light Facial Cleansing Oil', N'Kem lót', 389000, 340000, N'Lỏng', N'Chai 75ml'
--EXEC pc_InsertSanPham N'Tẩy Tế Bào Chết Mềm Mịn Da Hoa Gạo', N'Kem lót', 679000, 630000, N'Hổn dịch', N'Hộp 60g'
--EXEC pc_InsertSanPham N'Sản Phẩm Kem Dưỡng Da TheFaceShop Yehwadam Hwansaenggo Rejuvenating Radiance Cream', N'Kem lót', 729000, 680000, N'Kem', N'Lọ 65ml'
--EXEC pc_InsertSanPham N'Phấn Nước Hiệu Ứng Căng Bóng TheFaceShop Ink Lasting Cushion Glow SPF 35 PA++', N'Kem lót', 729000, 680000, N'Hỗn dịch', N'Hộp 30g'
--EXEC pc_InsertSanPham N'Nước Rửa Tay Làm Sáng Da Thefaceshop Rice Water Bright Light Facial Cleansing Oil', N'Kem lót', 359000, 310000, N'Gel', N'Chai 25ml'
--EXEC pc_InsertSanPham N'Kem Dưỡng Thuần Chay Chống Lão Hóa THE FACE SHOP The Therapy Vegan Blending Cream', N'Kem lót', 599000, 500000, N'Kem', N'Lọ 30g'
--EXEC pc_InsertSanPham N'Chì Kẻ Chân Mày Siêu Mảnh 1.5Mm Thefaceshop Brow Master Slim Pencil', N'Kem lót', 499000, 450000, N'Rắn', N'Hộp 1 cây'
--EXEC pc_InsertSanPham N'Sữa Dưỡng Da Chống Lão Hóa Thefaceshop Yehwadam Hwansaenggo Rejuvenating Radiance Emulsion', N'Kem lót', 699000, 650000, N'Gel', N'Lọ 100g'
--EXEC pc_InsertSanPham N'Sữa Dưỡng Sáng Trắng Da Thefaceshop Yehwadam Jeju Magnolia Pure Brightening Emulsion', N'Kem lót', 549000, 500000, N'Lotion', N'Lọ 50g'
--EXEC pc_InsertSanPham N'Má Hồng Sáng Da TheFaceShop Marble Beam Blush', N'Kem lót', 349000, 300000, N'Rắn', N'Hộp'
--EXEC pc_InsertSanPham N'Tinh Chất Dưỡng Thể Sáng Da VitaminC', N'Kem lót', 399000, 350000, N'Lỏng', N'Hộp 1 serum'
--EXEC pc_InsertSanPham N'Mặt Nạ Real Nature THE FACE SHOP', N'Kem lót', 399000, 350000, N'Gel', N'Hộp 10 cái'
--EXEC pc_InsertSanPham N'Màu Mắt Hiệu Ứng Tự Nhiên The Faceshop Mono Cube Eyeshadow (Matte)', N'Kem lót', 199000, 150000, N'Rắn', N'Hộp'
--EXEC pc_InsertSanPham N'Dưỡng ẩm làm dịu da chống lão hóa oxy hóa vitamin The Face Shop Yehwadam Artemisia Soothing', N'Kem lót', 399000, 350000, N'Kem', N'Chai 35ml'
--EXEC pc_InsertSanPham N'Tinh Chất Dưỡng Ẩm Thefaceshop', N'Kem lót', 629000, 580000, N'Gel', N'Chai 55ml'


--insert THANHPHAN
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP001', N'Dr.Belmeur Cica Peptite Ampoule, Chiết xuất rau má', N'30ml')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP002', N'Thành phần chính của kem lót TFS là từ Cotton Seed', N'100ml')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP003', N'Antioxidants, chiết xuất từ quả việt quất, quả nho, rau lá có màu xanh đậm, cá', N'10g')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP004', N'Thành phần chứa hyaluronic acid giúp bổ sung thêm độ ẩm mang đến vẻ căng mượt, tự nhiên cho đôi gò má.', N'8g')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP005', N'Beta hydroxy acid, axit alpha hydroxy', N'50g')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP006', N'Titanium dioxide, Axit Salicylic', N'30g')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP007', N'Acid Hyaluronic, Panthenol (Provitamin B5)', N'7g')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP008', N'Idebenone, Oxybenzone, Retinol', N'20g')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP009', N'Chiết xuất từ hạt hướng dương, hạtrum, hạt lanh, dầu hạt mỡ', N'3.5G')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP010', N'Caprylic/Capric Triglyceride, Vitamin E', N'4.8g')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP011', N'Chiết xuất bơ hạt mỡ', N'5.5g')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP012', N'Dầu dừa', N'4.5g')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP013', N'Dầu dừa, bơ hạt mỡ', N'4.5g')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP014', N'Ceramide NP, Ceramide AP, Hyaluronic acid', N'8.5g')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP015', N'Titanium dioxide, Zinc oxide', N'1.2g x 4')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP016', N'Cystine, Taurine', N'0.6g+0.13g')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP017', N'Nhựa, lông', N'5g')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP018', N'Mút, lông', N'5g')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP019', N'Bông', N'80pcs')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP020', N'Nhựa', N'10g')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP021', N'Deoxy – Arbutin, Rễ cam thảo', N'160ml')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP022', N'Vitamin B12, Chiết xuất hạt chia Mexico', N'170ml')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP023', N'Chiết xuất lô hội, cúc La Mã, rễ dâu tằm', N'140ml')
INSERT INTO THANHPHAN( MASP, TENTP, HAMLUONG) VALUES( 'SP024', N'N-acetyl Boldin, Abutin', N'45ml')

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
go
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
go
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
go

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

go