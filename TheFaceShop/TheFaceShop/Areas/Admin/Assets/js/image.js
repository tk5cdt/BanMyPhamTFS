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