$(document).ready(function() {
    $('a[data-toggle="tooltip"]').tooltip({placement: 'top'});

    $('#btn_edit_store').click(function(){
        $this = $(this);
        $.get($this.data('href'), function(html){
            var panel = $('#panel_edit_store');
            if ($.trim(panel.find('.content').html()) != '') {
                panel.toggle();
            } else {
                panel.find('.content').html(html);
                panel.css({left: $this.offset().left, top: $this.offset().top + $this.outerHeight() + 10})
                    .show();
            }
        });

        return false;
    });
});