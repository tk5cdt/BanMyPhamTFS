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

var product = {
    init: function () {
        product.registerEvents();
    },
    registerEvents: function () {
        $('#chonAnh').off('click').on('click', function (e) {
            e.preventDefault();
            var finder = new CKFinder();
            finder.selectActionFunction = function (url) {
                $('#listAnhSP').append('<div style="display: inline-block; margin-left:5px; margin-bottom:5px"><img src="' + url + '" width="100" /><a href="#" class="btn-delImg"><i class="fas fa-times"></i></a></div>')
                $('.btn-delImg').off('click').on('click', function (e) {
                    e.preventDefault();
                    $(this).parent().remove();
                });
            };
            finder.popup();
        })
    }
}
product.init();

//var product = {
//    init: function () {
//        product.registerEvents();
//    },
//    registerEvents: function () {
//        $('#chonAnh').off('click').on('click', function (e) {
//            e.preventDefault();
//            var finder = new CKFinder();
//            finder.selectActionFunction = function (url) {
//                $.ajax({
//                    url: '@Url.Action("UploadImage", "SanPham")',
//                    type: 'POST',
//                    data: { imageUrl: url },
//                    success: function (response) {
//                        if (response.success) {
//                            $('#listAnhSP').append('<div style="display: inline-block; margin-left:5px; margin-bottom:5px"><img src="' + response.imageUrl + '" width="100" /><a href="#" class="btn-delImg"><i class="fas fa-times"></i></a></div>');

//                            $('.btn-delImg').off('click').on('click', function (e) {
//                                e.preventDefault();
//                                $(this).parent().remove();
//                            });
//                        } else {
//                            alert('Có lỗi xảy ra, vui lòng thử lại');
//                        }
//                    },
//                    error: function (error) {
//                        console.error(error);
//                    }
//                });
//            };
//            finder.popup();
//        })
//    }
//}
//product.init();

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
    $("#themSP").click(function (e) {    
        e.preventDefault();
        var tenSP = $("#productDropdown option:selected").text();
        var giaNhap = $("#giaNhap").val();
        var soLuong = $("input[name='soLuong']").val();
        var thanhTien = giaNhap * soLuong;

        if (tenSP && giaNhap && soLuong)
        {
            var $existingProduct = $("table tbody").find(`td:first-child:contains('${tenSP}')`);
            if ($existingProduct.length > 0) {
                var SLHienTai = parseInt($existingProduct.next().next().text());
                var SLMoi = SLHienTai + parseInt(soLuong);
                var thanhTien1 = SLMoi * giaNhap;

                $existingProduct.next().next().text(SLMoi);
                $existingProduct.next().next().next().text(thanhTien1);

                var tong = parseFloat($("label[for='tongTien']").text());
                $("label[for='tongTien']").text(tong + (SLMoi - SLHienTai) * giaNhap);
            }
            else
            {
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
                var tong = parseFloat($("label[for='tongTien']").text());
                $("label[for='tongTien']").text(tong + thanhTien);
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
        var currentTotal = parseInt($("label[for='tongTien']").text());
        $("label[for='tongTien']").text(currentTotal - thanhTien);
        row.remove();
    });
});