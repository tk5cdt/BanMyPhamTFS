//var product = {
//    init: function () {
//        product.registerEvents();
//    },
//    registerEvents: function () {
//        $('#chonAnh').off('click').on('click', function (e) {
//            e.preventDefault();
//            var finder = new CKFinder();
//            finder.selectActionFunction = function (url) {
//                $('#listAnhSP').append('<div style="display: inline-block; margin-left:5px; margin-bottom:5px"><img src="' + url + '" width="100" /><a href="#" class="btn-delImg"><i class="fas fa-times"></i></a></div>')
//                $('.btn-delImg').off('click').on('click', function (e) {
//                    e.preventDefault();
//                    $(this).parent().remove();
//                });
//            };
//            finder.popup();
//        })
//    }
//}
//product.init();
var product = {
    init: function() {
        product.registerEvents();
    },

    registerEvents: function() {
        $('#chonAnh').off('click').on('click', function(e) {
            e.preventDefault();
            var finder = new CKFinder();
            finder.selectActionFunction = function(url) {
                $.ajax({
                    url: '@Url.Action("UploadImage", "SanPham")',
                    type: 'POST',
                    data: { imageUrl: url },
                    success: function(response) {
                        if (response.success) {
                            $('#listAnhSP').append('<div style="display: inline-block; margin-left:5px; margin-bottom:5px"><img src="' + response.url + '" width="100" /><a href="#" class="btn-delImg"><i class="fas fa-times"></i></a></div>');

                            $('.btn-delImg').off('click').on('click', function(e) {
                                e.preventDefault();
                                $(this).parent().remove();
                            });
                        } else {
                            alert('Có lỗi xảy ra, vui lòng thử lại');
                        }
                    },
                    //error: function (error) {
                    //    console.error(error);
                });
            };
        });
    },
    finder, : .popup()
};
