$(document).ready(function () {
    $('input[type="checkbox"]').change(function () {
        var selectedPriceRange = $(this).next('label').text().trim();

        $.ajax({
            url: '@Url.Action("FilterByPrice", "LoaiSanPham")',
            type: 'GET',
            data: { priceRange: selectedPriceRange },
            success: function (result) {
                $('#productsContainer').html(result);
            },
            error: function () {
                console.log("Lỗi khi lọc sản phẩm theo giá");
            }
        });
    });

    // Xử lý khi click vào danh mục sản phẩm
    $('.subcategory-link').click(function (e) {
        e.preventDefault();
        var subcategoryId = $(this).data('subcategory-id');

        $.ajax({
            url: '@Url.Action("FilterBySubcategory", "LoaiSanPham")',
            type: 'GET',
            data: { subcategoryId: subcategoryId },
            success: function (result) {
                $('#productsContainer').html(result);
            },
            error: function () {
                console.log("Lỗi khi lọc sản phẩm theo danh mục");
            }
        });
    });
});
