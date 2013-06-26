$(document).ready(function() {
    $('a[data-toggle="tooltip"]').tooltip();

    $('#btn_edit_store').popover({content: "dd", title: "编辑店铺", placement: 'bottom'});
});