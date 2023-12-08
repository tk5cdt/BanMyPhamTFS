$(document).ready(function () {
    $('#inputAnh').change(function () {
        var input = this;
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#anh').html('<div style="margin-bottom:5px"><img src="' + e.target.result + '" class="img-fluid" width="150" height="150"/></div>');
            };
            reader.readAsDataURL(input.files[0]);
        }        
    });
});

//var selectedImages = []; // Khai báo mảng để lưu tên ảnh

//$('#chonAnh').off('click').on('click', function (e) {
//    e.preventDefault();
//    var finder = new CKFinder();
//    finder.selectActionFunction = function (url) {
//        var imageName = url.split('/').pop(); // Lấy tên tệp từ URL
//        $('#listAnhSP').append('<div style="display: inline-block; margin-left:5px; margin-bottom:5px"><img src="' + url + '" width="100" /><a href="#" class="btn-delImg"><i class="fas fa-times"></i></a></div>');
//        selectedImages.push(imageName); // Lưu tên tệp vào mảng
//        $('#selectedImages').val(selectedImages.join(';')); // Lưu danh sách tên tệp vào trường ẩn
//    };
//    finder.popup();
//});

//$(document).on('click', '.btn-delImg', function (e) {
//    e.preventDefault();
//    $(this).parent().remove();
//    var imageName = imageUrl.split('/').pop(); // Lấy tên tệp từ URL
//    var index = selectedImages.indexOf(imageName);
//    if (index !== -1) {
//        selectedImages.splice(index, 1);
//        $('#selectedImages').val(selectedImages.join(';')); // Cập nhật lại danh sách tên tệp trong trường ẩn sau khi xóa
//    }
//});

function updateHiddenFields() {
    var selectedImages = [];
    $('#listAnhSP .btn-delImg').each(function () {
        var imageUrl = $(this).siblings('img').attr('src');
        var imageName = imageUrl.split('/').pop();
        selectedImages.push(imageName);
    });
    $('#selectedImages').val(selectedImages.join(';'));
    $('.hinhAnhItem').remove(); // Xóa tất cả các trường ẩn hiện có
    selectedImages.forEach(function (imageName) {
        $('<input>').attr({
            type: 'hidden',
            class: 'hinhAnhItem',
            name: 'hinhAnhItem',
            value: imageName
        }).appendTo('#listAnhSP');
    });
}

$(document).on('click', '.btn-delImg', function (e) {
    e.preventDefault();
    $(this).parent().remove();
    updateHiddenFields(); // Gọi hàm cập nhật trường ẩn sau khi xóa hình ảnh
});

$('#chonAnh').off('click').on('click', function (e) {
    e.preventDefault();
    var finder = new CKFinder();
    finder.selectActionFunction = function (url) {
        var imageName = url.split('/').pop();
        $('#listAnhSP').append('<div style="display: inline-block; margin-left:5px; margin-bottom:5px"><img src="' + url + '" width="100" /><a href="#" class="btn-delImg"><i class="fas fa-times"></i></a></div>');
        updateHiddenFields(); // Gọi hàm cập nhật trường ẩn sau khi thêm hình ảnh mới
    };
    finder.popup();
});

$(document).ready(function () {
    $('#productDropdown').change(function () {
        var maSP = $(this).val();
        $.ajax({
            url: '/SanPham/GetPrice/',
            type: 'GET',
            data: { maSP: maSP },
            success: function (response) {
                $('[name="giaNhap"]').val(response);
            },
            error: function () {
                console.log("Error");
            }
        });
    });
});

$(document).ready(function () {
    var chuoiTenSP = [];
    var chuoiSoLuong = [];
    $("#themSP").click(function (e) {
        e.preventDefault();
        var tenSP = $("#productDropdown option:selected").text();
        var giaNhap = $("#giaNhap").val();
        var soLuong = $("input[name='soLuong']").val();
        var thanhTien = giaNhap * soLuong;

        if (tenSP && giaNhap && soLuong) {
            var $existingProduct = $("table tbody").find(`td:first-child:contains('${tenSP}')`);
            if ($existingProduct.length > 0) {
                var SLHienTai = parseInt($existingProduct.next().next().text());
                var SLMoi = SLHienTai + parseInt(soLuong);
                var thanhTienMoi = SLMoi * giaNhap;

                $existingProduct.next().next().text(SLMoi);
                $existingProduct.next().next().next().text(thanhTienMoi);

                var tong = parseFloat($("input[name='tongTien']").val());
                $("input[name='tongTien']").val(tong + (SLMoi - SLHienTai) * giaNhap);
            } else {
                $("table tbody").append(`
                    <tr>
                        <td>${tenSP}</td>
                        <td class="text-center">${giaNhap}</td>                       
                        <td class="text-center">${soLuong}</td>                        
                        <td class="text-center">${thanhTien}</td>
                        <td class="text-center">
                            <a href="#" class="delete"><i class="fas fa-trash-alt" style="color: black"></i></a>
                        </td>
                    </tr>
                `);

                var tong = parseFloat($("input[name='tongTien']").val());
                $("input[name='tongTien']").val(tong + thanhTien);

                chuoiTenSP.push(tenSP);
                $('#chuoiTenSP').val(chuoiTenSP.join(';'));
                chuoiSoLuong.push(soLuong);
                $('#chuoiSoLuong').val(chuoiSoLuong.join(';'));               
            }
            $("#productDropdown").val('');
            $("#giaNhap").val('');
            $("input[name='soLuong']").val('');
        } else {
            alert("Vui lòng nhập đủ thông tin sản phẩm");
        }
    });
    $("table").on("click", ".delete", function () {
        var row = $(this).closest("tr");
        var thanhTien = parseInt(row.find("td:eq(3)").text());
        var tenSP = row.find("td:eq(0)").text();
        var tong = parseFloat($("input[name='tongTien']").val());
        $("input[name='tongTien']").val(tong - thanhTien);
        var index = chuoiTenSP.indexOf(tenSP); // Find the index of the productName in the array
        if (index !== -1) {
            chuoiTenSP.splice(index, 1);
            $('#chuoiTenSP').val(chuoiTenSP.join(';'));
            chuoiSoLuong.splice(index, 1);
            $('#chuoiSoLuong').val(chuoiSoLuong.join(';'));
        }  

        
        row.remove();
            
    });
});