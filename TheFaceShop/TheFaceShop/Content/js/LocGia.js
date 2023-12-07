//// Bắt sự kiện khi checkbox thay đổi
//$('#sidebar input[type=checkbox]').change(function () {
//    var selectedPrices = [];
//    $('#sidebar input[type=checkbox]:checked').each(function () {
//        var priceRange = $(this).val();
//        selectedPrices.push(priceRange);
//    });

//    // Gửi yêu cầu lọc dữ liệu đến action trong controller
//    $.ajax({
//        url: '@Url.Action("FilterByPrice", "Product")',
//        type: 'GET',
//        traditional: true,
//        data: { prices: selectedPrices },
//        success: function (result) {
//            // Xử lí dữ liệu trả về, có thể làm refresh hoặc hiển thị sản phẩm mới
//        },
//        error: function () {
//            alert('Error while filtering by price.');
//        }
//    });
//});

$(document).ready(function () {
    // Gán sự kiện cho checkbox lọc theo giá
    $('input[type="checkbox"]').change(function () {
        var selectedPriceRange = $(this).next('label').text().trim();

        // Gửi yêu cầu lọc theo giá đến server
        $.ajax({
            url: '@Url.Action("FilterByPrice", "Partial")',
            type: 'GET',
            data: { priceRange: selectedPriceRange },
            success: function (result) {
                // Hiển thị kết quả lọc vào phần sản phẩm
                $('#productsContainer').html(result);
            },
            error: function () {
                console.log("Đã xảy ra lỗi khi lọc sản phẩm theo giá");
            }
        });
    });

    // Gán sự kiện cho các checkbox giá cụ thể
    $('#checkboxExample1').change(function () {
        if ($(this).is(':checked')) {
            // Gửi yêu cầu lọc theo giá dưới 500k
            $.ajax({
                url: '@Url.Action("FilterByPrice", "Partial")',
                type: 'GET',
                data: { priceRange: 'Dưới 500.000đ' },
                success: function (result) {
                    $('#productsContainer').html(result);
                }
            });
        } else {
            $.ajax({
                url: '@Html.Action("DanhMucLoaiSP", "Partial")', // Thay đổi thành action để lấy tất cả sản phẩm
                type: 'GET',
                success: function (response) {
                    $('#productsContainer').html(response);
                }
            });
        }
    });

    $('#checkboxExample2').change(function () {
        if ($(this).is(':checked')) {
            // Gửi yêu cầu lọc theo giá từ 500k - 1000k
            $.ajax({
                url: '@Url.Action("FilterByPrice", "Partial")',
                type: 'GET',
                data: { priceRange: '500.000đ - 1.000.000đ' },
                success: function (response) {
                    $('#productsContainer').html(response);
                }
            });
        } else {
            // Khi checkbox bị bỏ chọn, hiển thị toàn bộ sản phẩm
            $.ajax({
                url: '@Html.Action("DanhMucLoaiSP", "Partial")',
                type: 'GET',
                success: function (response) {
                    $('#productsContainer').html(response);
                }
            });
        }
    });

    $('#checkboxExample2').change(function () {
        if ($(this).is(':checked')) {
            // Gửi yêu cầu lọc theo giá từ 1000k - 1500k
            $.ajax({
                url: '@Url.Action("FilterByPrice", "Partial")',
                type: 'GET',
                data: { priceRange: '1.000.000đ - 1.500.000đ' },
                success: function (response) {
                    $('#productsContainer').html(response);
                }
            });
        } else {
            // Khi checkbox bị bỏ chọn, hiển thị toàn bộ sản phẩm
            $.ajax({
                url: '@Html.Action("DanhMucLoaiSP", "Partial")',
                type: 'GET',
                success: function (response) {
                    $('#productsContainer').html(response);
                }
            });
        }
    });
    $('#checkboxExample2').change(function () {
        if ($(this).is(':checked')) {
            // Gửi yêu cầu lọc theo giá từ 1500k - 2000k
            $.ajax({
                url: '@Url.Action("FilterByPrice", "Partial")',
                type: 'GET',
                data: { priceRange: '1.500.000đ - 2.000.000đ' },
                success: function (response) {
                    $('#productsContainer').html(response);
                }
            });
        } else {
            // Khi checkbox bị bỏ chọn, hiển thị toàn bộ sản phẩm
            $.ajax({
                url: '@Html.Action("DanhMucLoaiSP", "Partial")',
                type: 'GET',
                success: function (response) {
                    $('#productsContainer').html(response);
                }
            });
        }
    });
});


