$('.subCategoryCheckbox').change(function () {
    if ($(this).is(':checked')) {
        var subcategoryId = $(this).val();
        // Gửi yêu cầu lọc theo loại sản phẩm con
        $.ajax({
            url: '@Url.Action("FilterBySubcategory", "Partial")',
            type: 'GET',
            data: { subcategoryId: subcategoryId },
            success: function (response) {
                $('#productsContainer').html(response);
            }
        });
    }
    $.ajax({
        url: '@Html.Action("DanhMucLoaiSP", "Partial")' // Thay đổi thành action để lấy tất cả sản phẩm
        type: 'GET',
        success: function (response) {
            $('#productsContainer').html(response);
        }
    });
});